/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : db_info_manage

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-05-23 15:21:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT 'd08c7f175e710faa226b6a37914424f8',
  `trueName` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `ip` bigint(30) DEFAULT NULL,
  `unionType` varchar(30) CHARACTER SET utf8 DEFAULT '温州大学',
  `adminTypeId` int(10) DEFAULT '3',
  `state` varchar(10) CHARACTER SET utf8 DEFAULT 'Y',
  `lastLoginTime` datetime DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'eason', '03ecf8bb3cf8437446a0a80d95db711e', '冯宇超', '15158656338', null, '温州大学', '1', 'Y', '2019-05-11 14:19:26', '2019-02-07 23:18:24', null);
INSERT INTO `t_admin` VALUES ('2', 'youke', '93b3af583920185e2fb1b410af8badc7', 'Yourk', '15159656338', null, '校团委', '3', 'Y', '2019-05-11 14:19:11', null, null);
INSERT INTO `t_admin` VALUES ('6', 'admin', 'a66abb5684c45962d887564f08346e8d', '管理员', '15158656338', null, '校团委', '2', 'Y', '2019-05-10 19:39:33', '2019-03-30 00:05:59', null);

-- ----------------------------
-- Table structure for `t_admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_permissions`;
CREATE TABLE `t_admin_permissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `permission` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `father` int(10) DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `resource` int(4) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_admin_permissions
-- ----------------------------
INSERT INTO `t_admin_permissions` VALUES ('1', 'admin:login', '系统管理', '-1', '', null, null);
INSERT INTO `t_admin_permissions` VALUES ('11', 'admin:config', '账号管理', '1', null, null, null);
INSERT INTO `t_admin_permissions` VALUES ('12', 'system:config', '系统设置', '1', null, null, null);
INSERT INTO `t_admin_permissions` VALUES ('21', 'admin-permission', '资源管理', '11', '', '这是资源管理', '2');
INSERT INTO `t_admin_permissions` VALUES ('22', 'admin-access', '权限管理', '11', '/infoMSystem/adminType/adminTypeList', '这是权限管理', '2');
INSERT INTO `t_admin_permissions` VALUES ('23', 'admin-user', '用户管理', '11', '/infoMSystem/admin/getAdminList', '这是用户管理', '2');
INSERT INTO `t_admin_permissions` VALUES ('31', 'system-stuInfo', '学生信息', '12', '/infoMSystem/user/userList', '这是学生信息', '2');
INSERT INTO `t_admin_permissions` VALUES ('32', 'system-orgInfo', '组织架构', '12', '/infoMSystem/union/unionList', '这是组织架构', '2');
INSERT INTO `t_admin_permissions` VALUES ('33', 'system-reguInfo', '规则管理', '12', '', '这是规则管理', '2');

-- ----------------------------
-- Table structure for `t_admin_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_type`;
CREATE TABLE `t_admin_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `permissionIds` varchar(30) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_type
-- ----------------------------
INSERT INTO `t_admin_type` VALUES ('1', '管理员', '21,22,23,31,32,33', '管理员具有超级权限');
INSERT INTO `t_admin_type` VALUES ('2', '账号管理员', '31', '比管理员少了部分权限');
INSERT INTO `t_admin_type` VALUES ('3', '普通用户', '', '普通用户只能登陆及修改密码');

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(100) DEFAULT NULL,
  `web_site` varchar(200) DEFAULT NULL,
  `headStr` text,
  `layuiStr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('1', '团委学生会信息管理系统', 'http://www.wlike.club', '<!-- 强制  高速模式 渲染网页    -->\n<meta NAME=”renderer” content=”webkit”>\n<!-- 强制  高速模式 渲染网页    -->\n\n<link href=\"/static/favicon.ico\" rel=\"shortcut icon\" />\n\n<!--添加  jq  支持加载-->\n<script	src=\"/static/easy-ui/jquery.min.js\"></script>\n<!--添加  jq  支持加载-->', '<!--添加 layui  支持加载-->\n<link rel=\"stylesheet\"	href=\"/static/layui-v2.2.5/layui/css/layui.css\">\n<script	src=\"/static/layui-v2.2.5/layui/layui.js\"></script>\n<!--添加 layui  支持加载-->');

-- ----------------------------
-- Table structure for `t_depart`
-- ----------------------------
DROP TABLE IF EXISTS `t_depart`;
CREATE TABLE `t_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `unionId` int(11) DEFAULT NULL,
  `teacherId` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `presidentId` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ministerId` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `memberSum` int(11) DEFAULT NULL,
  `featureActivities` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_depart
-- ----------------------------
INSERT INTO `t_depart` VALUES ('1', '文娱部', '3', '1520001', '15211110143', '15211110144', '8', '迎新晚会、十佳歌手、冬至晚会', '文娱部会举办大大小小的学区内活动！');
INSERT INTO `t_depart` VALUES ('2', '体育部', '3', '1520001', '15211110143', '15211110145', '8', '羽毛球赛、篮球赛', null);
INSERT INTO `t_depart` VALUES ('3', '组织部', '3', '1520001', '15211110143', '15211110144', '12', '123', null);
INSERT INTO `t_depart` VALUES ('4', '办公室', '1', '1520001', '15211110143', '15211110144', '6', '日常事务管理', null);
INSERT INTO `t_depart` VALUES ('5', '组织部', '1', '1520001', '15211110143', '15211110144', '6', '团组织建设', '共青团温州大学委员会');
INSERT INTO `t_depart` VALUES ('6', '文娱部', '4', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('7', '宣传部', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('8', '信息部', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('9', '青年志愿者服务中心', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('10', '实践服务中心', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('11', '大学生科学技术协会', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('12', '温大青年编辑部', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('13', '文明督察队', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('14', '素质拓展中心', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('15', '校友联络办公室', '1', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('16', '文娱部', '5', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('17', '舞蹈队', '17', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('18', '宣传部', '18', null, null, null, null, null, null);
INSERT INTO `t_depart` VALUES ('19', '吉他协会', '16', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_union`
-- ----------------------------
DROP TABLE IF EXISTS `t_union`;
CREATE TABLE `t_union` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `belongId` int(10) DEFAULT NULL,
  `departSum` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ministerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_union
