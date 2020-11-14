<!DOCTYPE html>
<html>
<head>
	<title>暂缓管理</title>
	<#include "../common.ftl">
</head>
<body class="childrenBody">
	<div class="layui-col-md12">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form" >
					<input name="id" type="hidden" value="${(customerLoss.id)!}"/>
					<div class="layui-form-item layui-row">
						<div class="layui-col-xs6">
							<label class="layui-form-label">客户名称</label>
							<div class="layui-input-block">
								<input type="text" class="layui-input"
									   name="customerName" id="customerName"  value="${(customerLoss.cusName)!}" readonly="readonly">
							</div>
						</div>
						<div class="layui-col-xs6">
							<label class="layui-form-label">客户编号</label>
							<div class="layui-input-block">
								<input type="text" class="layui-input"
									   name="chanceSource" id="chanceSource" value="${(customerLoss.cusNo)!}" readonly="readonly">
							</div>
						</div>
					</div>
					<#if customerLoss.state==0>
						<div class="layui-form-item layui-row">
							<div class="layui-col-xs6">
								<label class="layui-form-label">确认流失时间</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input"
										   name="confirmLossTime"
										   value="${(customerLoss.confirmLossTime?string("yyyy-MM-dd HH:mm:ss"))}" readonly="readonly">
								</div>
							</div>
							<div class="layui-col-xs6">
								<label class="layui-form-label">流失原因</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input"
										   name="lossReason" value="${(customerLoss.lossReason)!}" readonly="readonly">
								</div>
							</div>
						</div>
					</#if>

				</form>
			</div>
		</div>
	</div>

	<div class="layui-col-md12">
		<table id="customerRepList" class="layui-table"  lay-filter="customerReps"></table>
	</div>



	<#if customerLoss.state==1>
		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
					<i class="layui-icon">&#xe608;</i>
					添加暂缓
				</a>
				<a class="layui-btn layui-btn-normal addNews_btn" lay-event="confirm">
					<i class="layui-icon">&#xe608;</i>
					确认流失
				</a>
			</div>
		</script>

		<!--行操作-->
		<script id="customerRepListBar" type="text/html">
			<a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
		</script>
	</#if>



	<script type="text/javascript" src="${ctx}/js/customerLoss/customer.rep.js"></script>
</body>
</html>