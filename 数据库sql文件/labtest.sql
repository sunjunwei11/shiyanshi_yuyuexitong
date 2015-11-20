/*
Navicat MySQL Data Transfer

Source Server         : jun
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : labtest

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-11-19 19:08:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `111`
-- ----------------------------
DROP TABLE IF EXISTS `111`;
CREATE TABLE `111` (
  `experimentid` varchar(20) NOT NULL,
  `subexperimentid` varchar(20) NOT NULL DEFAULT '',
  `experimentname` varchar(20) DEFAULT NULL,
  `subexperimentname` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `deviceid` varchar(20) DEFAULT NULL,
  `maxnum` varchar(20) DEFAULT NULL,
  `openTime` varchar(20) DEFAULT NULL,
  `closeTime` varchar(20) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `teachername` varchar(20) DEFAULT NULL,
  `describe` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`experimentid`,`subexperimentid`),
  KEY `experimentid` (`experimentid`),
  KEY `subexperimentid` (`subexperimentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 111
-- ----------------------------

-- ----------------------------
-- Table structure for `222`
-- ----------------------------
DROP TABLE IF EXISTS `222`;
CREATE TABLE `222` (
  `orderid` varchar(20) NOT NULL,
  `deviceid` varchar(20) DEFAULT NULL,
  `studentid` varchar(20) NOT NULL,
  `studentname` varchar(20) DEFAULT NULL,
  `subexperimentid` varchar(20) NOT NULL,
  `subexperimentname` varchar(20) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `By` varchar(20) NOT NULL,
  `Time` varchar(20) NOT NULL,
  `caozuo` varchar(20) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 222
-- ----------------------------

-- ----------------------------
-- Table structure for `333`
-- ----------------------------
DROP TABLE IF EXISTS `333`;
CREATE TABLE `333` (
  `orderid` varchar(20) NOT NULL,
  `deviceid` varchar(20) NOT NULL,
  `studentid` varchar(20) NOT NULL,
  `studentname` varchar(20) NOT NULL,
  `coursename` varchar(20) NOT NULL,
  `subexperimentid` varchar(20) NOT NULL,
  `subexperimentname` varchar(20) DEFAULT NULL,
  `state` varchar(10) NOT NULL,
  `createBy` varchar(20) DEFAULT NULL,
  `createDate` varchar(20) DEFAULT NULL,
  `modifiedBy` varchar(20) DEFAULT NULL,
  `modifiedDate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `deviceid` (`deviceid`),
  KEY `studentid` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 333
-- ----------------------------

-- ----------------------------
-- Table structure for `admininf`
-- ----------------------------
DROP TABLE IF EXISTS `admininf`;
CREATE TABLE `admininf` (
  `adminid` int(20) NOT NULL,
  `adminname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `quanxian` varchar(10) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `researchroom` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininf
-- ----------------------------
INSERT INTO `admininf` VALUES ('111', '张俊', 'MTIzNDU2', 'C', '自动化', '', '管理员', '');
INSERT INTO `admininf` VALUES ('122', '张建', 'MTIzNDU2', 'C', '自动化', null, '管理员', null);

-- ----------------------------
-- Table structure for `allexperimentinf`
-- ----------------------------
DROP TABLE IF EXISTS `allexperimentinf`;
CREATE TABLE `allexperimentinf` (
  `experimentid` varchar(20) DEFAULT NULL,
  `subexperimentid` varchar(20) NOT NULL DEFAULT '',
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL COMMENT '源来哪门课程',
  `describe` varchar(255) DEFAULT NULL,
  KEY `experimentid` (`experimentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allexperimentinf
-- ----------------------------

-- ----------------------------
-- Table structure for `anwsers`
-- ----------------------------
DROP TABLE IF EXISTS `anwsers`;
CREATE TABLE `anwsers` (
  `userid` varchar(15) NOT NULL DEFAULT '',
  `anwserfor` char(15) DEFAULT NULL,
  `question1` char(11) DEFAULT NULL,
  `question2` char(11) DEFAULT NULL,
  `question3` char(11) DEFAULT NULL,
  `question4` char(11) DEFAULT NULL,
  `question5` char(11) DEFAULT NULL,
  `question6` char(11) DEFAULT NULL,
  `question7` char(11) DEFAULT NULL,
  `question8` text,
  `question9` text,
  `question10` text,
  `time` datetime DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anwsers
-- ----------------------------
INSERT INTO `anwsers` VALUES ('0121017550524', 'questionnaire1', '4', '6', '5', '10', '10', '10', '10', '111', '222', '333', '2015-10-19 17:09:04', null);
INSERT INTO `anwsers` VALUES ('0121111360127', 'questionnaire1', '10', '10', '9', '7', '8', '10', '10', '二次污染', '二E网通要', '让他如何让我', '2015-10-21 14:57:00', null);
INSERT INTO `anwsers` VALUES ('11', 'questionnaire1', '3', '6', '6', '5', '10', '10', '9', '11', '2234CRV贴吧', '4v4t4t', '2015-10-20 15:31:33', null);
INSERT INTO `anwsers` VALUES ('110', 'questionnaire1', '6', '8', '8', '10', '9', '10', '10', 'FES H TWHYW ', '地方热和我很听话 ', '我图网填好他惹火额', '2015-10-27 15:02:41', null);
INSERT INTO `anwsers` VALUES ('119', 'questionnaire1', '8', '8', '7', '10', '10', '10', '9', '太容易二货', '53元5元3躺赢6', '43 6元3元他会突然个', '2015-10-27 15:15:01', null);
INSERT INTO `anwsers` VALUES ('120', 'questionnaire1', '7', '9', '8', '7', '9', '9', '7', 'EWR RGRG', 'QE FQ EGRE QHRQ', 'AS GRHW THW', '2015-10-28 09:17:27', null);
INSERT INTO `anwsers` VALUES ('88', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-21 16:08:10', null);
INSERT INTO `anwsers` VALUES ('911', 'questionnaire1', '9', '10', '9', '10', '10', '10', '10', 'FGW HWTHW THT', '如果我然后他问卷', ' 也 呃呃 呵呵也额', '2015-10-28 10:37:57', null);
INSERT INTO `anwsers` VALUES ('99', 'questionnaire1', '9', '10', '9', '10', '9', '9', '9', '规范化人特', '怀特人基金', '具有特加入人', '2015-10-26 10:09:31', null);
INSERT INTO `anwsers` VALUES ('88', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-28 10:40:29', null);
INSERT INTO `anwsers` VALUES ('88', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-28 10:43:20', null);
INSERT INTO `anwsers` VALUES ('911', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-28 10:44:38', null);
INSERT INTO `anwsers` VALUES ('911', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-28 10:45:51', null);
INSERT INTO `anwsers` VALUES ('911', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-28 10:47:05', '40');
INSERT INTO `anwsers` VALUES ('120', 'testing', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', '2015-10-28 10:58:40', '20');
INSERT INTO `anwsers` VALUES ('711', 'questionnaire1', '7', '10', '10', '9', '9', '10', '10', 'TRY HT 个华为跳舞 ', '就二阶金额已经语句二阶', '额额和他约会额有条件额', '2015-10-28 13:19:52', null);
INSERT INTO `anwsers` VALUES ('711', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-28 13:22:05', '40');
INSERT INTO `anwsers` VALUES ('711', 'testing', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', '2015-10-28 13:24:53', '40');
INSERT INTO `anwsers` VALUES ('711', 'testing', 'A', 'D', 'D', 'B', 'C', 'C', 'C', 'C', 'C', 'B', '2015-10-28 13:26:22', '30');
INSERT INTO `anwsers` VALUES ('711', 'testing', 'A', 'D', 'D', 'B', 'C', 'A', 'C', 'C', 'C', 'C', '2015-10-28 13:27:06', '30');
INSERT INTO `anwsers` VALUES ('711', 'testing', 'A', 'D', 'D', 'B', 'C', 'A', 'C', 'C', 'C', 'B', '2015-10-28 13:27:37', '20');
INSERT INTO `anwsers` VALUES ('711', 'testing', 'A', 'B', 'C', 'D', 'A', 'B', 'C', 'D', 'A', 'B', '2015-10-28 14:49:02', '30');
INSERT INTO `anwsers` VALUES ('811', 'questionnaire1', '10', '9', '9', '9', '10', '10', '10', '二突然 就一定和', '人一塌糊涂让他感到很个', '他惹火搞好而他和她和 回个电话', '2015-10-28 15:10:31', null);
INSERT INTO `anwsers` VALUES ('811', 'testing', 'A', 'B', 'C', 'D', 'A', 'B', 'C', 'D', 'A', 'B', '2015-10-28 21:21:19', '30');
INSERT INTO `anwsers` VALUES ('811', 'testing', 'A', 'B', 'C', 'D', 'A', 'B', 'C', 'D', 'A', 'B', '2015-10-28 21:35:48', '30');
INSERT INTO `anwsers` VALUES ('811', 'testing', 'A', 'D', 'D', 'B', 'C', 'A', 'C', 'C', 'C', 'B', '2015-10-28 21:42:08', '100');
INSERT INTO `anwsers` VALUES ('911', '上水箱对象特性', 'A', 'D', 'B', 'C', 'D', 'A', 'C', 'C', 'C', 'B', '2015-11-03 16:26:05', '70');
INSERT INTO `anwsers` VALUES ('1234', 'questionnaire1', '10', '9', '9', '9', '9', '9', '10', '耳朵诶回复II', '润肤I好', '而非会覅我I去I我hi', '2015-11-04 15:14:54', null);
INSERT INTO `anwsers` VALUES ('12', 'questionnaire1', '10', '10', '10', '10', '10', '10', '10', '二个人后台问题', '填儿童画热火问问', '热额和网王同人会突然问我填好', '2015-11-04 18:37:45', null);
INSERT INTO `anwsers` VALUES ('112', 'questionnaire1', '9', '10', '10', '10', '10', '9', '9', '二次人非国防观反外挂', '填好天热很高额和他', '突然合同赫尔额', '2015-11-04 18:55:21', null);
INSERT INTO `anwsers` VALUES ('112', '上水箱对象特性', 'A', 'D', 'D', 'C', 'B', 'A', 'C', 'C', 'C', 'B', '2015-11-04 21:29:30', '80');
INSERT INTO `anwsers` VALUES ('113', 'questionnaire1', '10', '10', '9', '9', '10', '10', '9', '太热如果让他人', '惹我哥如果如果', '热狗玩个我热放入购物', '2015-11-05 10:20:33', null);
INSERT INTO `anwsers` VALUES ('113', '上水箱对象特性', 'A', 'D', 'B', 'C', 'D', 'A', 'C', 'C', 'C', 'B', '2015-11-05 10:21:12', '70');
INSERT INTO `anwsers` VALUES ('644', 'questionnaire1', '10', '10', '10', '10', '10', '10', '10', '如题热天热后而他已经', ' three额和更好的会更好 ', '额 和人呵呵呵和额和他', '2015-11-09 16:33:16', null);
INSERT INTO `anwsers` VALUES ('644', '上水箱对象特性', 'A', 'D', 'D', 'B', 'D', 'A', 'C', 'C', 'C', 'B', '2015-11-13 19:22:32', '90');
INSERT INTO `anwsers` VALUES ('644', '液位单闭环控制', 'C', 'C', 'C', 'A', 'D', 'B', 'B', 'D', 'C', 'D', '2015-11-13 19:55:29', '100');
INSERT INTO `anwsers` VALUES ('1115', 'questionnaire1', '9', '10', '10', '10', '9', '10', '10', '发热管乳房 ', '换个问题哈给我发分', ' 滕王阁发挥服务费', '2015-11-15 10:29:45', null);
INSERT INTO `anwsers` VALUES ('1115', '液位单闭环控制', 'C', 'C', 'C', 'A', 'D', 'B', 'B', 'D', 'C', 'D', '2015-11-15 10:53:22', '100');
INSERT INTO `anwsers` VALUES ('0121011360622', 'questionnaire1', '10', '8', '7', '5', '9', '8', '10', '发给他发的涣发大号', '额太热半夜有人用太热', '容易使人所以', '2015-11-19 14:26:21', null);
INSERT INTO `anwsers` VALUES ('0121011360622', 'questionnaire2', '10', '8', '8', '9', '8', '8', '10', '不符合大众', '人员人员在荣誉值', '有人员调整 ', '2015-11-19 14:27:00', null);
INSERT INTO `anwsers` VALUES ('0121017550524', '上水箱对象特性', 'A', 'D', 'D', 'B', 'C', 'A', 'C', 'D', 'C', 'C', '2015-11-29 16:30:47', '80');
INSERT INTO `anwsers` VALUES ('0121017550524', '液位单闭环控制', 'C', 'C', 'C', 'A', 'D', 'B', 'B', 'D', 'A', 'C', '2015-11-19 16:32:12', '80');
INSERT INTO `anwsers` VALUES ('0121017550524', '流量液位串级控制', 'C', 'A', 'C', 'A', 'B', 'A', 'B', 'C', 'C', 'C', '2015-11-19 16:51:58', '80');
INSERT INTO `anwsers` VALUES ('0121017550524', '史密斯预估实验', 'C', 'D', 'C', 'C', 'B', 'D', 'A', 'D', 'A', 'A', '2015-11-19 16:55:16', '80');

-- ----------------------------
-- Table structure for `appointmentsheet`
-- ----------------------------
DROP TABLE IF EXISTS `appointmentsheet`;
CREATE TABLE `appointmentsheet` (
  `studentid` varchar(50) DEFAULT NULL,
  `studentname` varchar(20) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `startTime` varchar(50) DEFAULT NULL,
  `xiakeTime` varchar(50) DEFAULT NULL,
  `equipment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appointmentsheet
-- ----------------------------
INSERT INTO `appointmentsheet` VALUES ('0121111360101', '李明闻', '过程控制', '对象特性', '上水箱对象特性', '2015-11-20', '08:00', '09:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360101', '李明闻', '过程控制', '单闭环控制', '液位单闭环控制', '2015-11-20', '10:00', '11:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360101', '李明闻', '过程控制', '串级控制', '流量液位串级控制', '2015-11-20', '14:00', '15:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-20', '16:00', '17:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360122', '杜路遥', '过程控制', '对象特性', '上水箱对象特性', '2015-11-20', '08:00', '09:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360122', '杜路遥', '过程控制', '单闭环控制', '液位单闭环控制', '2015-11-21', '10:00', '11:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360122', '杜路遥', '过程控制', '串级控制', '流量液位串级控制', '2015-11-20', '14:00', '15:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-20', '18:30', '20:10', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360231', '肖瑶', '过程控制', '对象特性', '上水箱对象特性', '2015-11-20', '08:00', '09:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360231', '肖瑶', '过程控制', '单闭环控制', '液位单闭环控制', '2015-11-22', '10:00', '11:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360231', '肖瑶', '过程控制', '串级控制', '流量液位串级控制', '2015-11-20', '14:00', '15:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-20', '16:00', '17:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360317', '周晓奇', '过程控制', '对象特性', '上水箱对象特性', '2015-11-20', '08:00', '09:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360317', '周晓奇', '过程控制', '单闭环控制', '液位单闭环控制', '2015-11-20', '10:00', '11:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360317', '周晓奇', '过程控制', '串级控制', '流量液位串级控制', '2015-11-20', '14:00', '15:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-20', '16:00', '17:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360712', '胡亚清', '过程控制', '对象特性', '上水箱对象特性', '2015-11-20', '08:00', '09:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360712', '胡亚清', '过程控制', '单闭环控制', '液位单闭环控制', '2015-11-21', '10:00', '11:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360712', '胡亚清', '过程控制', '串级控制', '流量液位串级控制', '2015-11-20', '14:00', '15:40', '设备4');
INSERT INTO `appointmentsheet` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-20', '16:00', '17:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121017550524', '黄莹莹', '过程控制', '单闭环控制', '液位单闭环控制', '2015-11-24', '10:00', '11:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121017550524', '黄莹莹', '过程控制', '串级控制', '流量液位串级控制', '2015-11-21', '14:00', '15:40', '设备1');
INSERT INTO `appointmentsheet` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-21', '18:30', '20:10', '设备1');

-- ----------------------------
-- Table structure for `appointmentsheet_old`
-- ----------------------------
DROP TABLE IF EXISTS `appointmentsheet_old`;
CREATE TABLE `appointmentsheet_old` (
  `studentid` varchar(50) DEFAULT NULL COMMENT '学生学号',
  `studentname` varchar(20) DEFAULT NULL COMMENT '预约学生姓名',
  `deviceid` varchar(20) DEFAULT NULL COMMENT '使用设备编号',
  `coursename` varchar(50) DEFAULT NULL COMMENT '预约的课程编号',
  `experimentname` varchar(50) DEFAULT NULL COMMENT '预约的实验编号',
  `subexperimentname` varchar(50) DEFAULT NULL COMMENT '约预的子实验编号',
  `ADate` varchar(20) DEFAULT NULL COMMENT '约预的验实进行的日期',
  `StartTime` varchar(20) DEFAULT NULL,
  `EndTime` varchar(20) DEFAULT NULL,
  `classname` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '约预是否有效，（是否取消）1为有效，0为取消',
  `path` varchar(20) DEFAULT NULL COMMENT '己自预约还是老师指定',
  `CreateBy` varchar(50) DEFAULT NULL COMMENT '生学自己预约则为自己创建，由老师指定则由老师创建',
  `CreateTime` varchar(20) DEFAULT NULL COMMENT '建创（取消）约预的时间',
  KEY `FK_studentid` (`studentid`),
  CONSTRAINT `FK_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentsinf` (`studentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appointmentsheet_old
-- ----------------------------
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-01', '2:00 AM', '6:00 AM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 15:07:53');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-01', '2:00 AM', '6:00 AM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 15:07:53');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '单闭环控制', '液位单闭环控制', '2014-09-01', '2:00 AM', '6:00 AM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 19:52:15');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '单闭环控制', '液位单闭环控制', '2014-09-01', '2:00 AM', '6:00 AM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 19:52:15');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360102', '胡亚', '1', '计算机仿真技术', 'matlab应用基础', 'matlab应用基础', '2014-09-01', '6:00 AM', '6:00 AM', '自动化0905', '有效', '1', '老师指定', '2014-09-14 19:57:34');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-01', '3:00 PM', '6:00 PM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 21:00:32');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-01', '3:00 PM', '6:00 PM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 21:00:32');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360102', '胡亚', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-01', '6:00 PM', '9:00 PM', '自动化0905', '有效', '1', '老师指定', '2014-09-14 21:05:53');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '计算机仿真技术', 'matlab应用基础', 'matlab应用基础', '2014-09-09', '1:15 PM', '3:05 PM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 21:09:54');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '计算机仿真技术', 'matlab应用基础', 'matlab应用基础', '2014-09-09', '1:15 PM', '3:05 PM', '自动化1001', '有效', '1', '老师指定', '2014-09-14 21:09:54');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '计算机仿真技术', '控制系统模型的建立', '控制系统模型的建立', '2014-09-01', '15:15', '18:00', '自动化1001', '有效', '1', '老师指定', '2014-09-15 08:57:51');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '计算机仿真技术', '控制系统模型的建立', '控制系统模型的建立', '2014-09-01', '15:15', '18:00', '自动化1001', '有效', '1', '老师指定', '2014-09-15 08:57:51');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '计算机仿真技术', '控制系统模型的建立', '控制系统模型的建立', '2014-09-01', '18:00', '18:00', '自动化1001', '有效', '1', '老师指定', '2014-09-15 09:00:21');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '计算机仿真技术', '控制系统模型的建立', '控制系统模型的建立', '2014-09-01', '18:00', '18:00', '自动化1001', '有效', '1', '老师指定', '2014-09-15 09:00:21');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '史密斯预估控制', '史密斯预估实验', '2014-09-09', '15:15 PM', '18:30 PM', '自动化1001', '有效', '1', '老师指定', '2014-09-15 09:09:44');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '史密斯预估控制', '史密斯预估实验', '2014-09-09', '15:15 PM', '18:30 PM', '自动化1001', '有效', '1', '老师指定', '2014-09-15 09:09:44');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360102', '胡亚', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-01', '17:30', '19:30', '自动化0905', '有效', '1', '老师指定', '2014-09-15 09:11:36');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-02', '9:00', '10:00', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:35:50');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-02', '9:00', '10:00', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:35:50');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360102', '胡亚', '1', '过程控制', '对象特性', '下水箱对象特性', '2014-09-01', '8:00', '9:00', '自动化0905', '有效', '1', '老师指定', '2014-09-17 12:37:48');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-01', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:46:11');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-01', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:46:11');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-02', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:47:29');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-02', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:47:29');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-04', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:50:12');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-04', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 12:50:12');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360102', '胡亚', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-10', '8:00', '9:55', '自动化0905', '有效', '1', '老师指定', '2014-09-17 13:01:56');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360102', '胡亚', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-10', '8:00', '9:55', '自动化0905', '有效', '1', '老师指定', '2014-09-17 13:03:48');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-01', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 21:07:02');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-01', '8:00', '21:55', '自动化1001', '有效', '1', '老师指定', '2014-09-17 21:07:02');
INSERT INTO `appointmentsheet_old` VALUES ('0121017550524', '陈万委', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-16', '9:00', '12:00', '自动化1001', '有效', '1', '老师指定', '2014-09-23 10:13:26');
INSERT INTO `appointmentsheet_old` VALUES ('0121111360101', '周星宇', '1', '过程控制', '对象特性', '上水箱对象特性', '2014-09-16', '9:00', '12:00', '自动化1001', '有效', '1', '老师指定', '2014-09-23 10:13:26');

-- ----------------------------
-- Table structure for `appointrecord`
-- ----------------------------
DROP TABLE IF EXISTS `appointrecord`;
CREATE TABLE `appointrecord` (
  `deviceid` varchar(20) NOT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `ADate` varchar(20) DEFAULT NULL,
  `StartTime` varchar(20) DEFAULT NULL,
  `EndTime` varchar(20) DEFAULT NULL,
  `container` varchar(20) DEFAULT NULL COMMENT '已选人数',
  `createtime` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  KEY `FK_deviceid` (`deviceid`),
  KEY `FK_subexperimentid` (`subexperimentname`),
  CONSTRAINT `FK_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `equipmentinf` (`deviceid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appointrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL,
  `quanxian` varchar(135) DEFAULT NULL,
  `xiangmu` varchar(135) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('0', 'A', '学生桌面');
INSERT INTO `authority` VALUES ('1', 'A', '基础部分1');
INSERT INTO `authority` VALUES ('2', 'A', '提高部分1');
INSERT INTO `authority` VALUES ('3', 'A', '功能部分1');
INSERT INTO `authority` VALUES ('4', 'A', '安全退出');
INSERT INTO `authority` VALUES ('21', 'B', '老师桌面');
INSERT INTO `authority` VALUES ('22', 'B', '基础部分2');
INSERT INTO `authority` VALUES ('23', 'B', '提高部分2');
INSERT INTO `authority` VALUES ('24', 'B', '功能部分2');
INSERT INTO `authority` VALUES ('25', 'B', '安全退出');
INSERT INTO `authority` VALUES ('31', 'C', '管理员桌面');
INSERT INTO `authority` VALUES ('32', 'C', '信息录入');
INSERT INTO `authority` VALUES ('33', 'C', '实验管理');
INSERT INTO `authority` VALUES ('34', 'C', '用户管理');
INSERT INTO `authority` VALUES ('35', 'C', '安全退出');

-- ----------------------------
-- Table structure for `authority_old`
-- ----------------------------
DROP TABLE IF EXISTS `authority_old`;
CREATE TABLE `authority_old` (
  `id` int(20) DEFAULT NULL,
  `quanxian` varchar(20) DEFAULT NULL,
  `xiangmu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority_old
-- ----------------------------
INSERT INTO `authority_old` VALUES ('1', 'A', '实验内容');
INSERT INTO `authority_old` VALUES ('1', 'A', '实验内容');
INSERT INTO `authority_old` VALUES ('2', 'A', '实验习题');
INSERT INTO `authority_old` VALUES ('3', 'A', '反馈内容');
INSERT INTO `authority_old` VALUES ('4', 'A', '实验报告');
INSERT INTO `authority_old` VALUES ('5', 'A', '个人信息');
INSERT INTO `authority_old` VALUES ('6', 'A', '安全退出');
INSERT INTO `authority_old` VALUES ('11', 'B', '实验内容');
INSERT INTO `authority_old` VALUES ('12', 'B', '实验习题');
INSERT INTO `authority_old` VALUES ('13', 'B', '实验反馈');
INSERT INTO `authority_old` VALUES ('21', 'C', '实验设置');
INSERT INTO `authority_old` VALUES ('22', 'C', '设备状态');

-- ----------------------------
-- Table structure for `choose1_old`
-- ----------------------------
DROP TABLE IF EXISTS `choose1_old`;
CREATE TABLE `choose1_old` (
  `user` varchar(50) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `startTime` varchar(50) DEFAULT NULL,
  `xiakeTime` varchar(50) DEFAULT NULL,
  `equipment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of choose1_old
-- ----------------------------
INSERT INTO `choose1_old` VALUES ('陈思明', '微机原理', '基础实验', '键盘输入并显示实验', '2014-08-30', '08:00', '09:00', '设备1');
INSERT INTO `choose1_old` VALUES ('陈思明', '微机原理', '基础实验', '键盘输入并显示实验', '2014-08-01', '12:30', '14:00', '设备1');
INSERT INTO `choose1_old` VALUES ('陈思明', '微机原理', '基础实验', '键盘输入并显示实验', '2014-08-08', '15:00', '16:00', '设备1');
INSERT INTO `choose1_old` VALUES ('陈思明', '微机原理', '基础实验', '键盘输入并显示实验', '2014-08-01', '01:00', '03:00', '设备1');
INSERT INTO `choose1_old` VALUES ('陈思明', '微机原理', '基础实验', '键盘输入并显示实验', '2014-08-31', '15:00', '16:00', '设备1');
INSERT INTO `choose1_old` VALUES ('陈思明', '微机原理', '基础实验', '键盘输入并显示实验', '2014-08-04', '14:20', '16:00', '设备1');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseid` varchar(20) NOT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `denotation` varchar(50) DEFAULT NULL,
  `teachername` varchar(20) DEFAULT NULL COMMENT '课老师任',
  `setTime` date DEFAULT NULL COMMENT '课开时间',
  `endTime` date DEFAULT NULL COMMENT '束结课程时间',
  `zt` tinyint(1) DEFAULT NULL COMMENT '程课开放或没开',
  `experimentplace` varchar(100) DEFAULT NULL COMMENT '课上地点',
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '过程控制', 'gckz', null, null, null, null, null);
INSERT INTO `course` VALUES ('2', '计算机仿真技术', 'jsjfzjs', null, null, null, null, null);
INSERT INTO `course` VALUES ('3', '微机原理', 'wjyl', null, null, null, null, null);
INSERT INTO `course` VALUES ('4', '电机与拖动', 'djtd', null, null, null, null, null);
INSERT INTO `course` VALUES ('5', '11', 'yy', null, null, null, null, null);
INSERT INTO `course` VALUES ('6', '22', 'ee', null, null, null, null, null);
INSERT INTO `course` VALUES ('7', '33', 'ss', null, null, null, null, null);
INSERT INTO `course` VALUES ('8', '44', 'se', null, null, null, null, null);

-- ----------------------------
-- Table structure for `diaochabiao`
-- ----------------------------
DROP TABLE IF EXISTS `diaochabiao`;
CREATE TABLE `diaochabiao` (
  `userid` varchar(15) NOT NULL,
  `question1` int(11) DEFAULT NULL,
  `question2` int(11) DEFAULT NULL,
  `question3` int(11) DEFAULT NULL,
  `question4` int(11) DEFAULT NULL,
  `question5` int(11) DEFAULT NULL,
  `question6` int(11) DEFAULT NULL,
  `question7` int(11) DEFAULT NULL,
  `question8` text,
  `question9` text,
  `question10` text,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diaochabiao
-- ----------------------------
INSERT INTO `diaochabiao` VALUES ('0120911360507', '8', '10', '10', '8', '10', '9', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 14:23:15');
INSERT INTO `diaochabiao` VALUES ('0121011360114', '8', '9', '8', '9', '10', '10', '9', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，实验原理，在做实验的时候可以更快的更好的完成实验，对专业的认识加深。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。对专业的认识有了更深一步的了解，收获颇丰。', '希望实验设施更加全面一点，讲解更加详细一点。', '2013-12-20 14:30:05');
INSERT INTO `diaochabiao` VALUES ('0121011360112', '9', '8', '9', '9', '9', '9', '9', '自己写软件说明书，起到了很好的预习作用，对实验的硬件软件有了初步的认识，在做实验的时候，能取得更好的实验效果', '这几次的过程控制实验，实验仪器和设备都特别的良好。但是由于设备是初次应用于实验，所以有很多问题需要解决。通过这几次的过程控制实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验严格按照时间进行，合理安排时间和实验数目。并适当增加实验次数，让我们通过更多的实验，对课本知识，有更多的了解。现在，对课本的知识过多停留在理论上。', '2013-12-20 14:36:15');
INSERT INTO `diaochabiao` VALUES ('0121011360113', '8', '9', '8', '9', '8', '10', '9', '自己写软件说明书，可以起到预习了解的作用，能够提前了解实验的软件硬件和实验原理，在做实验的时候可以更快的更好的完成实验，提高实验效率。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。同时通过这次实验，可以加深课本理论的理解。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备的基础设施应该齐全，实验的过度过程时间过长，真正的实验实践过短', '2013-12-20 14:43:09');
INSERT INTO `diaochabiao` VALUES ('0121011360116', '9', '9', '9', '9', '10', '9', '9', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 14:45:00');
INSERT INTO `diaochabiao` VALUES ('0121011360134', '9', '10', '9', '9', '10', '10', '9', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验，也更好的将理论的知识跟实践相结合起来。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，通过在试验使得我的实际应变能力有了很好的提高。同时通过这次实验，我对过程控制课本中知识有了更好的理解。', '实验设备能在实验前把硬件问题解决，这样可以节省实验过程中所要的时间。', '2013-12-20 14:51:35');
INSERT INTO `diaochabiao` VALUES ('0121011360107', '10', '9', '8', '8', '9', '10', '9', '通过自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。\n', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:02:13');
INSERT INTO `diaochabiao` VALUES ('0121011360108', '8', '9', '6', '7', '9', '9', '7', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:03:46');
INSERT INTO `diaochabiao` VALUES ('0121011360106', '9', '8', '8', '9', '7', '7', '8', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:05:04');
INSERT INTO `diaochabiao` VALUES ('0121011360103', '10', '10', '10', '9', '10', '10', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:07:19');
INSERT INTO `diaochabiao` VALUES ('0121011360101', '9', '9', '9', '8', '9', '9', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:08:22');
INSERT INTO `diaochabiao` VALUES ('0121011360102', '8', '9', '10', '9', '9', '8', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:09:40');
INSERT INTO `diaochabiao` VALUES ('0121011360104', '9', '10', '8', '9', '9', '9', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:10:54');
INSERT INTO `diaochabiao` VALUES ('0121011360110', '9', '8', '9', '9', '10', '9', '9', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:12:12');
INSERT INTO `diaochabiao` VALUES ('0121011360111', '9', '9', '8', '9', '9', '9', '9', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:13:18');
INSERT INTO `diaochabiao` VALUES ('0120911360303', '9', '9', '9', '9', '10', '9', '9', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:14:57');
INSERT INTO `diaochabiao` VALUES ('0121011360121', '9', '10', '10', '10', '10', '9', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:17:03');
INSERT INTO `diaochabiao` VALUES ('0121011360115', '9', '10', '9', '9', '10', '10', '9', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:18:23');
INSERT INTO `diaochabiao` VALUES ('0121011360117', '9', '10', '9', '10', '10', '10', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '\n这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:19:34');
INSERT INTO `diaochabiao` VALUES ('0120913770101', '10', '10', '9', '9', '10', '10', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:20:45');
INSERT INTO `diaochabiao` VALUES ('0121011360118', '9', '10', '10', '9', '10', '10', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:21:51');
INSERT INTO `diaochabiao` VALUES ('0121011360119', '10', '10', '10', '10', '9', '10', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:24:29');
INSERT INTO `diaochabiao` VALUES ('0121011360120', '10', '10', '9', '10', '10', '9', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。\n', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:25:33');
INSERT INTO `diaochabiao` VALUES ('0121011360132', '9', '10', '10', '10', '10', '9', '10', '能够起到预习的作用，提前了解实验的软件硬件，可以更快的完成实验。', '全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。', '实验设备能在实验前把硬件问题解决，先调试好在做实验。', '2013-12-20 15:28:50');
INSERT INTO `diaochabiao` VALUES ('0121011360131', '9', '9', '7', '8', '8', '7', '7', '自己写软件说明书，可以起到预习的作用，了解实验设备，想想实验要怎么做，在做实验的时候可以更快的更好的完成实验，加强能力。\n', '由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，但通过慢慢摸索，渐渐了解。', '能在实验前把硬件问题解决。', '2013-12-20 15:32:54');
INSERT INTO `diaochabiao` VALUES ('0121011360130', '9', '10', '10', '10', '9', '9', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。', '实验设备能在实验前把硬件问题解决。', '2013-12-20 15:34:59');
INSERT INTO `diaochabiao` VALUES ('0121011360126', '8', '8', '9', '8', '8', '9', '9', '自己写说明书可以让自己很快的了解实验内容，了解实验器材等等，对自己的实验过程起到帮助的作用。', '\n这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '更加丰富一点', '2013-12-20 15:50:39');
INSERT INTO `diaochabiao` VALUES ('0121011360127', '10', '9', '10', '9', '10', '9', '10', '能较快的理解实验原理。可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '增加独立完成环节，实验设备能在实验前把硬件问题解决。', '2013-12-20 15:54:13');
INSERT INTO `diaochabiao` VALUES ('0121011360125', '10', '9', '10', '10', '10', '10', '10', '通过对软件说明书的书写，提前对本次实验的原理与实验步骤有了更进一步的理解，相当于对实验提前预习了一遍，实验的时候可以更快的更好的完成实验。', '通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。在一定的程度上大大的提高了自己的动手动脑能力，由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。', '能够让我们自主独立完成实验操作。', '2013-12-20 15:59:03');
INSERT INTO `diaochabiao` VALUES ('0121011360128', '10', '9', '10', '9', '10', '9', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。', '希望实验设备好点。', '2013-12-20 16:00:43');
INSERT INTO `diaochabiao` VALUES ('0121011360123', '10', '9', '9', '10', '10', '10', '9', '可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。', '\n这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。', '希望学生能够自主完成任务。', '2013-12-20 16:03:13');
INSERT INTO `diaochabiao` VALUES ('0121011360124', '9', '10', '9', '9', '10', '10', '10', '自己写软件说明书，可以起到预习的作用，能够提前了解实验的软件硬件，和实验设备，在做实验的时候可以更快的更好的完成实验。\n', '\n这次过程控制实验，采用了全新的仪器设备。由于设备第一次使用，所以经常会遇到一些硬件问题，这些问题在课本里并没有讲过，有很多问题，并不能完全用PID调节来解决。比如说当响应曲线出现频繁波动时，很有可能是由于连接到压力表的水管中有气泡导致的。通过这次实验，我对过程控制的PID调节，串级控制和史密斯预估有了更深的了解。\n', '希望实验设备能更多一点！每个人都能参与', '2013-12-20 16:05:46');
INSERT INTO `diaochabiao` VALUES ('0121011360201', '10', '9', '10', '10', '10', '10', '10', '加深了对课本上的知识的理解', '实验工具复杂了许多', '没有', '2013-12-20 16:55:10');
INSERT INTO `diaochabiao` VALUES ('0121011360205', '10', '10', '9', '10', '10', '10', '10', '对理论知识有了进一步理解，受益匪浅', '实验设备操作结合实际，做起来得心应手', '老师多一些指导', '2013-12-20 16:58:39');
INSERT INTO `diaochabiao` VALUES ('0121011360217', '10', '9', '10', '10', '10', '10', '10', '对书本知识有了更深入的理解，收获很多', '实验过程更加复杂，对理论知识的要求更高', '增加设备，让同学有更多的动手机会', '2013-12-20 17:01:25');
INSERT INTO `diaochabiao` VALUES ('0121011360210', '10', '10', '10', '10', '9', '10', '10', '加深了对书本上理论知识的理解', '实验动手操作能力得到提高', '增加实验设备', '2013-12-20 17:03:14');
INSERT INTO `diaochabiao` VALUES ('0121011360228', '10', '10', '10', '9', '10', '10', '10', '对书本知识加深了理解掌握\n', '对动手能力要求更高', '实验内容可以更丰富', '2013-12-20 17:05:42');
INSERT INTO `diaochabiao` VALUES ('0121011360232', '10', '10', '10', '10', '9', '10', '10', '通过写软件说明书，深刻地理解了系统的构架，程序的流程。', '自己实际操作了水箱的运作过程，感觉很新奇，理解了过程控制的深刻含义。', '多建立几个实际的实验模型。', '2013-12-20 17:07:25');
INSERT INTO `diaochabiao` VALUES ('0121011360207', '10', '9', '10', '10', '10', '10', '10', '学到更多东西', '更注重动手能力', '实验设备有待更新', '2013-12-20 17:07:35');
INSERT INTO `diaochabiao` VALUES ('0121011360219', '10', '10', '10', '10', '10', '10', '10', '系统的编写说明书能更进一步熟悉软件细节，让我们对实验有更深的体会！', '这次实验的装置更大更真是，在现实环境下做实验，更好实现教学理解！', '希望能增加更多动手环节和设备数量，让更多的同学投入实验中去！', '2013-12-20 17:08:48');
INSERT INTO `diaochabiao` VALUES ('0121011360202', '10', '10', '10', '10', '10', '10', '10', '对软件的使用及理论知识有了更进一步的理解。', '这次实验让我们有了更强的动手能力，学到了更多东西，对书本上的知识有了更深的理解。', '实验组织很好，各个环节都很好。', '2013-12-20 17:10:22');
INSERT INTO `diaochabiao` VALUES ('0121011360233', '10', '9', '10', '10', '10', '10', '10', '感觉良好，通过实验将理论与实践联系在一起，活学活用，受益匪浅。', '这次实验充分利用理论知识，将理论融于实践，使我们收获颇丰，继续努力。', '希望实验可以使每个人都有动手的机会，从而获得更多的收获。', '2013-12-20 17:10:56');
INSERT INTO `diaochabiao` VALUES ('0121003921202', '10', '10', '10', '10', '9', '10', '10', '增强了对课本知识的理解，特别是一些平常注意不到的细节。', '加深了对实验原理的认识。', '增加更多的动手环节。', '2013-12-20 17:11:30');
INSERT INTO `diaochabiao` VALUES ('0121011360208', '10', '10', '9', '10', '9', '10', '10', '通过写软件说明书，了解了软件控制与硬件控制方法的异同，及特点。', '能够通过实验现象，更直观地了解到理论在实际中应用。', '实验内容可以更丰富些，试验现场对学生进行试验原理掌握测试。', '2013-12-20 17:12:21');
INSERT INTO `diaochabiao` VALUES ('0121011360223', '10', '10', '10', '10', '10', '10', '10', '学到了更多书本之外的知识。', '更加强调了动手能力的培养。', '增加实验内容的丰富性。', '2013-12-20 17:13:56');
INSERT INTO `diaochabiao` VALUES ('0121008270131', '10', '10', '10', '10', '9', '10', '10', '第一次写软件说明书，有点紧张，但是完成的过程中，自己有很多体会，对系统的流程有了更加深刻的理解。', '相比较于以往的系统，这次是我们第一次完整的看到一个系统，在实验的过程中，我们更加理解了书本和实际的区别，要更加注意生产中的很多问题。', '多加几个成套的系统，供学生练习。', '2013-12-20 17:14:58');
INSERT INTO `diaochabiao` VALUES ('0121011360221', '10', '10', '10', '9', '10', '10', '10', '收获良多，了解了相关的过程控制应用软件。', '这次实验内容更接近于实际。', '希望每个人都有单独演示实验的机会。', '2013-12-20 17:16:00');
INSERT INTO `diaochabiao` VALUES ('0121011360224', '10', '9', '10', '10', '10', '10', '10', '加深了对软件的了解和认识，巩固了课本知识，学到了许多知识。', '与以往相比，本次实验操作性更强，运用知识更深入，对所学知识进一步巩固。', '希望实验以后能更多的加强学生做实验得自主独立性，让我们通过实验学到更多。', '2013-12-20 17:18:20');
INSERT INTO `diaochabiao` VALUES ('0121011360231', '10', '9', '10', '10', '10', '10', '10', '通过写软件说明书，充分的了解了程序的流程，了解了实验的执行过程。', '这次试验与以往的试验不同，充分的锻炼了自己的动手能力，并充分理解了过程控制的原理。', '期望多家几台实验设备，每个人都有亲自操作的机会。', '2013-12-20 17:19:05');
INSERT INTO `diaochabiao` VALUES ('0121003920606', '10', '10', '9', '10', '10', '9', '10', '通过自己写软件说明书，提高了编写软件的能力，系统的学习编程方法。', '本次实验提高了动手能力，加深了对理论知识的理解运用。', '希望实验内容更丰富，有更多参与环节。使我们提高实践能力。', '2013-12-20 17:19:47');
INSERT INTO `diaochabiao` VALUES ('0121011360227', '10', '10', '10', '10', '10', '10', '10', '首次接触，很有创新意义。', '和以前的实验相比，更多的是软件控制，硬件控制较少。', '软硬件兼容，内容更丰富。。', '2013-12-20 17:19:51');
INSERT INTO `diaochabiao` VALUES ('0121011360209', '9', '10', '10', '10', '10', '10', '10', '通过写软件说明书，巩固了理论知识，收获良多。\n', '通过自己动手操作，不仅将理论知识运用到实际上，而且锻炼了动手能力。', '希望能丰富实验内容，加强实验考核。', '2013-12-20 17:21:04');
INSERT INTO `diaochabiao` VALUES ('0121011360211', '10', '9', '9', '10', '9', '10', '10', '提高了本人编写程序，分析程序的能力，加强了我将实践转化为理论的能力。', '老师更加细心指导学生，并且有了以前实验的基础，这次我能够更加熟练、准确、独立的完成实验了。', '现在就很不错，继续保持。', '2013-12-20 17:22:13');
INSERT INTO `diaochabiao` VALUES ('0121010340317', '9', '9', '8', '10', '9', '10', '10', '通过自己写软件说明书，我对于软件以及整个系统的原理有了更为深刻地了解，做实验的收获更为丰富。', '这次做实验能够亲自操作实验设备，对于书本的知识有了更多的了解，对于前馈、串级系统等有了更深刻地认识。', '希望下学期可以多一些实验设备，然后老师的指导能够更为全面一些。最好能在实验前给我们发实验指导书。', '2013-12-20 17:22:13');
INSERT INTO `diaochabiao` VALUES ('0121011360213', '10', '10', '10', '10', '10', '10', '10', '通过自己写软件说明书，对实验的过程和软件的使用有了更为深刻的认识，能够让自己的知识更为扎实。', '这次实验主要在于对于水箱的观察，通过对软件的改变，实现稳态。在于对整个过程的理解。', '能够增加实验的次数，增强自己对课程的理解与认识。', '2013-12-20 17:23:30');
INSERT INTO `diaochabiao` VALUES ('0121011360206', '10', '9', '9', '10', '10', '10', '10', '加强了自己对一些软件的了解与运用，学会了很多知识。', '和以前的实验一样在设备方面 有所不足，但是实验指导老师通过分组让每个人都有实验的机会。        ', '希望在考核方面更加严格。', '2013-12-20 17:23:38');
INSERT INTO `diaochabiao` VALUES ('0121009330209', '9', '10', '9', '10', '10', '10', '10', '通过自己写软件说明书，锻炼了自己的独立思考的能力', '实验过程带有较大的不确定性，主要靠自己探索', '对这次实验比较满意', '2013-12-20 17:25:07');
INSERT INTO `diaochabiao` VALUES ('0121011360203', '10', '10', '9', '9', '10', '10', '10', '通过写软件说明书，了解了相关软件的一些性质功能。', '设备少，讲解不详细，都不了解。', '增加设备，丰富内容。', '2013-12-20 17:26:42');
INSERT INTO `diaochabiao` VALUES ('0121011360220', '9', '10', '9', '10', '10', '0', '10', '自己动手写软件说明书对自己的专业知识增长很受帮助。', '感觉过程控制实验与其他实验不同，能学到很多其他学科学不到的东西，有很多收获。', '希望能多加几台实验设备，每个同学都能够参与实验。', '2013-12-20 17:27:02');
INSERT INTO `diaochabiao` VALUES ('0121011360215', '10', '10', '10', '8', '10', '10', '10', '在写说明书的时候，能够了解实验设备，了解相关的公司，了解实验要做什么，对实验的顺利进行帮助很大，收获了很多相关知识。', '实验以小组的形式进行，实验之前大家能讨论实验原理，实验过程中相互分工，提高了实验效率，也提高了实验的成功率，效果很好。', '实验设备有点少，有的同学都没有参与。', '2013-12-20 17:28:54');
INSERT INTO `diaochabiao` VALUES ('0121011360222', '10', '9', '10', '10', '10', '10', '10', '通过写软件说明书，让我了解了软件说明书的书写与原理。', '这次试验更加注重实际操作并与软件和计算机控制联系起来，通过模拟和实际相结合，实验更加直观。', '希望实验能够更加详尽，让学生深入了解实验原理。', '2013-12-20 17:30:21');
INSERT INTO `diaochabiao` VALUES ('0121011360214', '10', '10', '10', '10', '10', '10', '10', '编写软件说明书的还是一个比较复杂的过程，需要考虑软件要实现的一些功能，对个人的能力有很大的锻炼的作用。', '相同的地方就是我们还是需要对实验的原理做一个充分的了解，必要的准备工作是必须的。不同的地方就是这个实验是我们第一次接触，以前的实验都是关于电学的。', '增加考核环节。', '2013-12-20 17:34:08');
INSERT INTO `diaochabiao` VALUES ('0121011360314', '8', '8', '9', '8', '9', '9', '9', '通过自己查阅各元器件的使用说明书，使自己对实验中要用到的设备有了个大致的了解，在实验中能够更加快速高效的完成实验，而且实验之前查阅和实验之中的实际操作结合，就能更好的理解各设备的工作原理及方式。', '此次实验我们以5人小组的形式合作完成，在实验之前的查阅报告及实验时的分工合作使我们做实验更加高效，也切身感受到了团队合作的作用。', '因为是5人小组，所以到了实验的时候，因为实验室实验仪器有限，所以没办法让每个组员都动手操作，更多的时候是由组长操作，组员配合计算参数，所以我们动手的机会不多，或许我们每个人都没操作一次的话会取得更好的实验效果。', '2013-12-20 19:22:11');
INSERT INTO `diaochabiao` VALUES ('0121011360317', '8', '9', '10', '8', '9', '8', '9', '通过自己书写软件说明书加深了自身对一些软件、元器件的认识，同时对其使用方法及使用环境能够有相对清楚的认识，这对接下来的实验过程很有帮助，比起毫无准备的去做实验要有效率的多', '第一，本次实验比之其他实验更加注重实验前的准备工作，不至于在首次接触新设备时手足无措\n第二，本次实验以小组成员为五名，不多不少，不至于出现划水的也不至于无法完成实验\n第三，本次实验更加注重小组成员自己动手能力，而不是根据老师的演示生搬硬套', '首先是实验设备的不足，每次实验几乎都要等一个小时以上，效率不高；其次是实验设备的性能不好，我所在小组的两次实验都出现了设备故障的问题', '2013-12-20 19:25:53');
INSERT INTO `diaochabiao` VALUES ('0121011360316', '10', '10', '10', '8', '8', '10', '8', '在实验前查阅设备的相关信息是很有必要的，可以熟悉设备的各个参数和性能，对即将要接触的设备有基本的了解，心中有数，做实验自然信心百倍，流畅而高效。', '这次做实验我作为组长在电脑上进行操作，记忆深刻的是当时调PID参数，一边调这三个参数一边能看到他们对系统的影响，然后再根据曲线变化继续改变参数，直到系统满足要求为止。这次是很深刻的感受到PID的作用，对各个参数的作用从真实实验的角度进行了理解，印象很深刻。我对自动控制也有了更大的兴趣和继续深入学习的愿望。', '希望设备能多一些，让每个同学都能亲自动手去做，去体会这个控制的过程，感受自控的魅力。总体感觉这次过控实验很好，收获颇丰。', '2013-12-20 19:30:37');
INSERT INTO `diaochabiao` VALUES ('0121011360311', '7', '9', '8', '9', '6', '8', '8', '可以巩固自己的理论知识，加深对知识点的理解，提高动手能力。', '都是理论与实践的结合，提高自己的能力，加强知识的理解。', '希望对实验内容做详细的讲解，提高自己对实验的认知能力，指导自己操作，以提高动手能力。', '2013-12-20 19:31:39');
INSERT INTO `diaochabiao` VALUES ('0121011360313', '10', '10', '9', '10', '8', '8', '10', '感觉到自己专业知识仍然有相当大的欠缺，在写的过程中查阅了大量的资料，感觉收获也是相当的大，是一次感觉相当不错的体验，对自己帮助也蛮多。', '亲自操作机器，并在老师的帮助下调整参数，有相当大的自由空间，对提高自身的能力有很大帮助。在操作中会遇到各种各样的情况，应变能力相当重要。', '仪器太少了，希望能够有更多的人参与实验。', '2013-12-20 19:32:47');
INSERT INTO `diaochabiao` VALUES ('0121011360305', '10', '9', '9', '10', '10', '10', '10', '增强了收集信息的能力，发散了自己的思维，拓展了我们的视野！', '感觉方式独特，受益良多！', '我觉得应该进一步提升自己的动手能力！', '2013-12-20 19:56:05');
INSERT INTO `diaochabiao` VALUES ('0121011360306', '10', '10', '10', '9', '9', '10', '10', '对软件的有了更深刻的理解,对学习有极大帮助', '同学之间团结协作能力较好 ,收益很大！', '希望动手能力能更上一层楼！', '2013-12-20 19:58:27');
INSERT INTO `diaochabiao` VALUES ('0121011360308', '10', '9', '10', '10', '10', '10', '9', '感觉对过程控制的实验设备越来越了解，对实验中很有帮助。', '感到在动手过程中能够学到很多知识。', '期望以后实验设备出现故障能够自己调试好。', '2013-12-20 19:59:25');
INSERT INTO `diaochabiao` VALUES ('0121011360309', '10', '10', '10', '10', '10', '10', '10', '软件说明书给出参考参数有利于实验的进行。', '动手能力得到提升，加强书面知识的理解。', '多增加动手环节', '2013-12-20 20:02:00');
INSERT INTO `diaochabiao` VALUES ('0121010680317', '10', '10', '10', '10', '10', '10', '10', '自己之前对相关软件了解不够，通过自己写软件说明书，有很多收获', '这次实验是通过小组查阅资料准备，能够更好地了解实验原理和步骤', '希望以后多开展这样的实验，增强我们的动手能力', '2013-12-20 20:04:30');
INSERT INTO `diaochabiao` VALUES ('0121011360303', '10', '10', '10', '10', '9', '10', '10', '自己写软件锻炼了思维，帮助了理解，很有意义', '这次实验对动手能力要求更好高，更好地提高了实践能力', '希望实验有更多的讨论实践环节', '2013-12-20 20:04:59');
INSERT INTO `diaochabiao` VALUES ('0121011360307', '9', '9', '10', '10', '10', '10', '10', ' 增强了自己的理论知识', '   增强了自己的 动手能力，与实际调PID的能力', '   希望 有更多的实验 丰富理论知识', '2013-12-20 20:06:13');
INSERT INTO `diaochabiao` VALUES ('0121011360302', '10', '10', '10', '9', '10', '10', '10', '增加了自己的知识，提高了收集能力。', '实验形式新颖，可以很好地回顾知识。', '希望有更多机会自己亲自操作。', '2013-12-20 20:08:15');
INSERT INTO `diaochabiao` VALUES ('0121011360301', '10', '9', '10', '10', '10', '10', '10', '换个角度来做实验，加深了对实验知识的认识，是知识更加系统。', '实验形式更加新颖，认识更深刻。', '多做几次实验更好', '2013-12-20 20:11:21');
INSERT INTO `diaochabiao` VALUES ('0121011360323', '10', '10', '10', '10', '10', '10', '9', '对软件的使用更加的清楚和更加深刻的认识。', '本次试验的形式更加的新颖，内容更加的丰富。', '希望以后能够增加一些可以自己动手设计的设计性实验，', '2013-12-20 20:14:39');
INSERT INTO `diaochabiao` VALUES ('0121011360321', '9', '9', '10', '10', '9', '9', '10', '可以帮助自己在实验前做好准备，让自己对实验设备有了解，也可以帮助自己养成良好的习惯', '自己独立思考的机会更多了，学习到的内容也更多', '多些实验设备从而多些实际动手的机会！', '2013-12-20 20:17:31');
INSERT INTO `diaochabiao` VALUES ('0121011360322', '8', '9', '7', '8', '8', '9', '8', '让自己真正的了解了该软件的应用方法和适用范围，让自己真正的学会使用这个软件。', '这次实验的过程更加直观，可以观察到实验过程的变化。', '希望有更多的动手机会，更加了解实验过程和原理。', '2013-12-20 20:18:49');
INSERT INTO `diaochabiao` VALUES ('0121011360310', '9', '9', '10', '10', '10', '10', '9', '对软件有了透彻的认识', '自己参与了更多', '多来几次实验', '2013-12-20 20:21:57');
INSERT INTO `diaochabiao` VALUES ('0121011360328', '9', '9', '8', '7', '8', '8', '9', '加强对软件的理解，加深对实验的认识和对理论知识的掌握。', '更直观的认识的用软件仪器了解实验内容和理论知识。', '希望让每个学生都能亲自动手实验操作。', '2013-12-20 20:23:10');
INSERT INTO `diaochabiao` VALUES ('0121011360320', '10', '10', '10', '10', '10', '10', '10', '本次编写软件，让我收获很多，不仅验证了自己的所学，而且亲身体验了一次编写过程。', '这次实验不仅包含了其他实验的内容，而且还让我们自己独立设计和编程，收益良多。', '实验内容和样式更加多一些。', '2013-12-20 20:23:45');
INSERT INTO `diaochabiao` VALUES ('0121011360105', '10', '10', '10', '10', '10', '10', '10', '对软件有了透彻的认识', '自己有独立思考了实验问题', '实验次数较少', '2013-12-20 20:24:54');
INSERT INTO `diaochabiao` VALUES ('0121015940104', '10', '10', '10', '9', '10', '10', '9', '通过对软件书的编写，使我们对理论知识的应用有了更加深刻的了解和更灵活的运用。', '对仪器和实验内容有了更直观的了解。', '希望能让每个同学都能有操作的机会，这样才能使每个同学都能对实验有更深刻的理解。', '2013-12-20 20:25:57');
INSERT INTO `diaochabiao` VALUES ('0121011360319', '10', '10', '10', '9', '10', '10', '10', '软件说明书简单直接明朗，让人收获很多', '此次实验简捷明了直观，对我们有很大的帮助', '增加一些更有趣味的内容，让实验更加有趣', '2013-12-20 20:25:57');
INSERT INTO `diaochabiao` VALUES ('0121011360122', '10', '10', '10', '10', '10', '10', '10', '对软件有了透彻的认识', '自己有了对实验的独立思考', '实验次数较少', '2013-12-20 20:27:23');
INSERT INTO `diaochabiao` VALUES ('0121011360324', '10', '9', '10', '10', '10', '10', '10', '软件说明书简单直接明朗，让人收获很多', '此次实验简捷明了直观，对我们有很大的帮助', '增加一些更有趣味的内容，让实验更加有趣', '2013-12-20 20:27:27');
INSERT INTO `diaochabiao` VALUES ('0121011360326', '9', '10', '9', '8', '9', '10', '9', '加强对软件的理解，加深对实验的认识和对理论知识的掌握。', '更直观地认识到实验过程，更容易掌握所运用的知识。', '希望每位同学都能亲自动手操作实验。', '2013-12-20 20:28:02');
INSERT INTO `diaochabiao` VALUES ('0121011360325', '10', '10', '10', '10', '10', '10', '9', '经过这次说明书编写，我收获很多，不仅验证了自己的所学，而且让我得到了亲身动手的机会。', '这次实验更多的将重点放在了让学生自己独立设计和编写。', '实验内容更丰富，更有趣，样式更多样', '2013-12-20 20:28:52');
INSERT INTO `diaochabiao` VALUES ('0121014450320', '10', '10', '9', '10', '10', '10', '10', '软件说明书简单直接明朗，让人收获很多', '此次实验简捷明了直观，对我们有很大的帮助', '增加一些更有趣味的内容，让实验更加有趣', '2013-12-20 20:28:55');
INSERT INTO `diaochabiao` VALUES ('0121011360329', '10', '10', '10', '9', '10', '9', '10', '对软件有了更深入了解', '更直观感受到实验的成果', '增强个人的动手时间', '2013-12-20 20:30:14');
INSERT INTO `diaochabiao` VALUES ('0121011360318', '9', '10', '10', '10', '10', '10', '10', '加强对软件的理解，加深对实验的认识和对理论知识的掌握。\n增强了归纳总结能力\n', '更直观地认识到实验过程，更容易掌握所运用的知识。\n团队合作，更有效果。', '希望每位同学都能亲自动手操作实验。希望能多一点实验种类', '2013-12-20 20:30:39');
INSERT INTO `diaochabiao` VALUES ('0121011360304', '10', '10', '10', '10', '10', '10', '9', '对理论知识有了更深刻的了解和更灵活的应用。', '对实验内容有更深刻的了解和认识。', '希望能让每个同学都能有操作的机会。', '2013-12-20 20:30:41');
INSERT INTO `diaochabiao` VALUES ('0121011360327', '6', '5', '6', '6', '5', '6', '6', '己对验过程有更深的了解可', '以自己调节参数。', '设备的性能更稳定些就更好。 ', '2013-12-20 20:50:19');
INSERT INTO `diaochabiao` VALUES ('0121013640102', '7', '10', '7', '10', '10', '8', '7', '对实验仪器和内容有了进一步的了解.', '实验器材出现问题,自行无法解决,必须通过老师帮助才能修复问题.导致实验时间超过预期时间.', '希望每个人都有动手操作的机会.', '2013-12-20 21:18:04');
INSERT INTO `diaochabiao` VALUES ('111111', '1', '3', '5', '4', '5', '6', '10', '', '', '', '2014-11-19 10:46:52');
INSERT INTO `diaochabiao` VALUES ('0121111360123', '8', '8', '8', '8', '10', '8', '8', '对其有了更深刻的记忆，对做实验有着很大的帮助', '自己对实验的参与度有着显著的增加，在调试过程中，对平时所学的理论知识有了一个很好复习与巩固', '可以有更多的时间完成实验，增加设备，减少每组的人数，让同学们更加积极的参与到实验中', '2014-11-23 06:26:19');
INSERT INTO `diaochabiao` VALUES ('0121111360215', '7', '9', '10', '7', '8', '9', '8', '让我对这个软件有了一个更好的认识，印象更加深刻，而且对说明书的排版有了一个较好的认识', '相同的是这次试验依然是以小组为单位进行的，实验前需要好好预习才能做好实验\n\n不同的是本次试验把理论与实践联系的更加紧密，对动手能力要求更高', '希望以后能把实验设备改善一下', '2014-11-23 06:27:13');
INSERT INTO `diaochabiao` VALUES ('0121111360102', '10', '10', '10', '10', '9', '10', '9', '通过本实验，我了解到了软件的具体应用，加深了对实验的印象，更加有利于实验的进行！', '本次实验以小组进行，每个人都有机会上手，使得每个人都对本实验有了更加感性的认识！也对本课程有了更加实际的认识，巩固了书本知识！', '我希望本实验今后可以有更加全面的实验设备！', '2014-11-23 06:34:03');
INSERT INTO `diaochabiao` VALUES ('0121111360103', '5', '10', '10', '10', '4', '10', '10', '', '这次做实验我们能够真正接触到一个与专业关联性比较大的系统中来，使我们对自己的专业有了更好的认识，从而对将来的工作学习有很大的帮助。', '应该多增添设备，使更多的同学能参与到专业的实验中来，而不是只有一个或两个的操作员，而其他的同学则只是在旁边看着。', '2014-11-23 06:43:01');
INSERT INTO `diaochabiao` VALUES ('0121111360202', '9', '9', '10', '9', '9', '9', '10', '字太多 写的累', '感觉还好 ', '这样就可以 ', '2014-11-23 06:55:57');
INSERT INTO `diaochabiao` VALUES ('0121111360223', '9', '8', '9', '8', '9', '8', '10', '没啥感觉', '差不多', '继续努力', '2014-11-23 06:57:50');
INSERT INTO `diaochabiao` VALUES ('0121111360207', '8', '8', '9', '10', '8', '9', '10', '感受不错', '还可以撒', '就这样吧', '2014-11-23 06:59:26');
INSERT INTO `diaochabiao` VALUES ('0121111360101', '10', '10', '8', '9', '8', '8', '9', '感受不深。', '人数太多，时间太短，不能都参与，实验效果不是很好。', '希望能增加一些实验设备，每个小组少一些人，保证每个人都能充分参与。', '2014-11-23 07:04:46');
INSERT INTO `diaochabiao` VALUES ('0121111360128', '7', '8', '8', '7', '10', '9', '9', '', '', '', '2014-11-23 07:23:15');
INSERT INTO `diaochabiao` VALUES ('0121111360201', '9', '7', '8', '8', '9', '8', '7', '学到了很多东西', '和同学共同完成实验，很好', '最好再多学点在课本上学不到的', '2014-11-23 07:26:30');
INSERT INTO `diaochabiao` VALUES ('0121111360122', '9', '8', '8', '8', '8', '8', '9', '能够加深理解，熟悉操作，受益匪浅。', '自己动手，现场调试，加深了对专业知识的理解，收获颇丰。', '希望能够有更多动手机会，获得更多调试经验。', '2014-11-23 07:35:57');
INSERT INTO `diaochabiao` VALUES ('0121111360602', '10', '10', '10', '9', '6', '8', '6', '写软件说明书感到学到了很多', '在网上预约，形式很新颖', '实验很好，很满意，希望能在内容更加丰富一点', '2014-11-23 07:48:47');
INSERT INTO `diaochabiao` VALUES ('0121111360213', '8', '8', '9', '8', '8', '9', '9', '一.注重逻辑性、条理性会让整个说明书更加专业也更具可读性\n二.写说明书前应充分熟悉相关专业器件与原理\n三.软件说明书不仅仅体现相关技能与知识，更注重归纳总结、将所学所悟记录下来', '    首先是由研究生学长学姐带领我们做相关实验，有一种相互交流、共同探讨别开生面的感觉；其次，实验前，让我们先观看相关视频，让我们在在宏观上对相关实验有了一个比较清晰的认识；实验过程比较严谨，达到相关数据指标才算通过，让我们体验到了实验乃至科研的严谨的科学态度。', '希望课后会有一些相关的总结、探讨、解答环节，甚至感兴趣的同学可以组建相关兴趣小组，老师寄语一定帮助，相信一定会取得较好的成果与收获。', '2014-11-23 18:22:36');
INSERT INTO `diaochabiao` VALUES ('0121111360315', '8', '10', '5', '8', '7', '8', '7', '不会写，', '更加强调团队，强调预习', '更多设备，更多动手机会', '2014-11-27 13:14:44');
INSERT INTO `diaochabiao` VALUES ('0121111360301', '6', '9', '8', '7', '9', '10', '9', '感觉很难，不过有收获', '更强调自主动手能力。', '实验还可以多具体一些，多开展一些', '2014-11-27 17:20:49');
INSERT INTO `diaochabiao` VALUES ('0121111360302', '6', '7', '10', '1', '8', '6', '4', '有点难度，但是还是比较复杂，能锻炼能力', '', '多做一些', '2014-11-27 17:53:02');
INSERT INTO `diaochabiao` VALUES ('0121111360311', '2', '4', '7', '5', '3', '5', '5', '没有写过，不过感觉很难，可以尝试', '没有什么特别感觉，不过实验系统还是比较符合工程实际', '可以多安排一下实验', '2014-11-27 17:55:27');
INSERT INTO `diaochabiao` VALUES ('0121111360312', '4', '6', '8', '8', '8', '9', '5', '', '', '', '2014-11-27 18:10:10');
INSERT INTO `diaochabiao` VALUES ('0121111360314', '6', '8', '5', '9', '10', '7', '5', '收获很大', '很不错，强调动手能力', '多让学生探索', '2014-11-27 18:12:07');
INSERT INTO `diaochabiao` VALUES ('0121111360316', '5', '7', '10', '5', '8', '7', '5', '有难度，', '没有太大感觉', '多开展', '2014-11-27 18:16:22');
INSERT INTO `diaochabiao` VALUES ('0121111360317', '2', '5', '5', '4', '5', '6', '5', '有难度', '没什么不同', '需要增加实验时间', '2014-11-27 18:18:16');
INSERT INTO `diaochabiao` VALUES ('0121111360401', '5', '7', '9', '7', '8', '10', '5', '', '', '', '2014-11-27 18:20:33');
INSERT INTO `diaochabiao` VALUES ('0121111360406', '4', '2', '5', '8', '6', '7', '7', '没写过，不过感觉挺难，', '实验内容不错，但是效果没太大差别', '可以一边上课，一边实验，没必要全集中到最后', '2014-11-27 18:22:29');
INSERT INTO `diaochabiao` VALUES ('0121111360407', '4', '9', '6', '6', '8', '7', '7', '考虑不是很周到，漏洞多，', '接触到一个完整系统，挺新颖', '多开展类似的实验，实验时间也可以多安排', '2014-11-27 18:24:20');
INSERT INTO `diaochabiao` VALUES ('0121111360413', '5', '8', '8', '8', '8', '6', '10', '没有感觉', '没太大差别', '实验应该多关注，要求更严一些', '2014-11-27 18:26:34');
INSERT INTO `diaochabiao` VALUES ('0121111360414', '5', '8', '5', '2', '5', '7', '6', '没写过', '没有什么不同，实验平台很好，但是效果一般', '普遍重视程度不够，容易混', '2014-11-27 18:28:06');
INSERT INTO `diaochabiao` VALUES ('0121111360430', '6', '9', '7', '5', '7', '7', '7', '', '', '', '2014-11-27 18:28:41');
INSERT INTO `diaochabiao` VALUES ('0121111360502', '2', '8', '5', '9', '6', '8', '6', '没尝试过，', '效果一般', '多注重内容，提高成绩比例', '2014-11-27 18:30:08');
INSERT INTO `diaochabiao` VALUES ('0121111360521', '4', '9', '9', '9', '9', '9', '9', '', '还好，一个完整系统，学到了一些东西', '可以增加时间', '2014-11-27 18:31:41');
INSERT INTO `diaochabiao` VALUES ('0121111360522', '5', '9', '5', '8', '4', '10', '5', '', '', '', '2014-11-27 18:32:25');
INSERT INTO `diaochabiao` VALUES ('0121111360524', '6', '10', '10', '9', '10', '10', '10', '', '', '需要加强实验前自主学习', '2014-11-27 18:33:23');
INSERT INTO `diaochabiao` VALUES ('0121111360527', '4', '9', '8', '8', '7', '8', '9', '', '', '', '2014-11-27 18:34:03');
INSERT INTO `diaochabiao` VALUES ('0121111360531', '7', '7', '9', '8', '10', '10', '7', '', '', '', '2014-11-27 18:34:39');
INSERT INTO `diaochabiao` VALUES ('0121111360534', '4', '9', '5', '9', '6', '8', '9', '没试过', '还好，讲的挺仔细，学到一些', '多安排时间', '2014-11-27 18:36:05');
INSERT INTO `diaochabiao` VALUES ('0121111360701', '5', '9', '8', '7', '8', '8', '9', '', '', '', '2014-11-27 18:36:40');
INSERT INTO `diaochabiao` VALUES ('0121111360706', '8', '7', '6', '7', '4', '8', '9', '', '', '', '2014-11-27 18:37:12');
INSERT INTO `diaochabiao` VALUES ('0121111360710', '4', '6', '6', '7', '8', '7', '6', '', '一般', '多加强效果', '2014-11-27 18:39:43');
INSERT INTO `diaochabiao` VALUES ('0121111360711', '5', '9', '6', '8', '8', '8', '7', '', '', '', '2014-11-27 18:40:18');
INSERT INTO `diaochabiao` VALUES ('0121111360712', '5', '7', '9', '8', '6', '6', '6', '', '', '', '2014-11-27 18:40:51');
INSERT INTO `diaochabiao` VALUES ('0121111360713', '7', '6', '7', '8', '4', '7', '9', '', '', '', '2014-11-27 18:41:19');
INSERT INTO `diaochabiao` VALUES ('0121111360731', '4', '8', '6', '8', '6', '7', '7', '', '还好，有收获', '', '2014-11-27 18:42:11');
INSERT INTO `diaochabiao` VALUES ('0121111360732', '4', '6', '10', '10', '10', '10', '10', '收获不少', '一般，不过接触了一个完整系统', '多深入，多鼓励探索', '2014-11-27 18:43:36');
INSERT INTO `diaochabiao` VALUES ('0121111360735', '2', '7', '6', '8', '7', '6', '9', '', '', '', '2014-11-27 18:44:08');

-- ----------------------------
-- Table structure for `equipmentinf`
-- ----------------------------
DROP TABLE IF EXISTS `equipmentinf`;
CREATE TABLE `equipmentinf` (
  `deviceid` varchar(20) NOT NULL DEFAULT '' COMMENT '设备编号',
  `experimentid` varchar(20) DEFAULT NULL COMMENT '该设备可以进行的实验内容',
  `experimentname` varchar(50) DEFAULT NULL COMMENT '验内容实名称',
  `status` varchar(20) DEFAULT NULL COMMENT '备设开放使用或禁止使用',
  `condition` varchar(20) DEFAULT NULL COMMENT '备设运行正常或损坏',
  `openTime` varchar(20) DEFAULT NULL COMMENT '备设开放使用时间',
  `closeTime` varchar(20) DEFAULT NULL COMMENT '备设结束使用时间',
  `chargeman` varchar(20) DEFAULT NULL COMMENT '备设负责人',
  PRIMARY KEY (`deviceid`),
  KEY `deviceid` (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipmentinf
-- ----------------------------

-- ----------------------------
-- Table structure for `equipmentinf1`
-- ----------------------------
DROP TABLE IF EXISTS `equipmentinf1`;
CREATE TABLE `equipmentinf1` (
  `deviceid` varchar(20) NOT NULL DEFAULT '',
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipmentinf1
-- ----------------------------
INSERT INTO `equipmentinf1` VALUES ('设备1', '1');
INSERT INTO `equipmentinf1` VALUES ('设备2', '0');
INSERT INTO `equipmentinf1` VALUES ('设备3', '0');
INSERT INTO `equipmentinf1` VALUES ('设备4', '1');

-- ----------------------------
-- Table structure for `experimentinf`
-- ----------------------------
DROP TABLE IF EXISTS `experimentinf`;
CREATE TABLE `experimentinf` (
  `experimentid` varchar(20) NOT NULL COMMENT '实验编号',
  `experimentname` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '开放或禁止该实验',
  `openTime` varchar(20) DEFAULT NULL COMMENT '验实开放时间',
  `closeTime` varchar(20) DEFAULT NULL COMMENT '验实结束时间',
  `source` varchar(50) DEFAULT NULL COMMENT '该实验是来源于哪一学科（如过程控制或微机原理）',
  `teachername` varchar(20) DEFAULT NULL COMMENT '课老师任',
  `describe` varchar(255) DEFAULT NULL COMMENT '验实描述',
  PRIMARY KEY (`experimentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of experimentinf
-- ----------------------------

-- ----------------------------
-- Table structure for `groupinf`
-- ----------------------------
DROP TABLE IF EXISTS `groupinf`;
CREATE TABLE `groupinf` (
  `shiyan` varchar(25) DEFAULT NULL,
  `group_id` int(10) DEFAULT NULL,
  `stu_id` varchar(25) DEFAULT NULL,
  `stu_name` varchar(25) DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  `shiyan_date` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `equipment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupinf
-- ----------------------------
INSERT INTO `groupinf` VALUES ('guokong_shangshuixiang', '1', '13', '傅剑老师', '2015-11-15 11:03:13', '2015-11-20', '08:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '2', '13', '傅剑老师', '2015-11-15 13:38:03', '2015-11-20', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '3', '13', '傅剑老师', '2015-11-15 13:38:11', '2015-11-20', '14:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '4', '13', '傅剑老师', '2015-11-15 13:38:09', '2015-11-20', '16:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shangshuixiang', '1', '0121111360101', '李明闻', '2015-11-13 16:53:05', '2015-11-20', '08:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '2', '0121111360101', '李明闻', '2015-11-11 19:12:28', '2015-11-20', '10:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '3', '0121111360101', '李明闻', '2015-11-11 19:12:36', '2015-11-20', '14:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '4', '0121111360101', '李明闻', '2015-11-11 19:12:44', '2015-11-20', '16:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_shangshuixiang', '1', '0121111360122', '杜路遥', '2015-11-13 19:12:56', '2015-11-20', '08:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '5', '0121111360122', '杜路遥', '2015-11-13 19:12:53', '2015-11-21', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '5', '13', '傅剑老师', '2015-11-13 19:13:24', '2015-11-21', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '3', '0121111360122', '杜路遥', '2015-11-13 19:12:50', '2015-11-20', '14:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '6', '0121111360122', '杜路遥', '2015-11-13 19:12:47', '2015-11-20', '18:30', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '6', '13', '傅剑老师', '2015-11-25 14:59:14', '2015-11-20', '18:30', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shangshuixiang', '1', '0121111360231', '肖瑶', '2015-11-11 19:16:26', '2015-11-20', '08:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '7', '0121111360231', '肖瑶', '2015-11-11 19:15:36', '2015-11-22', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '7', '13', '傅剑老师', '2015-11-15 13:38:13', '2015-11-22', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '3', '0121111360231', '肖瑶', '2015-11-11 19:15:42', '2015-11-20', '14:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '4', '0121111360231', '肖瑶', '2015-11-11 19:15:49', '2015-11-20', '16:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shangshuixiang', '1', '0121111360317', '周晓奇', '2015-11-11 19:20:26', '2015-11-20', '08:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '2', '0121111360317', '周晓奇', '2015-11-11 19:20:26', '2015-11-20', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '3', '0121111360317', '周晓奇', '2015-11-11 19:20:26', '2015-11-20', '14:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '4', '0121111360317', '周晓奇', '2015-11-11 19:20:26', '2015-11-20', '16:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_shangshuixiang', '1', '0121111360712', '胡亚清', '2015-11-11 19:22:46', '2015-11-20', '08:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '5', '0121111360712', '胡亚清', '2015-11-11 19:23:07', '2015-11-21', '10:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '3', '0121111360712', '胡亚清', '2015-11-11 19:22:43', '2015-11-20', '14:00', '设备4');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '4', '0121111360712', '胡亚清', '2015-11-11 19:22:40', '2015-11-20', '16:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '8', '0121017550524', '黄莹莹', '2015-11-19 16:40:25', '2015-11-24', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_danbihuan', '8', '13', '傅剑老师', '2015-11-19 16:32:18', '2015-11-24', '10:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '9', '0121017550524', '黄莹莹', '2015-11-19 16:52:03', '2015-11-21', '14:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_chuanjikongzhi', '9', '13', '傅剑老师', '2015-11-19 16:52:03', '2015-11-21', '14:00', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '10', '0121017550524', '黄莹莹', '2015-11-19 16:56:10', '2015-11-21', '18:30', '设备1');
INSERT INTO `groupinf` VALUES ('guokong_shimisi', '10', '13', '傅剑老师', '2015-11-19 16:55:25', '2015-11-21', '18:30', '设备1');

-- ----------------------------
-- Table structure for `group_chat_inf`
-- ----------------------------
DROP TABLE IF EXISTS `group_chat_inf`;
CREATE TABLE `group_chat_inf` (
  `student_group` varchar(25) NOT NULL,
  `userid` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `message` varchar(25) DEFAULT NULL,
  `message_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_chat_inf
-- ----------------------------
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'qunliao上的夫为恶', '2015-10-20 10:20:35');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'qunliao是东方人', '2015-10-20 10:21:07');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'qunliao巍峨高耸风格', '2015-10-20 10:21:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'qunliao公司都会受到', '2015-10-20 10:21:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 10:59:35');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 10:59:35');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:00:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:00:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:01:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:01:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'qunliao辐射的', '2015-10-20 11:03:37');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:03:55');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:03:55');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '瓦尔登时', '2015-10-20 11:07:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '塞得港省', '2015-10-20 11:07:44');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:07:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '受到更多更好', '2015-10-20 11:12:10');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '上的夫为恶', '2015-10-20 11:17:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '时代光华', '2015-10-20 11:17:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '塞得港省的', '2015-10-20 11:17:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '时代光华 ', '2015-10-20 11:19:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '问阿嚏', '2015-10-20 11:19:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '说的话', '2015-10-20 11:20:21');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:24:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:26:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '说的个人观点符合', '2015-10-20 11:26:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '塞得港省的', '2015-10-20 11:26:43');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '发塞得港省的斯蒂芬', '2015-10-20 11:26:50');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '塞得港省的', '2015-10-20 11:26:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:26:53');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 11:26:55');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '山豆根山豆根', '2015-10-20 13:37:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '感受到分', '2015-10-20 13:37:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 13:38:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '斯蒂芬', '2015-10-20 14:43:58');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '斯蒂芬我', '2015-10-20 14:44:00');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '公司夫为恶', '2015-10-20 14:44:02');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '三代富贵和', '2015-10-20 15:12:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '说的话告诉对方', '2015-10-20 15:12:21');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '斯蒂芬', '2015-10-20 15:13:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '万恶个', '2015-10-20 15:13:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:17:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '宋登高', '2015-10-20 15:17:21');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:17:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '塞得港省的', '2015-10-20 15:17:35');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:19:58');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:20:01');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '上的广告', '2015-10-20 15:20:18');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '广告', '2015-10-20 15:20:19');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '斯蒂芬', '2015-10-20 15:20:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '额外上的', '2015-10-20 15:20:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:21:17');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:21:20');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:21:22');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 15:21:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '啊啊事实上顶顶', '2015-10-20 16:05:00');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '公司的方式的', '2015-10-20 16:05:02');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 16:05:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '的说法发个好点的', '2015-10-20 19:08:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '额头为首的', '2015-10-20 19:08:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '圣诞狗狗', '2015-10-20 19:08:44');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '我去饿的时光隧道', '2015-10-20 19:08:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '士大夫山豆根撒旦', '2015-10-20 19:08:59');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '撒旦发射点', '2015-10-20 19:09:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '山豆根', '2015-10-20 19:09:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '收到公司的', '2015-10-20 19:09:43');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '睡的正香', '2015-10-20 19:09:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:11:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:11:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '是非得失', '2015-10-20 19:11:43');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '收到公司的', '2015-10-20 19:12:07');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360102', '伍浩', '山豆根士大夫', '2015-10-20 19:13:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360102', '伍浩', '为范围', '2015-10-20 19:13:14');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360102', '伍浩', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:13:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360102', '伍浩', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:13:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:14:01');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:14:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121111360122', '杜路遥', '圣诞狗狗', '2015-10-20 19:15:52');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '的身高多少 ', '2015-10-20 19:16:17');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '发时光隧道分', '2015-10-20 19:16:27');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121111360122', '杜路遥', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:19:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121111360122', '杜路遥', '花费大概', '2015-10-20 19:20:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121111360122', '杜路遥', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:20:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '人头', '2015-10-20 19:21:07');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '蝴蝶飞', '2015-10-20 19:21:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 19:26:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '收到公司的', '2015-10-20 19:35:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '山豆根', '2015-10-20 19:36:23');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '说的好的方式', '2015-10-20 19:36:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '是大富大贵', '2015-10-20 19:36:58');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '萨芬', '2015-10-20 19:37:00');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '山豆根', '2015-10-20 20:01:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '感受到分', '2015-10-20 20:01:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '撒旦发送给的', '2015-10-20 20:02:10');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '岁的法国', '2015-10-20 20:02:47');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '山豆根士大夫', '2015-10-20 20:02:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '好的萨芬给', '2015-10-20 20:03:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '给荒废时光', '2015-10-20 20:03:14');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '额额头上的广告是', '2015-10-20 20:17:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '树大根深', '2015-10-20 20:17:45');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '问题温热', '2015-10-20 20:17:52');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:18:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:18:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:18:52');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '说的话', '2015-10-20 20:18:57');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:19:01');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:19:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:19:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '似的', '2015-10-20 20:20:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '感受到', '2015-10-20 20:20:19');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'were', '2015-10-20 20:20:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '感受到', '2015-10-20 20:20:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '感受到分', '2015-10-20 20:20:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '哇额', '2015-10-20 20:21:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '感受到', '2015-10-20 20:21:28');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '收到公司电话', '2015-10-20 20:21:53');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '为人师', '2015-10-20 20:21:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:22:07');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:23:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-20 20:23:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '士大夫', '2015-10-20 20:57:17');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '山豆根', '2015-10-20 20:59:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '宿舍如果', '2015-10-21 08:56:07');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '非', '2015-10-21 09:00:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '而', '2015-10-21 09:10:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 09:12:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 09:19:04');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 09:24:50');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '电视广告 ', '2015-10-21 09:25:04');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 09:25:22');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 09:28:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 10:19:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 10:19:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 11:15:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '啥地方都是个', '2015-10-21 11:15:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '塞得港省的', '2015-10-21 11:15:44');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '上的广告但是', '2015-10-21 11:21:37');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '塞得港省的', '2015-10-21 11:21:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '问阿嚏上的', '2015-10-21 11:21:59');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '塞得港省的', '2015-10-21 11:25:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '岁的法国', '2015-10-21 14:12:35');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '是的风格和', '2015-10-21 14:12:52');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '山豆根', '2015-10-21 14:16:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '山豆根', '2015-10-21 14:17:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '士大夫山豆根', '2015-10-21 14:19:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '威神敌法', '2015-10-21 14:19:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '问题的方式', '2015-10-21 14:20:20');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '收到公司的', '2015-10-21 14:21:04');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '山豆根士大夫', '2015-10-21 14:21:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 14:51:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '发色糕点师', '2015-10-21 14:51:52');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 14:53:50');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 14:53:52');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '问个电话', '2015-10-21 15:03:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 15:03:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 15:05:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '收到公司的', '2015-10-21 15:07:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '问题是的公司的', '2015-10-21 15:11:09');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 15:11:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:02:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:02:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:03:27');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:03:27');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:05:28');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:06:13');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:10:21');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:14:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:16:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:17:02');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '福娃的哥特我', '2015-10-21 16:17:47');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '都是符合公司的分', '2015-10-21 16:17:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:18:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:18:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '微光电视', '2015-10-21 16:18:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:18:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:18:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:19:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:20:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:20:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '山豆根士大夫', '2015-10-21 16:55:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 16:56:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:04:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '十多个', '2015-10-21 19:18:39');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:20:14');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:20:17');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '收到收到分', '2015-10-21 19:23:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', '收到公司的', '2015-10-21 19:23:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:23:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:24:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:31:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:35:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '山豆根', '2015-10-21 19:36:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', '树大根深', '2015-10-21 19:36:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '未收到', '2015-10-21 19:36:37');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:36:50');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:37:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:38:02');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:39:50');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:40:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:43:05');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:43:28');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:44:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:45:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '的风格热火', '2015-10-21 19:52:48');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '地方很多', '2015-10-21 19:52:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-21 19:52:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360230', '李君', '收到公司的', '2015-10-22 20:50:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360230', '李君', '额我认为他', '2015-10-22 20:50:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-22 20:50:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-22 20:50:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi11', '0121111360230', '李君', '微软', '2015-10-22 20:51:05');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi11', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-22 20:51:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan6', '0121111360230', '李君', '违法的事', '2015-10-22 20:51:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121111360230', '李君', '收到公司的', '2015-10-22 20:51:19');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121111360230', '李君', '收到公司的', '2015-10-22 20:51:21');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121111360230', '李君', '呃呃呃', '2015-10-22 20:51:23');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-22 20:51:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan6', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-22 20:51:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '山豆根', '2015-10-26 08:25:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', '所谓的是多个', '2015-10-26 08:25:37');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121111360230', '李君', '健康和恐惧i', '2015-10-26 08:26:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan6', '0121111360230', '李君', '7898', '2015-10-26 08:27:09');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '收到公司的', '2015-10-26 08:50:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi6', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 08:51:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan5', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 08:51:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 08:51:35');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 10:29:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '似的发射点', '2015-10-26 10:35:20');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 10:37:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360230', '李君', '撒旦发送给', '2015-10-26 10:44:48');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360212', '赵军', '是多个撒', '2015-10-26 10:44:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360212', '赵军', '山豆根', '2015-10-26 11:16:02');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi7', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 11:19:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '山豆根', '2015-10-26 11:21:58');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '士大夫', '2015-10-26 11:22:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '跟个', '2015-10-26 11:22:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '帝国时代', '2015-10-26 13:32:14');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '山豆根', '2015-10-26 13:33:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '广东省地方', '2015-10-26 13:33:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '三大', '2015-10-26 13:33:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 13:33:53');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 13:33:57');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '是多个呵呵', '2015-10-26 13:35:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '刚刚好', '2015-10-26 13:36:15');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 13:40:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 13:40:48');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 13:41:48');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '各色', '2015-10-26 13:42:01');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '感受到分', '2015-10-26 13:42:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '感受到分', '2015-10-26 13:42:27');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 13:43:21');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 13:55:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '施工方', '2015-10-26 14:51:18');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '公司的风格和', '2015-10-26 14:51:47');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '感受到分', '2015-10-26 14:51:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '干撒的', '2015-10-26 14:51:53');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '该死的', '2015-10-26 15:12:39');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '感受到分', '2015-10-26 15:16:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '换行', '2015-10-26 16:33:15');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '刚好', '2015-10-26 16:33:18');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 16:44:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 16:45:45');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '999', '999', 'iui', '2015-10-26 16:56:00');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '999', '999', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 17:06:01');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '999', '999', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 20:25:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', '感受到分', '2015-10-26 20:26:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360230', '李君', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-26 20:27:19');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360212', '赵军', '她她她', '2015-10-26 20:27:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang4', '0121111360608', '傅天翔', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-10-27 09:40:18');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '感受到', '2015-11-02 08:49:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'sdgsdf', '2015-11-04 14:45:13');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'rty ', '2015-11-04 14:45:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-04 15:10:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-04 15:10:59');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121111360122', '杜路遥', '谁敢惹', '2015-11-09 16:28:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi8', '0121111360122', '杜路遥', '噶违法', '2015-11-09 16:29:05');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', '钢丝绳道', '2015-11-09 19:02:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', '感受到分', '2015-11-09 19:04:17');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', '该死的', '2015-11-09 19:05:23');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-09 19:13:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-09 19:14:44');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-09 19:15:45');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-09 19:19:00');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan6', '0121111360101', '李明闻', '似的', '2015-11-11 09:39:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan6', '0121017550524', '黄莹莹', '速度发给', '2015-11-11 10:12:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', '围观', '2015-11-11 10:12:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang5', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 10:12:47');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan6', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 10:12:52');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'sdg ', '2015-11-11 19:05:43');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:06:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:07:04');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:11:47');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:11:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121111360231', '肖瑶', 'fdg ', '2015-11-11 19:16:00');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360231', '肖瑶', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:16:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan7', '0121111360231', '肖瑶', 'gwe', '2015-11-11 19:16:59');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360317', '周晓奇', 'ge', '2015-11-11 19:19:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360317', '周晓奇', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:20:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121111360317', '周晓奇', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:20:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121111360317', '周晓奇', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:20:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121111360317', '周晓奇', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:20:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121111360712', '胡亚清', 'wedffd', '2015-11-11 19:22:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121111360712', '胡亚清', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:22:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121111360712', '胡亚清', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:22:43');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360712', '胡亚清', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:22:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan5', '0121111360712', '胡亚清', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-11 19:23:07');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '是多个额', '2015-11-12 09:11:45');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '岗位啊十分', '2015-11-12 09:11:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑老师', '大概范围', '2015-11-12 11:20:47');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑老师', '哥啊地方', '2015-11-12 11:20:55');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑老师', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-12 11:21:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑老师', '访问方式的', '2015-11-12 11:21:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', 'gdfgfd', '2015-11-12 19:30:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', 'gsdf ', '2015-11-12 19:30:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '发生的故事的', '2015-11-12 19:35:20');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'sdf ', '2015-11-12 19:42:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '速度发给个', '2015-11-12 19:42:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '各位粉丝的风格', '2015-11-12 19:43:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'gwes ', '2015-11-12 19:43:13');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '各位哥哥', '2015-11-12 19:43:53');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '高纬度', '2015-11-12 19:47:28');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-12 19:47:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '高纬度', '2015-11-12 20:07:58');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '感受到分', '2015-11-12 20:09:10');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-12 20:14:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '威神敌法', '2015-11-12 20:14:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-12 20:14:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '感受到分', '2015-11-12 20:36:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-12 20:39:59');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '富士达', '2015-11-12 20:41:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-12 21:13:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '公司纷纷', '2015-11-12 21:32:43');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '得分', '2015-11-13 09:20:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '山豆根', '2015-11-13 09:29:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '23', '2015-11-13 09:44:14');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '受到广大', '2015-11-13 11:06:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', '围观', '2015-11-13 11:07:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '高温费', '2015-11-13 11:07:21');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', '围观地方', '2015-11-13 11:07:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '发色乳房', '2015-11-13 11:11:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '13', '傅剑', '感受到分微软', '2015-11-13 11:11:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '感受到分', '2015-11-13 11:11:42');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '是的风格', '2015-11-13 14:34:14');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 14:34:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 15:23:37');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '收到公司的', '2015-11-13 15:29:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', '各色', '2015-11-13 15:31:39');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 15:34:15');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:01:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:02:20');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:03:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '撒敌法的', '2015-11-13 16:31:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:31:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '斯德哥尔', '2015-11-13 16:36:02');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:36:05');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', '撒犯得上发', '2015-11-13 16:36:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:36:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', '速度发给', '2015-11-13 16:36:31');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:36:37');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '温哥华', '2015-11-13 16:38:55');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', '隐隐约约', '2015-11-13 16:39:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:39:17');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '饿啊日退房的', '2015-11-13 16:39:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:39:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '围观地方', '2015-11-13 16:51:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'wegssdf ', '2015-11-13 16:52:13');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '是多个乳房', '2015-11-13 16:52:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:52:59');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360101', '李明闻', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:53:05');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 16:53:27');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '撒敌法跟个', '2015-11-13 19:05:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '13', '傅剑', '围观速度发给', '2015-11-13 19:05:20');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:05:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan7', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:05:27');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:05:29');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:05:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:05:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '各位广东省', '2015-11-13 19:08:09');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', '公司担任过', '2015-11-13 19:08:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', '供热事故和', '2015-11-13 19:08:54');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', '热火萨芬给', '2015-11-13 19:09:07');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan5', '13', '傅剑', '山豆根士大夫', '2015-11-13 19:10:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121111360122', '杜路遥', 'wett', '2015-11-13 19:10:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '0121111360122', '杜路遥', 'wetdddsx', '2015-11-13 19:10:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '0121111360122', '杜路遥', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:12:47');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121111360122', '杜路遥', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:12:50');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan5', '0121111360122', '杜路遥', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:12:53');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121111360122', '杜路遥', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:12:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:10');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:12');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan5', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:36');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan7', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:38');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '额我刚好', '2015-11-13 19:13:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:13:50');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '钢丝绳道', '2015-11-13 19:29:00');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:29:01');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:29:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:31:49');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:32:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '围观的思想', '2015-11-13 19:32:19');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', '时代的说法的', '2015-11-13 19:32:26');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:32:37');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:32:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-13 19:37:41');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', '是的个人', '2015-11-15 11:02:18');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', '撒旦感受到分', '2015-11-15 11:03:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-15 11:03:10');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-15 11:03:13');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121017550524', '黄莹莹', '官府的人', '2015-11-15 12:53:55');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', '收到公司的', '2015-11-15 13:37:46');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '13', '傅剑', '委屈恶搞的', '2015-11-15 13:37:58');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-15 13:38:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-15 13:38:06');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-15 13:38:09');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-15 13:38:11');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan7', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-15 13:38:13');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-16 09:35:16');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', 'sdfe', '2015-11-18 18:32:03');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-18 18:32:04');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', '特务突然', '2015-11-19 14:19:24');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 14:19:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi6', '13', '傅剑', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-25 14:59:14');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'sdf', '2015-11-19 16:03:56');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:09:40');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan2', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:11:51');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:14:10');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:20:22');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'sdf', '2015-11-19 16:31:33');
INSERT INTO `group_chat_inf` VALUES ('guokong_shangshuixiang1', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:39:30');
INSERT INTO `group_chat_inf` VALUES ('guokong_chuanjikongzhi3', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:39:32');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi4', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:39:34');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan8', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:40:22');
INSERT INTO `group_chat_inf` VALUES ('guokong_danbihuan8', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:40:25');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi10', '0121017550524', '黄莹莹', 'sdgfg ', '2015-11-19 16:56:08');
INSERT INTO `group_chat_inf` VALUES ('guokong_shimisi10', '0121017550524', '黄莹莹', 'Lto/Gqr3TV2xdQ0I1Su9yQ', '2015-11-19 16:56:10');

-- ----------------------------
-- Table structure for `itembank`
-- ----------------------------
DROP TABLE IF EXISTS `itembank`;
CREATE TABLE `itembank` (
  `Number` int(10) NOT NULL DEFAULT '0',
  `Name` char(64) DEFAULT NULL,
  `questiontype` char(64) DEFAULT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itembank
-- ----------------------------
INSERT INTO `itembank` VALUES ('1', '你认为做实验前进行相关理论预习有无帮助？（有帮助/无帮助）', 'questionnaire1');
INSERT INTO `itembank` VALUES ('2', '你会在做实验前进行相关理论的预习吗？（会/不会）', 'questionnaire1');
INSERT INTO `itembank` VALUES ('3', '你认为做实验前了解相关实验设备接线有无帮助？（有帮助/无帮助）', 'questionnaire1');
INSERT INTO `itembank` VALUES ('4', '你会在做实验之前了解相关实验设备的接线吗？（会/不会）', 'questionnaire1');
INSERT INTO `itembank` VALUES ('5', '你认为以小组形式进行实验好不好？（好/不好）', 'questionnaire1');
INSERT INTO `itembank` VALUES ('6', '你认为做实验之前实验小组就实验内容进行讨论有无必要？（有必要/无必要）', 'questionnaire1');
INSERT INTO `itembank` VALUES ('7', '你认为以前的实验课内容安排和理论课内容结合紧密吗？（很紧密/不紧密）', 'questionnaire1');
INSERT INTO `itembank` VALUES ('8', '你觉得以前做专业课实验有收获吗？请谈谈你的看法。', 'questionnaire1');
INSERT INTO `itembank` VALUES ('9', '你认为专业课实验的内容安排合理吗？请简要谈谈你的想法。', 'questionnaire1');
INSERT INTO `itembank` VALUES ('10', '谈谈你对本次实验课有何期望和要求？', 'questionnaire1');
INSERT INTO `itembank` VALUES ('11', '你认为实验前预习相关理论对本课程实验有帮助吗？（有帮助/无帮助）', 'questionnaire2');
INSERT INTO `itembank` VALUES ('12', '你有在本课程实验前进行相关理论的预习吗？（有/没有）', 'questionnaire2');
INSERT INTO `itembank` VALUES ('13', '你认为实验前了解相关实验设备接线对本课程实验有无帮助？（有帮助/无帮助）', 'questionnaire2');
INSERT INTO `itembank` VALUES ('14', '你有在本课程实验之前了解相关实验设备的接线吗？（有/没有）', 'questionnaire2');
INSERT INTO `itembank` VALUES ('15', '你认为本课程实验以小组形式进行还不好？（好/不好）', 'questionnaire2');
INSERT INTO `itembank` VALUES ('16', '你认为做实验前小组内就实验内容进行讨论对本课程实验有无必要？（有必要/无必要）', 'questionnaire2');
INSERT INTO `itembank` VALUES ('17', '你认为本课程实验内容和理论课内容结合紧密吗？（很紧密/不紧密）', 'questionnaire2');
INSERT INTO `itembank` VALUES ('18', '你觉得做完本课程实验有收获吗？请谈谈你的想法。', 'questionnaire2');
INSERT INTO `itembank` VALUES ('19', '你认为本课程实验内容安排合理吗？请简要谈谈你的想法。', 'questionnaire2');
INSERT INTO `itembank` VALUES ('20', '你认为本课程实验还有哪些问题需要改进？', 'questionnaire2');
INSERT INTO `itembank` VALUES ('30', '对本次实验的感受。（有收获/无收获）', 'questionnaire3');
INSERT INTO `itembank` VALUES ('31', '对本次实验而言查阅相关设备的使用说明书有益吗？（有益/无益）', 'questionnaire3');

-- ----------------------------
-- Table structure for `ka1`
-- ----------------------------
DROP TABLE IF EXISTS `ka1`;
CREATE TABLE `ka1` (
  `id` varchar(20) NOT NULL,
  `currentstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ka1
-- ----------------------------
INSERT INTO `ka1` VALUES ('1', '预习');
INSERT INTO `ka1` VALUES ('2', '预习完成');
INSERT INTO `ka1` VALUES ('3', '测试完成');
INSERT INTO `ka1` VALUES ('4', '预约完成');
INSERT INTO `ka1` VALUES ('5', '预约取消');
INSERT INTO `ka1` VALUES ('6', '再次预约完成');
INSERT INTO `ka1` VALUES ('7', '再次预约取消');
INSERT INTO `ka1` VALUES ('8', '实验完成');
INSERT INTO `ka1` VALUES ('9', '已交报告');

-- ----------------------------
-- Table structure for `managerinf`
-- ----------------------------
DROP TABLE IF EXISTS `managerinf`;
CREATE TABLE `managerinf` (
  `managerid` int(20) NOT NULL,
  `managename` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `quanxian` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of managerinf
-- ----------------------------

-- ----------------------------
-- Table structure for `process`
-- ----------------------------
DROP TABLE IF EXISTS `process`;
CREATE TABLE `process` (
  `studentid` varchar(50) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `createtime` varchar(20) DEFAULT NULL,
  `path` varchar(20) DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process
-- ----------------------------
INSERT INTO `process` VALUES (null, '过程控制', '上水箱对象', null, '2014-10-22 09:20:16', '00A', '12091');
INSERT INTO `process` VALUES ('12091gg', '过程控制', '上水箱对象', null, '2014-10-22 09:21:05', '00A', '12091');

-- ----------------------------
-- Table structure for `processbiao`
-- ----------------------------
DROP TABLE IF EXISTS `processbiao`;
CREATE TABLE `processbiao` (
  `studentid` varchar(50) DEFAULT '',
  `studentname` varchar(20) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `path` varchar(20) DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL,
  `LastModifiedTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of processbiao
-- ----------------------------
INSERT INTO `processbiao` VALUES ('0120911360303', '陈万委', '过程控制', '上水箱对象特性', '预习完成', '2014-11-02 10:03:55', '00A', '0120911360303', '2014-11-04 18:06:59');
INSERT INTO `processbiao` VALUES ('0121011360102', '林国枝', '过程控制', '上水箱对象特性', '测试完成', '2014-10-27 09:12:23', '00A', '0121011360102', '2014-10-27 10:17:38');
INSERT INTO `processbiao` VALUES ('0121011360108', '李凯', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 18:24:38', '00A', '0121011360108', '2014-11-04 18:56:53');
INSERT INTO `processbiao` VALUES ('0121011360115', '朱洋', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 18:20:22', '00A', '0121011360115', '2014-11-04 19:30:20');
INSERT INTO `processbiao` VALUES ('0121011360122', '秦煌', '过程控制', '上水箱对象特性', '测试完成', '2014-10-31 10:22:14', '00A', '0121011360122', '2014-10-31 10:25:46');
INSERT INTO `processbiao` VALUES ('0121011360124', '龚良文', '过程控制', '上水箱对象特性', '测试完成', '2014-10-27 11:17:08', '00A', '0121011360124', '2014-10-27 11:21:16');
INSERT INTO `processbiao` VALUES ('0121011360108', '李凯', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 18:30:01', '00A', '0121011360108', '2014-11-04 18:56:53');
INSERT INTO `processbiao` VALUES ('0121011360108', '李凯', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 18:56:39', '00A', '0121011360108', '2014-11-04 18:56:53');
INSERT INTO `processbiao` VALUES ('0121011360122', '秦煌', '过程控制', '流量液位串级控制', '预习', '2014-11-04 19:03:01', '00A', '0121011360122', null);
INSERT INTO `processbiao` VALUES ('0121011360115', '朱洋', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 19:29:08', '00A', '0121011360115', '2014-11-04 19:30:20');
INSERT INTO `processbiao` VALUES ('0121011360115', '朱洋', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 19:29:46', '00A', '0121011360115', '2014-11-04 19:30:20');
INSERT INTO `processbiao` VALUES ('0121011360115', '朱洋', '过程控制', '史密斯预估实验', '预习完成', '2014-11-04 19:30:09', '00A', '0121011360115', '2014-11-04 19:30:20');
INSERT INTO `processbiao` VALUES ('0120913770101', '李南江', '过程控制', '液位单闭环控制', '预习', '2014-11-04 20:55:06', '00A', '0120913770101', null);
INSERT INTO `processbiao` VALUES ('111111', 'mm', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 21:47:28', '00A', '111111', '2014-11-04 21:55:10');
INSERT INTO `processbiao` VALUES ('111111', 'mm', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 21:49:08', '00A', '111111', '2014-11-04 21:55:10');
INSERT INTO `processbiao` VALUES ('111111', 'mm', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 21:52:39', '00A', '111111', '2014-11-04 21:55:10');
INSERT INTO `processbiao` VALUES ('111111', 'mm', '过程控制', '史密斯预估实验', '预习完成', '2014-11-04 21:54:44', '00A', '111111', '2014-11-04 21:55:10');
INSERT INTO `processbiao` VALUES ('333333', 'VV', '过程控制', '上水箱对象特性', '????', '2014-11-05 15:19:35', '00A', '333333', '2014-11-06 10:02:55');
INSERT INTO `processbiao` VALUES ('333333', 'VV', '过程控制', '液位单闭环控制', '预约完成', '2014-11-05 15:23:31', '00A', '333333', '2014-11-06 10:08:06');
INSERT INTO `processbiao` VALUES ('333333', 'VV', '过程控制', '流量液位串级控制', '预约完成', '2014-11-06 04:31:43', '00A', '333333', '2014-11-06 10:24:49');
INSERT INTO `processbiao` VALUES ('333333', 'VV', '过程控制', '史密斯预估实验', '预约完成', '2014-11-06 04:33:35', '00A', '333333', '2014-11-06 10:36:47');
INSERT INTO `processbiao` VALUES ('444444', '123', '过程控制', '上水箱对象特性', '预约完成', '2014-11-06 07:02:05', '00A', '444444', '2014-11-11 16:31:53');
INSERT INTO `processbiao` VALUES ('666666', '1234', '过程控制', '上水箱对象特性', '预习', '2014-11-06 10:59:23', '00A', '666666', null);
INSERT INTO `processbiao` VALUES ('777777', '12345', '过程控制', '上水箱对象特性', '预习完成', '2014-11-06 11:02:10', '00A', '777777', '2014-11-20 04:26:33');
INSERT INTO `processbiao` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预约完成', '2014-11-06 11:05:48', '00A', '777777', '2014-11-06 11:10:29');
INSERT INTO `processbiao` VALUES ('888888', '123456', '过程控制', '上水箱对象特性', '预约完成', '2014-11-06 11:10:12', '00A', '888888', '2014-11-19 13:39:57');
INSERT INTO `processbiao` VALUES ('777777', '12345', '过程控制', '流量液位串级控制', '预约完成', '2014-11-06 11:11:37', '00A', '777777', '2014-11-06 11:17:31');
INSERT INTO `processbiao` VALUES ('888888', '123456', '过程控制', '流量液位串级控制', '预习完成', '2014-11-06 11:13:00', '00A', '888888', '2014-11-06 11:13:18');
INSERT INTO `processbiao` VALUES ('888888', '123456', '过程控制', '史密斯预估实验', '预习完成', '2014-11-06 11:13:28', '00A', '888888', '2014-11-06 11:13:36');
INSERT INTO `processbiao` VALUES ('888888', '123456', '过程控制', '液位单闭环控制', '预习完成', '2014-11-06 11:13:44', '00A', '888888', '2014-11-22 03:05:25');
INSERT INTO `processbiao` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预约完成', '2014-11-11 16:32:46', '00A', '444444', '2014-11-11 16:37:35');
INSERT INTO `processbiao` VALUES ('444444', '123', '过程控制', '流量液位串级控制', '预约完成', '2014-11-11 16:38:21', '00A', '444444', '2014-11-11 16:39:20');
INSERT INTO `processbiao` VALUES ('111111', null, '过程控制', '上水箱对象特性', '预习', '2014-11-19 05:10:04', '00A', '111111', null);
INSERT INTO `processbiao` VALUES ('111111', null, '过程控制', '上水箱对象特性', '预习', '2014-11-19 05:13:06', '00A', '111111', null);
INSERT INTO `processbiao` VALUES ('666666', '1234', '过程控制', '液位单闭环控制', '预习', '2014-11-20 04:26:01', '00A', '666666', null);
INSERT INTO `processbiao` VALUES ('666666', '1234', '过程控制', '流量液位串级控制', '预习', '2014-11-20 04:26:12', '00A', '666666', null);
INSERT INTO `processbiao` VALUES ('666666', '1234', '过程控制', '史密斯预估实验', '预习', '2014-11-20 04:26:18', '00A', '666666', null);
INSERT INTO `processbiao` VALUES ('777777', '12345', '过程控制', '史密斯预估实验', '预习完成', '2014-11-20 04:28:07', '00A', '777777', '2014-11-20 04:28:24');
INSERT INTO `processbiao` VALUES ('0121111360527', '史森炬', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 13:59:11', '00A', '0121111360527', '2014-11-21 14:07:17');
INSERT INTO `processbiao` VALUES ('0121111360527', '史森炬', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:07:48', '00A', '0121111360527', '2014-11-21 14:10:45');
INSERT INTO `processbiao` VALUES ('0121111360311', '程思伟', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:15:25', '00A', '0121111360311', '2014-11-21 14:17:01');
INSERT INTO `processbiao` VALUES ('0121111360527', '史森炬', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:15:56', '00A', '0121111360527', '2014-11-21 14:17:58');
INSERT INTO `processbiao` VALUES ('0121111360311', '程思伟', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:17:32', '00A', '0121111360311', '2014-11-21 14:17:49');
INSERT INTO `processbiao` VALUES ('0121111360527', '史森炬', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:18:19', '00A', '0121111360527', '2014-11-21 14:19:17');
INSERT INTO `processbiao` VALUES ('0121111360706', '邢彦一', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:27:10', '00A', '0121111360706', '2014-11-21 14:29:15');
INSERT INTO `processbiao` VALUES ('0121111360706', '邢彦一', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:27:14', '00A', '0121111360706', '2014-11-21 14:28:09');
INSERT INTO `processbiao` VALUES ('0121111360706', '邢彦一', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:28:16', '00A', '0121111360706', '2014-11-21 14:28:49');
INSERT INTO `processbiao` VALUES ('0121111360706', '邢彦一', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:30:35', '00A', '0121111360706', '2014-11-21 14:30:44');
INSERT INTO `processbiao` VALUES ('0121111360524', '张利虎', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:37:08', '00A', '0121111360524', '2014-11-21 14:40:51');
INSERT INTO `processbiao` VALUES ('0121111360312', '周恒', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:40:47', '00A', '0121111360312', '2014-11-21 14:43:12');
INSERT INTO `processbiao` VALUES ('0121111360524', '张利虎', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:41:15', '00A', '0121111360524', '2014-11-21 14:41:46');
INSERT INTO `processbiao` VALUES ('0121111360524', '张利虎', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:42:51', '00A', '0121111360524', '2014-11-21 14:43:19');
INSERT INTO `processbiao` VALUES ('0121111360413', '赵玄', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:43:13', '00A', '0121111360413', '2014-11-21 14:46:02');
INSERT INTO `processbiao` VALUES ('0121111360312', '周恒', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:43:28', '00A', '0121111360312', '2014-11-21 14:43:36');
INSERT INTO `processbiao` VALUES ('0121111360524', '张利虎', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:43:28', '00A', '0121111360524', '2014-11-21 14:44:34');
INSERT INTO `processbiao` VALUES ('0121111360312', '周恒', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:44:07', '00A', '0121111360312', '2014-11-21 14:44:58');
INSERT INTO `processbiao` VALUES ('0121111360312', '周恒', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:45:04', '00A', '0121111360312', '2014-11-21 14:46:11');
INSERT INTO `processbiao` VALUES ('0121111360315', '陈天培', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:45:23', '00A', '0121111360315', '2014-11-21 14:49:02');
INSERT INTO `processbiao` VALUES ('0121111360413', '赵玄', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:46:13', '00A', '0121111360413', '2014-11-21 14:47:33');
INSERT INTO `processbiao` VALUES ('0121111360315', '陈天培', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:47:00', '00A', '0121111360315', '2014-11-21 14:50:03');
INSERT INTO `processbiao` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:48:25', '00A', '0121111360413', '2014-11-21 14:57:37');
INSERT INTO `processbiao` VALUES ('0121111360315', '陈天培', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:49:22', '00A', '0121111360315', '2014-11-21 14:49:30');
INSERT INTO `processbiao` VALUES ('0121111360413', '赵玄', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:49:35', '00A', '0121111360413', '2014-11-21 14:50:43');
INSERT INTO `processbiao` VALUES ('0121111360315', '陈天培', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:50:16', '00A', '0121111360315', '2014-11-21 14:50:53');
INSERT INTO `processbiao` VALUES ('0121111360131', '李彤', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:51:25', '00A', '0121111360131', '2014-11-21 14:53:23');
INSERT INTO `processbiao` VALUES ('0121111360316', '尹凡', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:51:52', '00A', '0121111360316', '2014-11-21 14:52:27');
INSERT INTO `processbiao` VALUES ('0121111360316', '尹凡', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:51:52', '00A', '0121111360316', null);
INSERT INTO `processbiao` VALUES ('0121111360316', '尹凡', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:51:53', '00A', '0121111360316', '2014-11-21 14:53:07');
INSERT INTO `processbiao` VALUES ('0121111360316', '尹凡', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:51:53', '00A', '0121111360316', '2014-11-21 14:53:31');
INSERT INTO `processbiao` VALUES ('0121111360131', '李彤', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:53:39', '00A', '0121111360131', '2014-11-21 14:53:58');
INSERT INTO `processbiao` VALUES ('0121111360711', '程琢', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:57:23', '00A', '0121111360711', '2014-11-21 15:53:37');
INSERT INTO `processbiao` VALUES ('0121111360712', '胡亚清', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:02:21', '00A', '0121111360712', '2015-11-11 19:21:16');
INSERT INTO `processbiao` VALUES ('0121111360712', '胡亚清', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:02:42', '00A', '0121111360712', '2015-11-11 19:22:23');
INSERT INTO `processbiao` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:03:23', '00A', '0121111360712', '2015-11-11 19:22:33');
INSERT INTO `processbiao` VALUES ('0121111360522', '孙靖哲', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:22:24', '00A', '0121111360522', '2014-11-21 15:24:04');
INSERT INTO `processbiao` VALUES ('0121111360522', '孙靖哲', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:22:25', '00A', '0121111360522', '2014-11-21 15:24:54');
INSERT INTO `processbiao` VALUES ('0121111360522', '孙靖哲', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:22:25', '00A', '0121111360522', '2014-11-21 15:25:24');
INSERT INTO `processbiao` VALUES ('0121111360502', '黄振伟', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:38:22', '00A', '0121111360502', '2014-11-21 15:39:28');
INSERT INTO `processbiao` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:39:18', '00A', '0121111360230', '2015-10-26 16:29:56');
INSERT INTO `processbiao` VALUES ('0121111360502', '黄振伟', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:39:33', '00A', '0121111360502', '2014-11-21 15:39:59');
INSERT INTO `processbiao` VALUES ('0121111360502', '黄振伟', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:40:02', '00A', '0121111360502', '2014-11-21 15:40:30');
INSERT INTO `processbiao` VALUES ('0121111360629', '李怡', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:40:46', '00A', '0121111360629', '2014-11-21 15:48:55');
INSERT INTO `processbiao` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 15:47:53', '00A', '0121111360230', '2015-10-26 08:49:02');
INSERT INTO `processbiao` VALUES ('0121111360713', '王宇', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:49:16', '00A', '0121111360713', '2014-11-21 15:49:43');
INSERT INTO `processbiao` VALUES ('0121111360713', '王宇', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:49:16', '00A', '0121111360713', '2014-11-21 15:50:20');
INSERT INTO `processbiao` VALUES ('0121111360713', '王宇', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:49:16', '00A', '0121111360713', '2014-11-21 15:51:34');
INSERT INTO `processbiao` VALUES ('0121111360629', '李怡', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 15:49:45', '00A', '0121111360629', '2014-11-23 06:42:19');
INSERT INTO `processbiao` VALUES ('0121111360629', '李怡', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:52:56', '00A', '0121111360629', '2014-11-21 15:53:21');
INSERT INTO `processbiao` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:53:37', '00A', '0121111360122', '2015-11-11 19:13:51');
INSERT INTO `processbiao` VALUES ('0121111360629', '李怡', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:53:38', '00A', '0121111360629', '2014-11-21 15:54:19');
INSERT INTO `processbiao` VALUES ('0121111360711', '程琢', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:53:42', '00A', '0121111360711', '2014-11-21 15:54:05');
INSERT INTO `processbiao` VALUES ('0121111360711', '程琢', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:54:09', '00A', '0121111360711', '2014-11-21 15:54:24');
INSERT INTO `processbiao` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:54:31', '00A', '0121111360230', '2015-10-26 08:48:12');
INSERT INTO `processbiao` VALUES ('0121111360534', '吴月', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:55:13', '00A', '0121111360534', '2014-11-21 15:57:53');
INSERT INTO `processbiao` VALUES ('0121111360534', '吴月', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:58:20', '00A', '0121111360534', '2014-11-21 15:59:04');
INSERT INTO `processbiao` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 15:58:48', '00A', '0121111360122', '2015-11-11 19:14:00');
INSERT INTO `processbiao` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:59:04', '00A', '0121111360122', '2015-11-11 19:14:07');
INSERT INTO `processbiao` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:59:18', '00A', '0121111360122', '2015-11-11 19:14:16');
INSERT INTO `processbiao` VALUES ('0121111360534', '吴月', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:59:27', '00A', '0121111360534', '2014-11-21 16:00:02');
INSERT INTO `processbiao` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:59:48', '00A', '0121111360230', '2015-10-26 11:17:01');
INSERT INTO `processbiao` VALUES ('0121111360534', '吴月', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:00:08', '00A', '0121111360534', '2014-11-21 16:00:24');
INSERT INTO `processbiao` VALUES ('0121111360430', '杜珍珍', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:02:06', '00A', '0121111360430', '2014-11-21 16:03:17');
INSERT INTO `processbiao` VALUES ('0121111360430', '杜珍珍', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:02:06', '00A', '0121111360430', '2014-11-21 16:06:17');
INSERT INTO `processbiao` VALUES ('0121111360430', '杜珍珍', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:02:06', '00A', '0121111360430', '2014-11-21 16:07:05');
INSERT INTO `processbiao` VALUES ('0121111360430', '杜珍珍', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:02:07', '00A', '0121111360430', '2014-11-21 16:03:47');
INSERT INTO `processbiao` VALUES ('0121111360601', '汪健', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:02:27', '00A', '0121111360601', null);
INSERT INTO `processbiao` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:02:40', '00A', '0121111360601', '2014-11-21 17:10:02');
INSERT INTO `processbiao` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:02:52', '00A', '0121111360601', '2014-11-21 17:10:15');
INSERT INTO `processbiao` VALUES ('0121111360601', '汪健', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:03:05', '00A', '0121111360601', '2014-11-21 17:29:26');
INSERT INTO `processbiao` VALUES ('0121111360233', '王陈', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:05:43', '00A', '0121111360233', '2014-11-21 16:12:10');
INSERT INTO `processbiao` VALUES ('0121111360223', '贾磊', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:07:28', '00A', '0121111360223', '2014-11-23 06:49:41');
INSERT INTO `processbiao` VALUES ('0121111360223', '贾磊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:07:32', '00A', '0121111360223', '2014-11-21 16:09:33');
INSERT INTO `processbiao` VALUES ('0121111360223', '贾磊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:07:43', '00A', '0121111360223', '2014-11-21 16:09:39');
INSERT INTO `processbiao` VALUES ('0121111360131', '李彤', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:09:21', '00A', '0121111360131', '2014-11-21 16:10:21');
INSERT INTO `processbiao` VALUES ('0121111360710', '赵磊', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:10:04', '00A', '0121111360710', '2014-11-21 16:10:19');
INSERT INTO `processbiao` VALUES ('0121111360710', '赵磊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:10:25', '00A', '0121111360710', '2014-11-21 16:10:54');
INSERT INTO `processbiao` VALUES ('0121111360131', '李彤', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:10:32', '00A', '0121111360131', '2014-11-21 16:11:05');
INSERT INTO `processbiao` VALUES ('0121111360521', '孙明军', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:10:41', '00A', '0121111360521', '2014-11-21 16:27:52');
INSERT INTO `processbiao` VALUES ('0121111360710', '赵磊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:10:57', '00A', '0121111360710', '2014-11-21 16:11:23');
INSERT INTO `processbiao` VALUES ('0121111360314', '夏鹏辉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:11:31', '00A', '0121111360314', '2014-11-21 16:17:44');
INSERT INTO `processbiao` VALUES ('0121111360605', '温林儒', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:11:44', '00A', '0121111360605', '2014-11-21 16:12:35');
INSERT INTO `processbiao` VALUES ('0121111360605', '温林儒', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:11:54', '00A', '0121111360605', '2014-11-21 18:06:27');
INSERT INTO `processbiao` VALUES ('0121111360233', '王陈', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:12:25', '00A', '0121111360233', '2014-11-23 06:23:57');
INSERT INTO `processbiao` VALUES ('0121111360314', '夏鹏辉', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:17:57', '00A', '0121111360314', null);
INSERT INTO `processbiao` VALUES ('0121111360314', '夏鹏辉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:19:07', '00A', '0121111360314', '2014-11-21 16:20:10');
INSERT INTO `processbiao` VALUES ('0121111360314', '夏鹏辉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:20:18', '00A', '0121111360314', '2014-11-21 16:21:14');
INSERT INTO `processbiao` VALUES ('0121111360401', '单跃跃', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:21:13', '00A', '0121111360401', '2014-11-21 16:23:32');
INSERT INTO `processbiao` VALUES ('0121111360311', '程思伟', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:22:25', '00A', '0121111360311', '2014-11-21 16:24:19');
INSERT INTO `processbiao` VALUES ('0121111360311', '程思伟', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:22:25', '00A', '0121111360311', '2014-11-21 16:41:57');
INSERT INTO `processbiao` VALUES ('0121111360233', '王陈', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:23:14', '00A', '0121111360233', '2014-11-21 17:00:52');
INSERT INTO `processbiao` VALUES ('0121111360401', '单跃跃', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:23:47', '00A', '0121111360401', '2014-11-21 16:23:56');
INSERT INTO `processbiao` VALUES ('0121111360233', '王陈', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:27:28', '00A', '0121111360233', '2014-11-21 16:28:51');
INSERT INTO `processbiao` VALUES ('0121111360521', '孙明军', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:28:14', '00A', '0121111360521', '2014-11-21 16:37:48');
INSERT INTO `processbiao` VALUES ('0121111360401', '单跃跃', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:28:19', '00A', '0121111360401', '2014-11-21 16:29:01');
INSERT INTO `processbiao` VALUES ('0121111360401', '单跃跃', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:29:48', '00A', '0121111360401', '2014-11-21 16:30:06');
INSERT INTO `processbiao` VALUES ('0121111360735', '胡国欣', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:32:14', '00A', '0121111360735', '2014-11-21 16:32:58');
INSERT INTO `processbiao` VALUES ('0121111360735', '胡国欣', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:32:14', '00A', '0121111360735', '2014-11-21 16:35:19');
INSERT INTO `processbiao` VALUES ('0121111360735', '胡国欣', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:32:14', '00A', '0121111360735', '2014-11-21 16:36:16');
INSERT INTO `processbiao` VALUES ('0121111360735', '胡国欣', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:32:14', '00A', '0121111360735', '2014-11-21 16:36:52');
INSERT INTO `processbiao` VALUES ('0121111360731', '胡棉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:33:27', '00A', '0121111360731', '2014-11-21 16:33:54');
INSERT INTO `processbiao` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:33:32', '00A', '0121017550524', '2015-11-19 16:31:24');
INSERT INTO `processbiao` VALUES ('0121111360731', '胡棉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:34:00', '00A', '0121111360731', '2014-11-21 16:34:22');
INSERT INTO `processbiao` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:34:25', '00A', '0121017550524', '2015-11-19 16:52:03');
INSERT INTO `processbiao` VALUES ('0121111360731', '胡棉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:34:27', '00A', '0121111360731', '2014-11-21 16:34:42');
INSERT INTO `processbiao` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:34:30', '00A', '0121017550524', '2015-11-19 16:32:18');
INSERT INTO `processbiao` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:36:52', '00A', '0121017550524', '2015-11-19 16:55:25');
INSERT INTO `processbiao` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:37:36', '00A', '0121111360531', '2014-11-21 16:53:34');
INSERT INTO `processbiao` VALUES ('0121111360531', '刘超群', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:37:36', '00A', '0121111360531', '2014-11-21 16:53:49');
INSERT INTO `processbiao` VALUES ('0121111360531', '刘超群', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:37:36', '00A', '0121111360531', '2014-11-21 16:41:25');
INSERT INTO `processbiao` VALUES ('0121111360521', '孙明军', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:38:22', '00A', '0121111360521', '2014-11-21 16:46:45');
INSERT INTO `processbiao` VALUES ('0121111360123', '张剑桥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:40:21', '00A', '0121111360123', '2014-11-22 17:23:31');
INSERT INTO `processbiao` VALUES ('0121111360105', '王槐', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:45:02', '00A', '0121111360105', '2014-11-21 17:05:33');
INSERT INTO `processbiao` VALUES ('0121111360105', '王槐', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:45:25', '00A', '0121111360105', '2014-11-22 18:21:45');
INSERT INTO `processbiao` VALUES ('0121111360105', '王槐', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:45:44', '00A', '0121111360105', '2014-11-21 17:06:19');
INSERT INTO `processbiao` VALUES ('0121111360105', '王槐', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:45:59', '00A', '0121111360105', '2014-11-21 17:06:58');
INSERT INTO `processbiao` VALUES ('0121111360634', '綦韦唯', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:46:50', '00A', '0121111360634', '2014-11-21 16:51:06');
INSERT INTO `processbiao` VALUES ('0121111360634', '綦韦唯', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:46:50', '00A', '0121111360634', '2014-11-23 07:23:52');
INSERT INTO `processbiao` VALUES ('0121111360634', '綦韦唯', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:46:50', '00A', '0121111360634', '2014-11-21 16:59:00');
INSERT INTO `processbiao` VALUES ('0121111360634', '綦韦唯', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:46:50', '00A', '0121111360634', '2014-11-21 16:57:20');
INSERT INTO `processbiao` VALUES ('0121111360521', '孙明军', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:46:53', '00A', '0121111360521', '2014-11-21 16:50:58');
INSERT INTO `processbiao` VALUES ('0121111360531', '刘超群', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:47:04', '00A', '0121111360531', '2014-11-21 16:54:25');
INSERT INTO `processbiao` VALUES ('0121111360732', '李源', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:59:02', '00A', '0121111360732', '2014-11-23 10:58:22');
INSERT INTO `processbiao` VALUES ('0121111360732', '李源', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:00:26', '00A', '0121111360732', '2014-11-21 17:00:55');
INSERT INTO `processbiao` VALUES ('0121111360407', '郝文汉', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:07:26', '00A', '0121111360407', '2014-11-21 17:09:10');
INSERT INTO `processbiao` VALUES ('0121111360407', '郝文汉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:07:28', '00A', '0121111360407', '2014-11-21 17:08:47');
INSERT INTO `processbiao` VALUES ('0121111360407', '郝文汉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:09:19', '00A', '0121111360407', '2014-11-21 17:10:12');
INSERT INTO `processbiao` VALUES ('0121111360123', '张剑桥', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:09:30', '00A', '0121111360123', '2014-11-21 17:09:46');
INSERT INTO `processbiao` VALUES ('0121111360123', '张剑桥', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:10:13', '00A', '0121111360123', '2014-11-21 17:10:35');
INSERT INTO `processbiao` VALUES ('0121111360123', '张剑桥', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:10:41', '00A', '0121111360123', '2014-11-21 17:16:53');
INSERT INTO `processbiao` VALUES ('0121111360407', '郝文汉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:10:58', '00A', '0121111360407', '2014-11-21 17:11:18');
INSERT INTO `processbiao` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:11:57', '00A', '0121111360101', '2015-11-11 19:12:16');
INSERT INTO `processbiao` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:11:58', '00A', '0121111360101', '2015-11-11 19:12:44');
INSERT INTO `processbiao` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:12:39', '00A', '0121111360101', '2015-11-11 19:12:28');
INSERT INTO `processbiao` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:13:31', '00A', '0121111360101', '2015-11-11 19:12:36');
INSERT INTO `processbiao` VALUES ('0121111360102', '伍浩', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:15:42', '00A', '0121111360102', null);
INSERT INTO `processbiao` VALUES ('0121111360102', '伍浩', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:15:42', '00A', '0121111360102', '2014-11-21 18:10:31');
INSERT INTO `processbiao` VALUES ('0121111360102', '伍浩', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:15:42', '00A', '0121111360102', '2014-11-21 17:16:53');
INSERT INTO `processbiao` VALUES ('0121111360102', '伍浩', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:15:42', '00A', '0121111360102', '2014-11-21 17:17:13');
INSERT INTO `processbiao` VALUES ('0121111360215', '余必秀', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:17:55', '00A', '0121111360215', '2014-11-21 17:18:59');
INSERT INTO `processbiao` VALUES ('0121111360215', '余必秀', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:17:56', '00A', '0121111360215', '2014-11-21 17:19:39');
INSERT INTO `processbiao` VALUES ('0121111360215', '余必秀', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:17:56', '00A', '0121111360215', '2014-11-23 06:18:20');
INSERT INTO `processbiao` VALUES ('0121111360215', '余必秀', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:17:59', '00A', '0121111360215', '2014-11-23 06:16:46');
INSERT INTO `processbiao` VALUES ('0121111360110', '邱卫林', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:18:48', '00A', '0121111360110', '2014-11-21 17:20:09');
INSERT INTO `processbiao` VALUES ('0121111360110', '邱卫林', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:19:10', '00A', '0121111360110', '2014-11-21 17:19:19');
INSERT INTO `processbiao` VALUES ('0121111360110', '邱卫林', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:19:25', '00A', '0121111360110', '2014-11-21 17:21:25');
INSERT INTO `processbiao` VALUES ('0121111360110', '邱卫林', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:19:42', '00A', '0121111360110', '2014-11-21 17:23:01');
INSERT INTO `processbiao` VALUES ('0121111360701', '魏迪', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:20:15', '00A', '0121111360701', '2014-11-21 17:20:42');
INSERT INTO `processbiao` VALUES ('0121111360506', '邵磊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:20:19', '00A', '0121111360506', '2014-11-21 17:24:53');
INSERT INTO `processbiao` VALUES ('0121111360506', '邵磊', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:20:21', '00A', '0121111360506', null);
INSERT INTO `processbiao` VALUES ('0121111360506', '邵磊', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:20:22', '00A', '0121111360506', null);
INSERT INTO `processbiao` VALUES ('0121111360506', '邵磊', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:20:22', '00A', '0121111360506', null);
INSERT INTO `processbiao` VALUES ('0121111360506', '邵磊', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:20:22', '00A', '0121111360506', null);
INSERT INTO `processbiao` VALUES ('0121111360506', '邵磊', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:20:22', '00A', '0121111360506', null);
INSERT INTO `processbiao` VALUES ('0121111360701', '魏迪', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:20:46', '00A', '0121111360701', '2014-11-21 17:21:14');
INSERT INTO `processbiao` VALUES ('0121111360701', '魏迪', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:21:17', '00A', '0121111360701', '2014-11-21 17:21:55');
INSERT INTO `processbiao` VALUES ('0121111360103', '邱艺铭', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:24:30', '00A', '0121111360103', '2014-11-21 17:27:05');
INSERT INTO `processbiao` VALUES ('0121111360115', '廖佳成', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:24:33', '00A', '0121111360115', '2014-11-21 17:26:49');
INSERT INTO `processbiao` VALUES ('0121111360115', '廖佳成', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:24:33', '00A', '0121111360115', '2014-11-21 17:27:30');
INSERT INTO `processbiao` VALUES ('0121111360115', '廖佳成', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:24:34', '00A', '0121111360115', '2014-11-23 05:04:53');
INSERT INTO `processbiao` VALUES ('0121111360115', '廖佳成', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:24:34', '00A', '0121111360115', '2014-11-21 17:27:07');
INSERT INTO `processbiao` VALUES ('0121111360103', '邱艺铭', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:27:14', '00A', '0121111360103', '2014-11-21 17:29:04');
INSERT INTO `processbiao` VALUES ('0121111360317', '周晓奇', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:27:43', '00A', '0121111360317', '2015-11-11 19:19:00');
INSERT INTO `processbiao` VALUES ('0121111360317', '周晓奇', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:28:06', '00A', '0121111360317', '2015-11-11 19:19:50');
INSERT INTO `processbiao` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:28:36', '00A', '0121111360317', '2015-11-11 19:20:01');
INSERT INTO `processbiao` VALUES ('0121111360207', '尹英豪', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:28:56', '00A', '0121111360207', '2014-11-21 17:30:03');
INSERT INTO `processbiao` VALUES ('0121111360207', '尹英豪', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:28:59', '00A', '0121111360207', '2014-11-21 17:29:23');
INSERT INTO `processbiao` VALUES ('0121111360103', '邱艺铭', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:29:22', '00A', '0121111360103', '2014-11-21 17:30:31');
INSERT INTO `processbiao` VALUES ('0121111360207', '尹英豪', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:30:09', '00A', '0121111360207', '2014-11-22 04:44:57');
INSERT INTO `processbiao` VALUES ('0121111360213', '王若飞', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:30:42', '00A', '0121111360213', '2014-11-21 17:31:04');
INSERT INTO `processbiao` VALUES ('0121111360213', '王若飞', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:30:43', '00A', '0121111360213', '2014-11-21 17:31:19');
INSERT INTO `processbiao` VALUES ('0121111360213', '王若飞', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:30:43', '00A', '0121111360213', '2014-11-23 18:10:46');
INSERT INTO `processbiao` VALUES ('0121111360302', '潘超华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:30:50', '00A', '0121111360302', '2014-11-21 17:31:19');
INSERT INTO `processbiao` VALUES ('0121111360302', '潘超华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:30:50', '00A', '0121111360302', '2014-11-21 17:31:47');
INSERT INTO `processbiao` VALUES ('0121111360302', '潘超华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:30:51', '00A', '0121111360302', '2014-11-21 17:32:49');
INSERT INTO `processbiao` VALUES ('0121111360103', '邱艺铭', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:31:01', '00A', '0121111360103', '2014-11-23 06:08:17');
INSERT INTO `processbiao` VALUES ('0121111360202', '罗君', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:32:32', '00A', '0121111360202', '2014-11-21 17:36:20');
INSERT INTO `processbiao` VALUES ('0121111360202', '罗君', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:32:37', '00A', '0121111360202', '2014-11-21 17:35:57');
INSERT INTO `processbiao` VALUES ('0121111360202', '罗君', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:32:37', '00A', '0121111360202', '2014-11-23 06:53:06');
INSERT INTO `processbiao` VALUES ('0121111360732', '李源', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:33:31', '00A', '0121111360732', '2014-11-21 17:34:29');
INSERT INTO `processbiao` VALUES ('0121111360732', '李源', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:33:47', '00A', '0121111360732', '2014-11-21 17:34:06');
INSERT INTO `processbiao` VALUES ('0121111360414', '李成', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:35:10', '00A', '0121111360414', '2014-11-21 17:35:29');
INSERT INTO `processbiao` VALUES ('0121111360414', '李成', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:35:40', '00A', '0121111360414', '2014-11-21 17:36:03');
INSERT INTO `processbiao` VALUES ('0121111360414', '李成', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:36:06', '00A', '0121111360414', '2014-11-21 17:36:33');
INSERT INTO `processbiao` VALUES ('0121111360406', '张文华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:37:06', '00A', '0121111360406', '2014-11-21 17:37:32');
INSERT INTO `processbiao` VALUES ('0121111360406', '张文华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:37:06', '00A', '0121111360406', '2014-11-21 17:38:17');
INSERT INTO `processbiao` VALUES ('0121111360406', '张文华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:37:06', '00A', '0121111360406', '2014-11-21 17:37:53');
INSERT INTO `processbiao` VALUES ('0121111360127', '杨添', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:37:51', '00A', '0121111360127', '2014-11-21 17:38:46');
INSERT INTO `processbiao` VALUES ('0121111360217', '王凯', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:38:20', '00A', '0121111360217', '2014-11-21 17:41:24');
INSERT INTO `processbiao` VALUES ('0121111360217', '王凯', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:38:20', '00A', '0121111360217', '2014-11-21 17:40:35');
INSERT INTO `processbiao` VALUES ('0121111360217', '王凯', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:38:23', '00A', '0121111360217', null);
INSERT INTO `processbiao` VALUES ('0121111360217', '王凯', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:38:38', '00A', '0121111360217', null);
INSERT INTO `processbiao` VALUES ('0121111360127', '杨添', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:39:09', '00A', '0121111360127', '2014-11-23 07:40:05');
INSERT INTO `processbiao` VALUES ('0121111360231', '肖瑶', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:39:24', '00A', '0121111360231', '2015-11-11 19:15:26');
INSERT INTO `processbiao` VALUES ('0121111360301', '周道洋', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:39:46', '00A', '0121111360301', '2014-11-21 17:40:02');
INSERT INTO `processbiao` VALUES ('0121111360301', '周道洋', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:40:05', '00A', '0121111360301', null);
INSERT INTO `processbiao` VALUES ('0121111360301', '周道洋', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:40:11', '00A', '0121111360301', '2014-11-21 17:40:32');
INSERT INTO `processbiao` VALUES ('0121111360127', '杨添', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:40:14', '00A', '0121111360127', '2014-11-21 17:40:48');
INSERT INTO `processbiao` VALUES ('0121111360227', '黄云建', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:40:16', '00A', '0121111360227', '2014-11-21 17:41:02');
INSERT INTO `processbiao` VALUES ('0121111360301', '周道洋', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:40:39', '00A', '0121111360301', '2014-11-21 17:40:56');
INSERT INTO `processbiao` VALUES ('0121111360127', '杨添', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:40:55', '00A', '0121111360127', '2014-11-21 17:41:21');
INSERT INTO `processbiao` VALUES ('0121111360227', '黄云建', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:41:15', '00A', '0121111360227', '2014-11-21 17:41:59');
INSERT INTO `processbiao` VALUES ('0121111360612', '颜为朗', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:42:11', '00A', '0121111360612', '2014-11-21 17:43:13');
INSERT INTO `processbiao` VALUES ('0121111360612', '颜为朗', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:42:11', '00A', '0121111360612', '2014-11-23 08:30:51');
INSERT INTO `processbiao` VALUES ('0121111360612', '颜为朗', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:42:12', '00A', '0121111360612', '2014-11-21 17:47:03');
INSERT INTO `processbiao` VALUES ('0121111360612', '颜为朗', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:42:12', '00A', '0121111360612', '2014-11-21 17:47:27');
INSERT INTO `processbiao` VALUES ('0121111360227', '黄云建', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:42:15', '00A', '0121111360227', '2014-11-21 17:42:48');
INSERT INTO `processbiao` VALUES ('0121111360602', '陈志华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:42:15', '00A', '0121111360602', '2014-11-21 17:44:54');
INSERT INTO `processbiao` VALUES ('0121111360602', '陈志华', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:42:15', '00A', '0121111360602', '2014-11-23 07:45:09');
INSERT INTO `processbiao` VALUES ('0121111360602', '陈志华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:42:16', '00A', '0121111360602', '2014-11-21 17:49:11');
INSERT INTO `processbiao` VALUES ('0121111360602', '陈志华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:42:16', '00A', '0121111360602', '2014-11-21 17:46:37');
INSERT INTO `processbiao` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:42:38', '00A', '0121111360231', '2015-11-11 19:15:36');
INSERT INTO `processbiao` VALUES ('0121111360231', '肖瑶', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:43:09', '00A', '0121111360231', '2015-11-11 19:15:42');
INSERT INTO `processbiao` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:44:06', '00A', '0121111360231', '2015-11-11 19:15:49');
INSERT INTO `processbiao` VALUES ('0121111360605', '温林儒', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:52:03', '00A', '0121111360605', null);
INSERT INTO `processbiao` VALUES ('0121111360605', '温林儒', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:52:03', '00A', '0121111360605', '2014-11-21 18:08:14');
INSERT INTO `processbiao` VALUES ('0121111360526', '赵杨', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:53:48', '00A', '0121111360526', '2014-11-21 17:56:33');
INSERT INTO `processbiao` VALUES ('0121111360128', '许渊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:54:07', '00A', '0121111360128', '2014-11-21 17:56:37');
INSERT INTO `processbiao` VALUES ('0121111360128', '许渊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:54:08', '00A', '0121111360128', '2014-11-21 17:59:01');
INSERT INTO `processbiao` VALUES ('0121111360128', '许渊', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:54:12', '00A', '0121111360128', '2014-11-21 17:55:49');
INSERT INTO `processbiao` VALUES ('0121111360128', '许渊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:54:43', '00A', '0121111360128', '2014-11-23 07:20:19');
INSERT INTO `processbiao` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:56:42', '00A', '0121111360526', '2014-11-21 18:03:14');
INSERT INTO `processbiao` VALUES ('0121111360526', '赵杨', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:58:14', '00A', '0121111360526', '2014-11-21 18:03:27');
INSERT INTO `processbiao` VALUES ('0121111360711', '程琢', '过程控制', '液位单闭环控制', '预习', '2014-11-21 18:21:25', '00A', '0121111360711', null);
INSERT INTO `processbiao` VALUES ('0121111360302', '潘超华', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 18:50:32', '00A', '0121111360302', '2014-11-21 18:50:44');
INSERT INTO `processbiao` VALUES ('0121111360608', '傅天翔', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:37:03', '00A', '0121111360608', '2015-10-27 09:40:11');
INSERT INTO `processbiao` VALUES ('0121111360608', '傅天翔', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 19:38:13', '00A', '0121111360608', '2014-11-23 06:04:59');
INSERT INTO `processbiao` VALUES ('0121111360608', '傅天翔', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:39:00', '00A', '0121111360608', '2014-11-21 19:39:49');
INSERT INTO `processbiao` VALUES ('0121111360608', '傅天翔', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:39:53', '00A', '0121111360608', '2014-11-21 19:41:12');
INSERT INTO `processbiao` VALUES ('0121111360616', '邓缘林', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 19:42:29', '00A', '0121111360616', '2014-11-23 06:03:12');
INSERT INTO `processbiao` VALUES ('0121111360616', '邓缘林', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:42:29', '00A', '0121111360616', '2014-11-21 19:43:35');
INSERT INTO `processbiao` VALUES ('0121111360616', '邓缘林', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:42:29', '00A', '0121111360616', '2014-11-21 19:47:03');
INSERT INTO `processbiao` VALUES ('0121111360616', '邓缘林', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:42:29', '00A', '0121111360616', '2014-11-21 19:46:22');
INSERT INTO `processbiao` VALUES ('0121111360615', '张小兵', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:50:35', '00A', '0121111360615', '2014-11-21 19:51:56');
INSERT INTO `processbiao` VALUES ('0121111360615', '张小兵', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 19:52:09', '00A', '0121111360615', '2014-11-23 06:07:48');
INSERT INTO `processbiao` VALUES ('0121111360615', '张小兵', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:52:56', '00A', '0121111360615', '2014-11-21 19:53:35');
INSERT INTO `processbiao` VALUES ('0121111360615', '张小兵', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:53:42', '00A', '0121111360615', '2014-11-21 19:55:03');
INSERT INTO `processbiao` VALUES ('0121111360317', '周晓奇', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 05:28:39', '00A', '0121111360317', '2015-11-11 19:19:39');
INSERT INTO `processbiao` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预约完成', '2014-11-23 03:34:55', '00A', '222222', '2014-11-23 03:38:39');
INSERT INTO `processbiao` VALUES ('222222', 'CC', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 03:38:50', '00A', '222222', '2015-01-19 16:35:04');
INSERT INTO `processbiao` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 03:40:25', '00A', '222222', '2014-11-23 07:12:40');
INSERT INTO `processbiao` VALUES ('0121111360227', '黄云建', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:06:27', '00A', '0121111360227', '2014-11-23 06:06:40');
INSERT INTO `processbiao` VALUES ('0121111360223', '贾磊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 06:50:03', '00A', '0121111360223', '2014-11-23 06:50:35');
INSERT INTO `processbiao` VALUES ('0121111360202', '罗君', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 06:51:48', '00A', '0121111360202', '2014-11-23 06:52:24');
INSERT INTO `processbiao` VALUES ('0121111360207', '尹英豪', '过程控制', '上水箱对象特性', '预习', '2014-11-23 06:58:21', '00A', '0121111360207', null);
INSERT INTO `processbiao` VALUES ('0121111360201', '周青', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 07:05:55', '00A', '0121111360201', '2014-11-23 07:12:25');
INSERT INTO `processbiao` VALUES ('0121111360201', '周青', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 07:05:55', '00A', '0121111360201', '2014-11-23 07:15:24');
INSERT INTO `processbiao` VALUES ('0121111360201', '周青', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:12:16', '00A', '0121111360201', '2014-11-23 07:13:05');
INSERT INTO `processbiao` VALUES ('0121111360201', '周青', '过程控制', '流量液位串级控制', '预习完成', '2014-11-23 07:13:09', '00A', '0121111360201', '2014-11-23 07:16:33');
INSERT INTO `processbiao` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2014-11-23 09:01:59', '00A', '0121111360212', '2015-10-26 21:08:58');
INSERT INTO `processbiao` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 09:02:38', '00A', '0121111360212', '2015-10-26 21:08:52');
INSERT INTO `processbiao` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预习完成', '2014-11-23 09:03:22', '00A', '0121111360212', '2015-10-26 10:37:39');
INSERT INTO `processbiao` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 09:03:51', '00A', '0121111360212', '2015-10-26 11:15:51');
INSERT INTO `processbiao` VALUES ('0121111360213', '王若飞', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 18:10:10', '00A', '0121111360213', '2014-11-23 18:11:18');
INSERT INTO `processbiao` VALUES ('222222', null, '过程控制', '上水箱对象特性', '预习', '2015-01-14 06:12:08', '00A', '222222', null);
INSERT INTO `processbiao` VALUES ('99', '99', '过程控制', '上水箱对象特性', '预约完成', '2015-09-22 17:02:37', '00A', '99', '2015-10-22 20:27:26');
INSERT INTO `processbiao` VALUES ('99', '99', '过程控制', '液位单闭环控制', '预约完成', '2015-09-23 17:35:25', '00A', '99', '2015-10-22 20:27:37');
INSERT INTO `processbiao` VALUES ('99', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-09-23 17:35:55', '00A', '99', '2015-10-22 20:26:39');
INSERT INTO `processbiao` VALUES ('888888', '某学生', '过程控制', '上水箱对象特性', '预习', '2015-10-03 15:23:46', '00A', '888888', null);
INSERT INTO `processbiao` VALUES ('99', '99', '过程控制', '史密斯预估实验', '预约完成', '2015-10-22 20:28:59', '00A', '99', '2015-10-22 20:29:40');
INSERT INTO `processbiao` VALUES ('999', '999', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:52:43', '00A', '999', '2015-10-26 16:52:55');
INSERT INTO `processbiao` VALUES ('0121111360712', '胡亚清', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:21:46', '00A', '0121111360712', '2015-11-11 19:21:59');

-- ----------------------------
-- Table structure for `processhist`
-- ----------------------------
DROP TABLE IF EXISTS `processhist`;
CREATE TABLE `processhist` (
  `studentid` varchar(50) DEFAULT NULL,
  `studentname` varchar(20) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '记录学生某一科的某一个试验下的子实验进行到哪一步骤（如过程控制学科的单闭环回路实验的流量单闭环，预习——测试——预约——实验——提交报告等阶段）',
  `changetime` varchar(20) DEFAULT NULL COMMENT '阶段改变时间',
  `caozuo` varchar(20) DEFAULT NULL COMMENT '初始阶段为新增，之后都为修改',
  KEY `studentid` (`studentid`),
  CONSTRAINT `studentid` FOREIGN KEY (`studentid`) REFERENCES `studentsinf` (`studentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of processhist
-- ----------------------------
INSERT INTO `processhist` VALUES ('0121017550524', null, '过程控制', '上水箱对象特性', '预习', '2014-10-23 12:50:46', '新增');
INSERT INTO `processhist` VALUES ('0121017550524', null, '过程控制', '上水箱对象特性', '预习完成', '2014-10-23 13:02:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', null, '过程控制', '上水箱对象特性', '预习', '2014-10-23 13:05:19', '新增');
INSERT INTO `processhist` VALUES ('0121111360101', null, '过程控制', '上水箱对象特性', '预习完成', '2014-10-23 13:05:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', null, '过程控制', '上水箱对象特性', '测试完成', '2014-10-23 14:34:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', null, '过程控制', '上水箱对象特性', '预约完成', '2014-10-23 14:35:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', null, '过程控制', '上水箱对象特性', '实验完成', '2014-10-23 14:36:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', null, '过程控制', '上水箱对象特性', '预习', '2014-10-23 14:51:13', '新增');
INSERT INTO `processhist` VALUES ('0121111360102', null, '过程控制', '上水箱对象特性', '预习完成', '2014-10-23 14:52:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', null, '过程控制', '上水箱对象特性', '测试完成', '2014-10-23 14:53:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', null, '过程控制', '上水箱对象特性', '预习', '2014-10-23 15:25:50', '新增');
INSERT INTO `processhist` VALUES ('0121111360103', null, '过程控制', '上水箱对象特性', '预习完成', '2014-10-23 15:35:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', null, '过程控制', '液位单闭环控制', '预习', '2014-10-25 12:44:51', '新增');
INSERT INTO `processhist` VALUES ('0121111360105', '林国枝', '过程控制', '上水箱对象特性', '预习', '2014-10-27 09:12:23', '新增');
INSERT INTO `processhist` VALUES ('0121111360105', '林国枝', '过程控制', '上水箱对象特性', '预习完成', '2014-10-27 09:13:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '林国枝', '过程控制', '上水箱对象特性', '测试完成', '2014-10-27 10:17:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '龚良文', '过程控制', '上水箱对象特性', '预习', '2014-10-27 11:17:08', '新增');
INSERT INTO `processhist` VALUES ('0121111360201', '龚良文', '过程控制', '上水箱对象特性', '预习完成', '2014-10-27 11:19:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '龚良文', '过程控制', '上水箱对象特性', '测试完成', '2014-10-27 11:21:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '秦煌', '过程控制', '上水箱对象特性', '预习', '2014-10-31 10:22:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360131', '秦煌', '过程控制', '上水箱对象特性', '预习完成', '2014-10-31 10:23:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '秦煌', '过程控制', '上水箱对象特性', '测试完成', '2014-10-31 10:25:46', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', null, '过程控制', '上水箱对象特性', '预习完成', '2014-10-23 12:50:46', '删除');
INSERT INTO `processhist` VALUES ('0121111360101', null, '过程控制', '上水箱对象特性', '实验完成', '2014-10-23 13:05:19', '删除');
INSERT INTO `processhist` VALUES ('0121111360102', null, '过程控制', '上水箱对象特性', '测试完成', '2014-10-23 14:51:13', '删除');
INSERT INTO `processhist` VALUES ('0121111360103', null, '过程控制', '上水箱对象特性', '预习完成', '2014-10-23 15:25:50', '删除');
INSERT INTO `processhist` VALUES ('0121111360115', null, '过程控制', '液位单闭环控制', '预习', '2014-10-25 12:44:51', '删除');
INSERT INTO `processhist` VALUES ('0121017550524', '陈万委', '过程控制', '上水箱对象特性', '预习', '2014-11-02 10:03:55', '新增');
INSERT INTO `processhist` VALUES ('0121017550524', '陈万委', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 18:06:59', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '陈万委', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 18:06:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '液位单闭环控制', '预习', '2014-11-04 18:20:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 18:20:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '上水箱对象特性', '预习', '2014-11-04 18:24:38', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 18:25:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '液位单闭环控制', '预习', '2014-11-04 18:30:01', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 18:53:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 18:53:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', null, '过程控制', '流量液位串级控制', '预习', '2014-11-04 18:54:58', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', null, '过程控制', '流量液位串级控制', '预习', '2014-11-04 18:54:58', '删除');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '流量液位串级控制', '预习', '2014-11-04 18:56:39', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 18:56:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 18:56:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '李凯', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 18:56:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '秦煌', '过程控制', '流量液位串级控制', '预习', '2014-11-04 19:03:01', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '上水箱对象特性', '预习', '2014-11-04 19:29:08', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 19:29:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 19:29:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '流量液位串级控制', '预习', '2014-11-04 19:29:46', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 19:29:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 19:29:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 19:29:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '史密斯预估实验', '预习', '2014-11-04 19:30:09', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 19:30:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 19:30:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 19:30:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '朱洋', '过程控制', '史密斯预估实验', '预习完成', '2014-11-04 19:30:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '李南江', '过程控制', '液位单闭环控制', '预习', '2014-11-04 20:55:06', '新增');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '上水箱对象特性', '预习', '2014-11-04 21:47:28', '新增');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 21:47:55', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '液位单闭环控制', '预习', '2014-11-04 21:49:08', '新增');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 21:50:51', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 21:50:51', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '流量液位串级控制', '预习', '2014-11-04 21:52:39', '新增');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 21:53:28', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 21:53:28', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 21:53:28', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '史密斯预估实验', '预习', '2014-11-04 21:54:44', '新增');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '上水箱对象特性', '预习完成', '2014-11-04 21:55:10', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '液位单闭环控制', '预习完成', '2014-11-04 21:55:10', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '流量液位串级控制', '预习完成', '2014-11-04 21:55:10', '修改');
INSERT INTO `processhist` VALUES ('111111', 'mm', '过程控制', '史密斯预估实验', '预习完成', '2014-11-04 21:55:10', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预习', '2014-11-05 10:54:54', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预习完成', '2014-11-05 10:55:09', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预约完成', '2014-11-05 10:57:03', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预习完成', '2014-11-05 10:57:03', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '上水箱对象特性', '预习', '2014-11-05 15:19:35', '新增');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '液位单闭环控制', '预习', '2014-11-05 15:23:31', '新增');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '流量液位串级控制', '预习', '2014-11-06 04:31:43', '新增');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '史密斯预估实验', '预习', '2014-11-06 04:33:35', '新增');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '上水箱对象特性', '预习', '2014-11-06 07:02:05', '新增');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '上水箱对象特性', '????', '2014-11-06 10:02:55', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '液位单闭环控制', '预习完成', '2014-11-06 10:07:14', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '液位单闭环控制', '预约完成', '2014-11-06 10:08:06', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '液位单闭环控制', '预约完成', '2014-11-06 10:08:06', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '流量液位串级控制', '预习完成', '2014-11-06 10:24:13', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '流量液位串级控制', '预约完成', '2014-11-06 10:24:49', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '流量液位串级控制', '预约完成', '2014-11-06 10:24:49', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '史密斯预估实验', '预习完成', '2014-11-06 10:36:22', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '史密斯预估实验', '预约完成', '2014-11-06 10:36:47', '修改');
INSERT INTO `processhist` VALUES ('333333', 'VV', '过程控制', '史密斯预估实验', '预约完成', '2014-11-06 10:36:47', '修改');
INSERT INTO `processhist` VALUES ('666666', '1234', '过程控制', '上水箱对象特性', '预习', '2014-11-06 10:59:23', '新增');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '上水箱对象特性', '预习', '2014-11-06 11:02:10', '新增');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预习', '2014-11-06 11:05:48', '新增');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预习完成', '2014-11-06 11:06:17', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预约完成', '2014-11-06 11:06:43', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预约完成', '2014-11-06 11:06:43', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预习完成', '2014-11-06 11:06:43', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '上水箱对象特性', '预习', '2014-11-06 11:10:12', '新增');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预约完成', '2014-11-06 11:10:29', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '液位单闭环控制', '预约完成', '2014-11-06 11:10:29', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '流量液位串级控制', '预习', '2014-11-06 11:11:37', '新增');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '上水箱对象特性', '预习完成', '2014-11-06 11:11:51', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '流量液位串级控制', '预习完成', '2014-11-06 11:12:45', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '流量液位串级控制', '预习', '2014-11-06 11:13:00', '新增');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '流量液位串级控制', '预习完成', '2014-11-06 11:13:18', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '史密斯预估实验', '预习', '2014-11-06 11:13:28', '新增');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '史密斯预估实验', '预习完成', '2014-11-06 11:13:36', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '液位单闭环控制', '预习', '2014-11-06 11:13:44', '新增');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '液位单闭环控制', '预习完成', '2014-11-06 11:13:59', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '流量液位串级控制', '预约完成', '2014-11-06 11:17:31', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '流量液位串级控制', '预约完成', '2014-11-06 11:17:31', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '上水箱对象特性', '预习完成', '2014-11-11 16:30:50', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '上水箱对象特性', '预约完成', '2014-11-11 16:31:53', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '上水箱对象特性', '预约完成', '2014-11-11 16:31:53', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预习', '2014-11-11 16:32:46', '新增');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预习完成', '2014-11-11 16:34:31', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预约完成', '2014-11-11 16:35:39', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预约完成', '2014-11-11 16:35:39', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预习完成', '2014-11-11 16:35:39', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预约完成', '2014-11-11 16:37:35', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '液位单闭环控制', '预约完成', '2014-11-11 16:37:35', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '流量液位串级控制', '预习', '2014-11-11 16:38:21', '新增');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '流量液位串级控制', '预习完成', '2014-11-11 16:38:36', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '流量液位串级控制', '预约完成', '2014-11-11 16:39:20', '修改');
INSERT INTO `processhist` VALUES ('444444', '123', '过程控制', '流量液位串级控制', '预约完成', '2014-11-11 16:39:20', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预约完成', '2014-11-12 15:21:26', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预约完成', '2014-11-12 15:21:26', '修改');
INSERT INTO `processhist` VALUES ('111111', null, '过程控制', '上水箱对象特性', '预习', '2014-11-19 05:10:04', '新增');
INSERT INTO `processhist` VALUES ('111111', null, '过程控制', '上水箱对象特性', '预习', '2014-11-19 05:13:06', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习', '2014-11-19 09:44:00', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '流量液位串级控制', '预习', '2014-11-19 10:26:56', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '史密斯预估实验', '预习', '2014-11-19 10:27:07', '新增');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '上水箱对象特性', '预约完成', '2014-11-19 13:39:57', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '上水箱对象特性', '预约完成', '2014-11-19 13:39:57', '修改');
INSERT INTO `processhist` VALUES ('666666', '1234', '过程控制', '液位单闭环控制', '预习', '2014-11-20 04:26:01', '新增');
INSERT INTO `processhist` VALUES ('666666', '1234', '过程控制', '流量液位串级控制', '预习', '2014-11-20 04:26:12', '新增');
INSERT INTO `processhist` VALUES ('666666', '1234', '过程控制', '史密斯预估实验', '预习', '2014-11-20 04:26:18', '新增');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '上水箱对象特性', '预习完成', '2014-11-20 04:26:33', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预习完成', '2014-11-12 15:21:26', '修改');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '史密斯预估实验', '预习', '2014-11-20 04:28:07', '新增');
INSERT INTO `processhist` VALUES ('777777', '12345', '过程控制', '史密斯预估实验', '预习完成', '2014-11-20 04:28:24', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-20 05:27:13', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-20 05:27:21', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-20 05:27:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '上水箱对象特性', '预习', '2014-11-21 13:59:11', '新增');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:07:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:07:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:07:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:07:48', '新增');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:10:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:15:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '流量液位串级控制', '预习', '2014-11-21 14:15:56', '新增');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:15:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:17:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:17:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:17:32', '新增');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:17:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:17:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:17:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:17:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '史密斯预估实验', '预习', '2014-11-21 14:18:19', '新增');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 14:18:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:19:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360527', '史森炬', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:19:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '史密斯预估实验', '预习', '2014-11-21 14:27:10', '新增');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:27:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:27:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:28:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:28:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '流量液位串级控制', '预习', '2014-11-21 14:28:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:28:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:28:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:28:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 14:29:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:29:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:29:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:30:35', '新增');
INSERT INTO `processhist` VALUES ('0121111360706', '邢彦一', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:30:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:37:08', '新增');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:38:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:40:47', '新增');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:40:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:40:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:40:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:41:15', '新增');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:41:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '流量液位串级控制', '预习', '2014-11-21 14:42:51', '新增');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:43:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:43:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:43:13', '新增');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:43:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:43:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:43:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:43:28', '新增');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '史密斯预估实验', '预习', '2014-11-21 14:43:28', '新增');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:43:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:43:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '流量液位串级控制', '预习', '2014-11-21 14:44:07', '新增');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 14:44:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:44:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:44:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360524', '张利虎', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:44:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:44:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:44:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '史密斯预估实验', '预习', '2014-11-21 14:45:04', '新增');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 14:45:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:45:23', '新增');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:45:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:46:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:46:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:46:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:46:13', '新增');
INSERT INTO `processhist` VALUES ('0121111360312', '周恒', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:46:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '流量液位串级控制', '预习', '2014-11-21 14:47:00', '新增');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:47:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:47:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预习', '2014-11-21 14:48:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:48:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:49:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:49:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:49:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:49:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '史密斯预估实验', '预习', '2014-11-21 14:49:35', '新增');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 14:49:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:50:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:50:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '史密斯预估实验', '预习', '2014-11-21 14:50:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 14:50:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:50:43', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:50:43', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:50:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360315', '陈天培', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:50:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:51:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:51:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:51:52', '新增');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:51:52', '新增');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '流量液位串级控制', '预习', '2014-11-21 14:51:53', '新增');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '史密斯预估实验', '预习', '2014-11-21 14:51:53', '新增');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 14:52:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:52:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:52:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:52:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:53:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:53:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 14:53:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:53:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:53:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 14:53:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360316', '尹凡', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 14:53:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '液位单闭环控制', '预习', '2014-11-21 14:53:39', '新增');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 14:53:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:55:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:55:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 14:55:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '上水箱对象特性', '预习', '2014-11-21 14:57:23', '新增');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:57:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360413', '赵玄', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 14:57:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:02:21', '新增');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:02:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:02:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:02:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:02:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:02:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:03:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:03:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:03:23', '新增');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:03:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:03:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:03:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:22:24', '新增');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:22:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:22:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:23:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:24:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:24:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:24:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:24:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:24:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:25:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:25:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360522', '孙靖哲', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:25:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:38:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:38:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:39:18', '新增');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:39:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:39:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:39:33', '新增');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:39:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:39:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:39:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:40:02', '新增');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:40:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:40:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360502', '黄振伟', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:40:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:40:46', '新增');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:47:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:47:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:47:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:47:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预习', '2014-11-21 15:47:53', '新增');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 15:48:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:48:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:48:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:49:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:49:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:49:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:49:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:49:43', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:49:43', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '液位单闭环控制', '预习', '2014-11-21 15:49:45', '新增');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:49:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:50:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:50:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 15:50:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:50:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:51:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360713', '王宇', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:51:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:52:56', '新增');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:53:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:53:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:53:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:53:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:53:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:53:37', '新增');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:53:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:53:38', '新增');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:53:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:53:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:53:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:54:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:54:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:54:09', '新增');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:54:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:54:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:54:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:54:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 15:54:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:54:31', '新增');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '上水箱对象特性', '预习', '2014-11-21 15:55:13', '新增');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:55:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:57:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 15:57:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:58:20', '新增');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:58:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:58:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预习', '2014-11-21 15:58:48', '新增');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:58:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 15:58:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '预习', '2014-11-21 15:59:04', '新增');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:59:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:59:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:59:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 15:58:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:59:18', '新增');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:59:27', '新增');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 15:59:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 15:59:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预习', '2014-11-21 15:59:48', '新增');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 15:59:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:00:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:00:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:00:08', '新增');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:00:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:00:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360534', '吴月', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:00:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:01:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:02:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:02:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:02:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:02:07', '新增');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:02:27', '新增');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:02:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:02:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:02:40', '新增');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:02:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:02:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:02:52', '新增');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:03:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:03:05', '新增');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:03:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:03:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:03:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:03:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:03:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:04:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:04:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:05:43', '新增');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:05:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:06:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:06:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:06:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:07:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360430', '杜珍珍', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:07:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:07:28', '新增');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:07:32', '新增');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:07:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:07:43', '新增');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:07:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:09:21', '新增');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:09:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:09:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:09:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:09:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:09:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:10:04', '新增');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:10:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:10:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:10:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:10:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:10:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:10:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:10:32', '新增');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:10:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:10:41', '新增');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:10:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:10:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:10:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:10:57', '新增');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:11:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360131', '李彤', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:11:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:11:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:11:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360710', '赵磊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:11:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:11:31', '新增');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:11:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:11:44', '新增');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:11:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:11:54', '新增');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:12:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:12:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:12:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:12:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:12:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 16:12:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:13:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:03:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:17:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:17:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:17:57', '新增');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:19:07', '新增');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:19:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:20:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:20:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:20:18', '新增');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:20:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:21:13', '新增');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:21:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360314', '夏鹏辉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:21:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:21:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:22:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:22:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:22:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:23:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:23:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:23:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:23:47', '新增');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:23:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:23:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:24:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:24:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:24:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:24:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:25:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:27:28', '新增');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:27:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:27:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:27:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:28:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:28:19', '新增');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:28:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:28:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:28:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:29:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:29:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:29:48', '新增');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:29:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:30:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360401', '单跃跃', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:30:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:32:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:32:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:32:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:32:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:32:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:32:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:32:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:33:27', '新增');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:33:32', '新增');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:33:33', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:33:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:33:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:33:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:34:00', '新增');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:34:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:34:10', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:34:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:34:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:34:22', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:34:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:34:27', '新增');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:34:30', '新增');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:34:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:34:42', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:34:43', '修改');
INSERT INTO `processhist` VALUES ('0121111360731', '胡棉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:34:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:35:19', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:35:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:35:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:36:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:36:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:36:30', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:36:44', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:36:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:36:52', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:36:52', '新增');
INSERT INTO `processhist` VALUES ('0121111360735', '胡国欣', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:36:52', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:37:01', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:37:23', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:37:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:37:36', '新增');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:37:36', '新增');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:37:36', '新增');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:37:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:37:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:38:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:39:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:40:21', '新增');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:41:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:41:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:41:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:41:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360311', '程思伟', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:41:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:45:02', '新增');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:45:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:45:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:45:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:45:44', '新增');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:45:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:45:59', '新增');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:46:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:46:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:46:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:46:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '上水箱对象特性', '预习', '2014-11-21 16:46:50', '新增');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:46:50', '新增');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:46:50', '新增');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '流量液位串级控制', '预习', '2014-11-21 16:46:50', '新增');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '史密斯预估实验', '预习', '2014-11-21 16:46:53', '新增');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:47:04', '新增');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:50:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:50:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:50:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360521', '孙明军', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:50:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:51:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:51:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:52:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:52:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 16:52:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:53:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 16:53:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:53:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:53:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360531', '刘超群', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 16:54:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:55:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:57:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 16:57:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:58:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:59:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 16:59:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '液位单闭环控制', '预习', '2014-11-21 16:59:02', '新增');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:00:26', '新增');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:00:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:00:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:00:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:00:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:00:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:05:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:05:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:06:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:06:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:06:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:06:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:07:26', '新增');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:07:28', '新增');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:07:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:08:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:08:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:09:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:09:19', '新增');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:09:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:09:30', '新增');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 16:04:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:09:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:09:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:09:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:09:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:10:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:10:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:10:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:10:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:10:13', '新增');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:10:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:10:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:10:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:10:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:10:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:10:41', '新增');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:10:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:10:58', '新增');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:11:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:11:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360407', '郝文汉', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:11:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:11:57', '新增');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:11:58', '新增');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:12:39', '新增');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:12:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:13:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:13:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:13:31', '新增');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:13:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:14:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:14:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:15:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:15:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:15:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:15:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:16:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:16:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:16:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:16:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:16:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:17:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:17:13', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:17:13', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:17:55', '新增');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:17:56', '新增');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:17:56', '新增');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:17:59', '新增');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:18:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:18:48', '新增');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:18:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:19:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:18:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:19:10', '新增');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:19:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:19:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:19:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:19:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:19:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:19:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:19:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:19:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:20:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:20:15', '新增');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:20:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:20:19', '新增');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:20:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:20:21', '新增');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:20:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:20:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:20:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:20:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:20:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:20:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:20:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:20:46', '新增');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:20:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:21:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:21:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:21:17', '新增');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:21:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:21:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:21:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:21:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360701', '魏迪', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:21:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:23:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360110', '邱卫林', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:23:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:24:30', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:24:33', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:24:33', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:24:34', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:24:34', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:24:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:24:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360506', '邵磊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:24:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:24:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:25:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:26:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:26:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:26:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:26:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:27:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:27:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:27:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:27:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:27:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:27:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:27:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:27:43', '新增');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:27:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:28:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:28:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:28:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:28:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:28:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:28:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:28:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:28:36', '新增');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:28:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:28:40', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:28:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:28:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:28:56', '新增');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:28:59', '新增');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:29:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:29:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:29:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:29:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:29:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:29:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:29:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360601', '汪健', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:29:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:29:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:29:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:30:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:30:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:30:09', '新增');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:30:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:30:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:30:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:30:43', '新增');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:30:43', '新增');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:30:50', '新增');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:30:50', '新增');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:30:51', '新增');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:30:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:31:01', '新增');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:31:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:31:04', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:31:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:31:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:31:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:31:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:31:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:31:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:31:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:31:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:32:32', '新增');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:32:37', '新增');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:32:37', '新增');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:32:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:32:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:32:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:32:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:32:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:33:31', '新增');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:33:47', '新增');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:33:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:34:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:34:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:34:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:34:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:34:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:35:10', '新增');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:35:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:35:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:35:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:35:40', '新增');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:35:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:35:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:35:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:36:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:36:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:36:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:36:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:36:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:36:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:36:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:36:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360414', '李成', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:36:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:37:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:37:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:37:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:37:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:37:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:37:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:37:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:37:51', '新增');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:37:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:37:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:38:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:38:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:38:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360406', '张文华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:38:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:38:20', '新增');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:38:20', '新增');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:38:23', '新增');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:38:38', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:38:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:38:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:39:09', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:39:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:39:24', '新增');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:39:46', '新增');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:39:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:40:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:40:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:40:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:40:05', '新增');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:40:11', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:40:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:40:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:40:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:40:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:40:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:40:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:40:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:40:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:40:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:40:39', '新增');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:40:41', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:40:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:40:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:40:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:40:55', '新增');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:40:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360301', '周道洋', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:40:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:41:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:41:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:41:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:41:15', '新增');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:41:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:41:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:41:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360217', '王凯', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:41:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:41:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:41:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:41:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:42:11', '新增');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:42:11', '新增');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:42:12', '新增');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:42:12', '新增');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:42:15', '新增');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:42:15', '新增');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:42:15', '新增');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:42:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:42:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:42:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:42:38', '新增');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:42:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:42:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:42:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:42:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:42:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:43:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预约完成', '2014-11-21 17:43:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:43:09', '新增');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:43:13', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:43:13', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:43:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:43:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:43:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:43:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:44:06', '新增');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:44:21', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:44:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:44:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:44:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:44:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:44:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:45:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:46:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:46:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:46:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:46:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:47:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:47:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:47:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:47:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:47:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 15:59:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:49:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:49:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:49:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:49:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:49:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:49:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:50:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:50:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:50:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:52:03', '新增');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:52:03', '新增');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:52:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:53:48', '新增');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:54:07', '新增');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:54:08', '新增');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '上水箱对象特性', '预习', '2014-11-21 17:54:12', '新增');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:54:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '液位单闭环控制', '预习', '2014-11-21 17:54:43', '新增');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:54:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:55:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 17:55:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:55:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:55:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:55:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:56:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:56:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:56:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:56:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预习', '2014-11-21 17:56:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:56:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:58:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 17:58:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:43:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '史密斯预估实验', '预习', '2014-11-21 17:58:14', '新增');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 17:58:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:58:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 17:58:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:59:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 17:59:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 17:58:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 18:02:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 18:02:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 18:02:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 18:02:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:02:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:02:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 18:03:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 18:03:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:03:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360526', '赵杨', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:03:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 18:03:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 17:13:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 18:04:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 18:04:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 18:06:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 18:06:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:08:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360605', '温林儒', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:08:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 18:10:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:10:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360102', '伍浩', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 18:10:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360711', '程琢', '过程控制', '液位单闭环控制', '预习', '2014-11-21 18:21:25', '新增');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '液位单闭环控制', '预习', '2014-11-21 18:50:32', '新增');
INSERT INTO `processhist` VALUES ('0121111360302', '潘超华', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 18:50:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '上水箱对象特性', '预习', '2014-11-21 19:37:03', '新增');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 19:37:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:37:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:37:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '液位单闭环控制', '预习', '2014-11-21 19:38:13', '新增');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 19:38:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '流量液位串级控制', '预习', '2014-11-21 19:39:00', '新增');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 19:39:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:39:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:39:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '史密斯预估实验', '预习', '2014-11-21 19:39:53', '新增');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 19:39:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:41:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:41:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '液位单闭环控制', '预习', '2014-11-21 19:42:29', '新增');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '上水箱对象特性', '预习', '2014-11-21 19:42:29', '新增');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '史密斯预估实验', '预习', '2014-11-21 19:42:29', '新增');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '流量液位串级控制', '预习', '2014-11-21 19:42:29', '新增');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 19:42:41', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:43:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:43:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 19:44:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 19:45:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:46:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:46:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 19:46:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:47:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:47:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '上水箱对象特性', '预习', '2014-11-21 19:50:35', '新增');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 19:50:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:51:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '上水箱对象特性', '预约完成', '2014-11-21 19:51:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '液位单闭环控制', '预习', '2014-11-21 19:52:09', '新增');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '液位单闭环控制', '预习完成', '2014-11-21 19:52:40', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '流量液位串级控制', '预习', '2014-11-21 19:52:56', '新增');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 19:53:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:53:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '流量液位串级控制', '预约完成', '2014-11-21 19:53:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '史密斯预估实验', '预习', '2014-11-21 19:53:42', '新增');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 19:53:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:55:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '史密斯预估实验', '预约完成', '2014-11-21 19:55:03', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 03:05:25', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 03:05:25', '修改');
INSERT INTO `processhist` VALUES ('888888', '123456', '过程控制', '液位单闭环控制', '预习完成', '2014-11-22 03:05:25', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-20 05:27:21', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 03:16:23', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 03:16:23', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-22 03:16:23', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 03:53:28', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 03:53:28', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '流量液位串级控制', '预习完成', '2014-11-22 03:54:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '史密斯预估实验', '预习完成', '2014-11-22 04:44:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '史密斯预估实验', '预约完成', '2014-11-22 04:44:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '史密斯预估实验', '预约完成', '2014-11-22 04:44:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '液位单闭环控制', '预习', '2014-11-22 05:28:39', '新增');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '液位单闭环控制', '预习完成', '2014-11-22 05:30:40', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 05:30:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 05:30:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 17:23:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360123', '张剑桥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 17:23:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 17:25:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 17:25:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 18:21:45', '修改');
INSERT INTO `processhist` VALUES ('0121111360105', '王槐', '过程控制', '液位单闭环控制', '预约完成', '2014-11-22 18:21:45', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '流量液位串级控制', '预约完成', '2014-11-23 03:13:34', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '流量液位串级控制', '预约完成', '2014-11-23 03:13:34', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-22 03:53:28', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 03:14:22', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 03:14:22', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '流量液位串级控制', '预习完成', '2014-11-23 03:13:34', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 03:14:22', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 03:22:49', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 03:22:49', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 03:22:49', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预习完成', '2014-11-05 10:54:54', '删除');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-19 09:44:00', '删除');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '流量液位串级控制', '预习完成', '2014-11-19 10:26:56', '删除');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '史密斯预估实验', '预习', '2014-11-19 10:27:07', '删除');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预习', '2014-11-23 03:34:55', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 03:35:17', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预约完成', '2014-11-23 03:38:39', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '上水箱对象特性', '预约完成', '2014-11-23 03:38:39', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '史密斯预估实验', '预习', '2014-11-23 03:38:50', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 03:39:01', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习', '2014-11-23 03:40:25', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 03:40:34', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 03:40:42', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 03:40:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 05:04:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360115', '廖佳成', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 05:04:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:03:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360616', '邓缘林', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:03:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:04:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:04:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '液位单闭环控制', '预习', '2014-11-23 06:06:27', '新增');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 06:06:34', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:06:40', '修改');
INSERT INTO `processhist` VALUES ('0121111360227', '黄云建', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:06:40', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:07:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360615', '张小兵', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:07:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:08:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360103', '邱艺铭', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:08:17', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:14:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:14:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 06:16:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 06:17:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 06:18:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360215', '余必秀', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 06:18:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:23:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360233', '王陈', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:23:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:42:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360629', '李怡', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 06:42:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 06:49:41', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '史密斯预估实验', '预习', '2014-11-23 06:50:03', '新增');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 06:50:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 06:50:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360223', '贾磊', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 06:50:35', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '上水箱对象特性', '预习', '2014-11-23 06:51:48', '新增');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 06:52:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 06:52:57', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 06:53:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360202', '罗君', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 06:53:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360207', '尹英豪', '过程控制', '上水箱对象特性', '预习', '2014-11-23 06:58:21', '新增');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:00:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:00:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '上水箱对象特性', '预习', '2014-11-23 07:05:55', '新增');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '史密斯预估实验', '预习', '2014-11-23 07:05:55', '新增');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '液位单闭环控制', '预习', '2014-11-23 07:12:16', '新增');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 07:12:25', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 03:40:42', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:12:40', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:12:40', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 07:12:40', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 07:12:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:13:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:13:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '流量液位串级控制', '预习', '2014-11-23 07:13:09', '新增');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '流量液位串级控制', '预习完成', '2014-11-23 07:13:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 07:15:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 07:15:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 07:15:24', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '流量液位串级控制', '预约完成', '2014-11-23 07:16:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '流量液位串级控制', '预约完成', '2014-11-23 07:16:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360201', '周青', '过程控制', '流量液位串级控制', '预习完成', '2014-11-23 07:16:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:20:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360128', '许渊', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:20:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:23:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360634', '綦韦唯', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:23:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:40:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360127', '杨添', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:40:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:45:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360602', '陈志华', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 07:45:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 08:30:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360612', '颜为朗', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 08:30:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习', '2014-11-23 09:01:59', '新增');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 09:02:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预习', '2014-11-23 09:02:38', '新增');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 09:02:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 09:02:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 09:02:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预习', '2014-11-23 09:03:22', '新增');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预习完成', '2014-11-23 09:03:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2014-11-23 09:03:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2014-11-23 09:03:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习', '2014-11-23 09:03:51', '新增');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 09:03:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 09:04:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2014-11-23 09:04:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 10:56:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 10:56:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 10:58:15', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 10:58:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360732', '李源', '过程控制', '液位单闭环控制', '预约完成', '2014-11-23 10:58:22', '修改');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '上水箱对象特性', '预习', '2014-11-23 18:10:10', '新增');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 18:10:46', '修改');
INSERT INTO `processhist` VALUES ('0121111360213', '王若飞', '过程控制', '上水箱对象特性', '预习完成', '2014-11-23 18:11:18', '修改');
INSERT INTO `processhist` VALUES ('222222', null, '过程控制', '上水箱对象特性', '预习', '2015-01-14 06:12:08', '新增');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '史密斯预估实验', '预约完成', '2015-01-19 16:35:04', '修改');
INSERT INTO `processhist` VALUES ('222222', 'CC', '过程控制', '史密斯预估实验', '预约完成', '2015-01-19 16:35:04', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预习', '2015-09-22 17:02:37', '新增');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预习', '2015-09-22 17:18:15', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预习完成', '2015-09-22 17:18:15', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预约完成', '2015-09-23 17:29:16', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预约完成', '2015-09-23 17:29:16', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预习完成', '2015-09-23 17:29:16', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '液位单闭环控制', '预习', '2015-09-23 17:35:25', '新增');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预习', '2015-09-23 17:35:55', '新增');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '液位单闭环控制', '预习完成', '2015-09-23 17:50:12', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '液位单闭环控制', '预约完成', '2015-09-23 17:50:22', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '液位单闭环控制', '预约完成', '2015-09-23 17:50:22', '修改');
INSERT INTO `processhist` VALUES ('888888', '某学生', '过程控制', '上水箱对象特性', '预习', '2015-10-03 15:23:46', '新增');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预习完成', '2015-10-22 19:56:07', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:05:05', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:05:05', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预习完成', '2015-10-22 20:05:05', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '液位单闭环控制', '预习完成', '2015-09-23 17:50:22', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:20:27', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:20:27', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预习完成', '2015-09-23 17:29:16', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预习完成', '2015-10-22 20:20:27', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:25:16', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:25:16', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预习完成', '2015-10-22 20:25:16', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:26:39', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:26:39', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预约完成', '2015-10-22 20:27:26', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '上水箱对象特性', '预约完成', '2015-10-22 20:27:26', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '液位单闭环控制', '预约完成', '2015-10-22 20:27:37', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '液位单闭环控制', '预约完成', '2015-10-22 20:27:37', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '史密斯预估实验', '预习', '2015-10-22 20:28:59', '新增');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '史密斯预估实验', '预习完成', '2015-10-22 20:29:14', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '史密斯预估实验', '预约完成', '2015-10-22 20:29:40', '修改');
INSERT INTO `processhist` VALUES ('999', '99', '过程控制', '史密斯预估实验', '预约完成', '2015-10-22 20:29:40', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2014-11-23 09:04:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预习完成', '2014-11-23 09:03:47', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 09:02:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-22 20:35:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-22 20:35:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:36:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:36:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2015-10-22 20:37:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2015-10-22 20:37:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-22 20:38:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-22 20:38:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2014-11-21 15:47:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预习完成', '2014-11-21 15:58:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预习完成', '2014-11-21 16:02:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预习完成', '2014-11-23 06:14:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-22 20:40:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预约完成', '2015-10-22 20:41:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预约完成', '2015-10-22 20:42:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预约完成', '2015-10-22 20:43:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预习完成', '2015-10-22 20:37:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-22 20:35:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2015-10-22 20:38:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预习完成', '2015-10-22 20:36:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 08:43:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 08:43:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2015-10-26 08:43:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2015-10-26 08:43:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2015-10-26 08:44:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2015-10-26 08:44:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预习完成', '2015-10-22 20:42:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-22 20:40:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预习完成', '2015-10-22 20:43:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预习完成', '2015-10-22 20:41:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预约完成', '2015-10-26 08:48:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预约完成', '2015-10-26 08:49:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 08:49:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 08:43:38', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 09:17:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 09:17:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 09:17:19', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 09:54:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 09:54:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 10:11:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 10:11:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2015-10-26 10:11:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预习完成', '2015-10-26 08:43:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 09:54:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预习完成', '2015-10-26 08:44:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 10:31:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 10:31:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2015-10-26 10:37:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预约完成', '2015-10-26 10:37:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 10:38:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 10:38:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2015-10-26 10:38:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 10:42:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 10:42:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 10:44:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2015-10-26 10:42:53', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预习完成', '2015-10-26 10:44:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 11:15:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 11:15:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预约完成', '2015-10-26 11:17:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '液位单闭环控制', '预习完成', '2015-10-26 08:49:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '史密斯预估实验', '预习完成', '2015-10-26 11:17:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 08:49:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '流量液位串级控制', '预习完成', '2015-10-26 08:48:12', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '史密斯预估实验', '预习完成', '2015-10-26 11:15:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 10:31:32', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '流量液位串级控制', '预习完成', '2015-10-26 10:37:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 11:21:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 11:21:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 11:22:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 11:22:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 11:21:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:31:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:31:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:33:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 13:31:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 13:33:18', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:35:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:35:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:35:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 13:35:54', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 13:35:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:41:41', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:41:41', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 13:42:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 13:41:41', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 13:42:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 14:51:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 14:51:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 14:51:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 14:51:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:12:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:12:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 15:12:29', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:16:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:16:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 14:51:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:25:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 15:16:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:30:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:30:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 15:30:27', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 15:25:48', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:46:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:46:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 15:46:10', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:51:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 15:51:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 15:51:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:05:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:05:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:05:09', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:10:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:10:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:10:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:11:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:11:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:13:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:13:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:15:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:17:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:17:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:15:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:17:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:25:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:25:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:25:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:25:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:25:05', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:27:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:27:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:27:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:27:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:27:14', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:29:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:30:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:30:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:30:03', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:31:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:31:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:31:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:33:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:33:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:33:06', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:40:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:40:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:40:08', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:45:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:45:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:45:28', '修改');
INSERT INTO `processhist` VALUES ('999', '999', '过程控制', '上水箱对象特性', '预习', '2015-10-26 16:52:43', '新增');
INSERT INTO `processhist` VALUES ('999', '999', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:52:49', '修改');
INSERT INTO `processhist` VALUES ('999', '999', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:52:55', '修改');
INSERT INTO `processhist` VALUES ('999', '999', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 16:52:55', '修改');
INSERT INTO `processhist` VALUES ('999', '999', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:52:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 20:26:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 20:26:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360230', '李君', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 16:29:56', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预习完成', '2015-10-26 20:26:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2015-10-26 21:08:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预约完成', '2015-10-26 21:08:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 21:08:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '上水箱对象特性', '预约完成', '2015-10-26 21:08:58', '修改');
INSERT INTO `processhist` VALUES ('0121111360212', '赵军', '过程控制', '液位单闭环控制', '预习完成', '2015-10-26 21:08:52', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '上水箱对象特性', '实验完成', '2015-10-27 09:40:11', '修改');
INSERT INTO `processhist` VALUES ('0121111360608', '傅天翔', '过程控制', '上水箱对象特性', '预约完成', '2015-10-27 09:40:11', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '实验完成', '2015-11-09 16:26:34', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预约完成', '2015-11-09 16:26:34', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预约完成', '2015-11-09 16:26:47', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预约完成', '2015-11-09 16:26:47', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '实验完成', '2015-11-09 16:26:56', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预约完成', '2015-11-09 16:26:56', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '实验完成', '2015-11-09 16:27:02', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预约完成', '2015-11-09 16:27:02', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '实验完成', '2015-11-09 16:27:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '预约完成', '2015-11-09 16:27:25', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '实验完成', '2015-11-09 16:27:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '预约完成', '2015-11-09 16:27:37', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '实验完成', '2015-11-09 16:27:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预约完成', '2015-11-09 16:27:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '实验完成', '2015-11-09 16:27:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '预约完成', '2015-11-09 16:27:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '实验完成', '2015-11-09 16:28:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '预约完成', '2015-11-09 16:28:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '实验完成', '2015-11-09 16:28:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '预约完成', '2015-11-09 16:28:20', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '实验完成', '2015-11-09 16:28:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预约完成', '2015-11-09 16:28:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '实验完成', '2015-11-09 16:28:30', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '预约完成', '2015-11-09 16:28:30', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '实验完成', '2015-11-11 19:04:00', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预约完成', '2015-11-11 19:04:00', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '实验完成', '2015-11-11 19:05:52', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:05:52', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '实验完成', '2015-11-11 19:06:51', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预约完成', '2015-11-11 19:06:51', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '实验完成', '2015-11-11 19:11:31', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预约完成', '2015-11-11 19:11:31', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '实验完成', '2015-11-11 19:12:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '上水箱对象特性', '预约完成', '2015-11-11 19:12:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '实验完成', '2015-11-11 19:12:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:12:28', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '实验完成', '2015-11-11 19:12:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '流量液位串级控制', '预约完成', '2015-11-11 19:12:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '实验完成', '2015-11-11 19:12:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360101', '李明闻', '过程控制', '史密斯预估实验', '预约完成', '2015-11-11 19:12:44', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '实验完成', '2015-11-11 19:13:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '上水箱对象特性', '预约完成', '2015-11-11 19:13:51', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '实验完成', '2015-11-11 19:14:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:14:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '实验完成', '2015-11-11 19:14:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '流量液位串级控制', '预约完成', '2015-11-11 19:14:07', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '实验完成', '2015-11-11 19:14:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360122', '杜路遥', '过程控制', '史密斯预估实验', '预约完成', '2015-11-11 19:14:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '上水箱对象特性', '实验完成', '2015-11-11 19:15:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '上水箱对象特性', '预约完成', '2015-11-11 19:15:26', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '实验完成', '2015-11-11 19:15:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:15:36', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '流量液位串级控制', '实验完成', '2015-11-11 19:15:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '流量液位串级控制', '预约完成', '2015-11-11 19:15:42', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估实验', '实验完成', '2015-11-11 19:15:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360231', '肖瑶', '过程控制', '史密斯预估实验', '预约完成', '2015-11-11 19:15:49', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '上水箱对象特性', '实验完成', '2015-11-11 19:19:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '上水箱对象特性', '预约完成', '2015-11-11 19:19:00', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '液位单闭环控制', '实验完成', '2015-11-11 19:19:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:19:39', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '流量液位串级控制', '实验完成', '2015-11-11 19:19:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '流量液位串级控制', '预约完成', '2015-11-11 19:19:50', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估实验', '实验完成', '2015-11-11 19:20:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360317', '周晓奇', '过程控制', '史密斯预估实验', '预约完成', '2015-11-11 19:20:01', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '上水箱对象特性', '实验完成', '2015-11-11 19:21:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '上水箱对象特性', '预约完成', '2015-11-11 19:21:16', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '液位单闭环控制', '预习', '2015-11-11 19:21:46', '新增');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '液位单闭环控制', '预习完成', '2015-11-11 19:21:55', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:21:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '液位单闭环控制', '预约完成', '2015-11-11 19:21:59', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '流量液位串级控制', '实验完成', '2015-11-11 19:22:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '流量液位串级控制', '预约完成', '2015-11-11 19:22:23', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估实验', '实验完成', '2015-11-11 19:22:33', '修改');
INSERT INTO `processhist` VALUES ('0121111360712', '胡亚清', '过程控制', '史密斯预估实验', '预约完成', '2015-11-11 19:22:33', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预习完成', '2015-11-11 19:04:00', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预习完成', '2015-11-11 19:05:52', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '测试完成', '2015-11-11 19:04:00', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预约完成', '2015-11-19 16:31:24', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预约完成', '2015-11-19 16:31:24', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '测试完成', '2015-11-11 19:05:52', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预约完成', '2015-11-19 16:32:18', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '液位单闭环控制', '预约完成', '2015-11-19 16:32:18', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '上水箱对象特性', '预习完成', '2015-11-19 16:31:24', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预习完成', '2015-11-11 19:06:51', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预习完成', '2015-11-11 19:11:31', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '测试完成', '2015-11-11 19:06:51', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预约完成', '2015-11-19 16:52:03', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '流量液位串级控制', '预约完成', '2015-11-19 16:52:03', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '测试完成', '2015-11-11 19:11:31', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预约完成', '2015-11-19 16:55:25', '修改');
INSERT INTO `processhist` VALUES ('0121017550524', '黄莹莹', '过程控制', '史密斯预估实验', '预约完成', '2015-11-19 16:55:25', '修改');

-- ----------------------------
-- Table structure for `questionnairestate`
-- ----------------------------
DROP TABLE IF EXISTS `questionnairestate`;
CREATE TABLE `questionnairestate` (
  `userid` varchar(15) DEFAULT NULL,
  `state` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionnairestate
-- ----------------------------
INSERT INTO `questionnairestate` VALUES ('99', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('110', '已完成');
INSERT INTO `questionnairestate` VALUES ('119', '已完成');
INSERT INTO `questionnairestate` VALUES ('120', '已完成');
INSERT INTO `questionnairestate` VALUES ('911', '已完成');
INSERT INTO `questionnairestate` VALUES ('711', '已完成');
INSERT INTO `questionnairestate` VALUES ('811', '已完成');
INSERT INTO `questionnairestate` VALUES ('1234', '已完成');
INSERT INTO `questionnairestate` VALUES ('12', '已完成');
INSERT INTO `questionnairestate` VALUES ('112', '已完成');
INSERT INTO `questionnairestate` VALUES ('113', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('222', '已完成');
INSERT INTO `questionnairestate` VALUES ('644', '已完成');
INSERT INTO `questionnairestate` VALUES ('1115', '已完成');
INSERT INTO `questionnairestate` VALUES ('0121011360622', '已完成');
INSERT INTO `questionnairestate` VALUES ('0121011360622', '已完成');

-- ----------------------------
-- Table structure for `setcourse`
-- ----------------------------
DROP TABLE IF EXISTS `setcourse`;
CREATE TABLE `setcourse` (
  `coursename` varchar(50) DEFAULT NULL,
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `setTime` varchar(50) DEFAULT NULL,
  `endTime` varchar(50) DEFAULT NULL,
  `zt` tinyint(1) DEFAULT NULL,
  `startTime` varchar(20) DEFAULT NULL,
  `xiakeTime` varchar(20) DEFAULT NULL,
  `maxnumber` int(10) DEFAULT NULL,
  `eqrule` varchar(50) DEFAULT NULL,
  `devicenum` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setcourse
-- ----------------------------
INSERT INTO `setcourse` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2015-11-20', '2015-11-24', '1', '08:00', '09:40', '6', '设备平均', null);
INSERT INTO `setcourse` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2015-11-20', '2015-11-24', '1', '10:00', '11:40', '7', '设备平均', null);
INSERT INTO `setcourse` VALUES ('过程控制', '串级控制', '流量液位串级控制', '2015-11-20', '2015-11-24', '1', '14:00', '15:40', '7', '设备平均', null);
INSERT INTO `setcourse` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-20', '2015-11-24', '1', '16:00', '17:40', '9', '设备平均', null);
INSERT INTO `setcourse` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2015-11-20', '2015-11-24', '1', '18:30', '20:10', '9', '设备平均', null);

-- ----------------------------
-- Table structure for `setcourse2`
-- ----------------------------
DROP TABLE IF EXISTS `setcourse2`;
CREATE TABLE `setcourse2` (
  `coursename` varchar(50) DEFAULT NULL,
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `setTime` varchar(50) DEFAULT NULL,
  `endTime` varchar(50) DEFAULT NULL,
  `zt` tinyint(1) DEFAULT NULL,
  `startTime` varchar(20) DEFAULT NULL,
  `xiakeTime` varchar(20) DEFAULT NULL,
  `maxnumber` int(10) DEFAULT NULL,
  `eqrule` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setcourse2
-- ----------------------------
INSERT INTO `setcourse2` VALUES ('微机原理', '设计实验', '显示目录实验', '2014-08-04', '2014-08-30', '0', '08:00', '09:40', '10', '设备平均');
INSERT INTO `setcourse2` VALUES ('微机原理', '设计实验', '显示目录实验', '2014-08-04', '2014-08-30', '1', '16:00', '17:40', '10', '设备节约');
INSERT INTO `setcourse2` VALUES ('微机原理', '设计实验', '显示目录实验', '2014-08-04', '2014-08-30', '1', '08:00', '09:40', '10', '设备平均');
INSERT INTO `setcourse2` VALUES ('微机原理', '设计实验', '显示目录实验', '2014-08-04', '2014-08-30', '1', '16:00', '17:40', '10', '设备节约');
INSERT INTO `setcourse2` VALUES ('微机原理', '设计实验', 'BCD码相乘实验', '2014-08-04', '2014-08-29', '0', '10:00', '11:40', '10', '设备平均');
INSERT INTO `setcourse2` VALUES ('微机原理', '设计实验', 'BCD码相乘实验', '2014-08-04', '2014-08-29', '1', '16:00', '17:40', '10', '设备节约');
INSERT INTO `setcourse2` VALUES ('微机原理', '基础实验', '键盘输入并显示实验', '2014-08-01', '2014-08-31', '0', '12:30', '14:00', '10', '设备节约');
INSERT INTO `setcourse2` VALUES ('微机原理', '基础实验', '键盘输入并显示实验', '2014-08-01', '2014-08-31', '1', '14:20', '16:00', '10', '设备节约');
INSERT INTO `setcourse2` VALUES ('微机原理', '基础实验', '键盘输入并显示实验', '2014-08-09', '2014-08-31', '0', '08:00', '09:00', '8', '设备平均');
INSERT INTO `setcourse2` VALUES ('微机原理', '基础实验', '键盘输入并显示实验', '2014-08-01', '2014-08-31', '1', '15:00', '16:00', '10', '设备平均');
INSERT INTO `setcourse2` VALUES ('微机原理', '基础实验', '键盘输入并显示实验', '2014-08-01', '2014-08-31', '1', '18:00', '20:00', '10', '设备平均');
INSERT INTO `setcourse2` VALUES ('微机原理', '基础实验', '键盘输入并显示实验', '2014-09-01', '2014-10-31', '1', '13:00', '15:00', '10', '设备节约');

-- ----------------------------
-- Table structure for `setcourse_old`
-- ----------------------------
DROP TABLE IF EXISTS `setcourse_old`;
CREATE TABLE `setcourse_old` (
  `coursename` varchar(50) DEFAULT NULL,
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `setTime` varchar(50) DEFAULT NULL,
  `endTime` varchar(50) DEFAULT NULL,
  `zt` tinyint(1) DEFAULT NULL,
  `startTime` varchar(20) DEFAULT NULL,
  `xiakeTime` varchar(20) DEFAULT NULL,
  `maxnumber` int(10) DEFAULT NULL,
  `eqrule` varchar(50) DEFAULT NULL,
  `devicenum` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setcourse_old
-- ----------------------------
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-11-22', '2014-11-22', '1', '08:30', '09:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-11-22', '2014-11-22', '1', '10:30', '11:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-11-22', '2014-11-22', '1', '14:00', '15:00', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-11-22', '2014-11-22', '1', '18:30', '19:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-11-22', '2014-11-22', '1', '19:30', '20:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-11-22', '2014-11-22', '1', '20:30', '21:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-22', '2014-11-22', '1', '08:30', '09:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-22', '2014-11-22', '1', '10:30', '11:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-22', '2014-11-22', '1', '14:00', '15:00', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-22', '2014-11-22', '1', '18:30', '19:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-22', '2014-11-22', '1', '19:30', '20:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-22', '2014-11-22', '1', '20:30', '21:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '串级控制', '流量液位串级控制', '2014-11-22', '2014-11-22', '1', '09:30', '10:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '串级控制', '流量液位串级控制', '2014-11-22', '2014-11-22', '1', '11:30', '12:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '串级控制', '流量液位串级控制', '2014-11-22', '2014-11-22', '1', '15:00', '16:00', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '串级控制', '流量液位串级控制', '2014-11-22', '2014-11-22', '1', '16:00', '17:00', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '串级控制', '流量液位串级控制', '2014-11-23', '2014-11-23', '1', '11:30', '12:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '串级控制', '流量液位串级控制', '2014-11-23', '2014-11-23', '1', '19:30', '20:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-11-23', '2014-11-23', '1', '08:30', '09:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-11-23', '2014-11-23', '1', '09:30', '10:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-11-23', '2014-11-23', '1', '10:30', '11:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-11-23', '2014-11-23', '1', '16:00', '17:00', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-11-23', '2014-11-23', '1', '18:30', '19:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-11-23', '2014-11-23', '1', '20:30', '21:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-24', '2014-11-24', '1', '08:30', '09:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-24', '2014-11-24', '1', '10:30', '11:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-24', '2014-11-24', '1', '14:00', '15:00', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-24', '2014-11-24', '1', '18:30', '19:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-24', '2014-11-24', '1', '19:30', '20:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '单闭环控制', '液位单闭环控制', '2014-11-24', '2014-11-24', '1', '20:30', '21:30', '12', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-12-24', '2014-12-27', '1', '08:30', '09:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-12-24', '2014-12-27', '1', '10:30', '11:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-12-24', '2014-12-27', '1', '14:00', '15:00', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-12-24', '2014-12-27', '1', '18:30', '19:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-12-24', '2014-12-27', '1', '19:30', '20:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '对象特性', '上水箱对象特性', '2014-12-24', '2014-12-27', '1', '20:30', '21:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-12-26', '2014-12-27', '1', '08:30', '09:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-12-26', '2014-12-27', '1', '10:30', '11:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-12-26', '2014-12-27', '1', '14:00', '15:00', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-12-26', '2014-12-27', '1', '18:30', '19:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-12-26', '2014-12-27', '1', '19:30', '20:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2014-12-26', '2014-12-27', '1', '20:30', '21:30', '6', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2015-01-29', '2015-01-31', '1', '14:00', '15:40', '4', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('过程控制', '史密斯预估控制', '史密斯预估实验', '2015-01-29', '2015-01-31', '1', '18:30', '20:10', '4', '设备节约', null);
INSERT INTO `setcourse_old` VALUES ('微机原理', '基础实验', '多位十进制数相减', '2015-01-06', '2015-01-31', '1', '08:00', '09:40', '4', '设备平均', null);
INSERT INTO `setcourse_old` VALUES ('微机原理', '基础实验', '多位十进制数相减', '2015-01-06', '2015-01-31', '1', '10:00', '11:40', '4', '设备平均', null);

-- ----------------------------
-- Table structure for `shijianbiao`
-- ----------------------------
DROP TABLE IF EXISTS `shijianbiao`;
CREATE TABLE `shijianbiao` (
  `userid` varchar(50) NOT NULL,
  `shiyanming` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shijianbiao
-- ----------------------------
INSERT INTO `shijianbiao` VALUES ('11', '实验问卷调查', '0:0:8');

-- ----------------------------
-- Table structure for `studentsinf`
-- ----------------------------
DROP TABLE IF EXISTS `studentsinf`;
CREATE TABLE `studentsinf` (
  `studentid` varchar(50) NOT NULL,
  `studentname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL COMMENT '院系',
  `position` varchar(20) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL COMMENT '业专班级如自动化1301班',
  `classdenotation` varchar(50) DEFAULT NULL COMMENT '班级简写',
  `quanxian` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `changeacademic` varchar(10) DEFAULT NULL COMMENT '到转新的专业',
  `changeclass` varchar(10) DEFAULT NULL COMMENT '的新专业班级',
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentsinf
-- ----------------------------
INSERT INTO `studentsinf` VALUES ('0121011360622', '王开元', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化1006', 'zdh1006', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121017550524', '黄莹莹', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360101', '李明闻', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360102', '伍浩', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360103', '邱艺铭', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360105', '王槐', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360110', '邱卫林', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360115', '廖佳成', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360122', '杜路遥', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360123', '张剑桥', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'dhzy1101', 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('0121111360127', '杨添', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360128', '许渊', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360131', '李彤', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360201', '周青', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360202', '罗君', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360207', '尹英豪', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360212', '赵军', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360213', '王若飞', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('0121111360215', '余必秀', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360217', '王凯', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360223', '贾磊', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360227', '黄云建', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360230', '李君', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360231', '肖瑶', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360233', '王陈', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360301', '周道洋', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360302', '潘超华', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360311', '程思伟', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360312', '周恒', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('0121111360314', '夏鹏辉', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360315', '陈天培', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360316', '尹凡', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360317', '周晓奇', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360401', '单跃跃', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360406', '张文华', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360407', '郝文汉', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360413', '赵玄', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360414', '李成', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360430', '杜珍珍', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360502', '黄振伟', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360506', '邵磊', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360521', '孙明军', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360522', '孙靖哲', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360524', '张利虎', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360526', '赵杨', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360527', '史森炬', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360531', '刘超群', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360534', '吴月', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360601', '汪健', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360602', '陈志华', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360605', '温林儒', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360608', '傅天翔', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360612', '颜为朗', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360615', '张小兵', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360616', '邓缘林', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360629', '李怡', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360634', '綦韦唯', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1101', 'zdhzy1101', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360701', '魏迪', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360706', '邢彦一', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360710', '赵磊', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360711', '程琢', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360712', '胡亚清', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '男', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360713', '王宇', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('0121111360731', '胡棉', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360732', '李源', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121111360735', '胡国欣', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1102', 'zdhzy1102', 'A', '女', null, null);
INSERT INTO `studentsinf` VALUES ('0121211360105', '李品达', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360106', '刘安平', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360107', '牛保群', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360110', '成栋梁', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360112', '曾冠雄', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360120', '蒋睿', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360123', '朱鑫', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360130', '牛怡青', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360132', '梅枭央', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360134', '刘欣宇', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360201', '叶清泉', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360202', '曲泽洋', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360205', '黄运吉', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360207', '李萌', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360208', '李想', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360209', '周泽', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360210', '胡鹏', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360214', '屈志平', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360215', '曹策', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360218', '王世宽', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360220', '张宗海', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360233', '周华妹', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360234', '马柱华', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360301', '谢阳', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360302', '袁韬', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360303', '吴培达', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360306', '彭方成', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360309', '许天辉', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360312', '赵明', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360314', '周杨', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360317', '张涛', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360322', '舒佳康', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360333', '胡芳香', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360335', '孟雪平', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360408', '李培鹤', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360409', '汪创', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360410', '徐江桥', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360416', '陈龙', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360423', '徐占友', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360428', '陈李俊', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360433', '陈冠余', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360501', '冉凡松', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360509', '林仕文', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360512', '刘立', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360513', '甘甜', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360514', '张清', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360520', '胡彪', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360531', '董梦玲', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360534', '杨田田', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360606', '田梓元', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360613', '刘子伟', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360616', '王涛', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360619', '李天德', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360621', '朱剑怀', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360627', '张生辉', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360701', '翟亮亮', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360707', '乔丙辰', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360709', '舒龙振', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360711', '李珺炜', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360714', '周江鹏', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360724', '刘洪珂', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360727', '李南伯', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360730', '杨琛', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('0121211360732', '王思维', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('111111', 'mm', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('121211360102', '高成', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1201', 'zdhzy1201', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('222222', 'CC', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('333333', 'VV', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('444444', '123', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('555555', '132', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('644', '644', 'MTIzNDU2', '自动化卓越工程师', '学生', '自动化zy1202', 'zdhzy1202', 'A', '', '', '');
INSERT INTO `studentsinf` VALUES ('666666', '1234', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('777777', '12345', 'MTIzNDU2', null, '学生', null, null, 'B', null, null, null);
INSERT INTO `studentsinf` VALUES ('888888', '某学生', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);
INSERT INTO `studentsinf` VALUES ('999', '999', 'MTIzNDU2', null, '学生', null, null, 'A', null, null, null);

-- ----------------------------
-- Table structure for `subexperimentinf`
-- ----------------------------
DROP TABLE IF EXISTS `subexperimentinf`;
CREATE TABLE `subexperimentinf` (
  `subexperimentid` varchar(20) NOT NULL COMMENT '实验内容编号',
  `subexperimentname` varchar(50) DEFAULT NULL COMMENT '验实内容名称',
  `status` varchar(20) DEFAULT NULL COMMENT '验实内容是否开放',
  `maxnum` varchar(20) DEFAULT NULL COMMENT '一台设备一次实验最多容纳人数',
  `continuetime` varchar(20) DEFAULT NULL COMMENT '实验时间，平常由老师指定一个或两个小时，考试时不超过规定时间',
  `openTime` varchar(20) DEFAULT NULL COMMENT '验实开放时间',
  `closeTime` varchar(20) DEFAULT NULL COMMENT '验实结束时间',
  `source` varchar(20) DEFAULT NULL COMMENT '验实来源于那个大实验（如单回路实验或串级控制实验）',
  `describe` varchar(255) DEFAULT NULL COMMENT '实验述描',
  PRIMARY KEY (`subexperimentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subexperimentinf
-- ----------------------------

-- ----------------------------
-- Table structure for `teachersinf`
-- ----------------------------
DROP TABLE IF EXISTS `teachersinf`;
CREATE TABLE `teachersinf` (
  `teacherid` int(20) NOT NULL,
  `teachername` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `quanxian` varchar(10) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL COMMENT '系院（自动化、汽车、）',
  `speciality` varchar(20) DEFAULT NULL COMMENT '专业',
  `researchroom` varchar(20) DEFAULT NULL COMMENT '研室教',
  `position` varchar(20) DEFAULT NULL COMMENT '位职（老师、管理员、学生）',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachersinf
-- ----------------------------
INSERT INTO `teachersinf` VALUES ('11', '张俊', 'MTIzNDU2', 'B', null, '自动化', null, null, '老师', null);
INSERT INTO `teachersinf` VALUES ('12', '张辉', 'MTIzNDU2', 'B', null, '自动化', null, null, '老师', null);
INSERT INTO `teachersinf` VALUES ('13', '傅剑', 'MTIzNDU2', 'B', null, '自动化', null, null, '老师', null);

-- ----------------------------
-- Table structure for `testingquestions`
-- ----------------------------
DROP TABLE IF EXISTS `testingquestions`;
CREATE TABLE `testingquestions` (
  `number` int(11) NOT NULL,
  `couse` text NOT NULL,
  `experiment` text NOT NULL,
  `question` longtext NOT NULL,
  `optionA` longtext NOT NULL,
  `optionB` longtext NOT NULL,
  `optionC` longtext NOT NULL,
  `optionD` longtext NOT NULL,
  `anwser` char(11) CHARACTER SET gbk NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testingquestions
-- ----------------------------
INSERT INTO `testingquestions` VALUES ('1', '过程控制', '上水箱对象特性', '下面哪个不是本次实验的目的', '根据实验得到液位的脉冲响应曲线', '掌握单容水箱的阶跃响应测试方法，并记录相应液位的响应曲线', '测量被测对象的特征函数K、T和传递函数', '掌握同一控制系统采用不同控制方案的实现过程', 'A');
INSERT INTO `testingquestions` VALUES ('2', '过程控制', '上水箱对象特性', '以下哪个不是本次实验的所需的设备', 'PC机', '过程控制综合型实验设备', '水箱', '电机', 'D');
INSERT INTO `testingquestions` VALUES ('3', '过程控制', '上水箱对象特性', '由实验原理可知，以下不正确的是', '单容是指只有一个贮蓄容量', '自衡是指对象在扰动作用下能自主重新恢复平衡', '液位装置中的液位对象是自衡对象', '单独的水箱是二阶对象', 'D');
INSERT INTO `testingquestions` VALUES ('4', '过程控制', '上水箱对象特性', '加热炉的炉温变化是一阶惯性加纯滞后环节系统，以下哪个不是其传递函数特征参数', '放大系数K', '延迟系数ζ', '滞后时间τ', '时间常数T', 'B');
INSERT INTO `testingquestions` VALUES ('5', '过程控制', '上水箱对象特性', '关于上水箱和下水箱组成的有自衡能力的对象，描述错误的是', '其为二阶对象', '其传递函数的特征参数有放大系数K', '其传递函数的特征参数有滞后时间τ', '其传递函数的特征参数有时间常数T', 'C');
INSERT INTO `testingquestions` VALUES ('6', '过程控制', '上水箱对象特性', '关于实验内容与步骤，下列说法正确的是', '电路连接完成后，第一步即为设置变频器频率', '在“实时曲线”和“工艺流程”选项中观察被控变量的实时值及阶跃曲线', '系统重新达到稳态时，再次点击“开始实验”按钮', '根据测得的实验数据通过列公式的方法计算特征参数', 'A');
INSERT INTO `testingquestions` VALUES ('7', '过程控制', '上水箱对象特性', '本次实验对象的输入信号为', '脉冲信号', '方波信号', '阶跃信号', '正弦信号', 'C');
INSERT INTO `testingquestions` VALUES ('8', '过程控制', '上水箱对象特性', '根据实验数据得到响应曲线后，当曲线升到稳态值的多少即为水箱的时间常数', '10%', '40%', '60%', '90%', 'C');
INSERT INTO `testingquestions` VALUES ('9', '过程控制', '上水箱对象特性', '单容水箱对象可用以下哪种模型近似描述', '一阶模型', '二阶模型', '一阶加时滞环节', '二阶加时滞环节', 'C');
INSERT INTO `testingquestions` VALUES ('10', '过程控制', '上水箱对象特性', '变频器的建议设置频率为', '10HZ', '30HZ', '50HZ', '70HZ', 'B');
INSERT INTO `testingquestions` VALUES ('11', '过程控制', '液位单闭环控制', '常见的比值控制系统不包括下列的', '单闭环比值系统', ' 双闭环比值系统', '开环比值系统', '串级比值系统', 'C');
INSERT INTO `testingquestions` VALUES ('12', '过程控制', '液位单闭环控制', '对于单闭环比值控制系统，下列说法哪一个正确的', '单闭环比值控制系统也是串级控制系统', '整个系统是闭环控制系统', '主物料是开环控制，副物料是闭环控制', '可以保证主物料．副物料量一定', 'C');
INSERT INTO `testingquestions` VALUES ('13', '过程控制', '液位单闭环控制', '反馈控制方式是按（）进行控制的', '测量值', '给定值', '偏差值', '干扰值', 'C');
INSERT INTO `testingquestions` VALUES ('14', '过程控制', '液位单闭环控制', '闭环控制系统的概念是', '是指控制器与被控对象之间既有顺向控制又有反向联系的自动控制', '是指控制器与被控对象之间只有顺向控制没有反向联系的自动控制', '是指系统只有输入与输出的自动控制', '是指系统的信号传递是从输入端传到输出端的自动控制', 'A');
INSERT INTO `testingquestions` VALUES ('15', '过程控制', '液位单闭环控制', '均匀控制系统的目的是', '液位、流量都稳定在一定的数值', '保证液位或压力的稳定', '保证流量的稳定', '液位、流量都在一定范围内缓慢波动', 'D');
INSERT INTO `testingquestions` VALUES ('16', '过程控制', '液位单闭环控制', '控制系统中控制器正反的确定依据是', '实现闭环回路的正反馈', '实现闭环回路的负反馈', '系统放大系数恰到好处', '生产的安全性', 'B');
INSERT INTO `testingquestions` VALUES ('17', '过程控制', '液位单闭环控制', '用 4：1 衰减曲线法整定控制器参数时，第一条做出的 4：1 曲线是在什么工作条件下获得的', '手动遥控控制', '自动控制纯比例作用', '自动控制比例加积分', '自动控制比例加微分', 'B');
INSERT INTO `testingquestions` VALUES ('18', '过程控制', '液位单闭环控制', '用4：1 衰减曲线法整定控制器参数时得到的TS值是什么数值', '从控制器积分时间旋纽上读出的积分时间', '从控制器微分时间旋纽上读出的积分时间', '对象特性的时间常数', '是4：1 衰减曲线上测量得到的振荡周期', 'D');
INSERT INTO `testingquestions` VALUES ('19', '过程控制', '液位单闭环控制', '使用输出信号为 4～20ｍA、的差压变送器用于汽包水位测量时，当汽包水位为一半时，变送器输出应为', '4mA', '10mA', '12mA', '20ｍA', 'C');
INSERT INTO `testingquestions` VALUES ('20', '过程控制', '液位单闭环控制', '衰减曲线法整定控制器参数，是将过渡过程曲线整定成（）的衰减振荡曲线', '4∶1 或1∶10', '1∶4 或10∶1', '1∶4 或1∶10', '4∶1 或10∶1', 'D');
INSERT INTO `testingquestions` VALUES ('21', '过程控制', '史密斯预估实验', 'PID 控制器变为比例积分作用，则（）', '微分时间置50 ', '微分时间置100', '微分时间置0', '微分时间置150', 'C');
INSERT INTO `testingquestions` VALUES ('22', '过程控制', '史密斯预估实验', '（）存在纯滞后，但不会影响控制品质', '控制通道', '测量元件', '变送器', '干扰通道', 'D');
INSERT INTO `testingquestions` VALUES ('23', '过程控制', '史密斯预估实验', '对控制系统的几种说法，哪一项是错误的', '对纯滞后大的控制对象，引入微分作用，不能克服其滞后的影响', '当控制过程不稳定时，可增大积分时间或加大比例度使其稳定', '当控制器的测量值与给定值相等时，即偏差为零时，控制器的输出为零', '比例控制过程的余差与控制器的比例度成正比', 'C');
INSERT INTO `testingquestions` VALUES ('24', '过程控制', '史密斯预估实验', '只要偏差存在，积分控制就起作用，直至（）消失为止', '测量值', '正偏差', '余差', '负偏差', 'C');
INSERT INTO `testingquestions` VALUES ('25', '过程控制', '史密斯预估实验', '选择操作变量应尽量使干扰靠近（）', '变送器', '控制阀', '被控变量', '控制器', 'B');
INSERT INTO `testingquestions` VALUES ('26', '过程控制', '史密斯预估实验', '控制器的比例度和积分时间正确说法是（）。', '比例度越大，比例作用越强', '积分时间越小，积分作用越弱', '比例度越大，比例作用越弱，积分时间越大，积分作用越强；', '比例度越小，比例作用越强，积分时间越小，积分作用越强。', 'D');
INSERT INTO `testingquestions` VALUES ('27', '过程控制', '史密斯预估实验', '某控制系统采用比例积分作用控制器。某人用先比例后加积分的凑试法来整定控制器的参数。若比例放大系数的数值已基本合适，再 加入积分作用的过程中，则 （）', '应适当减少比例放大系数 ', '适当增加比例放大系数', '无需改变比例放大系数', '与比例放大系数无关', 'A');
INSERT INTO `testingquestions` VALUES ('28', '过程控制', '史密斯预估实验', '在控制系统中，控制器的积分作用加强，会使系统（）变坏', '余差', '最大偏差', '稳定性', '超调量', 'C');
INSERT INTO `testingquestions` VALUES ('29', '过程控制', '史密斯预估实验', '有一冷却器，以蒸汽作为热剂来加热物料温度，现选择蒸汽流量为操纵变量，物料出口温度为被控变量，若被加热物料温度不能太高，否则对后续生产不利角度来考虑，则', '执行器应选气开阀、控制器为反作用方式', '执行器应选气开阀、控制器为正作用方式', '执行器应选气关阀、控制器为反作用方式', '执行器应选气关阀、控制器为正作用方式', 'A');
INSERT INTO `testingquestions` VALUES ('30', '过程控制', '史密斯预估实验', '选择操作变量应尽量使干扰靠近', '变送器', '控制阀', '被控变量', '控制器', 'B');
INSERT INTO `testingquestions` VALUES ('31', '过程控制', '流量液位串级控制', '有一冷却器，以冷却水作为冷剂来冷却物料温度，现选择冷却水流量为操纵变量，物料出口温度为被控变量，若从被冷却物料温度不能太高，否则对后续生产不利角度来考虑，则____', '执行器应选气开阀、控制器为反作用方式', '执行器应选气开阀、控制器为正作用方式', '执行器应选气关阀、控制器为反作用方式', '执行器应选气关阀、控制器为正作用方式', 'C');
INSERT INTO `testingquestions` VALUES ('32', '过程控制', '流量液位串级控制', '在串级控制系统中，主回路是（）控制系统?', '定值', '随动', '简单', '复杂', 'A');
INSERT INTO `testingquestions` VALUES ('33', '过程控制', '流量液位串级控制', '在串级控制系统中，主、副对象的（）要适当匹配，否则当一个参数发生振荡时，会引起另一个参数振荡', '滞后时间', '过渡时间', '时间常数', '放大倍数', 'C');
INSERT INTO `testingquestions` VALUES ('34', '过程控制', '流量液位串级控制', '根据经验先确定副控制器参数，再按简单控制系统参数整定的方法来整定主控制器，是串级控制系统参数整定的（）', '一步整定法', '两步整定法', '三步整定法', '四步整定法', 'A');
INSERT INTO `testingquestions` VALUES ('35', '过程控制', '流量液位串级控制', '串级控制系统的投运时', '先投主环，再投副环', '先投副环，再投主环', '主环、副环一起投', '主环、副环无所谓先后顺序', 'B');
INSERT INTO `testingquestions` VALUES ('36', '过程控制', '流量液位串级控制', '关于实验内容与步骤，下列说法正确的是', '电路连接完成后，第一步即为设置变频器频率', '在“实时曲线”和“工艺流程”选项中观察被控变量的实时值及阶跃曲线', '系统重新达到稳态时，再次点击“开始实验”按钮', '根据测得的实验数据通过列公式的方法计算特征参数', 'A');
INSERT INTO `testingquestions` VALUES ('37', '过程控制', '流量液位串级控制', '串级控制系统主、副回路各有一个控制器。副控制器的给定值为', '恒定不变', '由主控制器输出校正', '由副参数校正', '由干扰决定', 'B');
INSERT INTO `testingquestions` VALUES ('38', '过程控制', '流量液位串级控制', '对于串级均匀控制系统的控制目的，下列说法哪一个正确', '串级均匀控制系统只稳定主变量，对副变量没要求', '串级均匀控制系统的主．副变量都比较平稳，在允许范围内变化', '串级均匀控制系统的参数整定可按4：1 衰减法整定', '串级均匀控制系统控制器的比例和积分作用都很强', 'B');
INSERT INTO `testingquestions` VALUES ('39', '过程控制', '流量液位串级控制', '串级控制系统如果用于改善（）较大的对象时，副回路包含主要干扰，主回路包含', '容量滞后、测量滞后', '测量滞后、容量滞后', '惯性滞后 、容量滞后', '纯滞后、纯滞后', 'D');
INSERT INTO `testingquestions` VALUES ('40', '过程控制', '流量液位串级控制', '串级控制系统副回路的特点不包括', '克服干扰能力强', '改变了对象的特性', '只能克服一种干扰', '有一定的自适应能力', 'C');

-- ----------------------------
-- Table structure for `time`
-- ----------------------------
DROP TABLE IF EXISTS `time`;
CREATE TABLE `time` (
  `TimeBucketid` int(255) NOT NULL DEFAULT '0',
  `TimeBucket` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TimeBucketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of time
-- ----------------------------
INSERT INTO `time` VALUES ('1', '8:00——10:00');
INSERT INTO `time` VALUES ('2', '10:00——12:00');
INSERT INTO `time` VALUES ('3', '14:00——16:00');
INSERT INTO `time` VALUES ('4', '16:00——18:00');
INSERT INTO `time` VALUES ('5', '18:00——20:00');

-- ----------------------------
-- Table structure for `totalcourse`
-- ----------------------------
DROP TABLE IF EXISTS `totalcourse`;
CREATE TABLE `totalcourse` (
  `id` int(10) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `experimentname` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `teachername` varchar(50) DEFAULT NULL,
  `yuxiurl` varchar(100) DEFAULT NULL,
  `ceshiurl` varchar(100) DEFAULT NULL,
  `yuyueurl` varchar(100) DEFAULT NULL,
  `baogaourl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of totalcourse
-- ----------------------------
INSERT INTO `totalcourse` VALUES ('111', '过程控制', '对象特性', '上水箱对象特性', null, '/shangsxdxtxyx', '/shangsxdxtxcs', '/shiyanyuyue', '/shangsxdxtxbg');
INSERT INTO `totalcourse` VALUES ('112', '过程控制', '对象特性', '下水箱对象特性', null, '/xiasxdxtxyx', '/xiasxdxtxcs', '/shiyanyuyue', '/xiasxdxtxyxbg');
INSERT INTO `totalcourse` VALUES ('113', '过程控制', '对象特性', '调节阀对象特性', null, '/tiaojfdxtxyx', '/tiaojfdxtxcs', '/shiyanyuyue', '/tiaojfdxtxyxbg');
INSERT INTO `totalcourse` VALUES ('114', '过程控制', '对象特性', '温度对象特性', null, '/wenddxtxyx', '/wenddxtxcs', '/shiyanyuyue', '/wenddxtxyxbg');
INSERT INTO `totalcourse` VALUES ('115', '过程控制', '对象特性', '二阶液位对象特性', null, '/erjywdxtxyx', '/erjywdxtxcs', '/shiyanyuyue', '/erjywdxtxyxbg');
INSERT INTO `totalcourse` VALUES ('121', '过程控制', '单闭环控制', '流量单闭环控制', null, '/lldbhkzyx', '/lldbhkzcs', '/shiyanyuyue', '/lldbhkzyxbg');
INSERT INTO `totalcourse` VALUES ('122', '过程控制', '单闭环控制', '液位单闭环控制', null, '/ywdbhkzyx', '/ywdbhkzcs', '/shiyanyuyue', '/ywdbhkzyxbg');
INSERT INTO `totalcourse` VALUES ('123', '过程控制', '单闭环控制', '温度单闭环控制', null, '/wddbhkzyx', '/wddbhkzcs', '/shiyanyuyue', '/wddbhkzyxbg');
INSERT INTO `totalcourse` VALUES ('131', '过程控制', '串级控制', '流量液位串级控制', null, '/llywcjkzyx', '/llywcjkzcs', '/shiyanyuyue', '/llywcjkzyxbg');
INSERT INTO `totalcourse` VALUES ('141', '过程控制', '史密斯预估控制', '史密斯预估实验', null, '/smsygsyyx', '/smsygsycs', '/shiyanyuyue', '/smsygsyyxbg');
INSERT INTO `totalcourse` VALUES ('211', '微机原理', '基础实验', '多位十进制数相减', null, '/dwsjzsxjyx', '/dwsjzsxjcs', '/shiyanyuyue', '/dwsjzsxjyxbg');
INSERT INTO `totalcourse` VALUES ('212', '微机原理', '基础实验', '键盘输入并显示实验', null, '/jpsrbxssyyx', '/jpsrbxssycs', '/shiyanyuyue', '/jpsrbxssyyxbg');
INSERT INTO `totalcourse` VALUES ('213', '微机原理', '基础实验', '数据排序实验', null, '/sjpxsyyx', '/sjpxsycs', '/shiyanyuyue', '/sjpxsyyxbg');
INSERT INTO `totalcourse` VALUES ('221', '微机原理', '设计实验', '显示目录实验', null, '/xsmlsyyx', '/xsmlsycs', '/shiyanyuyue', '/xsmlsyyxbg');
INSERT INTO `totalcourse` VALUES ('222', '微机原理', '设计实验', 'BCD码相乘实验', null, '/BCDmxcsyyx', '/BCDmxcsycs', '/shiyanyuyue', '/BCDmxcsyyxbg');
INSERT INTO `totalcourse` VALUES ('311', '计算机仿真技术', 'matlab应用基础', 'matlab应用基础', null, '/matlabyyjcyx', '/matlabyyjccs', '/shiyanyuyue', '/matlabyyjcyxbg');
INSERT INTO `totalcourse` VALUES ('321', '计算机仿真技术', '控制系统模型的建立', '控制系统模型的建立', null, '/kzxtmxdjlyx', '/kzxtmxdjlcs', '/shiyanyuyue', '/kzxtmxdjlyxbg');
INSERT INTO `totalcourse` VALUES ('331', '计算机仿真技术', '控制系统的设计和时域仿真', '控制系统的设计和时域仿真', null, '/kzxtdsjhsyfzyx', '/kzxtdsjhsyfzcs', '/shiyanyuyue', '/kzxtdsjhsyfzyxbg');
INSERT INTO `totalcourse` VALUES ('411', '电机与拖动', '单相铁心变压器空载和短路试验测参数', '单相铁心变压器空载和短路试验测参数', null, '/dxtxbyqdkzhdlyx', '/dxtxbyqdkzhdlcs', '/shiyanyuyue', '/dxtxbyqdkzhdlyxbg');
INSERT INTO `totalcourse` VALUES ('421', '电机与拖动', '直流电动机的实验研究', '直流电动机的实验研究', null, '/zlddjdsyyjyx', '/zlddjdsyyjcs', '/shiyanyuyue', '/zlddjdsyyjyxbg');
INSERT INTO `totalcourse` VALUES ('431', '电机与拖动', '三相变压器的实验研究', '三相变压器的实验研究', null, '/sxbyqdsyyjyx', '/sxbyqdsyyjcs', '/shiyanyuyue', '/sxbyqdsyyjyxbg');

-- ----------------------------
-- Table structure for `urladress`
-- ----------------------------
DROP TABLE IF EXISTS `urladress`;
CREATE TABLE `urladress` (
  `id` int(10) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `subexperimentname` varchar(50) DEFAULT NULL,
  `yuxiurl` varchar(100) DEFAULT NULL,
  `ceshiurl` varchar(100) DEFAULT NULL,
  `yuyueurl` varchar(100) DEFAULT NULL,
  `baogaourl` varchar(100) DEFAULT NULL,
  `liaotianurl` varchar(100) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of urladress
-- ----------------------------
INSERT INTO `urladress` VALUES ('111', '过程控制', '上水箱对象特性', '/shangsxdxtxyx', '/testing', '/yuyueyemian', '/shangsxdxtxbg', '/liaotianui/guokong_shangshuixiang', '上水箱');
INSERT INTO `urladress` VALUES ('112', '过程控制', '下水箱对象特性', '/xiasxdxtxyx', '/xiasxdxtxcs', '/yuyueyemian', '/xiasxdxtxbg', null, null);
INSERT INTO `urladress` VALUES ('113', '过程控制', '调节阀对象特性', '/tiaojfdxtxyx', '/tiaojfdxtxcs', '/yuyueyemian', '/tiaojfdxtxbg', null, null);
INSERT INTO `urladress` VALUES ('114', '过程控制', '温度对象特性', '/wenddxtxyx', '/wenddxtxcs', '/yuyueyemian', '/wenddxtxbg', null, null);
INSERT INTO `urladress` VALUES ('115', '过程控制', '二阶液位对象特性', '/erjywdxtxyx', '/erjywdxtxcs', '/yuyueyemian', '/erjywdxtxbg', null, null);
INSERT INTO `urladress` VALUES ('121', '过程控制', '流量单闭环控制', '/lldbhkzyx', '/lldbhkzcs', '/yuyueyemian', '/lldbhkzbg', null, null);
INSERT INTO `urladress` VALUES ('122', '过程控制', '液位单闭环控制', '/ywdbhkzyx', '/testing', '/yuyueyemian', '/ywdbhkzbg', '/liaotianui/guokong_danbihuan', '单闭环');
INSERT INTO `urladress` VALUES ('123', '过程控制', '温度单闭环控制', '/wddbhkzyx', '/wddbhkzcs', '/yuyueyemian', '/wddbhkzbg', null, null);
INSERT INTO `urladress` VALUES ('132', '过程控制', '流量液位串级控制', '/llywcjkzyx', '/testing', '/yuyueyemian', '/llywcjkzbg', '/liaotianui/guokong_chuanjikongzhi', '串级控制');
INSERT INTO `urladress` VALUES ('141', '过程控制', '史密斯预估实验', '/smsygsyyx', '/testing', '/yuyueyemian', '/smsygsybg', '/liaotianui/guokong_shimisi', '史密斯');
INSERT INTO `urladress` VALUES ('211', '微机原理', '多位十进制数相减', '/dwsjzsxjyx', '/dwsjzsxjcs', '/yuyueyemian', '/dwsjzsxjbg', null, null);
INSERT INTO `urladress` VALUES ('212', '微机原理', '键盘输入并显示实验', '/jpsrbxssyyx', '/jpsrbxssycs', '/yuyueyemian', '/jpsrbxssybg', null, null);
INSERT INTO `urladress` VALUES ('213', '微机原理', '数据排序实验', '/sjpxsyyx', '/sjpxsycs', '/yuyueyemian', '/sjpxsybg', null, null);
INSERT INTO `urladress` VALUES ('221', '微机原理', '显示目录实验', '/xsmlsyyx', '/xsmlsycs', '/yuyueyemian', '/xsmlsybg', null, null);
INSERT INTO `urladress` VALUES ('222', '微机原理', 'BCD码相乘实验', '/BCDmxcsyyx', '/BCDmxcsycs', '/yuyueyemian', '/BCDmxcsybg', null, null);
INSERT INTO `urladress` VALUES ('311', '计算机仿真技术', 'matlab应用基础', '/matlabyyjcyx', '/matlabyyjccs', '/yuyueyemian', '/matlabyyjcbg', null, null);
INSERT INTO `urladress` VALUES ('321', '计算机仿真技术', '控制系统模型的建立', '/kzxtmxdjlyx', '/kzxtmxdjlcs', '/yuyueyemian', '/kzxtmxdjlbg', null, null);
INSERT INTO `urladress` VALUES ('331', '计算机仿真技术', '控制系统的设计和时域仿真', '/kzxtdsjhsyfzyx', '/kzxtdsjhsyfzcs', '/yuyueyemian', '/kzxtdsjhsyfzbg', null, null);
INSERT INTO `urladress` VALUES ('411', '电机与拖动', '单相铁心变压器空载和短路试验测参数', '/dxtxbyqdkzhdlyx', '/dxtxbyqdkzhdlcs', '/yuyueyemian', '/dxtxbyqdkzhdlbg', null, null);
INSERT INTO `urladress` VALUES ('421', '电机与拖动', '直流电动机的实验研究', '/zlddjdsyyjyx', '/zlddjdsyyjcs', '/yuyueyemian', '/zlddjdsyyjbg', null, null);
INSERT INTO `urladress` VALUES ('431', '电机与拖动', '三相变压器的实验研究', '/sxbyqdsyyjyx', '/sxbyqdsyyjcs', '/yuyueyemian', '/sxbyqdsyyjbg', null, null);

-- ----------------------------
-- Table structure for `useequipment`
-- ----------------------------
DROP TABLE IF EXISTS `useequipment`;
CREATE TABLE `useequipment` (
  `deviceid` varchar(20) NOT NULL,
  `ADate` varchar(20) DEFAULT NULL,
  `StartTime` varchar(20) DEFAULT NULL,
  `EndTime` varchar(20) DEFAULT NULL,
  `AssignTo` varchar(50) DEFAULT NULL COMMENT '设备在某一时间段分配给某个子实验（subexperimentid）',
  `status` varchar(20) DEFAULT NULL COMMENT '状态为占用，则非AssignTo值不可使用该设备，是AssignTo值且在subexperimentid的最大容量内可以使用该设备',
  KEY `deviceid` (`deviceid`),
  CONSTRAINT `deviceid` FOREIGN KEY (`deviceid`) REFERENCES `equipmentinf` (`deviceid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useequipment
-- ----------------------------

-- ----------------------------
-- Table structure for `ztreedata`
-- ----------------------------
DROP TABLE IF EXISTS `ztreedata`;
CREATE TABLE `ztreedata` (
  `id` varchar(255) DEFAULT NULL,
  `pId` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ztreedata
-- ----------------------------
INSERT INTO `ztreedata` VALUES ('1', '0', '默认');
INSERT INTO `ztreedata` VALUES ('11', '1', '08:00-09:40');
INSERT INTO `ztreedata` VALUES ('12', '1', '10:00-11:40');
INSERT INTO `ztreedata` VALUES ('13', '1', '14:00-15:40');
INSERT INTO `ztreedata` VALUES ('14', '1', '16:00-17:40');
INSERT INTO `ztreedata` VALUES ('15', '1', '18:30-20:10');
INSERT INTO `ztreedata` VALUES ('2', '0', '自由设定');
INSERT INTO `ztreedata` VALUES ('21', '2', '08:30-09:30');
INSERT INTO `ztreedata` VALUES ('22', '2', '09:30-10:30');
INSERT INTO `ztreedata` VALUES ('22', '2', '10:30-11:30');
INSERT INTO `ztreedata` VALUES ('22', '2', '11:30-12:30');
INSERT INTO `ztreedata` VALUES ('23', '2', '14:00-15:00');
INSERT INTO `ztreedata` VALUES ('24', '2', '15:00-16:00');
INSERT INTO `ztreedata` VALUES ('22', '2', '16:00-17:00');
INSERT INTO `ztreedata` VALUES ('23', '2', '18:30-19:30');
INSERT INTO `ztreedata` VALUES ('24', '2', '19:30-20:30');
INSERT INTO `ztreedata` VALUES ('25', '2', '20:30-21:30');

-- ----------------------------
-- Procedure structure for `group_chat_messages`
-- ----------------------------
DROP PROCEDURE IF EXISTS `group_chat_messages`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `group_chat_messages`(IN `userx_student_group` varchar(50) ,IN `userx_shiyan` varchar(50) ,IN `userx_group_id` int(10),IN `userx_student_id` varchar(50))
BEGIN
  DECLARE lasttime VARCHAR(25);

  DECLARE cunt INTEGER DEFAULT 0;
  DECLARE init INTEGER DEFAULT 0;
   
  SELECT last_time INTO lasttime  FROM groupinf WHERE ( shiyan=userx_shiyan AND group_id=userx_group_id AND stu_id=userx_student_id);
  SELECT * FROM group_chat_inf WHERE (student_group=userx_student_group AND message_time>lasttime AND 
                                        message<>"Lto/Gqr3TV2xdQ0I1Su9yQ");

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `statuschange`
-- ----------------------------
DROP PROCEDURE IF EXISTS `statuschange`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `statuschange`(IN `pro_studentid` varchar(50),IN `couname` varchar(50),IN `subname` varchar(50),IN `type` int)
BEGIN
	#Routine body goes here...
  DECLARE t1 VARCHAR(20);
  DECLARE temp VARCHAR(20) CHARACTER SET 'UTF8';

  SET @t1=NULL;

  SELECT id INTO t1 FROM ka1,processbiao WHERE ka1.currentstatus=processbiao.`status` AND studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
  SELECT t1;

  IF t1=4 THEN
       CASE type
       WHEN 0 THEN
            SELECT currentstatus INTO temp FROM ka1 WHERE id=t1+4;
            UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
       WHEN 1 THEN
            SELECT currentstatus INTO temp FROM ka1 WHERE id=t1+1;
             UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
        END CASE;


  ELSEIF t1=6 THEN
        CASE type
         WHEN 0 THEN
              SELECT currentstatus INTO temp FROM ka1 WHERE id=t1+2;
              UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
         WHEN 1 THEN
              SELECT currentstatus INTO temp FROM ka1 WHERE id=t1+1;
              UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
          END CASE;

  ELSEIF t1=7 THEN
           CASE type
           WHEN 0 THEN
                 SELECT currentstatus INTO temp FROM ka1 WHERE id=t1+1;
                 UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
            WHEN 1 THEN
                  SELECT currentstatus INTO temp FROM ka1 WHERE id=t1-1;
                  UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
             END CASE;

  ELSEIF t1=2 THEN
            SELECT currentstatus INTO temp FROM ka1 WHERE id=t1+2;
            UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
            

  ELSE
                 SELECT currentstatus INTO temp FROM ka1 WHERE id=t1+1;
                 UPDATE processbiao SET status=temp,LastModifiedTime=NOW() WHERE studentid=pro_studentid AND coursename=couname AND subexperimentname=subname;
  END IF;
        
                 



END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `create_group`;
DELIMITER ;;
CREATE TRIGGER `create_group` AFTER INSERT ON `appointmentsheet` FOR EACH ROW BEGIN
      declare number INT default 0;
      declare shiyan_name varchar(50);
      declare now_time varchar(50);
      declare get_group_id INT(11) default 0;
      
      SET now_time = (SELECT NOW());
      SET number = (SELECT COUNT(*) FROM groupinf WHERE  ( shiyan_date = NEW.date AND start_time = NEW.startTime));
      IF number = 0
      THEN 
              IF NEW.subexperimentname = "上水箱对象特性"
              THEN 
                       SET shiyan_name = "guokong_shangshuixiang";
              ELSEIF NEW.subexperimentname = "液位单闭环控制"
              THEN 
                       SET shiyan_name = "guokong_danbihuan";
              ELSEIF NEW.subexperimentname = "流量液位串级控制"
              THEN 
                       SET shiyan_name = "guokong_chuanjikongzhi";
              ELSEIF NEW.subexperimentname = "史密斯预估实验"
              THEN 
                       SET shiyan_name = "guokong_shimisi";
              ELSE
                       SET shiyan_name = "空";
              END IF;
              SET get_group_id = (SELECT MAX(group_id) FROM groupinf) +1;
              INSERT INTO groupinf (shiyan,group_id,stu_id,stu_name,last_time,shiyan_date,start_time,equipment) VALUES (shiyan_name,get_group_id,NEW.studentid,NEW.studentname,now_time,NEW.date,NEW.startTime,NEW.equipment);
              INSERT INTO groupinf (shiyan,group_id,stu_id,stu_name,last_time,shiyan_date,start_time,equipment) VALUES (shiyan_name,get_group_id,"13","傅剑老师",now_time,NEW.date,NEW.startTime,NEW.equipment);



  
      ELSEIF (number >0)
      THEN
             SET shiyan_name = (SELECT DISTINCT shiyan FROM groupinf WHERE  ( shiyan_date = NEW.date AND start_time = NEW.startTime));
             SET get_group_id = (SELECT DISTINCT group_id FROM groupinf WHERE  ( shiyan_date = NEW.date AND start_time = NEW.startTime));
             INSERT INTO groupinf (shiyan,group_id,stu_id,stu_name,last_time,shiyan_date,start_time,equipment) VALUES (shiyan_name,get_group_id,NEW.studentid,NEW.studentname,now_time,NEW.date,NEW.startTime,NEW.equipment);
      END IF;
              
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_group`;
DELIMITER ;;
CREATE TRIGGER `delete_group` AFTER DELETE ON `appointmentsheet` FOR EACH ROW BEGIN
      DELETE FROM groupinf WHERE (stu_id=OLD.studentid AND shiyan_date=OLD.date AND start_time=OLD.startTime);              
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_processI_1`;
DELIMITER ;;
CREATE TRIGGER `tri_processI_1` AFTER INSERT ON `processbiao` FOR EACH ROW begin
set@studentid=new.studentid;
set@studentname=new.studentname;
set@coursename=new.coursename;

set@subexperimentname=new.subexperimentname;
set@status=new.status;
set@changetime=new.createtime;
Insert into processhist values(@studentid,@studentname,@coursename,@subexperimentname,@status,@changetime,"新增");
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_processM_2`;
DELIMITER ;;
CREATE TRIGGER `tri_processM_2` AFTER UPDATE ON `processbiao` FOR EACH ROW begin
set@studentid=new.studentid;
set@studentname=new.studentname;
set@coursename=new.coursename;

set@subexperimentname=new.subexperimentname;
set@status=new.status;
set@changetime=new.LastModifiedTime;
Insert into processhist values(@studentid,@studentname,@coursename,@subexperimentname,@status,@changetime,"修改");
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_processD_3`;
DELIMITER ;;
CREATE TRIGGER `tri_processD_3` BEFORE DELETE ON `processbiao` FOR EACH ROW begin
set@studentid=old.studentid;
set@studentname=old.studentname;
set@coursename=old.coursename;

set@subexperimentname=old.subexperimentname;
set@status=old.status;
set@changetime=old.createtime;
Insert into processhist values(@studentid,@studentname,@coursename,@subexperimentname,@status,@changetime,"删除");
end
;;
DELIMITER ;
