/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50160
Source Host           : localhost:3306
Source Database       : jspmwljpdzswzxjyxthsg5400a3b6mysql

Target Server Type    : MYSQL
Target Server Version : 50160
File Encoding         : 65001

Date: 2019-04-08 10:47:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `allusers`
-- ----------------------------
DROP TABLE IF EXISTS `allusers`;
CREATE TABLE `allusers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `cx` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allusers
-- ----------------------------
INSERT INTO `allusers` VALUES ('1', 'hsg', 'hsg', '超级管理员', '2019-04-08 16:43:51');

-- ----------------------------
-- Table structure for `dingdanshengcheng`
-- ----------------------------
DROP TABLE IF EXISTS `dingdanshengcheng`;
CREATE TABLE `dingdanshengcheng` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dingdanbianhao` varchar(50) DEFAULT NULL,
  `dingdanneirong` varchar(50) DEFAULT NULL,
  `xiadanren` varchar(50) DEFAULT NULL,
  `lianxifangshi` varchar(50) DEFAULT NULL,
  `dizhi` varchar(255) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `zhuangtai` varchar(50) DEFAULT NULL,
  `issh` varchar(2) DEFAULT NULL,
  `jine` int(11) DEFAULT NULL,
  `iszf` varchar(2) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdanshengcheng
-- ----------------------------
INSERT INTO `dingdanshengcheng` VALUES ('6', '03220848474030', '图书编号：030,图书名称：历练,购买数量：2;', '001', '13654874512', '是的风格的的师傅过得舒服个的风格是的', '撒旦法是', '已下单', '否', '24624', '是', '2019-04-08 08:48:51');
INSERT INTO `dingdanshengcheng` VALUES ('7', '03220854137812', '图书编号：A0012,图书名称：AA图书,购买数量：100;', '111', '13654874512', '是的风格的的师傅过得舒服个的风格是的', '阿士大夫速度飞洒是', '已发货', '是', '30000', '是', '2019-04-08 08:54:18');
INSERT INTO `dingdanshengcheng` VALUES ('8', '04080114021441', '图书编号：sd5465,图书名称：撒旦法,购买数量：30;', '222', '13584785486', '是的风格的的师傅过得舒服个的风格是的', '是的风格地方过得舒服格式的风格地方', '已发货', '是', '900', '是', '2019-04-08 01:14:29');

-- ----------------------------
-- Table structure for `dx`
-- ----------------------------
DROP TABLE IF EXISTS `dx`;
CREATE TABLE `dx` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `leibie` varchar(50) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx
-- ----------------------------
INSERT INTO `dx` VALUES ('1', '系统公告', '<P>&nbsp;&nbsp;&nbsp; 欢迎大家登陆我站，我站主要是为广大朋友精心制作的一个系统，希望大家能够在我站获得一个好心情，谢谢！</P>\r\n<P>&nbsp;&nbsp;&nbsp; 自强不息，海纳百川，努力学习！</P>');
INSERT INTO `dx` VALUES ('2', '系统简介', '系统简介');
INSERT INTO `dx` VALUES ('3', '关于我们', '&nbsp; &nbsp; 本公司坚持走:以质量求生存,以科技求发展,重合同守信用的道路,生产经营得到迅速发展。我们将以优质的产品和最完善的售后服务来真诚与各界朋友开展广泛的合作,共同创造一个美好的未来!<br />  <br />  公司行为准则:忠信仁义，以人为本。 <br />  忠：即忠诚，  包括三重含义：企业忠于国家、忠于民族；企业忠于客户；员工忠于企业。 <br />  信：即诚信，做企业要立足根本道德、信义，要诚实、讲信用。 <br />  仁：即仁爱，上司对下属要仁爱、体贴，同事之间要关怀、友爱。 <br />  义：即大义，公司在与合作伙伴、客户的交往过程中，不做损人利己的事，维护自己利益的前提是不损害他人利益；对民族、社会要共襄义举，要识大义，明是非。 <br />');
INSERT INTO `dx` VALUES ('4', '联系方式', '联系人：xxxxxxxx<br />  电话：0000-0000000<br />  手机：010000000000<br />  传真：0000-0000000<br />  邮件：xxxxxxxx@163.com<br />  地址：您公司的地址<br />  网址：http://www.xxxx.com<br />');

