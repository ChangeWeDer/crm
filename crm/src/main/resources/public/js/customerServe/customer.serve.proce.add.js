layui.use(['form', 'layer','jquery_cookie'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
        $ = layui.jquery_cookie($);


    $.post(ctx+"/user/queryAllCustomerManager",function (res) {
        for (var i = 0; i < res.length; i++) {
            if($("input[name='man']").val() == res[i].id ){
                $("#assigner").append("<option value=\"" + res[i].id + "\" selected='selected' >" + res[i].uname + "</option>");
            }else {
                $("#assigner").append("<option value=\"" + res[i].id + "\">" + res[i].uname + "</option>");
            }
        }
        //重新渲染
        layui.form.render("select");
    });

    form.on("submit(addOrUpdateCustomerServe)", function (data) {
        var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
        data.field.serviceProcePeople=$.cookie("trueName");
        //弹出loading
        $.post(ctx + "/customer_serve/update", data.field, function (res) {
            if (res.code == 200) {
                setTimeout(function () {
                    top.layer.close(index);
                    top.layer.msg("操作成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                }, 500);
            } else {
                layer.msg(
                    res.msg, {
                        icon: 5
                    }
                );
            }
        });
        return false;
    });
});