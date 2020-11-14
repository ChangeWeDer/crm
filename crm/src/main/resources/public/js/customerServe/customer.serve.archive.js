layui.use(['table','layer',"form"],function(){
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    //服务列表展示
    table.render({
        elem: '#customerServeList',
        url : ctx+'/customer_serve/list?state=fw_005',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        toolbar: "#toolbarDemo",
        id : "customerServeListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: "id", title:'编号',fixed:"true", width:80},
            {field: 'customer', title: '客户名', minWidth:50, align:"center"},
            {field: 'dicValue', title: '服务类型', minWidth:100, align:'center'},
            {field: 'overview', title: '概要信息', align:'center'},
            {field: 'assignTime', title: '分配时间', minWidth:50, align:"center"},
            {field: 'createPeople', title: '创建人', minWidth:100, align:'center'},
            {field: 'serviceProcePeople', title: '处理人', align:'center'},
            {field: 'serviceProce', title: '处理内容', minWidth:50, align:"center"},
            {field: 'serviceProceTime', title: '处理时间', minWidth:100, align:'center'},
            {field: 'serviceProceResult', title: '处理结果', align:'center'},
            {field: 'satisfaction', title: '满意度', align:'center'},
            {field: 'createDate', title: '创建时间', align:'center',minWidth:150},
            {field: 'updateDate', title: '更新时间', align:'center',minWidth:150},
        ]]
    });

    // 多条件搜索
    $(".search_btn").on("click",function(){
        table.reload("customerServeListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                customer: $("input[name='customer']").val(),  //客户名
                serveType: $("#type").val()  //服务类型
            }
        })
    });

});
