SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `calmmeeting` ;
USE `calmmeeting`;

-- ----------------------------
-- Table structure for department
-- ----------------------------
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'department name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='department';

-- ----------------------------
-- Table structure for employee
-- ----------------------------
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `real_name` varchar(20) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(5) NOT NULL DEFAULT '0' COMMENT '0 normal 1 unaudited 2 Review failed',
  `dept_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(12) DEFAULT '2' COMMENT '1 administrator 2 General users',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
CREATE TABLE `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'Meeting Name',
  `room_id` int(11) DEFAULT NULL COMMENT 'Room id',
  `reserve_id` int(11) DEFAULT NULL COMMENT 'reserve id',
  `number_of_person` int(11) DEFAULT NULL COMMENT 'Number of participants',
  `start_time` datetime DEFAULT NULL COMMENT 'start time',
  `end_time` datetime DEFAULT NULL COMMENT 'end time',
  `reserve_time` datetime DEFAULT NULL COMMENT 'reserve time',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT 'Meeting Description',
  `status` varchar(20) DEFAULT NULL COMMENT 'Meeting status 0 normal 1 cancel',
  `cancel_time` datetime DEFAULT NULL COMMENT 'cancel time',
  `cancel_reason` varchar(255) NOT NULL DEFAULT '' COMMENT 'cancel reason',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='meeting';

