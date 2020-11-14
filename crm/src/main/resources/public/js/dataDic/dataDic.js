layui.use(['table','layer'],function(){
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;


    //字典列表展示
    var  tableIns = table.render({
        elem: '#dataDicList',
        url : ctx+'/dataDic/list',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        toolbar: "#toolbarDemo",
        id : "dataDicListTable",
        cols : [[
            {type: "checkbox", fixed:"center"},
            {field: "id", title:'编号',fixed:"true"},
            {field: 'dataDicName', title: '数据类型',align:"center"},
            {field: 'dataDicValue', title: '数据值',  align:'center'},
            {title: '操作', templet:'#dataDicListBar',fixed:"right",align:"center", minWidth:150}
        ]]
    });



    // 头工具栏事件
    table.on('toolbar(dataDic)',function (obj) {
        switch (obj.event) {
            case "add":
                openAddOrUpdateDataDicDialog();
                break;
            case "del":
                //console.log(table.checkStatus(obj.config.id).data);
                delDic(table.checkStatus(obj.config.id).data);
                break;
        }
    });


    function delDic(datas){
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
                url:ctx+"/dataDic/delete",
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



    table.on('tool(dataDic)',function (obj) {
          var layEvent =obj.event;
          if(layEvent === "edit"){
              openAddOrUpdateDataDicDialog(obj.data.id);
          }else if(layEvent === "del"){
              layer.confirm("确认删除当前记录?",{icon: 3, title: "数据管理"},function (index) {
                  $.post(ctx+"/dataDic/delete",{ids:obj.data.id},function (data) {
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



    /**
     * 打开添加或更新对话框
     */
    function openAddOrUpdateDataDicDialog(sid) {
        var title="字典管理-字典添加";
        var url=ctx+"/dataDic/addOrUpdateDataDicPage";
        if(sid){
            title="字典管理-字典更新";
            url=url+"?id="+sid;
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
