<!DOCTYPE html>
<html>
<head>
	<title>流失客户管理</title>
	<#include "../common.ftl">
</head>
<body class="childrenBody">

<form class="layui-form" >
	<blockquote class="layui-elem-quote quoteBox">
		<form class="layui-form">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input type="text" name="cusNo"
						   class="layui-input
					searchVal" placeholder="客户编号" />
				</div>
				<div class="layui-input-inline">
					<input type="text" name="cusName" class="layui-input
					searchVal" placeholder="客户名" />
				</div>
				<div class="layui-input-inline">
                    <select name="state"  id="state"  >
                        <option value="" >请选择</option>
                        <option value="1">暂缓流失</option>
                        <option value="0" >确认流失</option>
                    </select>
				</div>
				<a class="layui-btn search_btn" data-type="reload"><i
							class="layui-icon">&#xe615;</i> 搜索</a>
			</div>
		</form>
	</blockquote>
	<table id="customerLossList" class="layui-table"  lay-filter="customerLosses"></table>


	<script type="text/html" id="toolbarDemo">
	</script>


	<!--操作-->
	<script id="op" type="text/html" >
		{{# if (d.state=== 1 ) { }}
			<a href="javascript:;"  class="layui-btn layui-btn-warm layui-btn-xs"  lay-event="add">添加暂缓</a>
		{{# } else { }}
			<a href="javascript:;" class="layui-btn layui-btn-normal layui-btn-xs"  lay-event="info">详情</a>
		{{# } }}
	</script>

</form>
<script type="text/javascript" src="${ctx}/js/customerLoss/customer.loss.js"></script>

</body>
</html>