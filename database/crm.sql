/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 14/11/2020 13:30:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_cus_dev_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_cus_dev_plan`;
CREATE TABLE `t_cus_dev_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sale_chance_id` int(11) NULL DEFAULT NULL COMMENT '营销机会id',
  `plan_item` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划内容',
  `plan_date` datetime(0) NULL DEFAULT NULL COMMENT '计划日期',
  `exe_affect` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行效果',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_cus_dev_plan`(`sale_chance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cus_dev_plan
-- ----------------------------
INSERT INTO `t_cus_dev_plan` VALUES (142, 116, '吃饭', '2020-11-11 16:00:00', '很好', '2020-11-13 11:15:38', '2020-11-13 11:15:38', 1);

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户所属地',
  `cus_manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户经理',
  `level` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户级别',
  `satisfaction` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户满意度',
  `reputation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户信誉',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `web_site` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `business_license` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照注册好',
  `legal_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `registered_capital` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资金',
  `turnover` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年营业额',
  `bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户账号',
  `local_tax_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地税登记号',
  `national_tax_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国税登记号',
  `state` int(11) NULL DEFAULT NULL COMMENT '流失状态',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, 'KH21321321', '大牛科技', '北京', 'test', '战略合作伙伴', '☆☆☆', '☆☆☆', '北京海淀区双榆树东里15号', '100027', '18888888888', '010-62263393', 'www.daniu.com', '420103000057404', '赵飞翔', '1000', '5000', '中国银行', '6225231243641', '4422214321321', '4104322332', 1, 1, '2020-09-16 11:28:43', '2020-11-13 11:45:28');
INSERT INTO `t_customer` VALUES (2, 'KH20150526073022', '风驰科技', '北京', 'test', '大客户', '☆☆☆☆', '☆☆☆☆', '321', '21', '18888888888', '321', '321', '321', '码云', '', '21', '321', '321', '321', '3213', 1, 1, '2020-08-16 12:15:19', '2020-11-12 13:46:43');
INSERT INTO `t_customer` VALUES (20, 'KH201709181013450', '腾讯', '测试', 'test', '大客户', '☆☆☆☆☆', '☆☆☆☆', '', '', '18888888888', '', '', NULL, '赵飞翔', '', '', '', '', '', '', 1, 1, '2020-07-16 10:13:57', '2020-11-12 13:46:49');
INSERT INTO `t_customer` VALUES (21, 'KH201709181112739', '阿里巴巴', '北京', 'test01', '战略合作伙伴', '☆☆☆☆☆', '☆☆☆☆☆', '浙江杭州', '324324', '18888888888', '2343', 'www.alibaba.com', '232432', '码云', '100', '100000', '杭州', '23432432', '4324324', '234324234', 1, 1, '2020-08-16 11:12:16', '2020-11-12 13:46:59');
INSERT INTO `t_customer` VALUES (22, 'KH20171021105508617', '中国工商银行', '上海', 'test', '战略合作伙伴', '☆☆☆☆☆', '☆☆☆☆☆', '浦东', '201600', '18920156732', '12312321', 'www.icbc.com', '12323', '耿鹏', '1000000', '100000', '工商', '212321', '', '', 1, 1, '2020-08-16 10:55:09', '2020-11-12 13:47:03');
INSERT INTO `t_customer` VALUES (23, 'KH20180115104723756', '百度', '北京', 'test', '战略合作伙伴', '☆☆☆☆', '☆☆☆☆☆', '北京西二旗', '100000', '18888888888', '213123', '123213', '2321321', '李彦宏', '10000', '100000', '工商', '121321313', '', '', 1, 1, '2020-08-16 10:47:23', '2020-11-12 13:47:08');
INSERT INTO `t_customer` VALUES (24, 'KH20180504112003301', '小米科技', '上海', 'test', '重点开发客户', '☆☆☆☆☆', '☆☆☆☆☆', '北京市海淀区清河中街68号华润五彩城购物中心二期13层', '1000000', '18888888888', '123123131', 'www.xiaomi.com', '110108012660422', '雷军', '185000', '5000000', '中国银行', '99999999999', '91110108551385082Q', '91110108551385082Q', 0, 1, '2019-07-04 11:16:21', '2019-11-12 13:47:13');

-- ----------------------------
-- Table structure for t_customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_contact`;
CREATE TABLE `t_customer_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cus_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `contact_time` datetime(0) NULL DEFAULT NULL COMMENT '交往时间',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交往地址',
  `overview` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '概要信息',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_contact
-- ----------------------------
INSERT INTO `t_customer_contact` VALUES (17, 1, '2020-11-04 16:00:00', '广州', '吃饭了', '2020-11-13 11:29:49', '2020-11-13 11:29:49', 1);
INSERT INTO `t_customer_contact` VALUES (18, 1, '2020-11-02 16:00:00', '广州', '', '2020-11-13 11:37:31', '2020-11-13 11:37:31', 1);
INSERT INTO `t_customer_contact` VALUES (21, 21, '2020-11-12 16:00:00', '广州', '', '2020-11-13 11:43:49', '2020-11-13 11:43:49', 1);

-- ----------------------------
-- Table structure for t_customer_linkman
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_linkman`;
CREATE TABLE `t_customer_linkman`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cus_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `link_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `office_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_linkman
-- ----------------------------
INSERT INTO `t_customer_linkman` VALUES (1, 1, 'weder', '男', '无', '', '18888888888', 1, '2020-11-13 19:24:51', '2020-11-13 11:24:35');
INSERT INTO `t_customer_linkman` VALUES (11, 2, 'weder', '男', '无', '', '18888888888', 1, '2020-11-13 19:25:31', '2020-11-13 11:26:01');
INSERT INTO `t_customer_linkman` VALUES (12, 20, 'weder', '男', '无', '', '18888888888', 1, '2020-11-13 19:25:32', '2020-11-13 11:26:09');
INSERT INTO `t_customer_linkman` VALUES (13, 21, 'weder', '男', '无', '', '18888888888', 1, '2020-11-13 19:25:33', '2020-11-13 11:26:17');
INSERT INTO `t_customer_linkman` VALUES (14, 22, 'weder', '男', '无', '', '18888888888', 1, '2020-11-13 19:25:34', '2020-11-13 11:26:26');
INSERT INTO `t_customer_linkman` VALUES (15, 23, 'weder', '男', '无', '', '18888888888', 1, '2020-11-13 19:25:35', '2020-11-13 11:26:33');
INSERT INTO `t_customer_linkman` VALUES (16, 24, 'weder', '男', '无', '', '18888888888', 1, '2020-11-13 19:25:36', '2020-11-13 11:26:43');

-- ----------------------------
-- Table structure for t_customer_loss
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_loss`;
CREATE TABLE `t_customer_loss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cus_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `cus_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `cus_manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户经理',
  `last_order_time` date NULL DEFAULT NULL COMMENT '最后下单时间',
  `confirm_loss_time` date NULL DEFAULT NULL COMMENT '确认流失时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '流失状态',
  `loss_reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流失原因',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 760 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_loss
-- ----------------------------
INSERT INTO `t_customer_loss` VALUES (759, 'KH20180504112003301', '小米科技', 'test', '2018-10-01', NULL, 1, NULL, 1, '2020-11-13 12:27:00', '2020-11-13 12:27:00');

-- ----------------------------
-- Table structure for t_customer_order
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_order`;
CREATE TABLE `t_customer_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cus_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `order_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `order_date` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_order
-- ----------------------------
INSERT INTO `t_customer_order` VALUES (5, 20, '201910021001', '2020-03-03 14:56:10', '上海松江区', 1, '2020-01-29 14:56:15', '2020-11-29 14:56:17', 1);
INSERT INTO `t_customer_order` VALUES (6, 20, '202001022534', '2020-01-16 14:56:26', '杭州市滨江大道', 1, '2020-02-29 14:56:30', '2020-11-29 14:56:32', 1);
INSERT INTO `t_customer_order` VALUES (7, 24, '201911021082', '2018-10-01 17:27:31', '上海浦东', 1, '2020-09-01 17:27:13', '2020-09-01 17:27:21', 1);
INSERT INTO `t_customer_order` VALUES (8, 25, '201909021001', '2019-11-11 10:09:32', '背景海淀', 1, '2020-11-09 10:09:36', '2020-11-09 10:09:39', 1);

-- ----------------------------
-- Table structure for t_customer_reprieve
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_reprieve`;
CREATE TABLE `t_customer_reprieve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `loss_id` int(11) NULL DEFAULT NULL COMMENT '流失id',
  `measure` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '措施',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_reprieve
-- ----------------------------
INSERT INTO `t_customer_reprieve` VALUES (51, 759, '请吃饭', 1, '2020-11-13 12:30:56', '2020-11-13 12:30:56');

-- ----------------------------
-- Table structure for t_customer_serve
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_serve`;
CREATE TABLE `t_customer_serve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `serve_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型',
  `overview` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '概要',
  `customer` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户',
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务状态',
  `service_request` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务请求',
  `create_people` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务创建人',
  `assigner` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务分配人',
  `assign_time` datetime(0) NULL DEFAULT NULL COMMENT '分配时间',
  `service_proce` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务处理',
  `service_proce_people` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务处理人',
  `service_proce_time` datetime(0) NULL DEFAULT NULL COMMENT '服务处理时间',
  `service_proce_result` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `satisfaction` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '满意度',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '是否有效',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_serve
-- ----------------------------
INSERT INTO `t_customer_serve` VALUES (74, '6', 'crm 有待改进', '腾讯', 'fw_005', '', 'admin', '42', '2020-02-20 16:32:57', '234234343423432', 'admin', '2020-02-20 18:32:35', '满意', '☆☆☆☆☆', 1, '2020-02-20 20:49:12', '2020-01-18 09:31:53');
INSERT INTO `t_customer_serve` VALUES (75, '8', 'crm 有待改进', '腾讯', 'fw_005', '', 'admin', '10', '2020-01-18 11:01:20', '客服需求已解决 等待反馈', 'admin', '2020-01-18 11:55:23', '满意', '☆☆☆☆☆', 1, '2020-01-18 12:09:00', '2020-01-18 10:20:10');
INSERT INTO `t_customer_serve` VALUES (76, '6', 'this is test...', '腾讯', 'fw_005', 'this is test...', NULL, '42', '2020-02-20 16:33:06', '23423423432', 'admin', '2020-02-20 18:32:46', '满意', '☆☆☆☆', 1, '2020-02-20 20:49:19', '2020-02-20 15:10:50');
INSERT INTO `t_customer_serve` VALUES (82, '6', 'Crm系统系统上线时间?', '腾讯', 'fw_005', '这是服务测试', 'admin', '10', '2020-02-28 11:13:21', 'Crm即将上线', 'admin', '2020-02-28 11:34:32', 'nice', '☆☆☆☆☆', 1, '2020-11-11 09:46:01', '2020-02-28 09:57:18');
INSERT INTO `t_customer_serve` VALUES (83, '6', '无', '腾讯', 'fw_002', '咨询', 'admin', '10', '2020-11-11 09:45:19', NULL, NULL, NULL, NULL, NULL, 1, '2020-11-11 09:45:19', '2020-11-11 09:20:02');
INSERT INTO `t_customer_serve` VALUES (84, '6', '服务信息', '腾讯', 'fw_001', '咨询内容', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-11-13 11:45:58', '2020-11-13 11:45:58');
INSERT INTO `t_customer_serve` VALUES (85, '8', '', '腾讯', 'fw_001', '服务内容', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-11-13 11:47:34', '2020-11-13 11:47:34');
INSERT INTO `t_customer_serve` VALUES (86, '8', '', '腾讯', 'fw_001', '服务内容', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-11-13 11:51:04', '2020-11-13 11:51:04');
INSERT INTO `t_customer_serve` VALUES (87, '7', '', '腾讯', 'fw_001', '建议服务', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-11-13 11:54:22', '2020-11-13 11:54:22');

-- ----------------------------
-- Table structure for t_datadic
-- ----------------------------
DROP TABLE IF EXISTS `t_datadic`;
CREATE TABLE `t_datadic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_dic_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_dic_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_valid` tinyint(4) NULL DEFAULT 1,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t_datadic`(`data_dic_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_datadic
-- ----------------------------
INSERT INTO `t_datadic` VALUES (1, '客户等级', '普通客户', 1, '2020-02-20 10:04:27', '2020-02-20 10:04:48');
INSERT INTO `t_datadic` VALUES (2, '客户等级', '重点开发客户', 1, '2020-02-20 10:04:30', '2020-02-20 10:04:51');
INSERT INTO `t_datadic` VALUES (3, '客户等级', '大客户', 1, '2020-02-20 10:04:33', '2020-02-20 10:04:53');
INSERT INTO `t_datadic` VALUES (4, '客户等级', '合作伙伴', 1, '2020-02-20 10:04:35', '2020-02-20 10:04:56');
INSERT INTO `t_datadic` VALUES (5, '客户等级', '战略合作伙伴', 1, '2020-02-20 10:04:37', '2020-02-20 10:04:59');
INSERT INTO `t_datadic` VALUES (6, '服务类型', '咨询', 1, '2020-02-20 10:04:40', '2020-02-20 10:05:01');
INSERT INTO `t_datadic` VALUES (7, '服务类型', '建议', 1, '2020-02-20 10:04:43', '2020-02-20 10:05:04');
INSERT INTO `t_datadic` VALUES (8, '服务类型', '投诉', 1, '2020-02-20 10:04:45', '2020-08-24 15:48:46');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `execute_time` int(11) NULL DEFAULT NULL,
  `create_man` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 450 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (424, '营销机会-主页展示', 'index', '1', '0:0:0:0:0:0:0:1', '200', '操作成功', '[]', '2020-01-19 09:55:48', 1, 'admin', '\"sale_chance\"');
INSERT INTO `t_log` VALUES (431, '营销管理-多条件查询', 'querySaleChancesByParams', '1', '0:0:0:0:0:0:0:1', '200', '操作成功', '[{\"customerName\":\"\",\"createMan\":\"\",\"state\":\"\",\"page\":1,\"rows\":10}]', '2020-01-19 09:59:52', 16, 'admin', '{\"total\":30,\"rows\":[{\"assignMan\":\"admin\",\"assignTime\":1505466691000,\"cgjl\":50,\"chanceSource\":\"360推广\",\"createDate\":1505466310000,\"createMan\":\"shsxt\",\"customerName\":\"风驰科技\",\"description\":\"23432\",\"devResult\":0,\"id\":74,\"isValid\":1,\"linkMan\":\"3423432423\",\"linkPhone\":\"234234324\",\"overview\":\"风驰科技  初创型公司！！！\",\"state\":1,\"updateDate\":1505466691000},{\"assignMan\":\"admin\",\"assignTime\":1505546733000,\"cgjl\":100,\"chanceSource\":\"尚学堂推荐\",\"createDate\":1505546720000,\"createMan\":\",shsxt\",\"customerName\":\"test002\",\"description\":\"324324\",\"devResult\":0,\"id\":75,\"isValid\":1,\"linkMan\":\"老裴\",\"linkPhone\":\"2343242\",\"overview\":\"asdasd\",\"state\":1,\"updateDate\":1505546733000},{\"assignMan\":\"admin\",\"assignTime\":1508481153000,\"cgjl\":90,\"chanceSource\":\"百度\",\"createDate\":1508481153000,\"customerName\":\"李彦宏\",\"description\":\"\",\"devResult\":3,\"id\":81,\"isValid\":1,\"linkMan\":\"李彦宏\",\"linkPhone\":\"23213\",\"overview\":\"123213\",\"state\":1,\"updateDate\":1508481153000},{\"assignMan\":\"admin\",\"cgjl\":90,\"chanceSource\":\"官网\",\"createDate\":1515467933000,\"customerName\":\"百度\",\"id\":82,\"isValid\":1,\"linkMan\":\"李彦宏\",\"linkPhone\":\"123123213\",\"updateDate\":1515468116000},{\"assignMan\":\"admin\",\"cgjl\":90,\"chanceSource\":\"来自百度\",\"createDate\":1515470053000,\"customerName\":\"百度\",\"description\":\"\",\"devResult\":0,\"id\":83,\"isValid\":1,\"linkMan\":\"李彦宏\",\"linkPhone\":\"23323\",\"updateDate\":1515470053000},{\"assignMan\":\"admin\",\"cgjl\":90,\"chanceSource\":\"尚学堂官网\",\"createDate\":1515470195000,\"customerName\":\"小马\",\"description\":\"\",\"devResult\":0,\"id\":84,\"isValid\":1,\"linkMan\":\"老裴\",\"linkPhone\":\"2321321\",\"state\":0,\"updateDate\":1515470195000},{\"assignMan\":\"admin\",\"cgjl\":90,\"chanceSource\":\"尚学堂官网\",\"createDate\":1515470357000,\"createMan\":\"admin\",\"customerName\":\"小马\",\"description\":\"\",\"devResult\":0,\"id\":85,\"isValid\":1,\"linkMan\":\"老裴\",\"linkPhone\":\"123123213\",\"state\":0,\"updateDate\":1515470357000},{\"assignMan\":\"admin\",\"assignTime\":1515653291000,\"cgjl\":95,\"chanceSource\":\"sxt官网\",\"createDate\":1515653245000,\"createMan\":\"admin\",\"customerName\":\"阿里\",\"description\":\"213213\",\"devResult\":0,\"id\":87,\"isValid\":1,\"linkMan\":\"老裴\",\"linkPhone\":\"123213\",\"state\":1,\"updateDate\":1515653291000},{\"assignMan\":\"admin\",\"cgjl\":70,\"chanceSource\":\"官网\",\"createDate\":1529998302000,\"createMan\":\"whsxt\",\"customerName\":\"百度\",\"description\":\"\",\"devResult\":0,\"id\":91,\"isValid\":1,\"linkMan\":\"李彦宏\",\"linkPhone\":\"123456\",\"overview\":\"\",\"state\":0,\"updateDate\":1529998302000},{\"assignMan\":\"admin\",\"assignTime\":1529998586000,\"cgjl\":80,\"chanceSource\":\"\",\"createDate\":1529998586000,\"createMan\":\"whsxt\",\"customerName\":\"百度\",\"description\":\"\",\"devResult\":0,\"id\":92,\"isValid\":1,\"linkMan\":\"李彦宏\",\"linkPhone\":\"123456\",\"overview\":\"\",\"state\":1,\"updateDate\":1529998586000}]}');

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名',
  `module_style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块样式',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源地址',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级资源id',
  `parent_opt_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级资源权限码',
  `grade` int(255) NULL DEFAULT NULL COMMENT '层级',
  `opt_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `orders` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `is_valid` int(4) NULL DEFAULT NULL COMMENT '有效状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module` VALUES (1, '营销管理', '', '#', -1, NULL, 0, '10', 1, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (2, '营销机会管理', '', 'saleChance/index', 1, NULL, 1, '1010', 1, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (3, '营销机会管理查询', '', '#', 2, NULL, 2, '101001', 2, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (4, '营销机会管理添加', '', '#', 2, NULL, 2, '101002', 2, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (5, '营销机会管理删除', '', '#', 2, NULL, 2, '101003', 3, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (6, '客户开发计划', '', 'cus_dev_plan/index', 1, NULL, 1, '1020', 2, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (7, '查看详情', '', '#', 6, NULL, 2, '102001', 1, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (8, '客户管理', '', 'customer/index', -1, NULL, 0, '20', 3, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (9, '客户信息管理', '', 'customer/index', 8, NULL, 1, '2010', 1, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (10, '创建', '', '#', 9, NULL, 2, '201001', 1, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (11, '修改', '', '#', 9, NULL, 2, '201002', 2, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (12, '客户流失管理', '', 'customer_loss/index', 8, NULL, 1, '2020', 2, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (13, '暂缓流失', '', 'openCustomerReprieve', 12, NULL, 2, '202001', 1, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (14, '统计报表', '', '#', -1, NULL, 0, '40', 4, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (15, '客户贡献分析', '', 'report/1', 14, NULL, 1, '4010', 1, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (16, '服务管理', '', '#', -1, NULL, 0, '30', 3, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (18, '系统管理', '', '#', -1, NULL, 0, '50', 6, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (19, '删除', '', '#', 9, NULL, 2, '201003', 3, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (26, '用户管理', '', 'user/index', 18, NULL, 1, '5010', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (27, '角色管理', '', 'role/index', 18, NULL, 1, '5020', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (28, '资源管理', '', 'module/index/1', 18, NULL, 1, '5030', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (34, '服务创建', '', NULL, 16, NULL, 1, '3010', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (35, '服务分配', '', NULL, 16, NULL, 1, '3020', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (36, '服务处理', '', NULL, 16, NULL, 1, '3030', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (37, '服务反馈', '', NULL, 16, NULL, 1, '3040', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (38, '服务归档', '', NULL, 16, NULL, 1, '3050', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (39, '客户构成分析', '', NULL, 14, NULL, NULL, '4020', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (40, '客户服务分析', '', NULL, 14, NULL, NULL, '4030', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (44, '营销机会管理修改', '', NULL, 2, NULL, 2, '101004', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (109, '客户类别分析', '', 'report/r01', 14, NULL, 1, '4040', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (126, '流失管理添加', '', NULL, 12, NULL, 2, '123213', 12323, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (130, '用户添加', '', NULL, 26, NULL, 2, '601001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (131, '用户查询', '', NULL, 26, NULL, 2, '601002', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (132, '用户修改', '', NULL, 26, NULL, 2, '601003', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (133, '用户删除', '', NULL, 26, NULL, 2, '601004', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (134, '角色添加', '', NULL, 27, NULL, 2, '602001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (135, '角色查询', '', NULL, 27, NULL, 2, '602002', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (136, '角色修改', '', NULL, 27, NULL, 2, '602003', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (137, '角色删除', '', NULL, 27, NULL, 2, '602004', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (138, '资源添加', '', NULL, 28, NULL, 2, '603001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (139, '资源查询', '', NULL, 28, NULL, 2, '603002', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (140, '资源修改', '', NULL, 28, NULL, 2, '603003', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (141, '资源删除', '', NULL, 28, NULL, 2, '603004', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (142, '字典管理', '', 'data_dic/index', 18, NULL, 1, '5040', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (143, '字典添加', '', NULL, 142, NULL, 2, '604001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (144, '字典查询', '', NULL, 142, NULL, 2, '604002', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (145, '字典修改', '', NULL, 142, NULL, 2, '604003', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (146, '字典删除', '', NULL, 142, NULL, 2, '604004', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (147, '服务创建查询', '', NULL, 34, NULL, 2, '301001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (149, '服务分配查询', '', NULL, 35, NULL, 2, '302001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (150, '服务处理查询', '', NULL, 36, NULL, 2, '303001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (151, '服务处理', '', NULL, 36, NULL, 2, '303002', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (152, '服务反馈查询', '', NULL, 37, NULL, 2, '304001', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (153, '服务反馈', '', NULL, 37, NULL, 2, '304002', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `t_module` VALUES (160, '系统监控', '', 'druid/index.html', 18, NULL, 1, '5050', NULL, 1, '2020-11-01 00:00:00', '2020-11-01 00:00:00');

-- ----------------------------
-- Table structure for t_order_details
-- ----------------------------
DROP TABLE IF EXISTS `t_order_details`;
CREATE TABLE `t_order_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `price` float NULL DEFAULT NULL COMMENT '单价',
  `sum` float NULL DEFAULT NULL COMMENT '总金额',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_details
-- ----------------------------
INSERT INTO `t_order_details` VALUES (1, 5, '联想笔记本', 2, '台', 4900, 9800, 1, '2019-11-29 14:59:32', '2019-11-29 14:59:34');
INSERT INTO `t_order_details` VALUES (2, 5, '惠普音响', 4, '台', 200, 800, 1, '2020-03-01 11:32:34', '2020-03-01 11:32:36');
INSERT INTO `t_order_details` VALUES (3, 8, '罗技键盘', 10, '个', 90, 900, 1, '2020-03-01 11:32:39', '2020-03-01 11:32:41');
INSERT INTO `t_order_details` VALUES (4, 6, '艾利鼠标', 20, '个', 20, 400, 1, '2020-03-01 11:32:46', '2020-03-01 11:32:48');
INSERT INTO `t_order_details` VALUES (5, 7, '东芝U盘', 5, '个', 105, 525, 1, '2020-03-01 11:32:51', '2020-03-01 11:32:53');
INSERT INTO `t_order_details` VALUES (6, 7, '充电器', 1, '个', 30, 30, 1, '2020-03-01 11:32:55', '2020-03-01 11:32:57');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `module_id` int(11) NULL DEFAULT NULL COMMENT '模块ID',
  `acl_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8575 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (3548, 14, 1, '10', '2020-02-17 10:50:33', '2020-02-17 10:50:33');
INSERT INTO `t_permission` VALUES (3549, 14, 2, '1010', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (3550, 14, 3, '101001', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (3551, 14, 4, '101002', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (3552, 14, 5, '101003', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (3553, 14, 44, '101004', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (3554, 14, 100, '1012312321', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (3555, 14, 6, '1020', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (3556, 14, 7, '102001', '2020-02-17 10:50:34', '2020-02-17 10:50:34');
INSERT INTO `t_permission` VALUES (5732, 23, 1, '10', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5733, 23, 2, '1010', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5734, 23, 3, '101001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5735, 23, 4, '101002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5736, 23, 5, '101003', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5737, 23, 44, '101004', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5738, 23, 6, '1020', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5739, 23, 7, '102001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5740, 23, 8, '20', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5741, 23, 9, '2010', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5742, 23, 10, '201001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5743, 23, 11, '201002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5744, 23, 19, '201003', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5745, 23, 12, '2020', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5746, 23, 13, '202001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5747, 23, 126, '123213', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5748, 23, 14, '40', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5749, 23, 15, '4010', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5750, 23, 39, '4020', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5751, 23, 40, '4030', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5752, 23, 109, '4060', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5753, 23, 16, '30', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5754, 23, 34, '3010', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5755, 23, 147, '301001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5756, 23, 35, '3020', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5757, 23, 149, '302001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5758, 23, 36, '3030', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5759, 23, 150, '303001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5760, 23, 151, '303002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5761, 23, 37, '3040', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5762, 23, 152, '304001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5763, 23, 153, '304002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5764, 23, 38, '3050', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5765, 23, 17, '50', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5766, 23, 102, '5010', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5767, 23, 103, '5020', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5768, 23, 18, '60', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5769, 23, 26, '6010', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5770, 23, 130, '601001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5771, 23, 131, '601002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5772, 23, 132, '601003', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5773, 23, 133, '601004', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5774, 23, 27, '6020', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5775, 23, 134, '602001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5776, 23, 135, '602002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5777, 23, 136, '602003', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5778, 23, 137, '602004', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5779, 23, 28, '6030', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5780, 23, 138, '603001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5781, 23, 139, '603002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5782, 23, 140, '603003', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5783, 23, 141, '603004', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5784, 23, 142, '6040', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5785, 23, 143, '604001', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5786, 23, 144, '604002', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5787, 23, 145, '604003', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (5788, 23, 146, '604004', '2020-10-29 16:06:49', '2020-10-29 16:06:49');
INSERT INTO `t_permission` VALUES (8509, 1, 1, '10', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8510, 1, 2, '1010', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8511, 1, 3, '101001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8512, 1, 4, '101002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8513, 1, 5, '101003', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8514, 1, 44, '101004', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8515, 1, 6, '1020', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8516, 1, 7, '102001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8517, 1, 8, '20', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8518, 1, 9, '2010', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8519, 1, 10, '201001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8520, 1, 11, '201002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8521, 1, 19, '201003', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8522, 1, 12, '2020', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8523, 1, 13, '202001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8524, 1, 126, '123213', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8525, 1, 14, '40', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8526, 1, 15, '4010', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8527, 1, 39, '4020', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8528, 1, 40, '4030', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8529, 1, 109, '4040', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8530, 1, 16, '30', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8531, 1, 34, '3010', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8532, 1, 147, '301001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8533, 1, 35, '3020', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8534, 1, 149, '302001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8535, 1, 36, '3030', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8536, 1, 150, '303001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8537, 1, 151, '303002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8538, 1, 37, '3040', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8539, 1, 152, '304001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8540, 1, 153, '304002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8541, 1, 38, '3050', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8542, 1, 18, '50', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8543, 1, 26, '5010', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8544, 1, 130, '601001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8545, 1, 131, '601002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8546, 1, 132, '601003', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8547, 1, 133, '601004', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8548, 1, 27, '5020', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8549, 1, 134, '602001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8550, 1, 135, '602002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8551, 1, 136, '602003', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8552, 1, 137, '602004', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8553, 1, 28, '5030', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8554, 1, 138, '603001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8555, 1, 139, '603002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8556, 1, 140, '603003', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8557, 1, 141, '603004', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8558, 1, 142, '5040', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8559, 1, 143, '604001', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8560, 1, 144, '604002', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8561, 1, 145, '604003', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8562, 1, 146, '604004', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8563, 1, 160, '5050', '2020-11-13 08:05:39', '2020-11-13 08:05:39');
INSERT INTO `t_permission` VALUES (8572, 2, 1, '10', '2020-11-13 12:17:06', '2020-11-13 12:17:06');
INSERT INTO `t_permission` VALUES (8573, 2, 6, '1020', '2020-11-13 12:17:06', '2020-11-13 12:17:06');
INSERT INTO `t_permission` VALUES (8574, 2, 7, '102001', '2020-11-13 12:17:06', '2020-11-13 12:17:06');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `role_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_valid` int(11) NULL DEFAULT NULL COMMENT '有效状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', '系统管理员', '2019-12-01 00:00:00', '2020-02-24 15:53:12', 1);
INSERT INTO `t_role` VALUES (2, '销售', '销售', '2019-12-01 00:00:00', '2020-02-24 15:53:18', 1);
INSERT INTO `t_role` VALUES (3, '客户经理', '客户经理', '2019-12-01 00:00:00', '2020-02-24 15:53:22', 1);
INSERT INTO `t_role` VALUES (14, '技术经理', '研发', '2020-06-30 14:50:24', '2020-02-24 15:53:25', 1);
INSERT INTO `t_role` VALUES (17, '人事', '人事', '2020-10-23 09:15:10', '2020-02-24 15:53:29', 1);
INSERT INTO `t_role` VALUES (24, '法律顾问', '法律顾问', '2020-10-29 16:07:14', '2020-10-29 16:07:14', 1);

-- ----------------------------
-- Table structure for t_sale_chance
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_chance`;
CREATE TABLE `t_sale_chance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chance_source` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机会来源',
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `success_possibility` int(11) NULL DEFAULT NULL COMMENT '成功几率',
  `overview` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '概要',
  `link_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `assign_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分配人',
  `assign_time` datetime(0) NULL DEFAULT NULL COMMENT '分配时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '分配状态',
  `dev_result` int(11) NULL DEFAULT NULL COMMENT '开发结果',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sale_chance
-- ----------------------------
INSERT INTO `t_sale_chance` VALUES (116, '官网', '阿里', 80, '', 'weder', '18888888888', '无', 'admin', '10', '2020-11-13 11:04:27', 1, 3, 1, '2020-11-13 11:04:27', '2020-11-13 12:16:18');
INSERT INTO `t_sale_chance` VALUES (117, '官网', '百度', 80, '', 'weder', '18888888888', '无', 'admin', '10', '2020-11-13 11:19:04', 1, 1, 1, '2020-11-13 11:19:04', '2020-11-13 11:19:04');
INSERT INTO `t_sale_chance` VALUES (118, '官网', '腾讯', 80, '无', 'weder', '18888888888', '无', 'admin', '10', '2020-11-13 11:19:58', 1, 2, 1, '2020-11-13 11:19:58', '2020-11-13 11:19:58');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `true_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话\r',
  `is_valid` int(4) NULL DEFAULT 1 COMMENT '有效状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (10, 'admin', 'ICy5YqxZB1uWSwcVLSNLcA==', 'admin', '2395392356@qq.com', '13327792157', 1, '2020-10-01 12:05:49', '2020-11-13 12:16:56');
INSERT INTO `t_user` VALUES (42, 'scott', '4QrcOUm6Wau+VuBX8g+IPg==', 'scott', '234@126.com', '13327792157', 0, '2020-09-09 00:14:53', '2020-10-27 13:44:03');
INSERT INTO `t_user` VALUES (43, 'user', '4QrcOUm6Wau+VuBX8g+IPg==', '李六', '2395392356@qq.com', '18888888888', 1, '2020-11-13 12:09:28', '2020-11-13 12:15:50');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (178, 44, 14, '2020-10-27 13:10:50', '2020-10-27 13:10:50');
INSERT INTO `t_user_role` VALUES (179, 45, 17, '2020-10-27 13:11:20', '2020-10-27 13:11:20');
INSERT INTO `t_user_role` VALUES (182, 42, 2, '2020-10-27 13:44:03', '2020-10-27 13:44:03');
INSERT INTO `t_user_role` VALUES (193, 43, 2, '2020-11-13 12:15:50', '2020-11-13 12:15:50');
INSERT INTO `t_user_role` VALUES (194, 43, 3, '2020-11-13 12:15:50', '2020-11-13 12:15:50');
INSERT INTO `t_user_role` VALUES (195, 10, 1, '2020-11-13 12:16:56', '2020-11-13 12:16:56');
INSERT INTO `t_user_role` VALUES (196, 10, 3, '2020-11-13 12:16:56', '2020-11-13 12:16:56');
INSERT INTO `t_user_role` VALUES (197, 10, 2, '2020-11-13 12:16:56', '2020-11-13 12:16:56');
INSERT INTO `t_user_role` VALUES (198, 10, 14, '2020-11-13 12:16:56', '2020-11-13 12:16:56');
INSERT INTO `t_user_role` VALUES (199, 10, 17, '2020-11-13 12:16:56', '2020-11-13 12:16:56');
INSERT INTO `t_user_role` VALUES (200, 10, 24, '2020-11-13 12:16:56', '2020-11-13 12:16:56');

SET FOREIGN_KEY_CHECKS = 1;
