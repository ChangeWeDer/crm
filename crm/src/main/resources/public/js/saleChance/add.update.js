layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;


    //查询所有销售
    $.post(ctx+"/user/queryAllSales",function (res) {
        //console.log(res)
        for(var i=0;i<res.length;i++){
            //绑定下拉框显示
            if($("input[name='man']").val() == res[i].id){
                $("#assignMan").append("<option value=\""+res[i].id+"\"  selected='selected' >"+res[i].assignName+"</option>");
            }else{
                $("#assignMan").append("<option value=\""+res[i].id+"\"   >"+res[i].assignName+"</option>");
            }

        }
        // 重新渲染下拉框内容
        layui.form.render("select");
    });

    form.on('submit(addOrUpdateSaleChance)',function (data) {
        var index= top.layer.msg("数据提交中,请稍后...",{icon:16,time:false,shade:0.8});
        var url = ctx+"/sale_chance/save";
        //console.log(data.field)
        if($("input[name='id']").val()){
            url=ctx+"/sale_chance/update";
        }
        $.post(url,data.field,function (res) {
            if(res.code==200){
                top.layer.msg("操作成功");
                top.layer.close(index);
                layer.closeAll("iframe");
                // 刷新父页面
                parent.location.reload();
            }else{
                layer.msg(res.msg);
            }
        });
        return false;
    });

});