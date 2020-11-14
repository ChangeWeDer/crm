layui.use(['table','layer',"form","laydate"],function(){
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;

      // 设置时间
        laydate.render({
            elem: '#time'
        });
    //用户列表展示
    var  tableIns = table.render({
        elem: '#contriList',
        url : ctx+'/customer/queryCustomerContributionByParams',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        id : "customerContriListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'name', title: '客户名', minWidth:50, align:"center"},
            {field: 'total', title: '总金额(￥)', minWidth:50, align:"center"}
        ]]
    });

    // 多条件搜索
    $(".search_btn").on("click",function () {
        table.reload("customerContriListTable",{
            page:{
                curr:1
            },
            where:{
                cusName:$("input[name='customerName']").val(),// 客户名
                type:$("#type").val(),// 金额区间
                time:$("input[name='time']").val()    //下单时间
            }
        })
    });





});
