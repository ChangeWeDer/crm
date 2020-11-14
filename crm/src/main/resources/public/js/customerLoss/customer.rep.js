layui.use(['table','layer',"form"],function(){
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //暂缓列表展示
    var  tableIns = table.render({
        elem: '#customerRepList',
        url : ctx+'/customer_rep/list?lossId='+$("input[name='id']").val(),
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        toolbar: "#toolbarDemo",
        id : "customerRepListTable",
        cols : [[
            {type: "checkbox", fixed:"center"},
            {field: "id", title:'编号',fixed:"true"},
            {field: 'measure', title: '暂缓措施',align:"center"},
            {field: 'createDate', title: '创建时间',align:"center"},
            {field: 'updateDate', title: '更新时间',align:"center"},
            {title: '操作',fixed:"right",align:"center", minWidth:150,templet:"#customerRepListBar"}
        ]]
    });

    // 头工具栏事件
    table.on('toolbar(customerReps)',function (obj) {
        switch (obj.event) {
            case "add":
                openAddOrUpdateCustomerReprDialog();
                break;
            case "confirm":
                updateCustomerLossState();
                break;
        }
    });

    table.on('tool(customerReps)',function (obj) {
        var layEvent =obj.event;
        if(layEvent === "edit"){
            openAddOrUpdateCustomerReprDialog(obj.data.id);
        }else if(layEvent === "del"){
            layer.confirm("确认删除当前记录?",{icon: 3, title: "客户流失管理"},function (index) {
                $.post(ctx+"/customer_rep/delete",{id:obj.data.id},function (data) {
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


    function openAddOrUpdateCustomerReprDialog(id) {
        var title="暂缓管理-添加暂缓";
        var url=ctx+"/customer_loss/addOrUpdateCustomerReprPage?lossId="+$("input[name='id']").val();
        if(id){
            title="暂缓管理-更新暂缓";
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

    
    
    function updateCustomerLossState() {
        layer.confirm("当前客户确认流失?",{icon: 3, title: "客户流失管理"},function (index) {
            layer.close(index);

            layer.prompt({title: "请输入流失原因", formType: 2}, function(text, index){
                layer.close(index);
                /**
                 * id  $("input[name='id']").val()
                 * lossReason text
                 */
                $.ajax({
                    type:"post",
                    url:ctx+"/customer_loss/updateCustomerLossStateById",
                    data:{
                        id:$("input[name='id']").val(),
                        lossReason:text
                    },
                    dataType:"json",
                    success:function (data) {
                        if(data.code==200){
                            layer.msg(data.msg);
                            layer.closeAll("iframe");
                            // 刷新父页面
                            parent.location.reload();
                        }else{
                            layer.msg(data.msg);
                        }
                    }

                })

            });



        })
    }





});
