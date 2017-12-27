-- 表创建
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- 管理员表
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `authNo` varchar(255) NOT NULL,
  `tips` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for spendinfo
-- ----------------------------
DROP TABLE IF EXISTS `spendinfo`;
CREATE TABLE `spendinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `spendtype` int(2) NOT NULL,
  `spendamount` int(10) NOT NULL,
  `allcount` int(10) NOT NULL,
  `alreadycount` int(10) NOT NULL,
  `canusecount` int(10) NOT NULL,
  `count` int(10) NOT NULL,
  `nousecount` int(10) NOT NULL,
  `spendtime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  `suggestiontime` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phonenum` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '冻结或可用',
  `username` varchar(255) NOT NULL COMMENT '姓名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `status` int(2) NOT NULL COMMENT '结冻或可用',
  `usertype` int(2) NOT NULL COMMENT '会员类型',
  `phonenum` char(20) NOT NULL COMMENT '手机号',
  `vipnum` varchar(255) NOT NULL COMMENT '会员卡号',
  `sex` varchar(255) NOT NULL COMMENT '性别',
  `merrystaus` varchar(255) NOT NULL COMMENT '婚姻',
  `idcard` varchar(255) NOT NULL COMMENT '身份证',
  `birthday` varchar(255) NOT NULL COMMENT '生日',
  `stduy` varchar(255) NOT NULL COMMENT '学历',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `duty` varchar(255) NOT NULL COMMENT '职业',
  `allcount` int(10) NOT NULL COMMENT '总额度',
  `alreadycount` int(10) NOT NULL COMMENT '已激活',
  `canusecount` int(10) NOT NULL COMMENT '已激活可用',
  `count` int(10) NOT NULL COMMENT '余额',
  `nousecount` int(10) NOT NULL COMMENT '剩余可激活额度',
  `usertime` varchar(255) DEFAULT NULL COMMENT '开户时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;