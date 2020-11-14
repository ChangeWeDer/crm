layui.use(['table','layer',"form"],function(){
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //客户流失列表展示
    var  tableIns = table.render({
        elem: '#customerLossList',
        url : ctx+'/customer_loss/list',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        toolbar: "#toolbarDemo",
        id : "customerLossListTable",
        cols : [[
            {type: "checkbox", fixed:"center"},
            {field: "id", title:'编号',fixed:"true"},
            {field: 'cusNo', title: '客户编号',align:"center"},
            {field: 'cusName', title: '客户名称',align:"center"},
            {field: 'cusManager', title: '客户经理',align:"center"},
            {field: 'lastOrderTime', title: '最后下单时间',align:"center"},
            {field: 'lossReason', title: '流失原因',align:"center"},
            {field: 'confirmLossTime', title: '确认流失时间',align:"center"},
            {field: 'createDate', title: '创建时间',align:"center"},
            {field: 'updateDate', title: '更新时间',align:"center"},
            {title: '操作',fixed:"right",align:"center", minWidth:150,templet:"#op"}
        ]]
    });


    // 多条件搜索
    $(".search_btn").on("click",function () {
        table.reload("customerLossListTable",{
            page:{
                curr:1
            },
            where:{
                cusNo:$("input[name='cusNo']").val(),//客户编号
                cusName:$("input[name='cusName']").val(),// 客户名
                state:$("#state").val()    //流失状态
            }
        })
    });



    table.on("tool(customerLosses)",function (obj) {
        var layEvent = obj.event;
        if(layEvent==="add"){
            openCustomerReprDialog("暂缓措施维护",obj.data.id);
        }else if(layEvent ==="info"){
            openCustomerReprDialog("暂缓数据查看",obj.data.id);
        }
    });


    function openCustomerReprDialog(title,id) {
        layui.layer.open({
            title:title,
            type:2,
            area:["800px","600px"],
            maxmin:true,
            content:ctx+"/customer_loss/toCustomerReprPage?id="+id
        })
    }







});
