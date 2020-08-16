/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50168
Source Host           : localhost:3306
Source Database       : car

Target Server Type    : MYSQL
Target Server Version : 50168
File Encoding         : 65001

Date: 2020-03-15 00:48:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car_category
-- ----------------------------
DROP TABLE IF EXISTS `car_category`;
CREATE TABLE `car_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL COMMENT '类目名字',
  `category_type` int(100) NOT NULL COMMENT '类目编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uqe_category_type` (`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='类目表';

-- ----------------------------
-- Records of car_category
-- ----------------------------
INSERT INTO `car_category` VALUES ('1', '奥迪', '1', '2018-11-27 21:33:21', '2018-11-27 21:33:21');
INSERT INTO `car_category` VALUES ('2', '保时捷', '2', '2018-11-27 21:33:56', '2018-11-27 21:33:56');
INSERT INTO `car_category` VALUES ('3', '布加迪', '3', '2018-11-27 21:34:12', '2018-11-27 21:34:12');
INSERT INTO `car_category` VALUES ('4', '宾利', '4', '2018-11-27 21:34:36', '2018-11-27 21:34:36');
INSERT INTO `car_category` VALUES ('5', '法拉利', '5', '2018-11-27 21:35:07', '2018-11-27 21:35:07');

-- ----------------------------
-- Table structure for car_order
-- ----------------------------
DROP TABLE IF EXISTS `car_order`;
CREATE TABLE `car_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `phone` varchar(32) NOT NULL COMMENT '买家电话',
  `address` varchar(128) NOT NULL COMMENT '买家租车地址',
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
  `order_status` int(4) NOT NULL DEFAULT '0' COMMENT '订单状态，0未支付，1支付成功，2取消',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `address1` varchar(128) NOT NULL COMMENT '买家还车地址',
  `type1` int(11) NOT NULL DEFAULT '0' COMMENT '租车类型，0上门，1到店',
  `type2` int(11) NOT NULL DEFAULT '0' COMMENT '还车类型，0上门，1到店',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_order
-- ----------------------------
INSERT INTO `car_order` VALUES ('5', '1543377730275', '5', '18316981006', '广东工贸东区校门口', '880.00', '1', '2018-11-28 12:02:10', '2018-11-28 12:42:26', '', '0', '0');
INSERT INTO `car_order` VALUES ('6', '1546569216639', '5', '18316981006', '广州天河区车陂店', '300.00', '0', '2019-01-04 10:33:36', '2019-01-04 10:33:36', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('7', '1546569579265', '5', '18316981006', '广州天河区车陂店', '150.00', '0', '2019-01-04 10:39:39', '2019-01-04 10:39:39', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('10', '1546571208091', '9', '13800138000', '广州天河区车陂店', '300.00', '0', '2019-01-04 11:06:48', '2019-01-04 11:06:48', '广州天河区车陂店', '1', '1');
INSERT INTO `car_order` VALUES ('11', '1546573942215', '9', '13800138000', '广州天河区车陂店', '300.00', '0', '2019-01-04 11:52:22', '2019-01-04 11:52:22', '广州海珠区客村店', '1', '1');
INSERT INTO `car_order` VALUES ('12', '1546574149836', '9', '13800138000', '广州天河区车陂店', '150.00', '0', '2019-01-04 11:55:49', '2019-01-04 11:55:49', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('13', '1546574404171', '9', '13800138000', '广州天河区车陂店', '360.00', '0', '2019-01-04 12:00:04', '2019-01-04 12:00:04', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('14', '1546574522945', '9', '13800138000', '广州天河区车陂店', '250.00', '0', '2019-01-04 12:02:02', '2019-01-04 12:02:02', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('15', '1546574671156', '9', '13800138000', '广州天河区车陂店', '7500.00', '0', '2019-01-04 12:04:31', '2019-01-04 12:04:31', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('16', '1546574698634', '9', '13800138000', '广州天河区车陂店', '7500.00', '0', '2019-01-04 12:04:58', '2019-01-04 12:04:58', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('17', '1546574781443', '9', '13800138000', '广州天河区车陂店', '5500.00', '0', '2019-01-04 12:06:21', '2019-01-04 12:06:21', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('18', '1546574839118', '9', '13800138000', '广州海珠区客村店', '5500.00', '0', '2019-01-04 12:07:19', '2019-01-04 12:07:19', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('19', '1546575093747', '9', '13800138000', '深圳福田区香蜜湖店', '300.00', '0', '2019-01-04 12:11:33', '2019-01-04 12:11:33', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('20', '1546673153332', '5', '18316981006', '广州天河区车陂店', '450.00', '0', '2019-01-05 15:25:53', '2019-01-05 15:25:53', '广州海珠区客村店', '1', '1');
INSERT INTO `car_order` VALUES ('21', '1546673368182', '5', '18316981006', '广州天河区车陂店', '150.00', '0', '2019-01-05 15:29:28', '2019-01-05 15:29:28', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('22', '1546675598236', '9', '13800138000', '深圳南山区南山科技园店', '1440.00', '0', '2019-01-05 16:06:38', '2019-01-05 16:06:38', '广州海珠区客村店', '1', '1');
INSERT INTO `car_order` VALUES ('23', '1546675648836', '9', '13800138000', '深圳南山区南山科技园店', '440.00', '0', '2019-01-05 16:07:28', '2019-01-05 16:07:28', '深圳福田区香蜜湖店', '1', '1');
INSERT INTO `car_order` VALUES ('24', '1546675852883', '9', '13800138000', '深圳南山区南山科技园店', '15000.00', '0', '2019-01-05 16:10:52', '2019-01-05 16:10:52', '深圳福田区香蜜湖店', '1', '1');
INSERT INTO `car_order` VALUES ('25', '1546676187088', '9', '13800138000', '深圳南山区南山科技园店', '11000.00', '0', '2019-01-05 16:16:27', '2019-01-05 16:16:27', '深圳福田区香蜜湖店', '1', '1');
INSERT INTO `car_order` VALUES ('26', '1546676223083', '9', '13800138000', '你', '6200.00', '0', '2019-01-05 16:17:03', '2019-01-05 16:17:03', '你啊', '1', '1');
INSERT INTO `car_order` VALUES ('27', '1546676360159', '9', '13800138000', '啊', '6200.00', '0', '2019-01-05 16:19:20', '2019-01-05 16:19:20', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('28', '1546676601512', '9', '13800138000', '广州天河区车陂店', '540.00', '0', '2019-01-05 16:23:21', '2019-01-05 16:23:21', '广州天河区车陂店', '1', '1');
INSERT INTO `car_order` VALUES ('29', '1546676691071', '9', '13800138000', '啊', '360.00', '0', '2019-01-05 16:24:51', '2019-01-05 16:24:51', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('30', '1546676743532', '9', '13800138000', '啊', '1800.00', '0', '2019-01-05 16:25:43', '2019-01-05 16:25:43', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('31', '1546677151924', '9', '13800138000', '啊', '1800.00', '0', '2019-01-05 16:32:31', '2019-01-05 16:32:31', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('32', '1546678872711', '9', '13800138000', '啊', '1800.00', '0', '2019-01-05 17:01:12', '2019-01-05 17:01:12', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('33', '1546678890188', '9', '13800138000', '啊', '1800.00', '0', '2019-01-05 17:01:30', '2019-01-05 17:01:30', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('34', '1546678967421', '9', '13800138000', '广州天河区车陂店', '1800.00', '0', '2019-01-05 17:02:47', '2019-01-05 17:02:47', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('35', '1546679001621', '9', '13800138000', '啊啊', '1800.00', '0', '2019-01-05 17:03:21', '2019-01-05 17:03:21', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('36', '1546679037096', '9', '13800138000', '啊啊啊', '1800.00', '0', '2019-01-05 17:03:57', '2019-01-05 17:03:57', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('37', '1546679046332', '9', '13800138000', '广州天河区车陂店', '1800.00', '0', '2019-01-05 17:04:06', '2019-01-05 17:04:06', '啊', '1', '1');
INSERT INTO `car_order` VALUES ('38', '1546679373652', '9', '13800138000', '啊', '540.00', '0', '2019-01-05 17:09:33', '2019-01-05 17:09:33', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('39', '1546679381539', '9', '13800138000', '广州天河区车陂店', '540.00', '0', '2019-01-05 17:09:41', '2019-01-05 17:09:41', '啊', '1', '0');
INSERT INTO `car_order` VALUES ('40', '1546746497961', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 11:48:17', '2019-01-06 11:48:17', '你', '0', '0');
INSERT INTO `car_order` VALUES ('41', '1546746906327', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 11:55:06', '2019-01-06 11:55:06', '你', '0', '0');
INSERT INTO `car_order` VALUES ('42', '1546746910118', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 11:55:10', '2019-01-06 11:55:10', '你', '0', '0');
INSERT INTO `car_order` VALUES ('43', '1546746919862', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 11:55:19', '2019-01-06 11:55:19', '你', '0', '0');
INSERT INTO `car_order` VALUES ('44', '1546747124785', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 11:58:44', '2019-01-06 11:58:44', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('45', '1546747406964', '5', '18316981006', '啊a', '180.00', '0', '2019-01-06 12:03:26', '2019-01-06 12:03:26', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('46', '1546747473953', '5', '18316981006', '啊', '180.00', '0', '2019-01-06 12:04:33', '2019-01-06 12:04:33', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('47', '1546747875012', '5', '18316981006', '啊', '180.00', '0', '2019-01-06 12:11:14', '2019-01-06 12:11:14', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('48', '1546750199265', '5', '18316981006', 'a', '360.00', '0', '2019-01-06 12:49:59', '2019-01-06 12:49:59', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('49', '1546751170580', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 13:06:10', '2019-01-06 13:06:10', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('50', '1546752005920', '5', '18316981006', '啊', '1620.00', '0', '2019-01-06 13:20:05', '2019-01-06 13:20:05', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('51', '1546752037333', '5', '18316981006', '啊', '1620.00', '0', '2019-01-06 13:20:37', '2019-01-06 13:20:37', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('52', '1546752111755', '5', '18316981006', '啊', '55800.00', '0', '2019-01-06 13:21:51', '2019-01-06 13:21:51', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('53', '1546752200603', '5', '18316981006', '啊', '55800.00', '0', '2019-01-06 13:23:20', '2019-01-06 13:23:20', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('54', '1546752283272', '5', '18316981006', '啊', '6200.00', '0', '2019-01-06 13:24:43', '2019-01-06 13:24:43', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('57', '1546752511144', '5', '18316981006', '啊', '11000.00', '0', '2019-01-06 13:28:31', '2019-01-06 13:28:31', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('58', '1546752635937', '5', '18316981006', '啊', '300.00', '0', '2019-01-06 13:30:35', '2019-01-06 13:30:35', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('59', '1546752679568', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 13:31:19', '2019-01-06 13:31:19', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('60', '1546752726283', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 13:32:06', '2019-01-06 13:32:06', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('61', '1546752881628', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 13:34:41', '2019-01-06 13:34:41', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('62', '1546752927394', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 13:35:27', '2019-01-06 13:35:27', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('63', '1546753286653', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 13:41:26', '2019-01-06 13:41:26', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('64', '1546753533684', '5', '18316981006', '啊', '450.00', '0', '2019-01-06 13:45:33', '2019-01-06 13:45:33', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('65', '1546753585803', '5', '18316981006', '啊', '450.00', '0', '2019-01-06 13:46:25', '2019-01-06 13:46:25', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('66', '1546753667043', '5', '18316981006', '啊a', '300.00', '0', '2019-01-06 13:47:46', '2019-01-06 13:47:46', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('67', '1546753930430', '5', '18316981006', '啊', '450.00', '0', '2019-01-06 13:52:10', '2019-01-06 13:52:10', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('68', '1546754354174', '5', '18316981006', '啊', '450.00', '0', '2019-01-06 13:59:14', '2019-01-06 13:59:14', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('69', '1546754662239', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 14:04:22', '2019-01-06 14:04:22', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('70', '1546754989249', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 14:09:49', '2019-01-06 14:09:49', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('71', '1546755158909', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 14:12:38', '2019-01-06 14:12:38', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('72', '1546755420544', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 14:17:00', '2019-01-06 14:17:00', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('73', '1546755536858', '5', '18316981006', '啊', '360.00', '0', '2019-01-06 14:18:56', '2019-01-06 14:18:56', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('74', '1546755654991', '5', '18316981006', '啊', '440.00', '0', '2019-01-06 14:20:54', '2019-01-06 14:20:54', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('75', '1546755890977', '5', '18316981006', '啊', '440.00', '0', '2019-01-06 14:24:50', '2019-01-06 14:24:50', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('76', '1546756121074', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 14:28:41', '2019-01-06 14:28:41', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('77', '1546756121075', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 14:28:41', '2019-01-06 14:28:41', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('78', '1546756231313', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 14:30:31', '2019-01-06 14:30:31', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('79', '1546756231320', '5', '18316981006', '啊', '540.00', '0', '2019-01-06 14:30:31', '2019-01-06 14:30:31', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('80', '1546946423828', '5', '18316981006', '啊', '300.00', '0', '2019-01-08 19:20:23', '2019-01-08 19:20:23', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('81', '1547100413683', '5', '18316981006', 'a ', '1350.00', '0', '2019-01-10 14:06:53', '2019-01-10 14:06:53', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('82', '1547100701199', '5', '18316981006', 'a ', '1350.00', '0', '2019-01-10 14:11:41', '2019-01-10 14:11:41', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('83', '1547104076395', '5', '18316981006', 'a ', '300.00', '0', '2019-01-10 15:07:56', '2019-01-10 15:07:56', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('84', '1547104385354', '5', '18316981006', 'a', '300.00', '0', '2019-01-10 15:13:05', '2019-01-10 15:13:05', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('85', '1547104767915', '5', '18316981006', 'a', '300.00', '0', '2019-01-10 15:19:27', '2019-01-10 15:19:27', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('86', '1547104831001', '5', '18316981006', 'a', '300.00', '0', '2019-01-10 15:20:30', '2019-01-10 15:20:30', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('87', '1547104864331', '5', '18316981006', 'a ', '150.00', '0', '2019-01-10 15:21:04', '2019-01-10 15:21:04', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('88', '1547105062142', '5', '18316981006', 'a ', '150.00', '0', '2019-01-10 15:24:22', '2019-01-10 15:24:22', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('89', '1547105231603', '5', '18316981006', 'a ', '150.00', '0', '2019-01-10 15:27:11', '2019-01-10 15:27:11', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('90', '1547105245011', '5', '18316981006', 'a ', '150.00', '0', '2019-01-10 15:27:24', '2019-01-10 15:27:24', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('91', '1547105263219', '5', '18316981006', 'a', '300.00', '0', '2019-01-10 15:27:43', '2019-01-10 15:27:43', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('92', '1547114134875', '5', '18316981006', 'a', '300.00', '2', '2019-01-10 17:55:34', '2019-01-10 17:55:39', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('93', '1547114152438', '5', '18316981006', 'a', '300.00', '2', '2019-01-10 17:55:52', '2019-01-10 17:55:58', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('94', '1547114908856', '5', '18316981006', 'a', '450.00', '2', '2019-01-10 18:08:28', '2019-01-10 18:08:33', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('95', '1547114929792', '5', '18316981006', 'a', '450.00', '2', '2019-01-10 18:08:49', '2019-01-10 18:08:51', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('96', '1547115026206', '5', '18316981006', 'a', '450.00', '0', '2019-01-10 18:10:26', '2019-01-10 18:10:26', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('97', '1547115029381', '5', '18316981006', 'a', '450.00', '2', '2019-01-10 18:10:29', '2019-01-10 18:10:32', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('98', '1547115093675', '5', '18316981006', 'a', '150.00', '2', '2019-01-10 18:11:33', '2019-01-10 18:11:36', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('99', '1547115133317', '5', '18316981006', 'a', '150.00', '2', '2019-01-10 18:12:13', '2019-01-10 18:12:16', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('100', '1547115407263', '5', '18316981006', 'a', '150.00', '2', '2019-01-10 18:16:47', '2019-01-10 18:16:59', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('101', '1547115461294', '5', '18316981006', 'a', '300.00', '2', '2019-01-10 18:17:41', '2019-01-10 18:17:44', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('102', '1547115746302', '5', '18316981006', 'a', '150.00', '2', '2019-01-10 18:22:26', '2019-01-10 18:22:30', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('103', '1547115854828', '5', '18316981006', '广州海珠区客村店', '360.00', '2', '2019-01-10 18:24:14', '2019-01-10 18:24:27', 'a', '1', '0');
INSERT INTO `car_order` VALUES ('104', '1547115925602', '5', '18316981006', '广州海珠区客村店', '360.00', '2', '2019-01-10 18:25:25', '2019-01-10 18:25:29', 'a', '1', '0');
INSERT INTO `car_order` VALUES ('105', '1547126784450', '5', '18316981006', '广州海珠区客村店', '360.00', '2', '2019-01-10 21:26:24', '2019-01-10 21:26:28', 'a', '1', '0');
INSERT INTO `car_order` VALUES ('106', '1547126856580', '5', '18316981006', 'a', '1200.00', '2', '2019-01-10 21:27:36', '2019-01-10 21:27:40', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('107', '1547127193001', '5', '18316981006', 'a', '300.00', '2', '2019-01-10 21:33:12', '2019-01-10 21:33:16', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('108', '1547127275953', '5', '18316981006', 'a', '300.00', '2', '2019-01-10 21:34:35', '2019-01-10 21:35:57', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('109', '1547127787895', '5', '18316981006', 'a', '450.00', '2', '2019-01-10 21:43:07', '2019-01-10 21:43:36', '啊啊', '0', '0');
INSERT INTO `car_order` VALUES ('110', '1547127918075', '5', '18316981006', '吧', '1350.00', '2', '2019-01-10 21:45:18', '2019-01-10 21:45:30', '吧', '0', '0');
INSERT INTO `car_order` VALUES ('111', '1547128035006', '5', '18316981006', '吧', '1350.00', '2', '2019-01-10 21:47:14', '2019-01-10 21:47:20', '吧', '0', '0');
INSERT INTO `car_order` VALUES ('112', '1547128095320', '5', '18316981006', '啊', '300.00', '2', '2019-01-10 21:48:15', '2019-01-10 21:48:36', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('113', '1547129358417', '5', '18316981006', '啊', '150.00', '2', '2019-01-10 22:09:18', '2019-01-10 22:09:22', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('114', '1547129460421', '5', '18316981006', '啊', '150.00', '2', '2019-01-10 22:11:00', '2019-01-10 22:11:10', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('115', '1547131079730', '5', '18316981006', '啊', '150.00', '2', '2019-01-10 22:37:59', '2019-01-10 22:38:32', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('116', '1547131512579', '5', '18316981006', 'a', '450.00', '2', '2019-01-10 22:45:12', '2019-01-10 22:45:17', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('117', '1547131700464', '5', '18316981006', '啊', '150.00', '0', '2019-01-10 22:48:20', '2019-01-10 22:48:20', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('118', '1547198231886', '5', '18316981006', '广州天河区车陂店', '360.00', '2', '2019-01-11 17:17:12', '2019-01-11 17:17:24', '广州天河区车陂店', '1', '1');
INSERT INTO `car_order` VALUES ('119', '1547198576819', '5', '18316981006', 'a ', '180.00', '1', '2019-01-11 17:22:56', '2019-01-11 17:23:01', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('120', '1547198765260', '5', '18316981006', 'a ', '180.00', '1', '2019-01-11 17:26:05', '2019-01-11 17:26:10', 'a ', '0', '0');
INSERT INTO `car_order` VALUES ('121', '1547198918921', '5', '18316981006', 'a', '540.00', '1', '2019-01-11 17:28:38', '2019-01-11 17:28:49', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('122', '1547198970563', '5', '18316981006', 'a', '750.00', '0', '2019-01-11 17:29:30', '2019-01-11 17:29:30', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('123', '1547199105235', '5', '18316981006', 'a', '540.00', '1', '2019-01-11 17:31:45', '2019-01-11 17:31:53', 'a', '0', '0');
INSERT INTO `car_order` VALUES ('124', '1547199703541', '5', '18316981006', '深圳福田区香蜜湖店', '360.00', '0', '2019-01-11 17:41:43', '2019-01-11 17:41:43', '广州海珠区客村店', '1', '1');
INSERT INTO `car_order` VALUES ('125', '1547199716537', '5', '18316981006', '深圳福田区香蜜湖店', '500.00', '2', '2019-01-11 17:41:56', '2019-01-11 17:42:39', '广州海珠区客村店', '1', '1');
INSERT INTO `car_order` VALUES ('126', '1547200020850', '5', '18316981006', '广州天河区车陂店', '250.00', '0', '2019-01-11 17:47:00', '2019-01-11 17:47:00', '福田下沙六坊', '1', '0');
INSERT INTO `car_order` VALUES ('127', '1547200484572', '5', '18316981006', '广州天河区车陂店', '250.00', '1', '2019-01-11 17:54:44', '2019-01-11 17:55:14', '福田下沙六坊', '1', '0');
INSERT INTO `car_order` VALUES ('128', '1547200809964', '5', '18316981006', '\'你\'', '500.00', '1', '2019-01-11 18:00:09', '2019-01-14 16:34:57', '\'我\'', '0', '0');
INSERT INTO `car_order` VALUES ('131', '1547212551095', '5', '18316981006', '啊', '250.00', '1', '2019-01-11 21:15:51', '2019-01-11 21:15:58', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('132', '1547457101202', '5', '18316981006', '啊', '180.00', '0', '2019-01-14 17:11:41', '2019-01-14 17:11:41', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('134', '1547457121382', '5', '18316981006', '啊', '250.00', '1', '2019-01-14 17:12:01', '2019-01-14 18:03:30', '啊', '0', '0');
INSERT INTO `car_order` VALUES ('135', '1547478005316', '5', '18316981006', '你啊', '500.00', '0', '2019-01-14 23:00:05', '2019-01-14 23:00:05', '你啊', '0', '0');
INSERT INTO `car_order` VALUES ('136', '1551411231642', '5', '18316981006', '广州天河区车陂店', '250.00', '0', '2019-03-01 11:33:51', '2019-03-01 11:33:51', '深圳福田区香蜜湖店', '1', '1');
INSERT INTO `car_order` VALUES ('137', '1551411539256', '5', '18316981006', '广州天河区车陂店', '220.00', '0', '2019-03-01 11:38:59', '2019-03-01 11:38:59', '深圳福田区香蜜湖店', '1', '1');
INSERT INTO `car_order` VALUES ('138', '1556782311405', '5', '18316981006', '深圳南山区南山科技园店', '250.00', '1', '2019-05-02 15:31:51', '2019-05-02 15:39:46', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('139', '1557802795699', '5', '18316981006', '广州海珠区客村店', '2250.00', '0', '2019-05-14 10:59:55', '2019-05-14 10:59:55', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('140', '1557803400503', '5', '18316981006', '深圳南山区南山科技园店', '5500.00', '0', '2019-05-14 11:10:00', '2019-05-14 11:10:00', '深圳南山区南山科技园店', '1', '1');
INSERT INTO `car_order` VALUES ('141', '1557803450033', '5', '18316981006', '深圳南山区南山科技园店', '7500.00', '0', '2019-05-14 11:10:49', '2019-05-14 11:10:49', '深圳福田区香蜜湖店', '1', '1');

-- ----------------------------
-- Table structure for car_order_item
-- ----------------------------
DROP TABLE IF EXISTS `car_order_item`;
CREATE TABLE `car_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `user_id` int(11) DEFAULT NULL,
  `order_no` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20,2) DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
  `quantity` int(10) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `duration` int(10) DEFAULT NULL COMMENT '租车天数',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`user_id`,`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_order_item
-- ----------------------------
INSERT INTO `car_order_item` VALUES ('8', '5', '1543377730275', '4', '保时捷718', 'https://car3.autoimg.cn/cardfs/product/g30/M01/D3/90/1024x0_1_q87_autohomecar__ChsEf1uED4WALtGgAAZ0Cy3zMF0749.jpg', '220.00', '2', '880.00', '2018-11-28 12:02:10', '2018-11-28 12:02:10', '2');
INSERT INTO `car_order_item` VALUES ('9', '5', '1546569216639', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-04 10:33:36', '2019-01-04 10:33:36', '2');
INSERT INTO `car_order_item` VALUES ('10', '5', '1546569579265', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-04 10:39:39', '2019-01-04 10:39:39', '1');
INSERT INTO `car_order_item` VALUES ('13', '9', '1546571208091', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-04 11:06:48', '2019-01-04 11:06:48', '2');
INSERT INTO `car_order_item` VALUES ('14', '9', '1546573942215', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-04 11:52:22', '2019-01-04 11:52:22', '2');
INSERT INTO `car_order_item` VALUES ('15', '9', '1546574149836', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-04 11:55:49', '2019-01-04 11:55:49', '1');
INSERT INTO `car_order_item` VALUES ('16', '9', '1546574404171', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-04 12:00:04', '2019-01-04 12:00:04', '2');
INSERT INTO `car_order_item` VALUES ('17', '9', '1546574522945', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '250.00', '2019-01-04 12:02:02', '2019-01-04 12:02:02', '1');
INSERT INTO `car_order_item` VALUES ('18', '9', '1546574671156', '5', '布加迪Chiron', 'https://car2.autoimg.cn/cardfs/product/g25/M04/B9/74/1024x0_1_q87_autohomecar__ChcCr1qeu_KAGGv-AAOwtRDX_Xw197.jpg', '7500.00', '1', '7500.00', '2019-01-04 12:04:31', '2019-01-04 12:04:31', '1');
INSERT INTO `car_order_item` VALUES ('19', '9', '1546574698634', '5', '布加迪Chiron', 'https://car2.autoimg.cn/cardfs/product/g25/M04/B9/74/1024x0_1_q87_autohomecar__ChcCr1qeu_KAGGv-AAOwtRDX_Xw197.jpg', '7500.00', '1', '7500.00', '2019-01-04 12:04:58', '2019-01-04 12:04:58', '1');
INSERT INTO `car_order_item` VALUES ('20', '9', '1546574781443', '6', '宾利慕尚', 'https://car2.autoimg.cn/cardfs/product/g29/M08/84/A2/1024x0_1_q87_autohomecar__wKgHG1ttl9uAJxm2AAdSgzAw47I196.jpg', '5500.00', '1', '5500.00', '2019-01-04 12:06:21', '2019-01-04 12:06:21', '1');
INSERT INTO `car_order_item` VALUES ('21', '9', '1546574839118', '6', '宾利慕尚', 'https://car2.autoimg.cn/cardfs/product/g29/M08/84/A2/1024x0_1_q87_autohomecar__wKgHG1ttl9uAJxm2AAdSgzAw47I196.jpg', '5500.00', '1', '5500.00', '2019-01-04 12:07:19', '2019-01-04 12:07:19', '1');
INSERT INTO `car_order_item` VALUES ('22', '9', '1546575093747', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-04 12:11:33', '2019-01-04 12:11:33', '2');
INSERT INTO `car_order_item` VALUES ('23', '5', '1546673153332', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-05 15:25:53', '2019-01-05 15:25:53', '3');
INSERT INTO `car_order_item` VALUES ('24', '5', '1546673368182', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-05 15:29:28', '2019-01-05 15:29:28', '1');
INSERT INTO `car_order_item` VALUES ('25', '9', '1546675598236', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1440.00', '2019-01-05 16:06:38', '2019-01-05 16:06:38', '8');
INSERT INTO `car_order_item` VALUES ('26', '9', '1546675648836', '4', '保时捷718', 'https://car3.autoimg.cn/cardfs/product/g30/M01/D3/90/1024x0_1_q87_autohomecar__ChsEf1uED4WALtGgAAZ0Cy3zMF0749.jpg', '220.00', '1', '440.00', '2019-01-05 16:07:28', '2019-01-05 16:07:28', '2');
INSERT INTO `car_order_item` VALUES ('27', '9', '1546675852883', '5', '布加迪Chiron', 'https://car2.autoimg.cn/cardfs/product/g25/M04/B9/74/1024x0_1_q87_autohomecar__ChcCr1qeu_KAGGv-AAOwtRDX_Xw197.jpg', '7500.00', '1', '15000.00', '2019-01-05 16:10:52', '2019-01-05 16:10:52', '2');
INSERT INTO `car_order_item` VALUES ('28', '9', '1546676187088', '6', '宾利慕尚', 'https://car2.autoimg.cn/cardfs/product/g29/M08/84/A2/1024x0_1_q87_autohomecar__wKgHG1ttl9uAJxm2AAdSgzAw47I196.jpg', '5500.00', '1', '11000.00', '2019-01-05 16:16:27', '2019-01-05 16:16:27', '2');
INSERT INTO `car_order_item` VALUES ('29', '9', '1546676223083', '7', '法拉利GTC4Lusso', 'https://car3.autoimg.cn/cardfs/product/g20/M02/83/48/1024x0_1_q87_autohomecar__wKgFWVgu8riAK1eOAAIYDiX1Tl4464.jpg', '6200.00', '1', '6200.00', '2019-01-05 16:17:03', '2019-01-05 16:17:03', '1');
INSERT INTO `car_order_item` VALUES ('30', '9', '1546676360159', '7', '法拉利GTC4Lusso', 'https://car3.autoimg.cn/cardfs/product/g20/M02/83/48/1024x0_1_q87_autohomecar__wKgFWVgu8riAK1eOAAIYDiX1Tl4464.jpg', '6200.00', '1', '6200.00', '2019-01-05 16:19:20', '2019-01-05 16:19:20', '1');
INSERT INTO `car_order_item` VALUES ('31', '9', '1546676601512', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-05 16:23:21', '2019-01-05 16:23:21', '3');
INSERT INTO `car_order_item` VALUES ('32', '9', '1546676691071', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-05 16:24:51', '2019-01-05 16:24:51', '2');
INSERT INTO `car_order_item` VALUES ('33', '9', '1546676743532', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 16:25:43', '2019-01-05 16:25:43', '10');
INSERT INTO `car_order_item` VALUES ('34', '9', '1546677151924', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 16:32:31', '2019-01-05 16:32:31', '10');
INSERT INTO `car_order_item` VALUES ('35', '9', '1546678872711', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 17:01:12', '2019-01-05 17:01:12', '10');
INSERT INTO `car_order_item` VALUES ('36', '9', '1546678890188', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 17:01:30', '2019-01-05 17:01:30', '10');
INSERT INTO `car_order_item` VALUES ('37', '9', '1546678967421', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 17:02:47', '2019-01-05 17:02:47', '10');
INSERT INTO `car_order_item` VALUES ('38', '9', '1546679001621', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 17:03:21', '2019-01-05 17:03:21', '10');
INSERT INTO `car_order_item` VALUES ('39', '9', '1546679037096', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 17:03:57', '2019-01-05 17:03:57', '10');
INSERT INTO `car_order_item` VALUES ('40', '9', '1546679046332', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1800.00', '2019-01-05 17:04:06', '2019-01-05 17:04:06', '10');
INSERT INTO `car_order_item` VALUES ('41', '9', '1546679373652', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-05 17:09:33', '2019-01-05 17:09:33', '3');
INSERT INTO `car_order_item` VALUES ('42', '9', '1546679381539', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-05 17:09:41', '2019-01-05 17:09:41', '3');
INSERT INTO `car_order_item` VALUES ('43', '5', '1546746497961', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 11:48:17', '2019-01-06 11:48:17', '2');
INSERT INTO `car_order_item` VALUES ('44', '5', '1546746906327', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 11:55:06', '2019-01-06 11:55:06', '2');
INSERT INTO `car_order_item` VALUES ('45', '5', '1546746910118', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 11:55:10', '2019-01-06 11:55:10', '2');
INSERT INTO `car_order_item` VALUES ('46', '5', '1546746919862', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 11:55:19', '2019-01-06 11:55:19', '2');
INSERT INTO `car_order_item` VALUES ('47', '5', '1546747124785', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 11:58:44', '2019-01-06 11:58:44', '2');
INSERT INTO `car_order_item` VALUES ('48', '5', '1546747406964', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '180.00', '2019-01-06 12:03:26', '2019-01-06 12:03:26', '1');
INSERT INTO `car_order_item` VALUES ('49', '5', '1546747473953', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '180.00', '2019-01-06 12:04:33', '2019-01-06 12:04:33', '1');
INSERT INTO `car_order_item` VALUES ('50', '5', '1546747875012', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '180.00', '2019-01-06 12:11:14', '2019-01-06 12:11:14', '1');
INSERT INTO `car_order_item` VALUES ('51', '5', '1546750199265', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 12:49:59', '2019-01-06 12:49:59', '2');
INSERT INTO `car_order_item` VALUES ('52', '5', '1546751170580', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 13:06:10', '2019-01-06 13:06:10', '2');
INSERT INTO `car_order_item` VALUES ('53', '5', '1546752005920', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1620.00', '2019-01-06 13:20:05', '2019-01-06 13:20:05', '9');
INSERT INTO `car_order_item` VALUES ('54', '5', '1546752037333', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '1620.00', '2019-01-06 13:20:37', '2019-01-06 13:20:37', '9');
INSERT INTO `car_order_item` VALUES ('55', '5', '1546752111755', '7', '法拉利GTC4Lusso', 'https://car3.autoimg.cn/cardfs/product/g20/M02/83/48/1024x0_1_q87_autohomecar__wKgFWVgu8riAK1eOAAIYDiX1Tl4464.jpg', '6200.00', '1', '55800.00', '2019-01-06 13:21:51', '2019-01-06 13:21:51', '9');
INSERT INTO `car_order_item` VALUES ('56', '5', '1546752200603', '7', '法拉利GTC4Lusso', 'https://car3.autoimg.cn/cardfs/product/g20/M02/83/48/1024x0_1_q87_autohomecar__wKgFWVgu8riAK1eOAAIYDiX1Tl4464.jpg', '6200.00', '1', '55800.00', '2019-01-06 13:23:20', '2019-01-06 13:23:20', '9');
INSERT INTO `car_order_item` VALUES ('57', '5', '1546752283272', '7', '法拉利GTC4Lusso', 'https://car3.autoimg.cn/cardfs/product/g20/M02/83/48/1024x0_1_q87_autohomecar__wKgFWVgu8riAK1eOAAIYDiX1Tl4464.jpg', '6200.00', '1', '6200.00', '2019-01-06 13:24:43', '2019-01-06 13:24:43', '1');
INSERT INTO `car_order_item` VALUES ('62', '5', '1546752679568', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 13:31:19', '2019-01-06 13:31:19', '3');
INSERT INTO `car_order_item` VALUES ('63', '5', '1546752726283', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 13:32:06', '2019-01-06 13:32:06', '3');
INSERT INTO `car_order_item` VALUES ('64', '5', '1546752881628', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 13:34:41', '2019-01-06 13:34:41', '3');
INSERT INTO `car_order_item` VALUES ('65', '5', '1546752927394', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 13:35:27', '2019-01-06 13:35:27', '3');
INSERT INTO `car_order_item` VALUES ('66', '5', '1546753286653', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 13:41:26', '2019-01-06 13:41:26', '3');
INSERT INTO `car_order_item` VALUES ('67', '5', '1546753533684', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-06 13:45:33', '2019-01-06 13:45:33', '3');
INSERT INTO `car_order_item` VALUES ('68', '5', '1546753585803', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-06 13:46:25', '2019-01-06 13:46:25', '3');
INSERT INTO `car_order_item` VALUES ('69', '5', '1546753667043', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-06 13:47:46', '2019-01-06 13:47:46', '2');
INSERT INTO `car_order_item` VALUES ('70', '5', '1546753930430', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-06 13:52:10', '2019-01-06 13:52:10', '3');
INSERT INTO `car_order_item` VALUES ('71', '5', '1546754354174', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-06 13:59:14', '2019-01-06 13:59:14', '3');
INSERT INTO `car_order_item` VALUES ('72', '5', '1546754662239', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 14:04:22', '2019-01-06 14:04:22', '2');
INSERT INTO `car_order_item` VALUES ('73', '5', '1546754989249', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 14:09:49', '2019-01-06 14:09:49', '2');
INSERT INTO `car_order_item` VALUES ('74', '5', '1546755158909', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 14:12:38', '2019-01-06 14:12:38', '2');
INSERT INTO `car_order_item` VALUES ('75', '5', '1546755420544', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 14:17:00', '2019-01-06 14:17:00', '2');
INSERT INTO `car_order_item` VALUES ('76', '5', '1546755536858', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-06 14:18:56', '2019-01-06 14:18:56', '2');
INSERT INTO `car_order_item` VALUES ('77', '5', '1546755654991', '4', '保时捷718', 'https://car3.autoimg.cn/cardfs/product/g30/M01/D3/90/1024x0_1_q87_autohomecar__ChsEf1uED4WALtGgAAZ0Cy3zMF0749.jpg', '220.00', '1', '440.00', '2019-01-06 14:20:54', '2019-01-06 14:20:54', '2');
INSERT INTO `car_order_item` VALUES ('78', '5', '1546755890977', '4', '保时捷718', 'https://car3.autoimg.cn/cardfs/product/g30/M01/D3/90/1024x0_1_q87_autohomecar__ChsEf1uED4WALtGgAAZ0Cy3zMF0749.jpg', '220.00', '1', '440.00', '2019-01-06 14:24:50', '2019-01-06 14:24:50', '2');
INSERT INTO `car_order_item` VALUES ('79', '5', '1546756121074', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 14:28:41', '2019-01-06 14:28:41', '3');
INSERT INTO `car_order_item` VALUES ('80', '5', '1546756121075', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 14:28:41', '2019-01-06 14:28:41', '3');
INSERT INTO `car_order_item` VALUES ('81', '5', '1546756231313', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 14:30:31', '2019-01-06 14:30:31', '3');
INSERT INTO `car_order_item` VALUES ('82', '5', '1546756231320', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-06 14:30:31', '2019-01-06 14:30:31', '3');
INSERT INTO `car_order_item` VALUES ('83', '5', '1546946423828', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-08 19:20:23', '2019-01-08 19:20:23', '2');
INSERT INTO `car_order_item` VALUES ('84', '5', '1547100413683', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '1350.00', '2019-01-10 14:06:53', '2019-01-10 14:06:53', '9');
INSERT INTO `car_order_item` VALUES ('85', '5', '1547100701199', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '1350.00', '2019-01-10 14:11:41', '2019-01-10 14:11:41', '9');
INSERT INTO `car_order_item` VALUES ('86', '5', '1547104076395', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 15:07:56', '2019-01-10 15:07:56', '2');
INSERT INTO `car_order_item` VALUES ('87', '5', '1547104385354', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 15:13:05', '2019-01-10 15:13:05', '2');
INSERT INTO `car_order_item` VALUES ('88', '5', '1547104767915', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 15:19:27', '2019-01-10 15:19:27', '2');
INSERT INTO `car_order_item` VALUES ('89', '5', '1547104831001', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 15:20:30', '2019-01-10 15:20:30', '2');
INSERT INTO `car_order_item` VALUES ('90', '5', '1547104864331', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 15:21:04', '2019-01-10 15:21:04', '1');
INSERT INTO `car_order_item` VALUES ('91', '5', '1547105062142', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 15:24:22', '2019-01-10 15:24:22', '1');
INSERT INTO `car_order_item` VALUES ('92', '5', '1547105231603', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 15:27:11', '2019-01-10 15:27:11', '1');
INSERT INTO `car_order_item` VALUES ('93', '5', '1547105245011', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 15:27:24', '2019-01-10 15:27:24', '1');
INSERT INTO `car_order_item` VALUES ('94', '5', '1547105263219', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 15:27:43', '2019-01-10 15:27:43', '2');
INSERT INTO `car_order_item` VALUES ('95', '5', '1547114134875', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 17:55:34', '2019-01-10 17:55:34', '2');
INSERT INTO `car_order_item` VALUES ('96', '5', '1547114152438', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 17:55:52', '2019-01-10 17:55:52', '2');
INSERT INTO `car_order_item` VALUES ('97', '5', '1547114908856', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-10 18:08:28', '2019-01-10 18:08:28', '3');
INSERT INTO `car_order_item` VALUES ('98', '5', '1547114929792', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-10 18:08:49', '2019-01-10 18:08:49', '3');
INSERT INTO `car_order_item` VALUES ('99', '5', '1547115026206', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-10 18:10:26', '2019-01-10 18:10:26', '3');
INSERT INTO `car_order_item` VALUES ('100', '5', '1547115029381', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-10 18:10:29', '2019-01-10 18:10:29', '3');
INSERT INTO `car_order_item` VALUES ('101', '5', '1547115093675', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 18:11:33', '2019-01-10 18:11:33', '1');
INSERT INTO `car_order_item` VALUES ('102', '5', '1547115133317', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 18:12:13', '2019-01-10 18:12:13', '1');
INSERT INTO `car_order_item` VALUES ('103', '5', '1547115407263', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 18:16:47', '2019-01-10 18:16:47', '1');
INSERT INTO `car_order_item` VALUES ('104', '5', '1547115461294', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 18:17:41', '2019-01-10 18:17:41', '2');
INSERT INTO `car_order_item` VALUES ('105', '5', '1547115746302', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 18:22:26', '2019-01-10 18:22:26', '1');
INSERT INTO `car_order_item` VALUES ('106', '5', '1547115854828', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-10 18:24:14', '2019-01-10 18:24:14', '2');
INSERT INTO `car_order_item` VALUES ('107', '5', '1547115925602', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-10 18:25:25', '2019-01-10 18:25:25', '2');
INSERT INTO `car_order_item` VALUES ('108', '5', '1547126784450', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-10 21:26:24', '2019-01-10 21:26:24', '2');
INSERT INTO `car_order_item` VALUES ('109', '5', '1547126856580', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '1200.00', '2019-01-10 21:27:36', '2019-01-10 21:27:36', '8');
INSERT INTO `car_order_item` VALUES ('110', '5', '1547127193001', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 21:33:12', '2019-01-10 21:33:12', '2');
INSERT INTO `car_order_item` VALUES ('111', '5', '1547127275953', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 21:34:35', '2019-01-10 21:34:35', '2');
INSERT INTO `car_order_item` VALUES ('112', '5', '1547127787895', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-10 21:43:07', '2019-01-10 21:43:07', '3');
INSERT INTO `car_order_item` VALUES ('113', '5', '1547127918075', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '1350.00', '2019-01-10 21:45:18', '2019-01-10 21:45:18', '9');
INSERT INTO `car_order_item` VALUES ('114', '5', '1547128035006', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '1350.00', '2019-01-10 21:47:14', '2019-01-10 21:47:14', '9');
INSERT INTO `car_order_item` VALUES ('115', '5', '1547128095320', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '300.00', '2019-01-10 21:48:15', '2019-01-10 21:48:15', '2');
INSERT INTO `car_order_item` VALUES ('116', '5', '1547129358417', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 22:09:18', '2019-01-10 22:09:18', '1');
INSERT INTO `car_order_item` VALUES ('117', '5', '1547129460421', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 22:11:00', '2019-01-10 22:11:00', '1');
INSERT INTO `car_order_item` VALUES ('118', '5', '1547131079730', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 22:37:59', '2019-01-10 22:37:59', '1');
INSERT INTO `car_order_item` VALUES ('119', '5', '1547131512579', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '450.00', '2019-01-10 22:45:12', '2019-01-10 22:45:12', '3');
INSERT INTO `car_order_item` VALUES ('120', '5', '1547131700464', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '1', '150.00', '2019-01-10 22:48:20', '2019-01-10 22:48:20', '1');
INSERT INTO `car_order_item` VALUES ('121', '5', '1547198231886', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-11 17:17:11', '2019-01-11 17:17:11', '2');
INSERT INTO `car_order_item` VALUES ('122', '5', '1547198576819', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '180.00', '2019-01-11 17:22:56', '2019-01-11 17:22:56', '1');
INSERT INTO `car_order_item` VALUES ('123', '5', '1547198765260', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '180.00', '2019-01-11 17:26:05', '2019-01-11 17:26:05', '1');
INSERT INTO `car_order_item` VALUES ('124', '5', '1547198918921', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-11 17:28:38', '2019-01-11 17:28:38', '3');
INSERT INTO `car_order_item` VALUES ('125', '5', '1547198970563', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '750.00', '2019-01-11 17:29:30', '2019-01-11 17:29:30', '3');
INSERT INTO `car_order_item` VALUES ('126', '5', '1547199105235', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '540.00', '2019-01-11 17:31:45', '2019-01-11 17:31:45', '3');
INSERT INTO `car_order_item` VALUES ('127', '5', '1547199703541', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '360.00', '2019-01-11 17:41:43', '2019-01-11 17:41:43', '2');
INSERT INTO `car_order_item` VALUES ('128', '5', '1547199716537', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '500.00', '2019-01-11 17:41:56', '2019-01-11 17:41:56', '2');
INSERT INTO `car_order_item` VALUES ('129', '5', '1547200020850', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '250.00', '2019-01-11 17:47:00', '2019-01-11 17:47:00', '1');
INSERT INTO `car_order_item` VALUES ('130', '5', '1547200484572', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '250.00', '2019-01-11 17:54:44', '2019-01-11 17:54:44', '1');
INSERT INTO `car_order_item` VALUES ('131', '5', '1547200809964', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '500.00', '2019-01-11 18:00:09', '2019-01-11 18:00:09', '2');
INSERT INTO `car_order_item` VALUES ('134', '5', '1547212551095', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '250.00', '2019-01-11 21:15:51', '2019-01-11 21:15:51', '1');
INSERT INTO `car_order_item` VALUES ('135', '5', '1547457101202', '2', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', '180.00', '1', '180.00', '2019-01-14 17:11:41', '2019-01-14 17:11:41', '1');
INSERT INTO `car_order_item` VALUES ('137', '5', '1547457121382', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '250.00', '2019-01-14 17:12:01', '2019-01-14 17:12:01', '1');
INSERT INTO `car_order_item` VALUES ('138', '5', '1547478005316', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '2', '500.00', '2019-01-14 23:00:05', '2019-01-14 23:00:05', '1');
INSERT INTO `car_order_item` VALUES ('139', '5', '1551411231642', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '250.00', '2019-03-01 11:33:51', '2019-03-01 11:33:51', '1');
INSERT INTO `car_order_item` VALUES ('140', '5', '1551411539256', '4', '保时捷718', 'https://car3.autoimg.cn/cardfs/product/g30/M01/D3/90/1024x0_1_q87_autohomecar__ChsEf1uED4WALtGgAAZ0Cy3zMF0749.jpg', '220.00', '1', '220.00', '2019-03-01 11:38:59', '2019-03-01 11:38:59', '1');
INSERT INTO `car_order_item` VALUES ('141', '5', '1556782311405', '3', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', '250.00', '1', '250.00', '2019-05-02 15:31:51', '2019-05-02 15:31:51', '1');
INSERT INTO `car_order_item` VALUES ('142', '5', '1557802795699', '1', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', '150.00', '5', '2250.00', '2019-05-14 10:59:55', '2019-05-14 10:59:55', '3');
INSERT INTO `car_order_item` VALUES ('143', '5', '1557803400503', '6', '宾利慕尚', 'https://car2.autoimg.cn/cardfs/product/g29/M08/84/A2/1024x0_1_q87_autohomecar__wKgHG1ttl9uAJxm2AAdSgzAw47I196.jpg', '5500.00', '1', '5500.00', '2019-05-14 11:10:00', '2019-05-14 11:10:00', '1');
INSERT INTO `car_order_item` VALUES ('144', '5', '1557803450033', '5', '布加迪Chiron', 'https://car2.autoimg.cn/cardfs/product/g25/M04/B9/74/1024x0_1_q87_autohomecar__ChcCr1qeu_KAGGv-AAOwtRDX_Xw197.jpg', '7500.00', '1', '7500.00', '2019-05-14 11:10:49', '2019-05-14 11:10:49', '1');

-- ----------------------------
-- Table structure for car_product
-- ----------------------------
DROP TABLE IF EXISTS `car_product`;
CREATE TABLE `car_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_type` int(100) NOT NULL COMMENT '分类type,对应car_category表的category_type',
  `descrition` varchar(100) NOT NULL COMMENT '产品描述',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `main_image` varchar(500) DEFAULT NULL COMMENT '产品主图,url相对地址',
  `detail_image1` varchar(500) DEFAULT NULL COMMENT '产品详情图片1',
  `detail_image2` varchar(500) DEFAULT NULL COMMENT '产品详情图片2',
  `detail_image3` varchar(500) DEFAULT NULL COMMENT '产品详情图片3',
  `price` decimal(20,2) NOT NULL COMMENT '价格,单位-元保留两位小数',
  `stock` int(11) NOT NULL COMMENT '库存数量',
  `status` int(6) DEFAULT '1' COMMENT '商品状态.1-在售 2-下架 3-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_product
-- ----------------------------
INSERT INTO `car_product` VALUES ('1', '1', '2018款 30周年年型 Sportback 40 TFSI 风尚型', '奥迪A3', 'https://car2.autoimg.cn/cardfs/product/g5/M0A/C5/37/1024x0_1_q87_autohomecar__wKgHzFn541iAbrUGAAZbwVk6Xqc578.jpg', 'https://car3.autoimg.cn/cardfs/product/g7/M15/CB/7F/1024x0_1_q87_autohomecar__wKjB0Fn54r2Af3efAAhqJzFUTUc040.jpg', 'https://car3.autoimg.cn/cardfs/product/g17/M02/C4/81/1024x0_1_q87_autohomecar__wKjBxln540CAbBTQAAYmf1BRaW8766.jpg', 'https://car3.autoimg.cn/cardfs/product/g17/M14/C4/81/1024x0_1_q87_autohomecar__wKjBxln54zqASJbXAAhPUL5gA24716.jpg', '150.00', '20', '1', '2018-11-27 19:46:32', '2019-05-14 10:59:55');
INSERT INTO `car_product` VALUES ('2', '1', '2018款 30周年年型 50 TFSI quattro 尊享型', '奥迪A6L', 'https://car3.autoimg.cn/cardfs/product/g22/M00/2A/C3/1024x0_1_q87_autohomecar__wKjBwVnOExaActVwAAhZY71Fbic243.jpg', 'https://car3.autoimg.cn/cardfs/product/g16/M11/92/FA/1024x0_1_q87_autohomecar__wKgH5lnOEvCADRjcAAfSYZ0oZuw477.jpg', 'https://car3.autoimg.cn/cardfs/product/g9/M15/97/31/1024x0_1_q87_autohomecar__wKgH31nOEw6AUWRLAAj_W2iSk9c211.jpg', 'https://car3.autoimg.cn/cardfs/product/g9/M13/8E/E6/1024x0_1_q87_autohomecar__wKgH0FnOEw2AHJY7AAhVgyfHS9U908.jpg', '180.00', '20', '1', '2018-11-27 20:00:07', '2019-01-14 17:11:41');
INSERT INTO `car_product` VALUES ('3', '2', '2017款 Panamera 4 Sport Turismo 3.0T', '保时捷Panamera', 'https://car3.autoimg.cn/cardfs/product/g24/M02/EF/6F/1024x0_1_q87_autohomecar__wKgHIVrGRhmALFYBAAderOnQLmA795.jpg', 'https://car2.autoimg.cn/cardfs/product/g25/M05/E9/BC/1024x0_1_q87_autohomecar__wKgHIFrGRdCARmAoAAbNh1ZcFrw703.jpg', 'https://car3.autoimg.cn/cardfs/product/g25/M05/E9/BC/1024x0_1_q87_autohomecar__wKgHIFrGRc2AAE3JAAYqjSpiZyc054.jpg', 'https://car3.autoimg.cn/cardfs/product/g25/M09/EF/D4/1024x0_1_q87_autohomecar__ChcCr1rGRcaAPNJMAAemhgGra34144.jpg', '250.00', '10', '1', '2018-11-27 20:06:25', '2019-05-02 15:31:51');
INSERT INTO `car_product` VALUES ('4', '2', '2018款 Cayman S 2.5T', '保时捷718', 'https://car3.autoimg.cn/cardfs/product/g30/M01/D3/90/1024x0_1_q87_autohomecar__ChsEf1uED4WALtGgAAZ0Cy3zMF0749.jpg', 'https://car2.autoimg.cn/cardfs/product/g27/M09/D3/EB/1024x0_1_q87_autohomecar__ChsEfFuEDySAU1dpAAfkHXDkGrU226.jpg', 'https://car2.autoimg.cn/cardfs/product/g30/M02/D3/8C/1024x0_1_q87_autohomecar__ChsEf1uED16AcHF5AARkd4wX9Lk227.jpg', 'https://car2.autoimg.cn/cardfs/product/g2/M04/99/65/1024x0_1_q87_autohomecar__ChsEkFuED0GAR1b5AAV0B1a5cxw794.jpg', '220.00', '15', '1', '2018-11-27 20:12:42', '2019-03-01 11:38:59');
INSERT INTO `car_product` VALUES ('5', '3', '2018款 Sport', '布加迪Chiron', 'https://car2.autoimg.cn/cardfs/product/g25/M04/B9/74/1024x0_1_q87_autohomecar__ChcCr1qeu_KAGGv-AAOwtRDX_Xw197.jpg', 'https://car2.autoimg.cn/cardfs/product/g24/M0A/B8/C1/1024x0_1_q87_autohomecar__wKgHIVqeu_CAF29AAANX__LPwsE001.jpg', 'https://car2.autoimg.cn/cardfs/product/g24/M02/B8/C1/1024x0_1_q87_autohomecar__wKgHIVqeu-6AKa6YAANPDM0_T60095.jpg', 'https://car2.autoimg.cn/cardfs/product/g25/M05/B5/06/1024x0_1_q87_autohomecar__ChcCr1qea0KAK_FRAAGbLNaI8No942.jpg', '7500.00', '19', '1', '2018-11-27 20:19:43', '2019-05-14 11:10:49');
INSERT INTO `car_product` VALUES ('6', '4', '2017款 6.8T 长轴距版', '宾利慕尚', 'https://car2.autoimg.cn/cardfs/product/g29/M08/84/A2/1024x0_1_q87_autohomecar__wKgHG1ttl9uAJxm2AAdSgzAw47I196.jpg', 'https://car3.autoimg.cn/cardfs/product/g27/M04/88/BE/1024x0_1_q87_autohomecar__ChcCQFttl1-AYZPjAAkjD0_fmgo576.jpg', 'https://car2.autoimg.cn/cardfs/product/g28/M0A/87/9C/1024x0_1_q87_autohomecar__ChcCR1ttl8qALUmCAAghcFPt6tM839.jpg', 'https://car3.autoimg.cn/cardfs/product/g28/M03/87/9A/1024x0_1_q87_autohomecar__wKgHI1ttl8SAbPLfAAYD1ejocnM039.jpg', '5500.00', '19', '1', '2018-11-27 20:25:19', '2019-05-14 11:10:00');
INSERT INTO `car_product` VALUES ('7', '5', '2017款3.9T V8', '法拉利GTC4Lusso', 'https://car3.autoimg.cn/cardfs/product/g20/M02/83/48/1024x0_1_q87_autohomecar__wKgFWVgu8riAK1eOAAIYDiX1Tl4464.jpg', 'https://car2.autoimg.cn/cardfs/product/g7/M0A/9E/B9/1024x0_1_q87_autohomecar__wKgHzlgu8ZiAWpljAALAAjwMsVc785.jpg', 'https://car2.autoimg.cn/cardfs/product/g13/M09/9F/62/1024x0_1_q87_autohomecar__wKgH1Fgu8jCAFqTHAAH4AFGXC_k994.jpg', 'https://car3.autoimg.cn/cardfs/product/g8/M02/A2/21/1024x0_1_q87_autohomecar__wKgHz1gu8UOAZCRfAAH1_MgRH-s109.jpg', '6200.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('8', '3', '2019款 基本型', '布加迪Divo', 'https://car3.autoimg.cn/cardfs/product/g3/M07/33/EB/1024x0_1_q87_autohomecar__ChcCRVx-oB2ASUecAAJCf0rXa40738.jpg', 'https://car3.autoimg.cn/cardfs/product/g27/M0B/C2/55/1024x0_1_q87_autohomecar__ChsEfFuAo8-AbGWOAAa9yzVhkq4413.jpg', 'https://car3.autoimg.cn/cardfs/product/g27/M0B/C2/55/1024x0_1_q87_autohomecar__ChsEfFuAo9GAaXAbAAUs3A2Tp-0536.jpg', 'https://car3.autoimg.cn/cardfs/product/g3/M0A/29/2D/1024x0_1_q87_autohomecar__ChsEm1x-oBuAEZFCAAH1HTUUNys855.jpg', '4600.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('9', '3', '2015款 Grand Sport Vitesse La Finale', '布加迪威航', 'https://car1.autoimg.cn/car/upload/2015/3/4/1024x0_1_q87_20150304113028157-110.jpg', 'https://car1.autoimg.cn/car/upload/2015/3/3/1024x0_1_q87_2015030303410576426410.jpg', 'https://car1.autoimg.cn/car/upload/2015/3/3/1024x0_1_q87_2015030303405737126410.jpg', 'https://car0.autoimg.cn/car/upload/2015/3/4/1024x0_1_q87_20150304113239265-110.jpg', '7300.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('10', '5', '2019款 3.9T V8', '法拉利F8 Tributo', 'https://car3.autoimg.cn/cardfs/product/g2/M03/18/F6/1024x0_1_q87_autohomecar__ChsEkFyzjk6AL_jhAAg9HoKlhvE598.jpg', 'https://car2.autoimg.cn/cardfs/product/g2/M0A/4D/42/1024x0_1_q87_autohomecar__ChsEmlyzjjyAN2tvAAnomZj65jg632.jpg', 'https://car2.autoimg.cn/cardfs/product/g2/M00/4D/42/1024x0_1_q87_autohomecar__ChsEmlyzjkeATZX8AAkf2S1gC8Q612.jpg', 'https://car3.autoimg.cn/cardfs/product/g1/M0A/06/44/1024x0_1_q87_autohomecar__ChcCQ1yzjieAZDPsAAdbt3XCvU0685.jpg', '5000.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('11', '4', '2017款 4.0T V8 S 标准版', '宾利飞驰', 'https://car2.autoimg.cn/cardfs/product/g13/M02/34/FB/1024x0_1_q87_autohomecar__wKgH1FpDhHKAebt5AActm6nnsZA738.jpg', 'https://car2.autoimg.cn/cardfs/product/g25/M0B/3E/0C/1024x0_1_q87_autohomecar__wKgHIlrMkKuAbkxZAAeZPGN-dCU005.jpg', 'https://car3.autoimg.cn/cardfs/product/g25/M04/40/28/1024x0_1_q87_autohomecar__ChcCr1rMkMCAUhB7AAeVUP8V7SA248.jpg', 'https://car3.autoimg.cn/cardfs/product/g24/M04/3F/94/1024x0_1_q87_autohomecar__wKgHIVrMkI2AL-jGAATv8hrtUlk687.jpg', '2000.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('12', '4', '2018款 4..0T V8', '宾利添越', 'https://car3.autoimg.cn/cardfs/product/g2/M01/01/35/1024x0_1_q87_autohomecar__ChsEkFvbD0SAOQ4AAAuzPkJgf0Y895.jpg', 'https://car2.autoimg.cn/cardfs/product/g3/M0B/F4/E0/1024x0_1_q87_autohomecar__ChsEkVylX9KAZZoUAAcyKzxO58s155.jpg', 'https://car3.autoimg.cn/cardfs/product/g3/M02/F4/E0/1024x0_1_q87_autohomecar__ChsEkVylX9OAIMJeAAWv9M6xwaw527.jpg', 'https://car2.autoimg.cn/cardfs/product/g28/M04/7A/0C/1024x0_1_q87_autohomecar__ChsEnlyUPMyAavelAAbwJQLLhmk185.jpg', '6700.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('13', '5', '2015款 488 GTB', '法拉利488', 'https://car1.autoimg.cn/car/upload/2015/6/18/1024x0_1_q87_20150618102620700123112.jpg', 'https://car3.autoimg.cn/cardfs/product/g30/M08/A1/A6/1024x0_1_q87_autohomecar__ChcCSVwKEd6AJYklAAol2AXDRgU031.jpg', 'https://car2.autoimg.cn/cardfs/product/g3/M04/9B/AB/1024x0_1_q87_autohomecar__ChsEm1wKEZiAcFwNAAnOxzi5dUk504.jpg', 'https://car2.autoimg.cn/cardfs/product/g28/M09/A4/5B/1024x0_1_q87_autohomecar__ChsEfVwKEmWAbh3hAAkAd37F_v0967.jpg', '4300.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('14', '5', '2018款 3.9T', '法拉利Portofino', 'https://car2.autoimg.cn/cardfs/product/g8/M14/EB/8A/1024x0_1_q87_autohomecar__wKgHz1oT3HyAGQqLAAWdzD_wk-Y765.jpg', 'https://car2.autoimg.cn/cardfs/product/g4/M0A/F2/9B/1024x0_1_q87_autohomecar__wKgH2loT3GSAQOqfAAZLMG4m038462.jpg', 'https://car3.autoimg.cn/cardfs/product/g8/M0D/F3/04/1024x0_1_q87_autohomecar__wKgH3loT3HSAKNzLAAYycMSTz3U415.jpg', 'https://car3.autoimg.cn/cardfs/product/g4/M0C/F0/13/1024x0_1_q87_autohomecar__wKjB01oT3FCADZQEAASAUIjpF-c801.jpg', '5600.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');
INSERT INTO `car_product` VALUES ('15', '5', '2019 基本款', '法拉利Monza SP1', 'https://car3.autoimg.cn/cardfs/product/g30/M04/6A/00/1024x0_1_q87_autohomecar__ChcCSVu0hYSABzuRAAJ3Jsbexo8122.jpg', 'https://car3.autoimg.cn/cardfs/product/g30/M09/21/BB/1024x0_1_q87_autohomecar__ChsEoFuho0OAFo5zAAGxnlNCSLM518.jpg', 'https://car2.autoimg.cn/cardfs/product/g30/M08/65/4D/1024x0_1_q87_autohomecar__ChsEoFu0hXaAcnUqAAIiFwugIc4428.jpg', 'https://car2.autoimg.cn/cardfs/product/g1/M0B/88/80/1024x0_1_q87_autohomecar__ChsEmVu0hXSAewrMAAJbQgpQbZM026.jpg', '8300.00', '20', '1', '2018-11-27 20:52:57', '2019-01-06 13:24:43');

-- ----------------------------
-- Table structure for car_user
-- ----------------------------
DROP TABLE IF EXISTS `car_user`;
CREATE TABLE `car_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '找回密码答案',
  `role` int(4) NOT NULL COMMENT '角色0-会员,1-普通用户，2-管理员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_user
-- ----------------------------
INSERT INTO `car_user` VALUES ('5', 'lisi', '202CB962AC59075B964B07152D234B70cj@#$@#$#@KJ', '18316981006', '我是谁？', '马云', '1', '2018-11-27 12:13:49', '2019-01-15 17:55:02');
INSERT INTO `car_user` VALUES ('6', 'yangjunhua', '202CB962AC59075B964B07152D234B70cj@#$@#$#@KJ', '13800138000', '我是谁？', '杨军华', '2', '2018-11-27 14:03:31', '2018-11-27 14:03:31');
INSERT INTO `car_user` VALUES ('9', 'wangwu', '202CB962AC59075B964B07152D234B70cj@#$@#$#@KJ', '13800138000', '你好吗？', '好', '1', '2018-12-22 11:38:49', '2018-12-22 11:38:49');
INSERT INTO `car_user` VALUES ('10', 'liangguozhen', '202CB962AC59075B964B07152D234B70cj@#$@#$#@KJ', '13556590864', '我现在在哪里？', '肇庆', '1', '2018-12-22 11:50:58', '2018-12-22 11:50:58');
