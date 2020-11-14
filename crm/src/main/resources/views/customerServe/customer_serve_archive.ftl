<!DOCTYPE html>
<html>
<head>
    <title>服务归档</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">

<form class="layui-form" >
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" name="customer"
                           class="layui-input
					searchVal" placeholder="客户" />
                </div>
                <div class="layui-input-inline">
                    <select name="type"  id="type">
                        <option value="" >请选择</option>
                        <option value="6">咨询</option>
                        <option value="7" >建议</option>
                        <option value="8" >投诉</option>
                    </select>
                </div>

                <a class="layui-btn search_btn" data-type="reload"><i
                            class="layui-icon">&#xe615;</i> 搜索</a>
            </div>
        </form>
    </blockquote>
    <table id="customerServeList" class="layui-table"  lay-filter="customerServes"></table>


    <script type="text/html" id="toolbarDemo">
    </script>

</form>
<script type="text/javascript" src="${ctx}/js/customerServe/customer.serve.archive.js"></script>

</body>
</html>