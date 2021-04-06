/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql_5.7
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3307
 Source Schema         : test1

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 06/04/2021 22:45:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` tinyint(4) NULL DEFAULT NULL COMMENT '是否删除',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父类id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  `authorities` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '张三', '1', '/login', 0, 0, '2021-03-17 13:43:40', NULL, NULL, 'userAdd');
INSERT INTO `sys_menu` VALUES (2, '李四', '2', '/admin', 0, 0, '2021-03-29 19:44:33', NULL, NULL, 'admin');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` tinyint(4) NULL DEFAULT NULL COMMENT '是否删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '超级管理员', 0, '2021-03-17 13:42:49', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` tinyint(4) NULL DEFAULT NULL COMMENT '是否删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (17, 'a', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-16 05:55:34', NULL, NULL);
INSERT INTO `sys_user` VALUES (18, 'aa', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 04:34:16', NULL, NULL);
INSERT INTO `sys_user` VALUES (19, 'aaa', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 04:34:44', NULL, NULL);
INSERT INTO `sys_user` VALUES (20, 'aaaa', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 04:34:58', NULL, NULL);
INSERT INTO `sys_user` VALUES (21, 'b', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 04:36:52', NULL, NULL);
INSERT INTO `sys_user` VALUES (22, 'bb', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (23, 'ec1bbcd2-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (24, 'ec9e7287-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (25, 'ecb7cfeb-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (26, 'ecdd058e-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (27, 'ed099f63-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (28, 'ed31512f-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (29, 'ed494e8b-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (30, 'ed624c8a-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (31, 'ed7dab4b-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (32, 'ed96b5c0-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (33, 'edb2462a-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (34, 'edcee85c-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (35, 'eded5c3a-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (36, 'ee15dbcd-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (37, 'ee7c0b98-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (38, 'eea4b8b2-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (39, 'eec0c4a9-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (40, 'eee54016-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (41, 'ef08718d-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (42, 'ef1d72c8-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (43, 'ef306c65-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (44, 'ef42ade1-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (45, 'ef554d30-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (46, 'ef674aa4-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (47, 'ef7b510e-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (48, 'ef8d0507-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (49, 'ef9ee987-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (50, 'efb1a562-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (51, 'efc28c4e-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (52, 'efd2b33a-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (53, 'efe679f2-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (54, 'eff87011-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (55, 'f00bcb65-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (56, 'f01fef33-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (57, 'f036efa9-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (58, 'f0475625-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (59, 'f05a33a7-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (60, 'f06d1bbf-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (61, 'f09a0ada-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (62, 'f0bf0c53-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (63, 'f0e08359-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (64, 'f103e1a4-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (65, 'f1185b1f-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (66, 'f12bcfdd-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (67, 'f13ceba6-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (68, 'f14dcb98-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (69, 'f16199e0-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (70, 'f1736f23-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (71, 'f18916dd-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (72, 'f1a6cb25-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (73, 'f1bbc414-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (74, 'f1cf928d-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (75, 'f1e414fc-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (76, 'f1f73414-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (77, 'f2097c35-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (78, 'f21f176c-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (79, 'f2332c97-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (80, 'f245194f-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (81, 'f2595f59-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (82, 'f26bcb8e-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (83, 'f27ea67b-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (84, 'f29435f9-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (85, 'f2a6adc2-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (86, 'f2b7b848-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (87, 'f2ce1b91-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (88, 'f2ddfa33-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (89, 'f2eed822-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (90, 'f322bc5d-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (91, 'f344241a-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (92, 'f35820af-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (93, 'f36a78bb-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (94, 'f37e0fb9-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (95, 'f394fbe8-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (96, 'f3a8e54f-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (97, 'f3c016b9-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (98, 'f3d4d6a3-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (99, 'f3e9519a-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (100, 'f3fce258-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 'f40e9eec-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 'f423929d-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 'f435fd95-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, 'f449c5ef-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 'f45b64ab-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 'f4719e05-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (107, 'f483f2f3-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (108, 'f496c39e-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (109, 'f4ae5f59-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (110, 'f4c0f9ad-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (111, 'f4d47b4e-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (112, 'f4ec1a51-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (113, 'f4fd600f-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (114, 'f51098ee-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (115, 'f528b4dd-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (116, 'f54f8a2a-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (117, 'f57b6ddc-879a-11eb-986d-a81e84feddfd', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-17 05:34:42', NULL, NULL);
INSERT INTO `sys_user` VALUES (118, 'aa', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-19 08:39:12', NULL, NULL);
INSERT INTO `sys_user` VALUES (119, 'aa', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-19 08:39:12', NULL, NULL);
INSERT INTO `sys_user` VALUES (120, 'aa', '$2a$10$uK9hthbkWUmZzeCf0SX73OIxPCIWclxaOQcdgHsqpzf5ARr/CH1KK', 0, '2021-03-19 08:39:12', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (21, 1);
INSERT INTO `sys_user_role` VALUES (17, 1);

SET FOREIGN_KEY_CHECKS = 1;