-- ----------------------------
INSERT INTO `t_union` VALUES ('1', '校团委学生会', '1', '10', '团委书记', '思想引领、成长服务。以“真心”，用“真爱”，做同学们身边最“真实”的学生会！');
INSERT INTO `t_union` VALUES ('3', '步青学区学生会', '2', '10', '学区书记', '非常优秀！');
INSERT INTO `t_union` VALUES ('4', '数电学院学生会', '3', '10', '学院书记', '非常优秀！');
INSERT INTO `t_union` VALUES ('5', '溯初学区学生会', '2', '10', '学区书记', '非常优秀！');
INSERT INTO `t_union` VALUES ('16', '社团联合会', '1', '12', '张三', '非常优秀！');
INSERT INTO `t_union` VALUES ('17', '校艺术团', '1', '8', '李四', '非常优秀！');
INSERT INTO `t_union` VALUES ('18', '研究生会', '1', '5', '王五', '非常优秀！');

-- ----------------------------
-- Table structure for `t_union_belong`
-- ----------------------------
DROP TABLE IF EXISTS `t_union_belong`;
CREATE TABLE `t_union_belong` (
  `id` int(10) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_union_belong
-- ----------------------------
INSERT INTO `t_union_belong` VALUES ('0', '温州大学', null);
INSERT INTO `t_union_belong` VALUES ('1', '校团委', null);
INSERT INTO `t_union_belong` VALUES ('2', '学区', null);
INSERT INTO `t_union_belong` VALUES ('3', '学院', null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `unionId` int(11) DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  `userTypeId` int(11) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `college` varchar(30) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `carno_only_one` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1520001', '某老师', '123456', '3', '1', '5', '1', '15158656338', '温州大学', '教师', '2019-03-27 09:42:17', null);
INSERT INTO `t_user` VALUES ('15211110142', '甲同学', '123456', '2', '3', '2', '2', '15158656338', '音乐学院', '音乐', '2019-04-07 11:35:05', null);
INSERT INTO `t_user` VALUES ('15211110143', '冯宇超', '123456', '3', '1', '3', '1', '15158656338', '数理与电子信息工程学院', '电子信息科学与技术专业', '2019-04-06 13:45:04', null);
INSERT INTO `t_user` VALUES ('15211110144', '乙同学', '123456', '3', '1', '1', '1', '15158656338', '数电学院', '电科', '2019-03-30 00:08:08', null);
INSERT INTO `t_user` VALUES ('15211110145', '丙同学', '123456', '3', '3', '1', '2', '15158656338', '数电学院', '物本', '2019-04-06 13:45:07', null);
INSERT INTO `t_user` VALUES ('15211110231', '李四', '123456', null, null, null, '0', '15158656338', '数电学院', '电科', null, null);

-- ----------------------------
-- Table structure for `t_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_permissions`;
CREATE TABLE `t_user_permissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `permission` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `father` int(10) DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `resource` int(4) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_type`;
CREATE TABLE `t_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `peimissions` varchar(100) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_type
-- ----------------------------
INSERT INTO `t_user_type` VALUES ('1', '1', '普通用户', null, null);
INSERT INTO `t_user_type` VALUES ('2', '2', '干事', null, null);
INSERT INTO `t_user_type` VALUES ('3', '3', '部长', null, null);
INSERT INTO `t_user_type` VALUES ('4', '4', '主席', null, null);
INSERT INTO `t_user_type` VALUES ('5', '5', '指导老师', null, null);
INSERT INTO `t_user_type` VALUES ('6', '3', '副部长', null, null);
INSERT INTO `t_user_type` VALUES ('7', '6', '管理员', null, null);
INSERT INTO `t_user_type` VALUES ('8', '3', '临时部长', null, null);
