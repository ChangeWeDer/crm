<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input type="hidden" name="id"  value="${(customerContact.id)!}">
    <input type="hidden" name="cusId"  value="${(cusId)!}">

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">交往时间</label>
        <div class="layui-input-block">

            <#if (customerContact.contactTime)??>
                <input type="text" class="layui-input userName"
                       lay-verify="required" name="contactTime" id="contactTime" value="${(customerContact.contactTime)?string("yyyy-MM-dd HH:mm:ss")}" placeholder="请输入计划项时间">
            <#else>
                <input type="text" class="layui-input userName"
                       lay-verify="required" name="contactTime" id="contactTime"  placeholder="请输入计划项时间">
            </#if>
        </div>
    </div>

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">交往地址</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   name="address"  lay-verify="required"
                   placeholder="请输入交往地址" value="${(customerContact.address)!}">
        </div>
    </div>

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">概要信息</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入概要信息" name="overview" class="layui-textarea">${(customerContact.overview)!}</textarea>
        </div>
    </div>

    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="addOrUpdateCustomerContact">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/customerContact/addOrUpdate.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#contactTime' ,//指定元素
            format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
        });
    });
</script>
</body>
</html>