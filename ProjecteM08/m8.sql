/*
Navicat MySQL Data Transfer

Source Server         : My Sql PHP
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : m8

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-21 17:37:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for juegos
-- ----------------------------
DROP TABLE IF EXISTS `juegos`;
CREATE TABLE `juegos` (
  `idjuego` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idjuego`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of juegos
-- ----------------------------

-- ----------------------------
-- Table structure for usuaris
-- ----------------------------
DROP TABLE IF EXISTS `usuaris`;
CREATE TABLE `usuaris` (
  `idusuaris` int(255) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `admin` varchar(1) DEFAULT NULL,
  `dinero` double DEFAULT NULL,
  PRIMARY KEY (`idusuaris`),
  UNIQUE KEY `id` (`idusuaris`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuaris
-- ----------------------------
INSERT INTO `usuaris` VALUES ('1', 'yato', 'yato', 'F', '100');
