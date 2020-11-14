layui.use(['table','layer',"form"],function(){
       var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var  tableIns = table.render({
        elem: '#userList',
        url : ctx+'/user/list',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        toolbar: "#toolbarDemo",
        id : "userListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: "id", title:'编号',fixed:"true", width:80},
            {field: 'userName', title: '用户名', minWidth:50, align:"center"},
            {field: 'email', title: '用户邮箱', minWidth:100, align:'center'},
            {field: 'phone', title: '手机号', minWidth:100, align:'center'},
            {field: 'trueName', title: '真实姓名', align:'center'},
            {field: 'createDate', title: '创建时间', align:'center',minWidth:150},
            {field: 'updateDate', title: '更新时间', align:'center',minWidth:150},
            {title: '操作', minWidth:150, templet:'#userListBar',fixed:"right",align:"center"}
        ]]
    });


    // 多条件搜索
    $(".search_btn").on("click",function () {
        table.reload("userListTable",{
            page:{
                curr:1
            },
            where:{
                userName:$("input[name='userName']").val(),// 用户名
                email:$("input[name='email']").val(),// 邮箱
                phone:$("input[name='phone']").val()    //手机号
            }
        })
    });


    // 头工具栏事件
    table.on('toolbar(users)',function (obj) {
        switch (obj.event) {
            case "add":
                openAddOrUpdateUserDialog();
                break;
            case "del":
                delUser(table.checkStatus(obj.config.id).data);
                break;
        }
    });



    function delUser(datas){
        /**
         * 批量删除
         *   datas:选择的待删除记录数组
         */
        if(datas.length==0){
            layer.msg("请选择待删除记录!");
            return;
        }
        layer.confirm("确定删除选中的记录",{
            btn:['确定','取消']
        },function (index) {
            layer.close(index);
            // ids=10&ids=20&ids=30
            var ids="ids=";
            for(var i=0;i<datas.length;i++){
                if(i<datas.length-1){
                    ids=ids+datas[i].id+"&ids=";
                }else{
                    ids=ids+datas[i].id;
                }
            }
            $.ajax({
                type:"post",
                url:ctx+"/user/delete",
                data:ids,
                dataType:"json",
                success:function (data) {
                    if(data.code==200){
                        tableIns.reload();
                    }else{
                        layer.msg(data.msg);
                    }
                }
            })



        })
    }

    // 编辑 删除选项
    table.on('tool(users)',function (obj) {
        var layEvent =obj.event;
        if(layEvent === "edit"){
            openAddOrUpdateUserDialog(obj.data.id);
        }else if(layEvent === "del"){
            layer.confirm("确认删除当前记录?",{icon: 3, title: "用户管理"},function (index) {
                $.post(ctx+"/user/delete",{ids:obj.data.id},function (data) {
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


    //弹出框
    function openAddOrUpdateUserDialog(id) {
        var title="用户管理-用户添加";
        var url=ctx+"/user/addOrUpdateUserPage";
        if(id){
            title="用户管理-用户更新";
            url=url+"?id="+id;
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
