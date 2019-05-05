/*
Navicat MySQL Data Transfer

Source Server         : ismy
Source Server Version : 50725
Source Host           : youxiu326.xin:3306
Source Database       : multi_data_02

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-05-05 15:04:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'aaaaaaaaaa', 'o1');
INSERT INTO `message` VALUES ('2', 'bbbbbbbbbb', 'o2');
INSERT INTO `message` VALUES ('3', 'cccccccccc', 'o3');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `dir_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsakqwgqi9tf37qwg0l936m60y` (`dir_id`),
  CONSTRAINT `FKsakqwgqi9tf37qwg0l936m60y` FOREIGN KEY (`dir_id`) REFERENCES `product_dir` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '从数据源', null);
INSERT INTO `product` VALUES ('2', '这是从数据源', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'Jone', '18', 'test1@baomidou.com');
INSERT INTO `student` VALUES ('2', 'Jack', '20', 'test2@baomidou.com');
INSERT INTO `student` VALUES ('3', 'Tom', '28', 'test3@baomidou.com');
INSERT INTO `student` VALUES ('4', 'Sandy', '21', 'test4@baomidou.com');
INSERT INTO `student` VALUES ('5', 'Billie', '24', 'test5@baomidou.com');
INSERT INTO `student` VALUES ('6', null, '24', 'test6@qq.com');
INSERT INTO `student` VALUES ('7', 'TomT', '15', 'test7@baomidou.com');
