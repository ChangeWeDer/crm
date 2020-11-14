<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input type="hidden" name="id"  value="${(DataDic.id)!}">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">字典名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   lay-verify="required" name="dataDicName" id="dataDicName"  value="${(DataDic.dataDicName)!}"  placeholder="请输数据类型">
        </div>
    </div>

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">字典值</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   lay-verify="required" name="dataDicValue" id="dataDicValue"  value="${(DataDic.dataDicValue)!}"  placeholder="请输入数据值">
        </div>
    </div>



    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="addOrUpdateDataDic">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/dataDic/add.update.js"></script>
</body>
</html>