-- ----------------------------
-- Table structure for `goumaijilu`
-- ----------------------------
DROP TABLE IF EXISTS `goumaijilu`;
CREATE TABLE `goumaijilu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tushubianhao` varchar(50) DEFAULT NULL,
  `tushumingcheng` varchar(50) DEFAULT NULL,
  `tushuleibie` varchar(50) DEFAULT NULL,
  `chushoujiage` varchar(50) DEFAULT NULL,
  `xiaoliang` varchar(50) DEFAULT NULL,
  `goumaishuliang` varchar(50) DEFAULT NULL,
  `jine` varchar(50) DEFAULT NULL,
  `goumaishijian` varchar(50) DEFAULT NULL,
  `goumairen` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `yue` varchar(50) DEFAULT NULL,
  `issh` varchar(2) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goumaijilu
-- ----------------------------
INSERT INTO `goumaijilu` VALUES ('3', '030', '历练', 'X类', '12312', '56', '2', '24624.0', '2019-03-22 08:41:51', '001', '连小云', '50000', '是', '2019-04-08 08:44:15');
INSERT INTO `goumaijilu` VALUES ('4', 'A0012', 'AA图书', 'A类', '300', '0', '100', '30000.0', '2019-03-22 08:53:47', '111', '周大怒', '50000', '是', '2019-04-08 08:53:48');
INSERT INTO `goumaijilu` VALUES ('5', 'sd5465', '撒旦法', 'B类', '30', '0', '30', '900.0', '2019-04-08 01:13:41', '222', '的风格', '', '是', '2019-04-08 01:13:43');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `xinwenID` varchar(50) DEFAULT NULL,
  `pinglunneirong` varchar(255) DEFAULT NULL,
  `pinglunren` varchar(50) DEFAULT NULL,
  `pingfen` varchar(50) DEFAULT NULL,
  `biao` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', '1', '的风格大方个地方官', '001', '3', 'tushuxinxi', '2019-04-08 08:08:51');
INSERT INTO `pinglun` VALUES ('2', '6', 'sdfsad成v大风格大使馆', '111', '4', 'tushuxinxi', '2019-04-08 08:53:35');
INSERT INTO `pinglun` VALUES ('3', '7', 'dfghfdg发给恢复规划', '222', '4', 'tushuxinxi', '2019-04-08 01:13:54');

-- ----------------------------
-- Table structure for `tushuleibie`
-- ----------------------------
DROP TABLE IF EXISTS `tushuleibie`;
CREATE TABLE `tushuleibie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `leibie` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tushuleibie
-- ----------------------------
INSERT INTO `tushuleibie` VALUES ('5', 'X类', '2019-04-08 07:12:51');
INSERT INTO `tushuleibie` VALUES ('6', 'A类', '2019-04-08 08:51:41');
INSERT INTO `tushuleibie` VALUES ('7', 'B类', '2019-04-08 01:11:51');

-- ----------------------------
-- Table structure for `tushuxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `tushuxinxi`;
CREATE TABLE `tushuxinxi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tushubianhao` varchar(50) DEFAULT NULL,
  `tushumingcheng` varchar(50) DEFAULT NULL,
  `tushuleibie` varchar(50) DEFAULT NULL,
  `chushoujiage` int(11) DEFAULT NULL,
  `xiangxijieshao` varchar(255) DEFAULT NULL,
  `tupian` varchar(50) DEFAULT NULL,
  `xiaoliang` int(11) DEFAULT NULL,
  `issh` varchar(2) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tushuxinxi
