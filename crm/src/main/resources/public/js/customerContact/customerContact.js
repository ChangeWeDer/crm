layui.use(['table','layer',"form"],function(){
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table,
        form = layui.form;

    //获取顾客id
    var cusId = $("input[name='cusId']").val()
    //客户列表展示
    var  tableIns = table.render({
        elem: '#customerList',
        url : ctx+'/customer_contact/list?cusId='+cusId,
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        toolbar: "#toolbarDemo",
        id : "customerListTable",
        cols : [[
            {field: "id", title:'编号',fixed:"true"},
            {field: 'contactTime', title: '交往时间',  align:'center'},
            {field: 'address', title: '交往地址', align:'center'},
            {field: 'overview', title: '概况', align:'center'},
            {field: 'createDate', title: '创建时间', align:'center'},
            {field: 'updateDate', title: '更新时间', align:'center'},
            {title: '操作', templet:'#customerListBar',fixed:"right",align:"center", minWidth:150}
        ]]
    });

    // 头工具栏事件
    table.on('toolbar(customers)',function (obj) {
        switch (obj.event) {
            //添加
            case "add":
                openAddOrUpdateCustomerContactDialog();
                break;
        }
    });

    table.on('tool(customers)',function (obj) {
        var layEvent =obj.event;
        if(layEvent === "edit"){
            openAddOrUpdateCustomerContactDialog(obj.data.id);
        }else if(layEvent === "del"){
            layer.confirm("确认删除当前记录?",{icon: 3, title: "客户管理"},function (index) {
                $.post(ctx+"/customer_contact/delete",{id:obj.data.id},function (data) {
                    if(data.code==200){
                        layer.msg("删除成功");
                        tableIns.reload();
                    }else{
                        layer.msg(data.msg);
                    }
                })
            })
        }
    });



    function openAddOrUpdateCustomerContactDialog(id) {
        var title="客户管理-客户添加";
        var url=ctx+"/customer_contact/addOrUpdateCustomerContactPage?cusId="+cusId;
        if(id){
            title="客户管理-客户更新";
            url=url+"&id="+id;
        }
        layui.layer.open({
            title:title,
            type:2,
            area:["700px","500px"],
            maxmin:true,
            content:url
        })
    }

});
