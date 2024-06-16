/*
 Navicat Premium Data Transfer

 Source Server         : my mysql 
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 17/01/2020 17:16:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `admin_id` int(55) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` char(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` bigint(55) NULL DEFAULT NULL,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `empnum`(`roleId`) USING BTREE,
  CONSTRAINT `fk_roleId` FOREIGN KEY (`roleId`) REFERENCES `tb_role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (1, 'jack', 'E10ADC3949BA59ABBE56E057F20F883E', '杰克', 1, '超级管理员', '2', '13212341234', 'jack@126.com');
INSERT INTO `tb_admin` VALUES (3, '员工2', 'E10ADC3949BA59ABBE56E057F20F883E', '小丑', 2, '0', '0', '13212341234', '123@126.com');

-- ----------------------------
-- Table structure for tb_adminlog
-- ----------------------------
DROP TABLE IF EXISTS `tb_adminlog`;
CREATE TABLE `tb_adminlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminUsername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginTime` datetime,
  `logoutTime` datetime,
  `isSafeExit` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_adminlog
-- ----------------------------
INSERT INTO `tb_adminlog` VALUES (1, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 10:42:35', '2019-12-31 10:42:58', 1);
INSERT INTO `tb_adminlog` VALUES (2, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 10:43:09', '2019-12-31 10:43:09', 0);
INSERT INTO `tb_adminlog` VALUES (3, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 10:47:32', '2019-12-31 10:47:32', 0);
INSERT INTO `tb_adminlog` VALUES (4, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 10:53:09', '2019-12-31 10:53:34', 1);
INSERT INTO `tb_adminlog` VALUES (5, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 10:53:48', '2019-12-31 10:53:48', 0);
INSERT INTO `tb_adminlog` VALUES (6, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 10:56:38', '2019-12-31 10:56:38', 0);
INSERT INTO `tb_adminlog` VALUES (7, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 10:58:05', '2019-12-31 10:58:59', 1);
INSERT INTO `tb_adminlog` VALUES (8, '员工1', '0:0:0:0:0:0:0:1', '2019-12-31 10:59:24', '2019-12-31 10:59:48', 1);
INSERT INTO `tb_adminlog` VALUES (9, '员工1', '0:0:0:0:0:0:0:1', '2019-12-31 10:59:59', '2019-12-31 11:00:08', 1);
INSERT INTO `tb_adminlog` VALUES (10, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 11:00:20', '2019-12-31 11:20:21', 1);
INSERT INTO `tb_adminlog` VALUES (11, '员工2', '0:0:0:0:0:0:0:1', '2019-12-31 11:21:31', '2019-12-31 11:23:30', 1);
INSERT INTO `tb_adminlog` VALUES (12, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 14:23:44', '2019-12-31 14:25:11', 1);
INSERT INTO `tb_adminlog` VALUES (13, 'jack', '0:0:0:0:0:0:0:1', '2019-12-31 17:16:08', '2019-12-31 17:17:23', 1);
INSERT INTO `tb_adminlog` VALUES (14, '员工2', '0:0:0:0:0:0:0:1', '2019-12-31 17:18:05', '2019-12-31 17:18:22', 1);
INSERT INTO `tb_adminlog` VALUES (15, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 08:26:25', '2020-01-01 08:27:29', 1);
INSERT INTO `tb_adminlog` VALUES (16, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 08:58:38', '2020-01-01 09:04:38', 1);
INSERT INTO `tb_adminlog` VALUES (17, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 10:01:53', '2020-01-01 10:01:53', 0);
INSERT INTO `tb_adminlog` VALUES (18, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 10:08:40', '2020-01-01 10:08:45', 1);
INSERT INTO `tb_adminlog` VALUES (19, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 10:24:09', '2020-01-01 10:24:21', 1);
INSERT INTO `tb_adminlog` VALUES (20, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 10:32:05', '2020-01-01 10:32:33', 1);
INSERT INTO `tb_adminlog` VALUES (21, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 15:37:44', '2020-01-01 15:37:44', 0);
INSERT INTO `tb_adminlog` VALUES (22, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 15:42:40', '2020-01-01 15:43:19', 1);
INSERT INTO `tb_adminlog` VALUES (23, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 15:49:02', '2020-01-01 15:49:02', 0);
INSERT INTO `tb_adminlog` VALUES (24, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 16:18:13', '2020-01-01 16:18:49', 1);
INSERT INTO `tb_adminlog` VALUES (25, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 16:22:15', '2020-01-01 16:22:15', 0);
INSERT INTO `tb_adminlog` VALUES (26, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 17:02:09', '2020-01-01 17:02:09', 0);
INSERT INTO `tb_adminlog` VALUES (27, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 17:11:37', '2020-01-01 17:11:42', 1);
INSERT INTO `tb_adminlog` VALUES (28, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 17:17:49', '2020-01-01 17:17:51', 1);
INSERT INTO `tb_adminlog` VALUES (29, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 21:18:27', '2020-01-01 21:18:27', 0);
INSERT INTO `tb_adminlog` VALUES (30, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 21:30:18', '2020-01-01 21:30:18', 0);
INSERT INTO `tb_adminlog` VALUES (31, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 21:35:01', '2020-01-01 21:35:01', 0);
INSERT INTO `tb_adminlog` VALUES (32, 'jack', '0:0:0:0:0:0:0:1', '2020-01-01 21:43:51', '2020-01-01 21:43:54', 1);
INSERT INTO `tb_adminlog` VALUES (33, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 09:38:23', '2020-01-02 09:38:23', 0);
INSERT INTO `tb_adminlog` VALUES (34, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 09:42:42', '2020-01-02 09:42:42', 0);
INSERT INTO `tb_adminlog` VALUES (35, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 09:44:23', '2020-01-02 09:44:23', 0);
INSERT INTO `tb_adminlog` VALUES (36, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 09:59:52', '2020-01-02 09:59:52', 0);
INSERT INTO `tb_adminlog` VALUES (37, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:07:09', '2020-01-02 10:07:09', 0);
INSERT INTO `tb_adminlog` VALUES (38, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:09:04', '2020-01-02 10:09:04', 0);
INSERT INTO `tb_adminlog` VALUES (39, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:13:31', '2020-01-02 10:15:51', 1);
INSERT INTO `tb_adminlog` VALUES (40, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:16:30', '2020-01-02 10:17:17', 1);
INSERT INTO `tb_adminlog` VALUES (41, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:17:57', '2020-01-02 10:17:57', 0);
INSERT INTO `tb_adminlog` VALUES (42, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:23:02', '2020-01-02 10:23:02', 0);
INSERT INTO `tb_adminlog` VALUES (43, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:28:07', '2020-01-02 10:28:58', 1);
INSERT INTO `tb_adminlog` VALUES (44, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:29:41', '2020-01-02 10:30:54', 1);
INSERT INTO `tb_adminlog` VALUES (45, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 10:54:50', '2020-01-02 10:54:50', 0);
INSERT INTO `tb_adminlog` VALUES (46, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 11:05:57', '2020-01-02 11:05:57', 0);
INSERT INTO `tb_adminlog` VALUES (47, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 11:22:02', '2020-01-02 11:25:34', 1);
INSERT INTO `tb_adminlog` VALUES (48, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 11:25:58', '2020-01-02 11:25:58', 0);
INSERT INTO `tb_adminlog` VALUES (49, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 11:26:40', '2020-01-02 11:27:59', 1);
INSERT INTO `tb_adminlog` VALUES (50, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 14:24:02', '2020-01-02 14:24:15', 1);
INSERT INTO `tb_adminlog` VALUES (51, 'jack', '0:0:0:0:0:0:0:1', '2020-01-02 14:28:30', '2020-01-02 14:28:35', 1);
INSERT INTO `tb_adminlog` VALUES (52, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 09:21:07', '2020-01-03 09:21:07', 0);
INSERT INTO `tb_adminlog` VALUES (53, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 10:00:04', '2020-01-03 10:07:02', 1);
INSERT INTO `tb_adminlog` VALUES (54, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 10:07:47', '2020-01-03 10:07:47', 0);
INSERT INTO `tb_adminlog` VALUES (55, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 10:10:35', '2020-01-03 10:15:36', 1);
INSERT INTO `tb_adminlog` VALUES (56, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 10:17:07', '2020-01-03 10:26:27', 1);
INSERT INTO `tb_adminlog` VALUES (57, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 10:27:11', '2020-01-03 10:36:04', 1);
INSERT INTO `tb_adminlog` VALUES (58, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 10:36:51', '2020-01-03 10:36:51', 0);
INSERT INTO `tb_adminlog` VALUES (59, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 10:43:03', '2020-01-03 10:46:05', 1);
INSERT INTO `tb_adminlog` VALUES (60, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 14:13:05', '2020-01-03 14:13:05', 0);
INSERT INTO `tb_adminlog` VALUES (61, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 15:22:01', '2020-01-03 15:23:41', 1);
INSERT INTO `tb_adminlog` VALUES (62, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 15:24:36', '2020-01-03 15:31:54', 1);
INSERT INTO `tb_adminlog` VALUES (63, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 15:32:56', '2020-01-03 15:34:19', 1);
INSERT INTO `tb_adminlog` VALUES (64, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 15:34:58', '2020-01-03 15:34:58', 0);
INSERT INTO `tb_adminlog` VALUES (65, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 16:52:25', '2020-01-03 16:54:10', 1);
INSERT INTO `tb_adminlog` VALUES (66, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 16:55:11', '2020-01-03 17:05:48', 1);
INSERT INTO `tb_adminlog` VALUES (67, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 17:06:00', '2020-01-03 17:09:46', 1);
INSERT INTO `tb_adminlog` VALUES (68, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 17:10:38', '2020-01-03 17:15:43', 1);
INSERT INTO `tb_adminlog` VALUES (69, 'jack', '0:0:0:0:0:0:0:1', '2020-01-03 19:12:59', '2020-01-03 19:20:34', 1);
INSERT INTO `tb_adminlog` VALUES (70, 'jack', '0:0:0:0:0:0:0:1', '2020-01-07 14:20:44', '2020-01-07 14:20:44', 0);
INSERT INTO `tb_adminlog` VALUES (71, 'jack', '0:0:0:0:0:0:0:1', '2020-01-07 14:29:55', '2020-01-07 14:29:55', 0);
INSERT INTO `tb_adminlog` VALUES (72, 'jack', '0:0:0:0:0:0:0:1', '2020-01-07 14:31:22', '2020-01-07 14:40:32', 1);
INSERT INTO `tb_adminlog` VALUES (73, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 11:42:08', '2020-01-08 11:42:08', 0);
INSERT INTO `tb_adminlog` VALUES (74, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 11:45:34', '2020-01-08 11:45:34', 0);
INSERT INTO `tb_adminlog` VALUES (75, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 11:51:44', '2020-01-08 11:52:17', 1);
INSERT INTO `tb_adminlog` VALUES (76, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 11:52:48', '2020-01-08 11:52:48', 0);
INSERT INTO `tb_adminlog` VALUES (77, 'jack', '0:0:0:0:0:0:0:1', '2020-01-09 10:28:12', '2020-01-09 10:28:39', 1);
INSERT INTO `tb_adminlog` VALUES (78, 'jack', '0:0:0:0:0:0:0:1', '2020-01-10 16:15:35', '2020-01-10 16:15:35', 0);
INSERT INTO `tb_adminlog` VALUES (79, 'jack', '0:0:0:0:0:0:0:1', '2020-01-10 16:33:44', '2020-01-10 16:33:44', 0);
INSERT INTO `tb_adminlog` VALUES (80, 'jack', '0:0:0:0:0:0:0:1', '2020-01-10 16:38:55', '2020-01-10 16:42:14', 1);
INSERT INTO `tb_adminlog` VALUES (81, 'jack', '0:0:0:0:0:0:0:1', '2020-01-10 16:42:35', '2020-01-10 16:42:48', 1);
INSERT INTO `tb_adminlog` VALUES (82, 'jack', '0:0:0:0:0:0:0:1', '2020-01-10 16:45:03', '2020-01-10 16:59:59', 1);
INSERT INTO `tb_adminlog` VALUES (83, 'jack', '0:0:0:0:0:0:0:1', '2020-01-12 15:54:47', '2020-01-12 15:55:14', 1);
INSERT INTO `tb_adminlog` VALUES (84, 'jack', '0:0:0:0:0:0:0:1', '2020-01-14 11:33:48', '2020-01-14 11:45:12', 1);
INSERT INTO `tb_adminlog` VALUES (85, 'jack', '0:0:0:0:0:0:0:1', '2020-01-14 15:45:33', '2020-01-14 15:45:33', 0);
INSERT INTO `tb_adminlog` VALUES (86, 'jack', '0:0:0:0:0:0:0:1', '2020-01-14 15:52:27', '2020-01-14 15:52:27', 0);
INSERT INTO `tb_adminlog` VALUES (87, 'jack', '0:0:0:0:0:0:0:1', '2020-01-14 16:04:29', '2020-01-14 16:09:07', 1);
INSERT INTO `tb_adminlog` VALUES (88, 'jack', '0:0:0:0:0:0:0:1', '2020-01-14 16:09:55', '2020-01-14 16:19:37', 1);
INSERT INTO `tb_adminlog` VALUES (89, 'jack', '0:0:0:0:0:0:0:1', '2020-01-14 16:20:05', '2020-01-14 16:33:56', 1);
INSERT INTO `tb_adminlog` VALUES (90, 'jack', '0:0:0:0:0:0:0:1', '2020-01-14 16:36:47', '2020-01-14 16:37:58', 1);
INSERT INTO `tb_adminlog` VALUES (91, 'jack', '0:0:0:0:0:0:0:1', '2020-01-15 08:56:23', '2020-01-15 09:00:20', 1);
INSERT INTO `tb_adminlog` VALUES (92, 'jack', '0:0:0:0:0:0:0:1', '2020-01-15 09:01:51', '2020-01-15 09:01:51', 0);
INSERT INTO `tb_adminlog` VALUES (93, 'jack', '0:0:0:0:0:0:0:1', '2020-01-15 13:11:13', '2020-01-15 13:11:13', 0);
INSERT INTO `tb_adminlog` VALUES (94, 'jack', '0:0:0:0:0:0:0:1', '2020-01-15 19:19:24', '2020-01-15 19:20:46', 1);
INSERT INTO `tb_adminlog` VALUES (95, 'jack', '0:0:0:0:0:0:0:1', '2020-01-15 19:21:59', '2020-01-15 19:22:48', 1);
INSERT INTO `tb_adminlog` VALUES (96, 'jack', '0:0:0:0:0:0:0:1', '2020-01-15 19:23:54', '2020-01-15 19:28:35', 1);
INSERT INTO `tb_adminlog` VALUES (97, 'jack', '0:0:0:0:0:0:0:1', '2020-01-16 08:55:55', '2020-01-16 08:58:11', 1);
INSERT INTO `tb_adminlog` VALUES (98, 'jack', '0:0:0:0:0:0:0:1', '2020-01-16 08:59:35', '2020-01-16 09:00:19', 1);
INSERT INTO `tb_adminlog` VALUES (99, 'jack', '0:0:0:0:0:0:0:1', '2020-01-16 11:55:27', '2020-01-16 11:55:49', 1);
INSERT INTO `tb_adminlog` VALUES (100, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 08:43:52', '2020-01-17 08:44:26', 1);
INSERT INTO `tb_adminlog` VALUES (101, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 09:23:51', '2020-01-17 09:24:50', 1);
INSERT INTO `tb_adminlog` VALUES (102, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 09:26:42', '2020-01-17 09:26:49', 1);
INSERT INTO `tb_adminlog` VALUES (103, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 10:20:03', '2020-01-17 10:20:30', 1);
INSERT INTO `tb_adminlog` VALUES (104, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 10:53:57', '2020-01-17 10:53:57', 0);
INSERT INTO `tb_adminlog` VALUES (105, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 10:56:24', '2020-01-17 10:56:24', 0);
INSERT INTO `tb_adminlog` VALUES (106, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 10:59:10', '2020-01-17 10:59:10', 0);
INSERT INTO `tb_adminlog` VALUES (107, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 11:27:55', '2020-01-17 11:41:26', 1);
INSERT INTO `tb_adminlog` VALUES (108, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 12:45:36', '2020-01-17 12:47:04', 1);
INSERT INTO `tb_adminlog` VALUES (109, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 13:14:26', '2020-01-17 13:27:26', 1);
INSERT INTO `tb_adminlog` VALUES (110, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 13:28:08', '2020-01-17 13:32:40', 1);
INSERT INTO `tb_adminlog` VALUES (111, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 13:33:28', '2020-01-17 13:33:28', 0);
INSERT INTO `tb_adminlog` VALUES (112, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 16:55:22', '2020-01-17 16:55:48', 1);
INSERT INTO `tb_adminlog` VALUES (113, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 17:03:47', '2020-01-17 17:05:37', 1);
INSERT INTO `tb_adminlog` VALUES (114, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 17:06:18', '2020-01-17 17:06:18', 0);
INSERT INTO `tb_adminlog` VALUES (115, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 17:07:11', '2020-01-17 17:07:11', 0);
INSERT INTO `tb_adminlog` VALUES (116, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 17:09:50', '2020-01-17 17:10:58', 1);
INSERT INTO `tb_adminlog` VALUES (117, 'jack', '0:0:0:0:0:0:0:1', '2020-01-17 17:12:05', '2020-01-17 17:12:05', 0);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` datetime,
  `room_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `comment_user_fk`(`user_id`) USING BTREE,
  INDEX `comment_room_info_fk`(`room_info_id`) USING BTREE,
  CONSTRAINT `comment_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commet_room_id` FOREIGN KEY (`room_info_id`) REFERENCES `tb_room_info` (`room_info_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (2, '房间很干净，儿子很喜欢，无线很快。', '2020-01-06 16:06:45', 3, 3);
INSERT INTO `tb_comment` VALUES (3, '无线很快，地面很干净，窗外景色很美。', '2020-01-01 16:10:12', 3, 4);
INSERT INTO `tb_comment` VALUES (4, '很舒服，早餐很好吃，点赞。', '2019-12-26 16:10:54', 4, 5);
INSERT INTO `tb_comment` VALUES (5, '很好，家人很喜欢。', '2020-01-17 10:21:25', 14, 15);
INSERT INTO `tb_comment` VALUES (6, '不错的房间，很干净。', '2020-01-17 10:21:58', 13, 15);
INSERT INTO `tb_comment` VALUES (8, '很舒服，早餐很好吃。', '2020-01-17 17:00:27', 10, 3);
INSERT INTO `tb_comment` VALUES (9, '很好，下次还会来。', '2020-01-17 17:01:42', 8, 1);
INSERT INTO `tb_comment` VALUES (10, '很好，早餐很好吃。、', '2020-01-17 17:01:55', 4, 1);
INSERT INTO `tb_comment` VALUES (11, '睡的很舒服。', '2020-01-17 17:02:08', 3, 1);

-- ----------------------------
-- Table structure for tb_history_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_history_order`;
CREATE TABLE `tb_history_order`  (
  `histoty_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `checkOutDate` datetime,
  PRIMARY KEY (`histoty_order_id`) USING BTREE,
  INDEX `history_order_admin_fk`(`admin_id`) USING BTREE,
  INDEX `history_order_reservation_fk`(`reservation_id`) USING BTREE,
  CONSTRAINT `history_order_admin_fk` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `history_order_reservation_fk` FOREIGN KEY (`reservation_id`) REFERENCES `tb_reservation` (`reservation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `menuId` bigint(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` bigint(20) NULL DEFAULT NULL,
  `sorting` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1, '后台首页', 'layui-icon-home', NULL, NULL, 'false', 0, 1);
INSERT INTO `tb_menu` VALUES (2, '我的面板', 'layui-icon-username', NULL, NULL, 'false', 0, 2);
INSERT INTO `tb_menu` VALUES (3, '个人信息', 'layui-icon-username', '../admin/personalDate', NULL, 'false', 2, 111);
INSERT INTO `tb_menu` VALUES (4, '修改密码', 'layui-icon-password', '../admin/changePassword', NULL, 'false', 2, 112);
INSERT INTO `tb_menu` VALUES (5, '登录日志', 'layui-icon-log', '../admin/adminLoginLog', NULL, 'false', 2, 113);
INSERT INTO `tb_menu` VALUES (6, '管理员管理', 'layui-icon-set', NULL, NULL, 'false', 0, 3);
INSERT INTO `tb_menu` VALUES (7, '管理员列表', 'layui-icon-more-vertical', '../admin/adminList', '', 'false', 6, 114);
INSERT INTO `tb_menu` VALUES (8, '角色管理', 'layui-icon-form', '../admin/roleList', NULL, 'false', 6, 115);
INSERT INTO `tb_menu` VALUES (9, '订单管理', 'layui-icon-home', NULL, NULL, 'false', 0, 4);
INSERT INTO `tb_menu` VALUES (10, '预定房间订单', 'layui-icon-form', '../admin/reservationList', NULL, 'false', 9, 116);
INSERT INTO `tb_menu` VALUES (13, '客房信息管理', 'layui-icon-form', NULL, NULL, 'false', 0, 5);
INSERT INTO `tb_menu` VALUES (14, '客房列表', 'layui-icon-form', '../room/roomList', NULL, 'false', 13, 119);
INSERT INTO `tb_menu` VALUES (15, '酒店活动管理', 'layui-icon-form', NULL, NULL, 'false', 0, 6);
INSERT INTO `tb_menu` VALUES (16, '活动列表管理', 'layui-icon-form', '../promotion/AdminPromotionList', NULL, 'false', 15, 120);
INSERT INTO `tb_menu` VALUES (17, '会员评论管理', 'layui-icon-form', NULL, NULL, 'false', 0, 7);
INSERT INTO `tb_menu` VALUES (18, '会员评论列表', 'layui-icon-form', '../admin/commentList', NULL, 'false', 17, 121);
INSERT INTO `tb_menu` VALUES (19, '会员管理', 'layui-icon-username', NULL, NULL, 'false', 0, 8);
INSERT INTO `tb_menu` VALUES (20, '会员列表', 'layui-icon-form', '../admin/userList', NULL, 'false', 19, 122);
INSERT INTO `tb_menu` VALUES (21, '酒店之家', 'layui-icon-home', NULL, NULL, 'false', 0, 9);
INSERT INTO `tb_menu` VALUES (22, '酒店活动', 'layui-icon-home', '', NULL, 'false', 0, 10);
INSERT INTO `tb_menu` VALUES (23, '浏览客房', 'layui-icon-home', '../user/roomList', NULL, 'false', 21, 124);
INSERT INTO `tb_menu` VALUES (24, '我的历史订单', 'layui-icon-log', '../user/orderList', NULL, 'false', 21, 125);
INSERT INTO `tb_menu` VALUES (25, '会员中心', 'layui-icon-home', NULL, NULL, 'false', 0, 10);
INSERT INTO `tb_menu` VALUES (26, '会员资料', 'layui-icon-form', '../user/info', NULL, 'false', 25, 126);
INSERT INTO `tb_menu` VALUES (27, '修改密码', 'layui-icon-home', '../user/changePassword', NULL, 'false', 25, 127);
INSERT INTO `tb_menu` VALUES (28, '房间类型', 'layui-icon-home', '../room/Catalog', NULL, 'false', 13, 128);
INSERT INTO `tb_menu` VALUES (29, '已入住房间订单', 'layui-icon-form', '../admin/reservationDoneList', NULL, 'false', 9, 117);
INSERT INTO `tb_menu` VALUES (30, '预订成功的订单', 'layui-icon-home', '../user/nowOrderList', NULL, 'false', 21, 130);
INSERT INTO `tb_menu` VALUES (31, '查看酒店活动', 'layui-icon-home', '../promotion/promotionList', NULL, 'false', 22, 131);

-- ----------------------------
-- Table structure for tb_promotion
-- ----------------------------
DROP TABLE IF EXISTS `tb_promotion`;
CREATE TABLE `tb_promotion`  (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` datetime,
  PRIMARY KEY (`promotion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_promotion
-- ----------------------------
INSERT INTO `tb_promotion` VALUES (2, '活动2', '新推出豪华套餐，八折优惠', '2019-12-05 13:12:58');
INSERT INTO `tb_promotion` VALUES (3, '活动3', '最新活动，早餐免费。', '2020-01-07 13:13:22');
INSERT INTO `tb_promotion` VALUES (5, '活动4', '开业大酬宾 八折优惠', '2020-01-17 13:35:17');

-- ----------------------------
-- Table structure for tb_reservation
-- ----------------------------
DROP TABLE IF EXISTS `tb_reservation`;
CREATE TABLE `tb_reservation`  (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `order_time` datetime,
  `days` int(11) NOT NULL DEFAULT 1,
  `check_in_time` datetime,
  `check_in_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `check_in_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_info_id` int(11) NOT NULL,
  PRIMARY KEY (`reservation_id`) USING BTREE,
  INDEX `reservation_user_fk`(`user_id`) USING BTREE,
  INDEX `reservation_room_info_id_fk`(`room_info_id`) USING BTREE,
  CONSTRAINT `re_room_info_id` FOREIGN KEY (`room_info_id`) REFERENCES `tb_room_info` (`room_info_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reservation_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_reservation
-- ----------------------------
INSERT INTO `tb_reservation` VALUES (1, 1, '2020-01-09 14:23:15', 5, '2020-01-15 12:00:00', '露丝', '13212341234', 1, 3);
INSERT INTO `tb_reservation` VALUES (3, 1, '2020-01-09 14:28:09', 4, '2020-01-21 12:00:00', '科比布莱恩特', '13212341234', 3, 10);
INSERT INTO `tb_reservation` VALUES (4, 1, '2020-01-09 14:29:35', 3, '2020-01-20 13:00:00', '奥尼尔', '13212341234', 2, 5);
INSERT INTO `tb_reservation` VALUES (5, 1, '2020-01-09 16:55:45', 4, '2020-01-30 00:00:00', '肖华', '13212341234', 14, 12);
INSERT INTO `tb_reservation` VALUES (6, 1, '2020-01-09 16:58:01', 3, '2020-01-21 00:00:00', '韩天明', '13212345678', 15, 14);
INSERT INTO `tb_reservation` VALUES (7, 1, '2020-01-09 16:59:55', 3, '2020-01-23 00:00:00', '韩天明', '13212345678', 15, 13);
INSERT INTO `tb_reservation` VALUES (8, 1, '2020-01-16 08:59:09', 2, '2020-01-23 00:00:00', '小李', '13212341234', 4, 3);
INSERT INTO `tb_reservation` VALUES (9, 1, '2020-01-17 08:42:34', 2, '2020-01-30 00:00:00', '露丝', '13212341234', 1, 4);
INSERT INTO `tb_reservation` VALUES (11, 1, '2020-01-17 09:22:21', 1, '2020-01-25 00:00:00', '露丝', '13212341234', 1, 8);
INSERT INTO `tb_reservation` VALUES (13, 1, '2020-01-17 09:23:33', 2, '2020-01-25 00:00:00', '小李', '13212341234', 4, 9);
INSERT INTO `tb_reservation` VALUES (14, 1, '2020-01-17 16:55:04', 3, '2020-01-18 00:00:00', '露丝', '13212341234', 1, 3);
INSERT INTO `tb_reservation` VALUES (15, 0, '2020-01-17 16:56:21', 2, '2020-01-24 00:00:00', '韩天明', '13212345678', 15, 6);
INSERT INTO `tb_reservation` VALUES (16, 0, '2020-01-17 16:59:21', 4, '2020-01-23 00:00:00', '韩天明', '13212345678', 15, 10);
INSERT INTO `tb_reservation` VALUES (17, 0, '2020-01-17 16:59:32', 1, '2020-01-31 00:00:00', '韩天明', '13212345678', 15, 11);
INSERT INTO `tb_reservation` VALUES (18, 0, '2020-01-17 17:00:08', 4, '2020-01-29 00:00:00', '科比布莱恩特', '13212341234', 3, 8);
INSERT INTO `tb_reservation` VALUES (19, 0, '2020-01-17 17:00:52', 3, '2020-01-28 00:00:00', '科比布莱恩特', '13212341234', 3, 14);
INSERT INTO `tb_reservation` VALUES (20, 0, '2020-01-17 17:02:24', 4, '2020-01-27 00:00:00', '露丝', '13212341234', 1, 7);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `roleId` bigint(255) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleRemark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '超级管理员', '所有权限');
INSERT INTO `tb_role` VALUES (2, '普通管理员', '普通员工');
INSERT INTO `tb_role` VALUES (3, '会员', '一般会员；会员注册登录使用。');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
  `roleId` bigint(11) NOT NULL,
  `menuId` bigint(11) NOT NULL,
  INDEX `fk_tb_roleId`(`roleId`) USING BTREE,
  INDEX `fk_tb_menuId`(`menuId`) USING BTREE,
  CONSTRAINT `fk_tb_menuId` FOREIGN KEY (`menuId`) REFERENCES `tb_menu` (`menuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_roleId` FOREIGN KEY (`roleId`) REFERENCES `tb_role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES (1, 1);
INSERT INTO `tb_role_menu` VALUES (1, 2);
INSERT INTO `tb_role_menu` VALUES (1, 3);
INSERT INTO `tb_role_menu` VALUES (1, 4);
INSERT INTO `tb_role_menu` VALUES (1, 5);
INSERT INTO `tb_role_menu` VALUES (1, 6);
INSERT INTO `tb_role_menu` VALUES (1, 7);
INSERT INTO `tb_role_menu` VALUES (1, 8);
INSERT INTO `tb_role_menu` VALUES (1, 9);
INSERT INTO `tb_role_menu` VALUES (1, 10);
INSERT INTO `tb_role_menu` VALUES (1, 29);
INSERT INTO `tb_role_menu` VALUES (1, 13);
INSERT INTO `tb_role_menu` VALUES (1, 14);
INSERT INTO `tb_role_menu` VALUES (1, 28);
INSERT INTO `tb_role_menu` VALUES (1, 15);
INSERT INTO `tb_role_menu` VALUES (1, 16);
INSERT INTO `tb_role_menu` VALUES (1, 17);
INSERT INTO `tb_role_menu` VALUES (1, 18);
INSERT INTO `tb_role_menu` VALUES (1, 19);
INSERT INTO `tb_role_menu` VALUES (1, 20);
INSERT INTO `tb_role_menu` VALUES (2, 1);
INSERT INTO `tb_role_menu` VALUES (2, 2);
INSERT INTO `tb_role_menu` VALUES (2, 3);
INSERT INTO `tb_role_menu` VALUES (2, 4);
INSERT INTO `tb_role_menu` VALUES (2, 5);
INSERT INTO `tb_role_menu` VALUES (2, 9);
INSERT INTO `tb_role_menu` VALUES (2, 10);
INSERT INTO `tb_role_menu` VALUES (2, 29);
INSERT INTO `tb_role_menu` VALUES (3, 1);
INSERT INTO `tb_role_menu` VALUES (3, 21);
INSERT INTO `tb_role_menu` VALUES (3, 23);
INSERT INTO `tb_role_menu` VALUES (3, 24);
INSERT INTO `tb_role_menu` VALUES (3, 30);
INSERT INTO `tb_role_menu` VALUES (3, 22);
INSERT INTO `tb_role_menu` VALUES (3, 31);
INSERT INTO `tb_role_menu` VALUES (3, 25);
INSERT INTO `tb_role_menu` VALUES (3, 26);
INSERT INTO `tb_role_menu` VALUES (3, 27);

-- ----------------------------
-- Table structure for tb_room_catalog
-- ----------------------------
DROP TABLE IF EXISTS `tb_room_catalog`;
CREATE TABLE `tb_room_catalog`  (
  `room_catalog_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`room_catalog_id`) USING BTREE,
  UNIQUE INDEX `catalog`(`catalog`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room_catalog
-- ----------------------------
INSERT INTO `tb_room_catalog` VALUES (6, '三人间');
INSERT INTO `tb_room_catalog` VALUES (7, '四人间');
INSERT INTO `tb_room_catalog` VALUES (5, '平价房');
INSERT INTO `tb_room_catalog` VALUES (3, '标准房');
INSERT INTO `tb_room_catalog` VALUES (1, '豪华房');
INSERT INTO `tb_room_catalog` VALUES (2, '轻奢房');

-- ----------------------------
-- Table structure for tb_room_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_room_info`;
CREATE TABLE `tb_room_info`  (
  `room_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` int(11) NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `room_catalog_id` int(11) NOT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `version` bigint(255) NULL DEFAULT NULL,
  `photo_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`room_info_id`) USING BTREE,
  INDEX `fk_catalog`(`room_catalog_id`) USING BTREE,
  CONSTRAINT `fk_catalog` FOREIGN KEY (`room_catalog_id`) REFERENCES `tb_room_catalog` (`room_catalog_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room_info
-- ----------------------------
INSERT INTO `tb_room_info` VALUES (3, '101', 101, '禁烟，无线，含早餐;大床。', 355.00, 1, 0, NULL, '1585500744952646d4344fc4aa7de8bad486dae5.jpeg');
INSERT INTO `tb_room_info` VALUES (4, '103', 120, '禁烟；无线；含早餐，午餐。', 400.00, 1, 0, NULL, '579685596fce4cd40b2f4cd1b379e6e0cbb037ac.jpeg');
INSERT INTO `tb_room_info` VALUES (5, '104', 110, '禁烟；无线；热水；大床。', 366.00, 1, 0, NULL, '45128651551af790330405f8b08bcb37cf6d3e9.jpeg');
INSERT INTO `tb_room_info` VALUES (6, '201', 120, '禁烟；无线；含早；双人床。', 333.00, 2, 2, NULL, '5532546342ee67a35b38471f82053ef793f406f2.jpeg');
INSERT INTO `tb_room_info` VALUES (7, '202', 120, '禁烟；无线；含早餐。', 320.00, 2, 1, NULL, '74737333b664e0f5520247a88a55489ed030aa84.jpeg');
INSERT INTO `tb_room_info` VALUES (8, '203', 120, '无线；禁烟；大床。', 300.00, 2, 1, NULL, '91836827772817b4b8404599b958b9a4016d6bdc.jpeg');
INSERT INTO `tb_room_info` VALUES (9, '301', 100, '禁烟；无线；含早餐。', 288.00, 3, 0, NULL, '36433074fca68c13ba5e4133a3d27b84ee581b83.jpeg');
INSERT INTO `tb_room_info` VALUES (10, '302', 90, '无线；禁烟；双人床。', 268.00, 3, 1, NULL, '902682530090c377e571443fa8e5c73ca3e3f2b4.jpeg');
INSERT INTO `tb_room_info` VALUES (11, '303', 90, '禁烟；无线；含早餐。', 255.00, 3, 1, NULL, '790984490c4a5228d83b4eb4ad5534221c915584.jpeg');
INSERT INTO `tb_room_info` VALUES (12, '401', 100, '无线；禁烟；双人床。', 199.00, 5, 0, NULL, '36557607c3dc46fa44a54bf3a5db7e57e5511b57.jpeg');
INSERT INTO `tb_room_info` VALUES (13, '402', 100, '无线；禁烟；大床。', 188.00, 5, 0, NULL, '28128340bf7af8e888114052be9ee5d4728292a0.jpeg');
INSERT INTO `tb_room_info` VALUES (14, '403', 80, '无线；禁烟；大床。', 188.00, 5, 1, NULL, '41091440a50e085e554241878a12169d7b8d48cf.jpeg');
INSERT INTO `tb_room_info` VALUES (15, '501', 120, '禁烟；无线；三人间。', 500.00, 6, 0, NULL, '16972750890833d2a75c460fb864813950c18bd2.jpeg');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(4) NULL DEFAULT 1,
  `roleId` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `fk_roleId_user`(`roleId`) USING BTREE,
  CONSTRAINT `fk_roleId_user` FOREIGN KEY (`roleId`) REFERENCES `tb_role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'rose', 'E10ADC3949BA59ABBE56E057F20F883E', 'rose@126.com', '13212341234', '露丝', '0', '76128240d57c4d9cfb7a47f7882cf06b00d87d15.jpeg', 1, 3, '2019-12-01 08:25:16');
INSERT INTO `tb_user` VALUES (2, 'onel', 'E10ADC3949BA59ABBE56E057F20F883E', 'onel@qq.com', '13212341234', '奥尼尔', '0', '68667404ced8fc1e19aa48f1acb99db1cc6a70d7.gif', 1, 3, '2020-01-01 08:24:40');
INSERT INTO `tb_user` VALUES (3, 'kobe', 'E10ADC3949BA59ABBE56E057F20F883E', 'kebo@126.com', '13212341234', '科比布莱恩特', '0', '98816647f1f383a0b14d48f4910bfe04368eb892.gif', 1, 3, '2020-01-01 16:05:35');
INSERT INTO `tb_user` VALUES (4, 'xiaoli', 'E10ADC3949BA59ABBE56E057F20F883E', 'xiaoli@126.com', '13212341234', '小李', '1', '59324317e1c1f09a333447ad97f499fa13463913.png', 1, 3, '2020-01-01 17:18:41');
INSERT INTO `tb_user` VALUES (5, 'xiao', 'E10ADC3949BA59ABBE56E057F20F883E', '123@126.com', '13211111111', '莱昂纳多', '1', '1165700188dc707df9f34d1699fa9d3122c24db9.gif', 1, 3, '2020-01-01 17:30:54');
INSERT INTO `tb_user` VALUES (6, 'xx', 'E10ADC3949BA59ABBE56E057F20F883E', '1231@126.com', '13211111111', '韩梅梅', '1', '81536891e96e79d43ed949fca0279325d65a57a9.gif', 1, 3, '2020-01-01 17:44:49');
INSERT INTO `tb_user` VALUES (7, 'll', 'E10ADC3949BA59ABBE56E057F20F883E', '12@126.com', '13212341234', '莉莉', '1', '57697092e20e86f673a7408c90e82ca0deb2f561.gif', 1, 3, '2020-01-01 20:41:33');
INSERT INTO `tb_user` VALUES (9, 'aa', 'E10ADC3949BA59ABBE56E057F20F883E', '1213qq@126.com', '13212341234', '安安', '1', '21487299ed1ffcfc78f4d8ca3cb12d8fe4c7fcd.gif', 1, 3, '2020-01-01 20:49:48');
INSERT INTO `tb_user` VALUES (10, 'zz', 'E10ADC3949BA59ABBE56E057F20F883E', 'zz@qq.com', '13212341234', '小明', '2', '311910516a29f43c21524accafe4988d22b30c6a.png', 1, 3, '2020-01-01 20:52:56');
INSERT INTO `tb_user` VALUES (13, 'rr', 'E10ADC3949BA59ABBE56E057F20F883E', '12qw@126.com', '13212341234', '小花2', '1', '8295898689d2d3f62e0b4c25afe03dd1008e85d9.gif', 1, 3, '2020-01-01 20:59:16');
INSERT INTO `tb_user` VALUES (14, 'xiaohua', 'E10ADC3949BA59ABBE56E057F20F883E', '1212@126.com', '13212341234', '肖华', '1', '32526522d5e69c1bd0f9453ba30dcaaba261931c.gif', 1, 3, '2020-01-01 21:45:12');
INSERT INTO `tb_user` VALUES (15, 'mm', 'E10ADC3949BA59ABBE56E057F20F883E', '2@qq.com', '13212345678', '韩天明', '1', '3633983493013235da22425287b542caa75c11c5.png', 1, 3, '2020-01-01 21:47:07');

SET FOREIGN_KEY_CHECKS = 1;