-- ----------------------------
-- Table structure for meeting_employee
-- ----------------------------
CREATE TABLE `meeting_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='meeting_employee';

-- ----------------------------
-- Table structure for room
-- ----------------------------
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_num` int(11) NOT NULL COMMENT 'Room NO',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'Room Name',
  `capacity` int(11) DEFAULT NULL COMMENT 'Maximum capacity',
  `status` varchar(5) DEFAULT '0' COMMENT 'Status,0 Enable，1Closed',
  `desc` varchar(200) DEFAULT NULL COMMENT 'Description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='room';

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `department` VALUES ('13', '技术部');
INSERT INTO `department` VALUES ('14', '财务部');
INSERT INTO `department` VALUES ('15', '市场部');
INSERT INTO `department` VALUES ('16', '商务部');
INSERT INTO `department` VALUES ('17', '销售部');
INSERT INTO `department` VALUES ('20', '生产部');
INSERT INTO `employee` VALUES ('8', 'wangxh', '1', '王晓华', '13671075406', 'wang@qq.com', '0', '13', '2');
INSERT INTO `employee` VALUES ('9', 'linyk', '1', '林耀坤', '13671075406', 'yang@qq.com', '0', '13', '2');
INSERT INTO `employee` VALUES ('10', 'xiongjw', '1', '熊杰文', '134555555', 'xiong@qq.com', '0', '13', '2');
INSERT INTO `employee` VALUES ('11', 'wangmin', '1', '王敏', '1324554321', 'wangm@qq.com', '0', '15', '2');
INSERT INTO `employee` VALUES ('15', 'huangml', '1', '黄美玲', 'huangml@qq.com', '13567898765', '0', '15', '2');
INSERT INTO `employee` VALUES ('20', 'wangmin002', '1', '王敏', '13454332334', 'wang@qq.com', '0', '15', '2');
INSERT INTO `employee` VALUES ('21', 'chenm', '0192023a7bbd73250516f069df18b500', '陈敏', '13559994444', 'www@aa.com', '1', '15', '2');
INSERT INTO `employee` VALUES ('23', 'wangm', '0192023a7bbd73250516f069df18b500', '陈晨', '22·2', '11', '0', '14', '2');
INSERT INTO `employee` VALUES ('25', 'wangxh222', '0192023a7bbd73250516f069df18b500', '王晓华', '111', '1', '0', '14', '2');
INSERT INTO `employee` VALUES ('27', 'zhangsan', '0192023a7bbd73250516f069df18b500', '张三', '122', '22', '1', '16', '2');
INSERT INTO `employee` VALUES ('28', 'lisi', '0192023a7bbd73250516f069df18b500', '李四', '1', '1', '0', '16', '2');
INSERT INTO `employee` VALUES ('29', 'wangwu', '0192023a7bbd73250516f069df18b500', '王五', '1', '1', '0', '17', '2');
INSERT INTO `employee` VALUES ('30', 'zhaoliu', '0192023a7bbd73250516f069df18b500', '赵六', '1', '1', '0', '13', '2');
INSERT INTO `employee` VALUES ('32', 'fengqi', '0192023a7bbd73250516f069df18b500', '冯七', '1', '1', '0', '13', '2');
INSERT INTO `employee` VALUES ('33', 'maba', '0192023a7bbd73250516f069df18b500', '马八', '1', '1', '0', '13', '2');
INSERT INTO `employee` VALUES ('34', 'qianshi', '0192023a7bbd73250516f069df18b500', '钱十', '1', '1', '2', '13', '2');
INSERT INTO `employee` VALUES ('35', 'zhoushiyi', '0192023a7bbd73250516f069df18b500', '周十一', '1', '1', '0', '13', '2');
INSERT INTO `employee` VALUES ('36', 'wushier', '0192023a7bbd73250516f069df18b500', 'wushier', '1', '1', '1', '13', '2');
INSERT INTO `employee` VALUES ('37', 'woshini', '0192023a7bbd73250516f069df18b500', 'woshini', '123', '12@12.com', '2', '13', '2');
INSERT INTO `employee` VALUES ('38', 'admin', '0192023a7bbd73250516f069df18b500', '重天', '12355556666', '12@12.com', '0', '13', '1');
INSERT INTO `employee` VALUES ('39', 'tow', '202cb962ac59075b964b07152d234b70', 'tow', '12355556666', '12@12.com', '0', '13', '2');
INSERT INTO `employee` VALUES ('40', 'three', 'e10adc3949ba59abbe56e057f20f883e', '重天1', '1896666333', '12@12.com', '0', '14', '2');
INSERT INTO `meeting` VALUES ('25', 'ces', '5', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-10 23:02:39', '', '0', '2023-11-23 14:48:40', 'aaaaaaaaaaaaa');
INSERT INTO `meeting` VALUES ('26', '测测', '7', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-17 23:04:18', '', '0', '2023-11-11 01:06:20', '');
INSERT INTO `meeting` VALUES ('27', '我看看', '6', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-10 23:06:33', '我看看', '0', '2023-11-11 01:01:42', '');
INSERT INTO `meeting` VALUES ('28', '运营会', '5', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-10 23:26:26', '测试', '0', '2023-11-23 14:49:06', 'ppppppppppppppp');
INSERT INTO `meeting` VALUES ('29', '市场部会议', '6', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-10 23:44:41', '市场部', '0', null, '');
INSERT INTO `meeting` VALUES ('30', '内部会议', '10', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-10 23:56:20', '内部会议', '0', null, '');
INSERT INTO `meeting` VALUES ('31', '我的会议', '9', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-11 16:35:11', '测试', '0', null, '');
INSERT INTO `meeting` VALUES ('32', '我的会议哈哈', '5', '8', '10', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-11 16:40:50', '', '0', null, '');
INSERT INTO `meeting` VALUES ('33', '哈哈', '6', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-11 16:42:09', '你好', '0', '2023-11-12 11:44:57', '');
INSERT INTO `meeting` VALUES ('34', '我的会议3', '8', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-11 16:42:51', '测试', '0', null, '');
INSERT INTO `meeting` VALUES ('35', '我的会议', '7', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-11 16:44:35', '', '0', null, '');
INSERT INTO `meeting` VALUES ('36', '我问问', '7', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-11 16:57:56', '地点', '0', '2023-11-11 16:59:57', '');
INSERT INTO `meeting` VALUES ('37', '我的会议4', '7', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-11 16:59:49', '我的会议', '0', null, '');
INSERT INTO `meeting` VALUES ('38', '班会', '9', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-12 11:49:17', '班会', '1', '2023-11-12 11:49:37', '');
INSERT INTO `meeting` VALUES ('39', '测试会议', '5', '8', '12', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-14 14:44:07', 'ss', '0', null, '');
INSERT INTO `meeting` VALUES ('40', '市场研究会议', '5', '8', '99', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-16 21:23:45', '222222222222222222222', '0', null, '');
INSERT INTO `meeting` VALUES ('41', '哈哈哈', '17', '8', '99', '2023-11-25 12:00:00', '2023-11-30 12:00:00', '2023-11-21 14:28:36', 'aaaaaaaaaaaaaaaaaaa', '0', null, '');
INSERT INTO `meeting` VALUES ('42', '我来了', '6', '8', '12', '2023-11-21 13:00:19', '2023-11-21 14:00:21', '2023-11-21 13:00:41', '2222', '0', null, '');
INSERT INTO `meeting` VALUES ('43', '我来了', '5', '9', '12', '2023-11-22 13:53:08', '2023-11-23 13:53:10', '2023-11-22 13:53:21', '11111', '1', '2023-11-22 21:53:27', '1111');
INSERT INTO `meeting` VALUES ('44', '111', '5', '9', '111', '2023-11-22 15:03:47', '2023-11-23 15:03:49', '2023-11-22 15:04:00', '111', '0', null, '');
INSERT INTO `meeting` VALUES ('45', '1111', '5', '9', '1111', '2023-11-22 15:04:10', '2023-11-23 15:04:13', '2023-11-22 15:04:20', '1111', '0', null, '');
INSERT INTO `meeting` VALUES ('46', 'room', '8', '38', '3', '2023-11-27 06:24:22', '2023-11-28 06:24:37', '2023-11-25 06:25:03', '发发发', '0', null, '');
INSERT INTO `meeting` VALUES ('47', '今天班级会', '8', '39', '12', '2023-11-27 15:23:13', '2023-11-28 15:23:18', '2023-11-25 15:23:40', '简单地对', '1', '2023-11-25 23:23:53', '1111');
INSERT INTO `meeting` VALUES ('48', '1222', '7', '39', '11', '2023-11-27 15:24:33', '2023-11-28 15:24:37', '2023-11-25 15:24:51', '11212', '1', '2023-11-25 23:25:01', '222');
INSERT INTO `meeting` VALUES ('49', '我来了', '6', '38', '12', '2023-11-26 02:34:36', '2023-11-27 02:34:40', '2023-11-26 02:34:57', 'qqwqwq', '0', null, '');
INSERT INTO `meeting_employee` VALUES ('1', '28', '13');
INSERT INTO `meeting_employee` VALUES ('2', '28', '23');
INSERT INTO `meeting_employee` VALUES ('3', '28', '27');
INSERT INTO `meeting_employee` VALUES ('4', '28', '16');
INSERT INTO `meeting_employee` VALUES ('5', '29', '16');
INSERT INTO `meeting_employee` VALUES ('6', '29', '13');
INSERT INTO `meeting_employee` VALUES ('7', '29', '8');
INSERT INTO `meeting_employee` VALUES ('8', '30', '15');
INSERT INTO `meeting_employee` VALUES ('9', '30', '13');
INSERT INTO `meeting_employee` VALUES ('10', '30', '8');
INSERT INTO `meeting_employee` VALUES ('11', '30', '23');
INSERT INTO `meeting_employee` VALUES ('12', '27', '8');
INSERT INTO `meeting_employee` VALUES ('13', '26', '8');
INSERT INTO `meeting_employee` VALUES ('14', '25', '8');
INSERT INTO `meeting_employee` VALUES ('15', '28', '8');
INSERT INTO `meeting_employee` VALUES ('16', '31', '8');
INSERT INTO `meeting_employee` VALUES ('17', '31', '17');
INSERT INTO `meeting_employee` VALUES ('18', '31', '23');
INSERT INTO `meeting_employee` VALUES ('19', '32', '8');
INSERT INTO `meeting_employee` VALUES ('20', '32', '17');
INSERT INTO `meeting_employee` VALUES ('21', '33', '15');
INSERT INTO `meeting_employee` VALUES ('22', '34', '8');
INSERT INTO `meeting_employee` VALUES ('23', '34', '17');
INSERT INTO `meeting_employee` VALUES ('24', '35', '8');
INSERT INTO `meeting_employee` VALUES ('25', '36', '9');
INSERT INTO `meeting_employee` VALUES ('26', '36', '8');
INSERT INTO `meeting_employee` VALUES ('27', '37', '8');
INSERT INTO `meeting_employee` VALUES ('28', '37', '23');
INSERT INTO `meeting_employee` VALUES ('29', '38', '11');
INSERT INTO `meeting_employee` VALUES ('30', '38', '16');
INSERT INTO `meeting_employee` VALUES ('31', '38', '20');
INSERT INTO `meeting_employee` VALUES ('32', '39', '13');
INSERT INTO `meeting_employee` VALUES ('33', '40', '10');
INSERT INTO `meeting_employee` VALUES ('34', '40', '8');
INSERT INTO `meeting_employee` VALUES ('35', '40', '9');
INSERT INTO `meeting_employee` VALUES ('36', '41', '10');
INSERT INTO `meeting_employee` VALUES ('37', '41', '8');
INSERT INTO `meeting_employee` VALUES ('38', '41', '9');
INSERT INTO `meeting_employee` VALUES ('39', '42', '10');
INSERT INTO `meeting_employee` VALUES ('40', '42', '32');
INSERT INTO `meeting_employee` VALUES ('41', '42', '35');
INSERT INTO `meeting_employee` VALUES ('42', '43', '8');
INSERT INTO `meeting_employee` VALUES ('43', '43', '9');
INSERT INTO `meeting_employee` VALUES ('44', '44', '9');
INSERT INTO `meeting_employee` VALUES ('45', '45', '10');
INSERT INTO `meeting_employee` VALUES ('46', '46', '15');
INSERT INTO `meeting_employee` VALUES ('47', '46', '20');
INSERT INTO `meeting_employee` VALUES ('48', '46', '29');
INSERT INTO `meeting_employee` VALUES ('49', '47', '15');
INSERT INTO `meeting_employee` VALUES ('50', '47', '20');
INSERT INTO `meeting_employee` VALUES ('51', '47', '30');
INSERT INTO `meeting_employee` VALUES ('52', '47', '32');
INSERT INTO `meeting_employee` VALUES ('53', '47', '35');
INSERT INTO `meeting_employee` VALUES ('54', '48', '32');
INSERT INTO `meeting_employee` VALUES ('55', '48', '38');
INSERT INTO `meeting_employee` VALUES ('56', '48', '39');
INSERT INTO `meeting_employee` VALUES ('57', '49', '30');
INSERT INTO `meeting_employee` VALUES ('58', '49', '32');
INSERT INTO `meeting_employee` VALUES ('59', '49', '39');
INSERT INTO `room` VALUES ('5', '101', '第一会议室', '15', '0', '公共会议室');
INSERT INTO `room` VALUES ('6', '102', '第二会议室', '5', '0', '管理部门会议室');
INSERT INTO `room` VALUES ('7', '103', '第三会议室', '12', '0', '市场部专用会议室');
INSERT INTO `room` VALUES ('8', '401', '第四会议室', '15', '0', '公共会议室');
INSERT INTO `room` VALUES ('9', '201', '第五会议室', '15', '0', '最大会议室');
INSERT INTO `room` VALUES ('10', '601', '第六会议室', '12', '0', '需要提前三天预定');
INSERT INTO `room` VALUES ('15', '999', '第998会议室', '99', '0', '爱笑会议室');
INSERT INTO `room` VALUES ('16', '998', '第999会议室', '98', '0', '游戏会议室');
INSERT INTO `room` VALUES ('17', '996', '第10000会议室', '96', '0', '狼人杀会议室');