-- ----------------------------
INSERT INTO `tushuxinxi` VALUES ('1', '030', '历练', 'X类', '12312', '的风格的收费', 'upload/1553212421146.jpg', '62', '是', '2019-04-08 07:12:55');
INSERT INTO `tushuxinxi` VALUES ('2', '034', '三国演义', 'H类', '324', '的风格撒旦法', 'upload/1553212404545.jpg', '645', '是', '2019-04-08 07:12:55');
INSERT INTO `tushuxinxi` VALUES ('3', '027', '安娜卡列琳娜', 'J类', '123', '的风格地方', 'upload/1553212392149.jpg', '456', '是', '2019-04-08 07:12:55');
INSERT INTO `tushuxinxi` VALUES ('4', '008', '鲁滨孙漂流记', 'D类', '600', '的风格的师傅', 'upload/1553212379296.jpg', '4456', '是', '2019-04-08 07:12:55');
INSERT INTO `tushuxinxi` VALUES ('5', '001', '简爱', 'H类', '300', 'dfgdf gdf东方故事的的', 'upload/1553212366307.jpg', '465', '是', '2019-04-08 07:12:55');
INSERT INTO `tushuxinxi` VALUES ('6', 'A0012', 'AA图书', 'A类', '300', '的风格是的风格都是', 'upload/1553215929287.jpg', '100', '否', '2019-04-08 08:52:10');
INSERT INTO `tushuxinxi` VALUES ('7', 'sd5465', '撒旦法', 'B类', '30', '的风格的风格大方过得舒服个撒旦法', 'upload/1554657147429.jpg', '30', '是', '2019-04-08 01:12:30');

-- ----------------------------
-- Table structure for `xinwentongzhi`
-- ----------------------------
DROP TABLE IF EXISTS `xinwentongzhi`;
CREATE TABLE `xinwentongzhi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) DEFAULT NULL,
  `leibie` varchar(50) DEFAULT NULL,
  `neirong` longtext,
  `tianjiaren` varchar(50) DEFAULT NULL,
  `shouyetupian` varchar(50) DEFAULT NULL,
  `dianjilv` int(11) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinwentongzhi
-- ----------------------------
INSERT INTO `xinwentongzhi` VALUES ('1', '113', '变幻图', '123', 'hsg', 'upload/1553212747993.jpg', '1', '2019-04-08 07:59:09');
INSERT INTO `xinwentongzhi` VALUES ('2', '111', '变幻图', '111', 'hsg', 'upload/1553215983809.jpg', '1', '2019-04-08 08:53:05');
INSERT INTO `xinwentongzhi` VALUES ('3', '11111111111', '变幻图', '撒旦法告诉对方', 'hsg', 'upload/1554657174721.jpg', '1', '2019-04-08 01:12:56');

-- ----------------------------
-- Table structure for `zhuceyonghu`
-- ----------------------------
DROP TABLE IF EXISTS `zhuceyonghu`;
CREATE TABLE `zhuceyonghu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(50) DEFAULT NULL,
  `nianling` varchar(50) DEFAULT NULL,
  `lianxifangshi` varchar(50) DEFAULT NULL,
  `zhaopian` varchar(50) DEFAULT NULL,
  `issh` varchar(2) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhuceyonghu
-- ----------------------------
INSERT INTO `zhuceyonghu` VALUES ('5', '001', '001', '连小云', '女', '34', '17505772420', 'upload/1553212341745.jpg', '是', '2019-04-08 07:13:03');
INSERT INTO `zhuceyonghu` VALUES ('6', '111', '111', '周大怒', '男', '40', '13584785486', 'upload/1553215877687.png', '是', '2019-04-08 08:51:19');
INSERT INTO `zhuceyonghu` VALUES ('7', '222', '222', '的风格', '女', '22', '13584785486', 'upload/1554657087787.jpg', '是', '2019-04-08 01:11:29');
