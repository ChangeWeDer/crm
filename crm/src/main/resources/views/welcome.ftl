<!DOCTYPE html>
<html>
<head>
  <#include "common.ftl">
</head>


<body class="childrenBody">

<div class="layui-box">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md12">
            <blockquote class="layui-elem-quote main_btn">
                <p>此CRM客户关系管理系统采用： </p>
                <p>0.springboot</p>
                <p>1.前端模板 layui  <a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="http://www.layui.com/doc">layui文档</a></p>
                <p>2.持久层 mybatis-plus  <a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="https://baomidou.com/guide/">mybatis-plus文档</a></p>
                <p>3.模板引擎 freemark  <a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="http://freemarker.foofun.cn/">freemark文档</a></p>
                <p>4.生成目录树插件 Z-tree  <a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="http://www.treejs.cn/v3/faq.php#_206">Z-tree文档</a></p>
                <p>5.数据连接池 Druid  <a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="https://github.com/alibaba/druid/">Druid文档</a></p>
                <p>6.接口测试工具 swagger2  <a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="https://swagger.io/">swagger文档</a></p>
                <p>7.图标展示工具 echars  <a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="https://swagger.io/">echars文档</a></p>
                <p>8.分页工具 PageHelper</p>
                <p>9.插件（注解生成get set方法）Lombok</p>


                <p>github    <a class="layui-btn layui-btn-xs layui-btn-normal" target="_blank" href="https://github.com/ChangeWeDer/crm">github地址</a></p>
                
                <p>gitee     <a class="layui-btn layui-btn-xs layui-btn-normal" target="_blank" href="https://gitee.com/changeWeder/crm">gitee地址</a></p>
            </blockquote>
        </div>
    </div>
</div>


<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
        });

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            ,interval: 1800
            ,anim: 'fade'
            ,height: '120px'
        });

        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '100%'
            ,height: '440px'
            ,interval: 3000
        });

        //事件
        carousel.on('change(test4)', function(res){
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
</body>
</html>
