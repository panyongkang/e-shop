/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ssm_crud

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 30/05/2019 13:29:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
INSERT INTO `tb_dept` VALUES (1, '行政部');

-- ----------------------------
-- Table structure for tb_emp
-- ----------------------------
DROP TABLE IF EXISTS `tb_emp`;
CREATE TABLE `tb_emp`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `fk_emp_dept`(`d_id`) USING BTREE,
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tb_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_emp
-- ----------------------------
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (1, '海舟南', 'F', '895484122@qq.com', 1);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (2, '流川枫', 'F', '895484122@qq.com', 2);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (3, '风清扬', 'M', '895484122@qq.com', 3);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (4, '杨春雪', 'M', '895484122@qq.com', 4);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (5, '雪上霜', 'M', '895484122@qq.com', 5);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (6, '海舟南', 'F', '895484122@qq.com', 1);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (7, '李娇娇', 'F', '165132@qq.com', 4);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (8, '小小李', 'M', '54654@qq.com', 5);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (9, '李娇娇', 'F', '165132@qq.com', 1);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (10, '小小李', 'M', '54654@qq.com', 3);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (11, '海舟南', 'F', '895484122@qq.com', 1);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (12, '流川枫', 'F', '895484122@qq.com', 2);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (13, '风清扬', 'M', '895484122@qq.com', 3);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (14, '杨春雪', 'M', '895484122@qq.com', 4);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (15, '雪上霜', 'M', '895484122@qq.com', 5);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (16, '海舟南', 'F', '895484122@qq.com', 1);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (17, '李娇娇', 'F', '165132@qq.com', 4);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (18, '小小李', 'M', '54654@qq.com', 5);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (19, '李娇娇', 'F', '165132@qq.com', 1);
INSERT INTO `ssm_crud`.`tb_emp`(`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES (20, '小小李', 'M', '54654@qq.com', 3);

SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE t_user;
##建立用户表t_user
CREATE TABLE T_USER (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    USERNAME VARCHAR(16) NOT NULL,
    PASSWORD VARCHAR(16) NOT NULL
    );
INSERT INTO T_USER (USERNAME,PASSWORD) VALUES ("admin","123");
