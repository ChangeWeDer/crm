<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>CRM-智能办公系统</title>
    <#include "common.ftl">
</head>
<body class="layui-layout-body layuimini-all">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header">
        <div class="layui-logo">
            <a href="">
                <img src="images/logo.png" alt="logo">
                <h1>CRM-智能办公</h1>
            </a>
        </div>
        <a>
            <div class="layuimini-tool"><i title="展开" class="fa fa-outdent" data-side-fold="1"></i></div>
        </a>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item mobile layui-hide-xs" lay-unselect>
                <a href="javascript:;" data-check-screen="full"><i class="fa fa-arrows-alt"></i></a>
            </li>
            <li class="layui-nav-item layuimini-setting">
                <a href="javascript:;">${(user.userName)!""}</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-iframe-tab="${ctx}/user/toPasswordPage" data-title="修改密码" data-icon="fa fa-gears">修改密码</a>
                    </dd>
                    <dd>
                        <a href="javascript:" class="login-out">退出登录</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item layuimini-select-bgcolor mobile layui-hide-xs" lay-unselect>
                <a href="javascript:;"></a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll layui-left-menu">
            <#if permissions??>
                <ul class="layui-nav layui-nav-tree layui-left-nav-tree layui-this" id="currency">
                    <#if permissions?seq_contains("10")>
                        <li class="layui-nav-item">
                            <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-street-view"></i><span class="layui-left-nav"> 营销管理</span> <span class="layui-nav-more"></span></a>
                            <dl class="layui-nav-child">
                                <#if permissions?seq_contains("1010")>
                                    <dd>
                                        <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-1" data-tab="sale_chance/index" target="_self"><i class="fa fa-tty"></i><span class="layui-left-nav"> 营销机会管理</span></a>
                                    </dd>
                                </#if>
                                <#if permissions?seq_contains("1020")>
                                    <dd>
                                        <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-2" data-tab="cus_dev_plan/index" target="_self"><i class="fa fa-ellipsis-h"></i><span class="layui-left-nav"> 客户开发计划</span></a>
                                    </dd>
                                </#if>
                            </dl>
                        </li>
                    </#if>

                    <#if permissions?seq_contains("20")>
                    <li class="layui-nav-item">
                        <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-flag"></i><span class="layui-left-nav"> 客户管理</span> <span class="layui-nav-more"></span></a><dl class="layui-nav-child">
                    </#if>
                    <#if permissions?seq_contains("2010")>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-3" data-tab="customer/index" target="_self"><i class="fa fa-exchange"></i><span class="layui-left-nav"> 客户信息管理</span></a>
                        </dd>
                    </#if>
                    <#if permissions?seq_contains("2020")>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-4" data-tab="customer_loss/index" target="_self"><i class="fa fa-user-times"></i><span class="layui-left-nav"> 客户流失管理</span></a>
                        </dd>
                    </#if>
                        </dl>
                    </li>
                    <#if permissions?seq_contains("30")>
                    <li class="layui-nav-item">
                        <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-desktop"></i><span class="layui-left-nav"> 服务管理</span> <span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                    </#if>
                            <#if permissions?seq_contains("3010")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-5" data-tab="customer_serve/index/1" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 服务创建</span></a>
                                </dd>
                            </#if>
                            <#if permissions?seq_contains("3020")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-6" data-tab="customer_serve/index/2" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 服务分配</span></a>
                                </dd>
                            </#if>
                            <#if permissions?seq_contains("3030")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-7" data-tab="customer_serve/index/3" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 服务处理</span></a>
                                </dd>
                            </#if>

                            <#if permissions?seq_contains("3040")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-8" data-tab="customer_serve/index/4" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 服务反馈</span></a>
                                </dd>
                            </#if>
                            <#if permissions?seq_contains("3050")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-9" data-tab="customer_serve/index/5" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 服务归档</span></a>
                                </dd>
                            </#if>


                        </dl>
                    </li>
                    <#if permissions?seq_contains("40")>
                    <li class="layui-nav-item">
                        <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-home"></i><span class="layui-left-nav"> 统计报表</span> <span class="layui-nav-more"></span></a><dl class="layui-nav-child">
                    </#if>
                            <#if permissions?seq_contains("4010")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-10" data-tab="report/0" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 客户贡献分析</span></a>
                                </dd>
                            </#if>
                            <#if permissions?seq_contains("4020")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-10" data-tab="report/1" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 客户构成分析</span></a>
                                </dd>
                            </#if>
                            <#if permissions?seq_contains("4030")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-10" data-tab="report/2" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 客户服务分析</span></a>
                                </dd>
                            </#if>
                            <#if permissions?seq_contains("4040")>
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-10" data-tab="report/3" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 客户流失分析</span></a>
                                </dd>
                            </#if>


                        </dl>
                    </li>
                    <#if permissions?seq_contains("50")>
                    <li class="layui-nav-item">
                        <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-gears"></i><span class="layui-left-nav"> 系统设置</span> <span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                    </#if>
                    <#if permissions?seq_contains("5010")>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-11" data-tab="user/index" target="_self"><i class="fa fa-user"></i><span class="layui-left-nav"> 用户管理</span></a>
                        </dd>
                    </#if>
                    <#if permissions?seq_contains("5020")>
                        <dd class="">
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-12" data-tab="role/index" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 角色管理</span></a>
                        </dd>
                    </#if>
                    <#if permissions?seq_contains("5030")>
                        <dd class="">
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-13" data-tab="module/index" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 菜单管理</span></a>
                        </dd>
                    </#if>
                    <#if permissions?seq_contains("5040")>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-10" data-tab="dataDic/index" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 字典管理</span></a>
                        </dd>
                    </#if>
                    <#if permissions?seq_contains("5050")>
                        <dd class="">
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-14" data-tab="druid/index.html" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 系统监控</span></a>
                        </dd>
                    </#if>

                        </dl>
                    </li>
                    <span class="layui-nav-bar" style="top: 201px; height: 0px; opacity: 0;"></span>
                </ul>
            </#if>
        </div>
    </div>

    <div class="layui-body">
        <div class="layui-tab" lay-filter="layuiminiTab" id="top_tabs_box">
            <ul class="layui-tab-title" id="top_tabs">
                <li class="layui-this" id="layuiminiHomeTabId" lay-id="welcome"><i class="fa fa-home"></i> <span>首页</span></li>
            </ul>

            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"> <i class="fa fa-dot-circle-o"></i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-page-close="other"><i class="fa fa-window-close"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" data-page-close="all"><i class="fa fa-window-close-o"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div id="layuiminiHomeTabIframe" class="layui-tab-item layui-show">
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript" src="${ctx}/js/main.js"></script>
</body>
</html>
