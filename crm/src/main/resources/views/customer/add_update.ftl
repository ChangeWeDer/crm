<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input name="id" type="hidden" value="${(customer.id)!}"/>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">客户名称</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="name" id="name"  lay-verify="required" value="${(customer.name)!}" placeholder="请输入客户名">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">法人</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="legalPerson" id="legalPerson" lay-verify="required" value="${(customer.legalPerson)!}" placeholder="请输入法人">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">区域</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="area"    value="${(customer.area)!}" placeholder="请输入区域">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">客户经理</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="cusManager" value="${(customer.cusManager)!}" placeholder="请输入客户经理">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">客户级别</label>
            <div class="layui-input-block">
                <select name="level"  id="level">
                    <option value="" >请选择</option>
                    <option value="普通客户" <#if customer?? & customer.level=="普通客户">selected="selected"</#if>>普通客户</option>
                    <option value="重点开发客户" <#if customer?? & customer.level=="重点开发客户">selected="selected"</#if>>重点开发客户</option>
                    <option value="大客户" <#if customer?? & customer.level=="大客户">selected="selected"</#if>>大客户</option>
                    <option value="合作伙伴" <#if customer?? & customer.level=="合作伙伴">selected="selected"</#if>>合作伙伴</option>
                    <option value="战略合作伙伴" <#if customer?? & customer.level=="战略合作伙伴">selected="selected"</#if>>战略合作伙伴</option>
                </select>
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">信用度</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="reputation" value="${(customer.reputation)!}"  placeholder="请输入客户信用级别">
            </div>
        </div>
    </div>


    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">邮编</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="postCode" value="${(customer.postCode)!}"  placeholder="请输入客户邮编">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="phone" lay-verify="required" value="${(customer.phone)!}"  placeholder="请输入客户联系电话">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">客户地址</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="address" value="${(customer.address)!}"  placeholder="请输入客户地址">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">传真</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="fax" value="${(customer.fax)!}"  placeholder="请输入客户传真">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">网站</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="webSite" value="${(customer.webSite)!}"  placeholder="请输入客户网站地址">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">注册资金</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="registeredCapital" value="${(customer.registeredCapital)!}"  placeholder="请输入注册资金">
            </div>
        </div>
    </div>



    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">开户行</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="bank" value="${(customer.bank)!}"  placeholder="请输入客户开户行">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">开户账号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="accountNumber" value="${(customer.accountNumber)!}"  placeholder="请输入开户账号">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">国税</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="nationalTaxNum" value="${(customer.nationalTaxNum)!}"  placeholder="请输入国税">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">地税</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="localTaxNum" value="${(customer.localTaxNum)!}"  placeholder="请输入地税">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">

        <div class="layui-col-xs6">
            <label class="layui-form-label">年营业额</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="turnover" value="${(customer.turnover)!}"  placeholder="请输入客户年营业额">
            </div>
        </div>
    </div>


    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="addOrUpdateCustomer">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/customer/add.update.js"></script>
</body>
</html>