<!DOCTYPE html>
<html>
<head>
    <title>客户管理</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">

<form class="layui-form" >
    <input name="cusId" type="hidden" value="${(cusId)!}"/>
    <table id="customerList" class="layui-table"  lay-filter="customers"></table>
    <script type="text/html" id="toolbarDemo">

        <div class="layui-btn-container">
            <a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
                <i class="layui-icon">&#xe608;</i>
                添加
            </a>
        </div>
    </script>

    <!--操作-->
    <script id="customerListBar" type="text/html">
        <a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </script>


</form>
<script type="text/javascript" src="${ctx}/js/customerContact/customerContact.js"></script>

</body>
</html>