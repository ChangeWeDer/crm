## 一、说在前面
本项目是个人为了学习springboot开发的项目，参考了一些开源项目和学习视频，项目中的一些功能注释都是已经写好了，会有一些瑕疵、未完善的地方，仅供参考学习使用。
下载地址1：[Github](https://github.com/ChangeWeDer/crm)
下载地址2（推荐）：[Gitee](https://gitee.com/changeWeder/crm)
博客地址：[博客地址](https://www.upstudy.top/index.php/archives/39/)
***
## 二、技术栈
1. springboot
2. 数据库 MySQL 5.7
3. 前端模板 [layui](http://www.layui.com/doc)
4. 持久层 [mybatis-plus](https://baomidou.com/guide/)
5. 模板引擎 [freemark](http://freemarker.foofun.cn/)
6. 生成目录树插件 [Z-tree](http://www.treejs.cn/v3/faq.php#_206)
7. 数据连接池 [Druid](https://github.com/alibaba/druid/)
8. 接口测试工具 [swagger2](https://swagger.io/)
9. 图标展示工具 [echars](https://echarts.apache.org/zh/index.html)
10. 分页工具 PageHelper
11. 插件（注解生成get set方法）Lombok
***

## 三、工具
1. IDEA
2. Navicat Premium
3. MySQL 5.7
4. Chrome浏览器
***
## 四、食用方式
1.新建一个名为 **crm** 的数据库，然后导入本项目中的sql文件
2.IDEA安装lombok插件（在插件库中直接搜索即可下载）
3.运行启动访问 **http://localhost:8080/** 即可
4.可在swagger（ **localhost:8080/swagger-ui.html** ）中查看本项目中的所有接口，有个总体了解

**登录页：**
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020111413270439.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg3ODMzMg==,size_16,color_FFFFFF,t_70#pic_center)
**页面：**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201114132825159.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg3ODMzMg==,size_16,color_FFFFFF,t_70#pic_center)

***
## 五、数据库表间关系
**5.1.营销管理**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201114115418195.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg3ODMzMg==,size_16,color_FFFFFF,t_70#pic_center)
**5.2.客户管理**
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020111412520713.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg3ODMzMg==,size_16,color_FFFFFF,t_70#pic_center)
**5.3.服务管理**：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201114125819116.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg3ODMzMg==,size_16,color_FFFFFF,t_70#pic_center)
**5.4.权限管理**：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201114130543290.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg3ODMzMg==,size_16,color_FFFFFF,t_70#pic_center)
**5.5.其余**：日志表（t_log）、t_datadic(字典表)

## 六、项目目录说明
- main.java.top.upstudy
  * base (公共类)
  * crm 
    + annotations （自定义注解）
    + aspect（切面类）
    + config（配置类）
    + controller（controler层）
    + enums（枚举类）
    + exceptions（全局异常配置）
    + generator（代码生成器）
    + interceptor（拦截器）
    + mapper（大部分增删改查使用了mybatis-plus，自定义SQL的已在这里声明）
    + pojo（实体类）
    + query（查询类）
    + service（service层）
    + task（定时任务，定时将定义流失的用户添加到流失表）
    + utils（工具类）
    + vo（自定义实体）
   
