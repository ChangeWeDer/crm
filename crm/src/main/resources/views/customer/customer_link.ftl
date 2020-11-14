<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input type="hidden" name="id"  value="${(customer.id)!}">
    <input type="hidden" name="cusId"  value="${(customer.cusId)!}">

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">联系人姓名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   lay-verify="required" name="linkName" id="linkName"  value="${(customer.linkName)!}"  placeholder="请输入联系人姓名">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   name="sex" id="sex" placeholder="请输入联系人性别" value="${(customer.sex)!}">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">职位</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   name="position"  lay-verify="required"
                   placeholder="请输入联系人职位" value="${(customer.position)!}">
        </div>
    </div>

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">办公电话</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                    name="officePhone" id="officePhone" placeholder="请输入办公电话" value="${(customer.officePhone)!}">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   lay-verify="phone" name="phone" id="officePhone" placeholder="请输入联系手机号" value="${(customer.phone)!}">
        </div>
    </div>

    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="updateCustomerLink">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/customer/customer_link.js"></script>
</body>
</html>