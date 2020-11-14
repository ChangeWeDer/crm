<!DOCTYPE html>
<html>
<head>
	<title>数据字典管理</title>
	<#include "../common.ftl">
</head>
<body class="childrenBody">

<form class="layui-form" >

	<table id="dataDicList" class="layui-table"  lay-filter="dataDic"></table>



		<script type="text/html" id="toolbarDemo">

				<div class="layui-btn-container">

						<a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
							<i class="layui-icon">&#xe608;</i>
							添加
						</a>

						<a class="layui-btn layui-btn-normal delNews_btn" lay-event="del">
							<i class="layui-icon">&#xe608;</i>
							删除
						</a>

				</div>

		</script>



	<!--操作-->
	<script id="dataDicListBar" type="text/html">

				<a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>

				<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>

	</script>

</form>
<script type="text/javascript" src="${ctx}/js/dataDic/dataDic.js"></script>

</body>
</html>