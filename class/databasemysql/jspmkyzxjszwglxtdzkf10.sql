

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `allusers`
-- ----------------------------
DROP TABLE IF EXISTS `allusers`;
CREATE TABLE `allusers` (
  `ID` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `cx` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allusers
-- ----------------------------
INSERT INTO `allusers` VALUES ('1', 'hsg', 'hsg', '超级管理员', '2021-05-22 21:06:12');

-- ----------------------------
-- Table structure for `gonggaoxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `gonggaoxinxi`;
CREATE TABLE `gonggaoxinxi` (
  `ID` int(11) NOT NULL,
  `biaoti` varchar(255) DEFAULT NULL,
  `fenlei` varchar(50) DEFAULT NULL,
  `neirong` longtext,
  `tianjiaren` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gonggaoxinxi
-- ----------------------------

-- ----------------------------
-- Table structure for `jiaoshixinxi`
-- ----------------------------
DROP TABLE IF EXISTS `jiaoshixinxi`;
CREATE TABLE `jiaoshixinxi` (
  `ID` int(11) NOT NULL,
  `xinxibianhao` varchar(50) DEFAULT NULL,
  `louhao` varchar(50) DEFAULT NULL,
  `cenghao` varchar(50) DEFAULT NULL,
  `jiaoshihao` varchar(50) DEFAULT NULL,
  `zuoweihao` varchar(50) DEFAULT NULL,
  `zhuangtai` varchar(50) DEFAULT NULL,
  `issh` varchar(2) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jiaoshixinxi
-- ----------------------------

-- ----------------------------
-- Table structure for `likai`
-- ----------------------------
DROP TABLE IF EXISTS `likai`;
CREATE TABLE `likai` (
  `ID` int(11) NOT NULL,
  `yuyuedanhao` varchar(50) DEFAULT NULL,
  `xinxibianhao` varchar(50) DEFAULT NULL,
  `louhao` varchar(50) DEFAULT NULL,
  `cenghao` varchar(50) DEFAULT NULL,
  `jiaoshihao` varchar(50) DEFAULT NULL,
  `zuoweihao` varchar(50) DEFAULT NULL,
  `likaiyuanyin` varchar(255) DEFAULT NULL,
  `xuehao` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likai
-- ----------------------------

-- ----------------------------
-- Table structure for `quxiao`
-- ----------------------------
DROP TABLE IF EXISTS `quxiao`;
CREATE TABLE `quxiao` (
  `ID` int(11) NOT NULL,
  `yuyuedanhao` varchar(50) DEFAULT NULL,
  `xinxibianhao` varchar(50) DEFAULT NULL,
  `louhao` varchar(50) DEFAULT NULL,
  `cenghao` varchar(50) DEFAULT NULL,
  `jiaoshihao` varchar(50) DEFAULT NULL,
  `zuoweihao` varchar(50) DEFAULT NULL,
  `xuehao` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quxiao
-- ----------------------------

-- ----------------------------
-- Table structure for `xueshengxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `xueshengxinxi`;
CREATE TABLE `xueshengxinxi` (
  `ID` int(11) NOT NULL,
  `xuehao` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(50) DEFAULT NULL,
  `yuanxi` varchar(50) DEFAULT NULL,
  `zhuanye` varchar(50) DEFAULT NULL,
  `shouji` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xueshengxinxi
-- ----------------------------

-- ----------------------------
-- Table structure for `yuyue`
-- ----------------------------
DROP TABLE IF EXISTS `yuyue`;
CREATE TABLE `yuyue` (
  `ID` int(11) NOT NULL,
  `yuyuedanhao` varchar(50) DEFAULT NULL,
  `xinxibianhao` varchar(50) DEFAULT NULL,
  `louhao` varchar(50) DEFAULT NULL,
  `cenghao` varchar(50) DEFAULT NULL,
  `jiaoshihao` varchar(50) DEFAULT NULL,
  `zuoweihao` varchar(50) DEFAULT NULL,
  `yuyueshijian` varchar(50) DEFAULT NULL,
  `xuehao` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `shouji` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yuyue
-- ----------------------------
