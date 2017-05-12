/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.119
Source Server Version : 50173
Source Host           : 192.168.3.119:3306
Source Database       : lj_crawling

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-12 14:54:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lj_house
-- ----------------------------
DROP TABLE IF EXISTS `lj_house`;
CREATE TABLE `lj_house` (
  `house_id` varchar(128) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `year_flood` varchar(255) DEFAULT NULL,
  `area` decimal(10,0) DEFAULT NULL,
  `toward` varchar(255) DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `ref_url` varchar(255) DEFAULT NULL,
  `street_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`house_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
