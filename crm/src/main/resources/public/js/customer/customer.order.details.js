layui.use(['table','layer',"form"],function(){
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //订单列表展示
    var  tableIns = table.render({
        elem: '#orderDetailList',
        url : ctx+'/order_details/list?orderId='+$("input[name='id']").val(),
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        toolbar: "#toolbarDemo",
        id : "customerOrderListTable",
        cols : [[
            {type: "checkbox", fixed:"center"},
            {field: "id", title:'编号',fixed:"true"},
            {field: 'goodsName', title: '商品名称',align:"center"},
            {field: 'goodsNum', title: '商品数量',align:"center"},
            {field: 'unit', title: '单位',align:"center"},
            {field: 'price', title: '单价(￥)',align:"center"},
            {field: 'sum', title: '总价(￥)',align:"center"},
            {field: 'createDate', title: '创建时间',align:"center"},
            {field: 'updateDate', title: '更新时间',align:"center"}
        ]]
    });


});
