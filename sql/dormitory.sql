/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : dormitory

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 09/07/2024 19:12:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for back_late
-- ----------------------------
DROP TABLE IF EXISTS `back_late`;
CREATE TABLE `back_late`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(0) NULL DEFAULT NULL,
  `back_date` datetime(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_s_s`(`student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of back_late
-- ----------------------------

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_pid`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES (1, '清华大学', NULL);
INSERT INTO `building` VALUES (2, '宿舍楼A', 1);
INSERT INTO `building` VALUES (3, '宿舍楼B', 1);
INSERT INTO `building` VALUES (5, '宿舍楼C', 1);
INSERT INTO `building` VALUES (6, 'A1入口', 2);
INSERT INTO `building` VALUES (13, 'A2入口', 2);
INSERT INTO `building` VALUES (14, 'A3入口', 2);
INSERT INTO `building` VALUES (15, 'B1入口', 3);
INSERT INTO `building` VALUES (16, 'B2入口', 3);
INSERT INTO `building` VALUES (17, 'B3入口', 3);
INSERT INTO `building` VALUES (18, 'C1入口', 5);
INSERT INTO `building` VALUES (19, 'C2入口', 5);
INSERT INTO `building` VALUES (20, '北京大学', NULL);
INSERT INTO `building` VALUES (21, '宿舍楼A', 20);

-- ----------------------------
-- Table structure for depart_application
-- ----------------------------
DROP TABLE IF EXISTS `depart_application`;
CREATE TABLE `depart_application`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `apply_user_id` bigint(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `student_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_oui`(`apply_user_id`) USING BTREE,
  INDEX `fk_si`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of depart_application
-- ----------------------------
INSERT INTO `depart_application` VALUES (16, 23, '退学了', '2024-02-10 00:21:25', 2075);
INSERT INTO `depart_application` VALUES (17, 41, NULL, '2024-02-10 10:56:11', 2073);
INSERT INTO `depart_application` VALUES (18, 41, '不想住了', '2024-02-10 13:42:08', 2073);
INSERT INTO `depart_application` VALUES (19, 23, '不想住了', '2024-02-10 13:46:45', 2073);
INSERT INTO `depart_application` VALUES (20, 1, NULL, '2024-02-10 13:48:20', 2075);
INSERT INTO `depart_application` VALUES (21, 41, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2024-02-10 14:55:34', 2053);
INSERT INTO `depart_application` VALUES (22, 41, NULL, '2024-02-10 15:07:00', 2050);
INSERT INTO `depart_application` VALUES (23, 1, NULL, '2024-03-10 16:29:47', 2074);
INSERT INTO `depart_application` VALUES (25, 37, '不住了', '2024-03-13 12:08:26', 2050);
INSERT INTO `depart_application` VALUES (27, 29, NULL, '2024-03-18 13:47:14', 2069);
INSERT INTO `depart_application` VALUES (28, 24, '.....', '2024-05-07 14:08:31', 2033);
INSERT INTO `depart_application` VALUES (29, 1, NULL, '2024-07-09 19:05:06', 8);

-- ----------------------------
-- Table structure for depart_application_user
-- ----------------------------
DROP TABLE IF EXISTS `depart_application_user`;
CREATE TABLE `depart_application_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `operate_user_id` bigint(0) NULL DEFAULT NULL,
  `is_agree` tinyint(1) NULL DEFAULT NULL,
  `operate_time` datetime(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_op_uid`(`operate_user_id`) USING BTREE,
  INDEX `fk_dpId`(`application_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of depart_application_user
-- ----------------------------
INSERT INTO `depart_application_user` VALUES (16, 1, 0, '2024-02-10 10:53:20', '不通过', 16);
INSERT INTO `depart_application_user` VALUES (17, 43, 1, '2024-02-10 10:56:49', NULL, 17);
INSERT INTO `depart_application_user` VALUES (18, 23, 1, '2024-02-10 10:57:11', NULL, 17);
INSERT INTO `depart_application_user` VALUES (19, 1, 0, '2024-02-10 13:31:04', '没有申请理由', 17);
INSERT INTO `depart_application_user` VALUES (20, 43, 0, '2024-02-10 13:45:32', '不同意', 18);
INSERT INTO `depart_application_user` VALUES (21, 1, 1, '2024-02-10 13:47:26', NULL, 19);
INSERT INTO `depart_application_user` VALUES (22, 43, 1, '2024-02-10 15:02:57', NULL, 21);
INSERT INTO `depart_application_user` VALUES (23, 23, 1, '2024-02-10 15:03:22', NULL, 21);
INSERT INTO `depart_application_user` VALUES (24, 1, 1, '2024-02-10 15:04:28', '通过', 21);
INSERT INTO `depart_application_user` VALUES (25, 43, 0, '2024-03-13 12:09:17', '滚', 22);
INSERT INTO `depart_application_user` VALUES (26, 43, 1, '2024-03-13 12:09:30', '好', 25);
INSERT INTO `depart_application_user` VALUES (27, 23, 1, '2024-03-13 12:10:11', '行', 25);
INSERT INTO `depart_application_user` VALUES (28, 1, 0, '2024-03-13 12:10:38', '不行', 25);
INSERT INTO `depart_application_user` VALUES (30, 23, 1, '2024-03-18 13:47:51', NULL, 27);
INSERT INTO `depart_application_user` VALUES (31, 1, 0, '2024-03-18 13:48:28', NULL, 27);
INSERT INTO `depart_application_user` VALUES (32, 29, 1, '2024-05-07 14:12:56', '通过', 28);
INSERT INTO `depart_application_user` VALUES (33, 23, NULL, NULL, NULL, 28);

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(0) NULL DEFAULT NULL,
  `order_num` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parent`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES (1, '清华大学', NULL, 2);
INSERT INTO `faculty` VALUES (2, '信息工程学院', 1, 0);
INSERT INTO `faculty` VALUES (4, '吉利汽车学院', 1, 5);
INSERT INTO `faculty` VALUES (5, '特种设备学院', 1, 4);
INSERT INTO `faculty` VALUES (7, '软件技术', 2, 1);
INSERT INTO `faculty` VALUES (10, '软件2011', 7, 1);
INSERT INTO `faculty` VALUES (11, '软件2012', 7, 2);
INSERT INTO `faculty` VALUES (12, '软件2013', 7, 3);
INSERT INTO `faculty` VALUES (13, '有嘉机电学院', 1, 5);
INSERT INTO `faculty` VALUES (14, '计算机技术', 2, 2);
INSERT INTO `faculty` VALUES (15, '计算机2021', 14, 1);
INSERT INTO `faculty` VALUES (16, '计算机2022', 14, 2);
INSERT INTO `faculty` VALUES (17, '应用电子技术', 2, 4);
INSERT INTO `faculty` VALUES (18, '应电2011', 17, 1);
INSERT INTO `faculty` VALUES (19, '应电2012', 17, 2);
INSERT INTO `faculty` VALUES (20, '应电2013', 17, 3);
INSERT INTO `faculty` VALUES (21, '信息安全技术', 2, 3);
INSERT INTO `faculty` VALUES (22, '信安2011', 21, 1);
INSERT INTO `faculty` VALUES (23, '信安2041', 21, 2);
INSERT INTO `faculty` VALUES (24, '北京大学', NULL, 1);
INSERT INTO `faculty` VALUES (25, '机械工程学院', 24, 0);
INSERT INTO `faculty` VALUES (26, '计算机学院', 24, 1);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `save_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upload_user` bigint(0) NOT NULL,
  `upload_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `md5`(`md5`) USING BTREE,
  INDEX `fk_userid`(`upload_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (6, '01c8c897-a9ce-43e0-b344-827e70149849.png', '03b0d39583f48206768a7534e55bcpng.png', '08803B0D39583F48206768A7534E55BC', 1, '2024-03-19 16:39:20');
INSERT INTO `image` VALUES (7, '8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png', '006gMemDly8gk9wejsed7j30ro0rodgv.jpg', 'E258A24CD0D3C992BA15C7864D59BFB3', 1, '2024-03-19 16:39:25');
INSERT INTO `image` VALUES (8, '3d130778-d05a-4c75-9796-a04ed086c495.png', '0f4cf1af-2e31-11eb-a0ca-2016b988fa0d.png', '230AA9BB6ADEF187C6E1FFB2136AF2B7', 1, '2024-03-23 16:10:51');
INSERT INTO `image` VALUES (9, 'bf796bfa-8c1f-4352-83d6-514ec6b72c1c.png', '0ccef5a0-2e24-11eb-a19e-2016b988fa0d.png', '7D2C56441C0EF4FA6FEEE7FB770D048C', 25, '2024-03-23 16:11:38');
INSERT INTO `image` VALUES (10, '721e1934-39c1-4a39-a83e-46e613acda0e.png', '0d49e427-2e29-11eb-9a80-2016b988fa0d.png', 'FF5917F7C55C764D7EAD26C3D9DFCD04', 26, '2024-03-23 16:12:06');
INSERT INTO `image` VALUES (11, 'ecdbb708-1eba-4342-8c22-88481a5824cc.png', '02baac8c-2e33-11eb-87d5-2016b988fa0d.png', '7F2A11DB9A12FF072C06561671569661', 31, '2024-03-23 16:12:29');
INSERT INTO `image` VALUES (12, 'bc21e192-bc6e-4a6b-a543-d61ce4cb49b2.png', '1ebd0166-2e33-11eb-bb61-2016b988fa0d.png', '2F6F7613A3C93F0B3C700178283F0CFA', 43, '2024-03-23 16:13:12');
INSERT INTO `image` VALUES (14, '33bc7241-3694-432f-90f6-36cdd42cf8e7.png', '020519-js4-1602.jpg', '67C2F639889A3CC4224F0B8F9F39045F', 1, '2024-04-13 15:02:42');
INSERT INTO `image` VALUES (15, '82369579-e15b-4888-a3e0-3c70e4c0a698.png', 'ksc-71pc-178.jpg', '8DADE443CB11D9A53FB87601B5725789', 1, '2024-04-13 15:03:01');
INSERT INTO `image` VALUES (16, 'fd16a365-db2f-4140-8fbb-5bf4c301a2ee.png', 'PIA23265_hires.jpg', '23CAB9C2A47635F0BB4AEB9C23EE0538', 1, '2024-04-13 15:03:12');
INSERT INTO `image` VALUES (17, 'be20241b-267e-4d76-9bc4-11df6aebb7f7.png', 'aeroshell_vab_.jpg', 'C9F1B6143A7388BD78ACBCF5C2E77FFA', 1, '2024-04-13 15:03:15');
INSERT INTO `image` VALUES (18, '18358239-196d-4901-b2bd-3e849dc5227c.png', 'as11-44-6667.jpg', '092F8B5E3865A2C6BF75C0DF6CD16044', 1, '2024-04-13 15:15:03');
INSERT INTO `image` VALUES (19, '090325c6-3d90-49dd-ae88-58807f8d09f7.png', 'pia23056.jpg', 'DF1417E4885D31FAC4F07B77E5312D7F', 1, '2024-04-14 11:37:06');
INSERT INTO `image` VALUES (20, 'eecb4cde-2ffd-4539-994f-6a1f6c6f2984.png', '2021_08_09_17_00_IMG_0271.JPG', '18CB4ECB2D511C32AE3F8A6C3D461ACB', 1, '2024-07-09 17:48:37');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `time` datetime(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_back` tinyint(1) NULL DEFAULT NULL,
  `student_id` bigint(0) NULL DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `back_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_student_id`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES (1, '2024-02-13 17:12:26', '家里有事', 0, 1875, '广东', '2022-02-09');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_notice`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (28, '今年放假时间：2024-02-06', 1, '2024-02-06 16:33:47');
INSERT INTO `notice` VALUES (48, '今年开学时间：2024年3月1日', 1, '2024-02-07 18:32:24');
INSERT INTO `notice` VALUES (49, '明天放假，注意早出晚归的同学', 1, '2024-07-09 11:30:35');
INSERT INTO `notice` VALUES (50, '准备放假', 1, '2024-07-09 18:32:06');
INSERT INTO `notice` VALUES (51, 'zhunbeifangjia', 1, '2024-07-09 19:07:31');

-- ----------------------------
-- Table structure for notice_user
-- ----------------------------
DROP TABLE IF EXISTS `notice_user`;
CREATE TABLE `notice_user`  (
  `user_id` bigint(0) NOT NULL,
  `notice_id` bigint(0) NOT NULL,
  `is_read` tinyint(1) NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  INDEX `fk_msg1`(`notice_id`) USING BTREE,
  INDEX `fk_user1`(`user_id`) USING BTREE,
  CONSTRAINT `fk_msg1` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user1` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice_user
-- ----------------------------
INSERT INTO `notice_user` VALUES (1, 28, 1, 0);
INSERT INTO `notice_user` VALUES (23, 28, 1, 0);
INSERT INTO `notice_user` VALUES (24, 28, 1, 0);
INSERT INTO `notice_user` VALUES (23, 50, 0, 0);
INSERT INTO `notice_user` VALUES (24, 50, 1, 0);
INSERT INTO `notice_user` VALUES (1, 51, 0, 0);
INSERT INTO `notice_user` VALUES (23, 51, 0, 0);
INSERT INTO `notice_user` VALUES (24, 51, 1, 0);

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(0) NOT NULL,
  `describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `create_date` date NULL DEFAULT NULL,
  `finish_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service___fk_rid`(`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报修记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES (4, 1, '天花板塌了。。', 1, '2024-04-13', '2024-04-13');
INSERT INTO `repair` VALUES (5, 262, '卫生间漏水', 0, '2024-04-13', NULL);

-- ----------------------------
-- Table structure for repair_picture
-- ----------------------------
DROP TABLE IF EXISTS `repair_picture`;
CREATE TABLE `repair_picture`  (
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `repair_id` bigint(0) NULL DEFAULT NULL,
  INDEX `fk_repair_id`(`repair_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of repair_picture
-- ----------------------------
INSERT INTO `repair_picture` VALUES ('18358239-196d-4901-b2bd-3e849dc5227c.png', 4);
INSERT INTO `repair_picture` VALUES ('8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png', 4);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `building_id` bigint(0) NULL DEFAULT NULL,
  `max_capacity` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_buding_id`(`building_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 'A1001', 1, 4);
INSERT INTO `room` VALUES (2, 'A1002', 1, 4);
INSERT INTO `room` VALUES (3, 'A1003', 1, 4);
INSERT INTO `room` VALUES (4, 'A1004', 1, 4);
INSERT INTO `room` VALUES (114, 'A6014', 6, 6);
INSERT INTO `room` VALUES (115, 'A6015', 6, 6);
INSERT INTO `room` VALUES (116, 'A6016', 6, 6);
INSERT INTO `room` VALUES (117, 'A6017', 6, 6);
INSERT INTO `room` VALUES (118, 'A6018', 21, 6);
INSERT INTO `room` VALUES (119, 'A6019', 21, 6);
INSERT INTO `room` VALUES (120, 'A6020', 21, 6);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `room_id` bigint(0) NULL DEFAULT NULL,
  `faculty_id` bigint(0) NULL DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registration_date` date NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_leave` tinyint(1) NULL DEFAULT 0,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_s_r`(`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2083 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (5, '张娜', 114, 22, '2151797766', '2024-02-03', '13812345678', NULL, 0, 0);
INSERT INTO `student` VALUES (6, '冯秀兰', 115, 12, '1831200243', '2024-02-03', '13812345678', NULL, 0, 0);
INSERT INTO `student` VALUES (7, '张红梅', 116, 19, '2527799207', '2024-02-03', '13812345678', NULL, 0, 0);
INSERT INTO `student` VALUES (8, '张玉兰', NULL, 16, '1275088524', '2024-02-03', '13812345678', NULL, 0, 1);
INSERT INTO `student` VALUES (9, '韩桂珍', 118, 25, '4673563850', '2024-02-03', '13812345678', NULL, 0, 0);
INSERT INTO `student` VALUES (10, '李玉英', 119, 25, '9224218663', '2024-02-03', '13812345678', NULL, 0, 0);

-- ----------------------------
-- Table structure for system_function
-- ----------------------------
DROP TABLE IF EXISTS `system_function`;
CREATE TABLE `system_function`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `order_num` int(0) NULL DEFAULT NULL,
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `permission` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_function
-- ----------------------------
INSERT INTO `system_function` VALUES (2, '系统管理', NULL, 2, NULL, NULL, 'M', NULL, 'iconflashlight_fill', '2020-12-09 11:07:14');
INSERT INTO `system_function` VALUES (3, '用户管理', 2, 1, 'system/user/index.html', 'views/system/user/index', 'C', 'system:user:list', 'iconpeople', '2020-12-10 09:46:31');
INSERT INTO `system_function` VALUES (4, '角色管理', 2, 2, 'system/role/index.html', 'views/system/role/index', 'C', 'system:role:list', 'iconaddressbook', '2020-12-10 09:48:07');
INSERT INTO `system_function` VALUES (5, '菜单管理', 2, 3, 'system/function/index', 'views/system/function/index', 'C', 'system:function:list', 'iconcreatetask', '2020-12-10 09:50:13');
INSERT INTO `system_function` VALUES (6, '用户添加', 3, 1, '', '', 'F', 'system:user:save', NULL, '2020-12-18 13:06:04');
INSERT INTO `system_function` VALUES (7, '用户修改', 3, 2, NULL, NULL, 'F', 'system:user:update', NULL, '2020-12-18 13:06:50');
INSERT INTO `system_function` VALUES (8, '用户删除', 3, 2, NULL, NULL, 'F', 'system:user:delete', NULL, '2020-12-18 13:07:15');
INSERT INTO `system_function` VALUES (10, '角色添加', 4, 1, NULL, NULL, 'F', 'system:role:save', NULL, '2020-12-18 13:34:18');
INSERT INTO `system_function` VALUES (11, '角色修改', 4, 2, NULL, NULL, 'F', 'system:role:update', NULL, '2020-12-18 13:34:32');
INSERT INTO `system_function` VALUES (12, '角色删除', 4, 3, NULL, NULL, 'F', 'system:role:delete', NULL, '2020-12-18 13:34:45');
INSERT INTO `system_function` VALUES (13, '角色查询', 4, 4, NULL, NULL, 'F', 'system:role:query', NULL, '2020-12-18 13:34:57');
INSERT INTO `system_function` VALUES (14, '用户查询', 3, 4, NULL, NULL, 'F', 'system:user:query', NULL, '2020-12-18 13:34:04');
INSERT INTO `system_function` VALUES (15, '菜单添加', 5, 1, NULL, NULL, 'F', 'system:function:save', NULL, '2020-12-18 15:14:18');
INSERT INTO `system_function` VALUES (16, '菜单修改', 5, 2, NULL, NULL, 'F', 'system:function:update', NULL, '2020-12-18 15:14:21');
INSERT INTO `system_function` VALUES (17, '菜单删除', 5, 3, NULL, NULL, 'F', 'system:function:delete', NULL, '2020-12-18 15:14:24');
INSERT INTO `system_function` VALUES (18, '菜单查询', 5, 4, NULL, NULL, 'F', 'system:function:query', NULL, '2020-12-18 15:14:26');
INSERT INTO `system_function` VALUES (38, '日志管理', 2, 4, 'system/log/index.html', 'views/system/log/index', 'C', 'system:log:list', 'iconworkbench_fill', '2020-12-30 13:49:37');
INSERT INTO `system_function` VALUES (44, '日志查询', 38, 1, '', '', 'F', 'system:log:query', '', '2024-01-08 11:45:42');
INSERT INTO `system_function` VALUES (45, '学生宿舍管理', NULL, 0, '', '', 'M', '', 'iconaccessory', '2024-01-19 13:43:28');
INSERT INTO `system_function` VALUES (46, '宿舍楼管理', 45, 3, 'building/index.html', 'views/manage/building/index', 'C', 'manage:building:list', 'iconhomepage_fill', '2024-01-19 13:47:12');
INSERT INTO `system_function` VALUES (47, '新增', 46, 1, '', '', 'F', 'manage:building:save', '', '2024-01-19 13:52:59');
INSERT INTO `system_function` VALUES (48, '更新', 46, 2, '', '', 'F', 'manage:building:update', '', '2024-01-19 13:53:35');
INSERT INTO `system_function` VALUES (49, '删除', 46, 3, '', '', 'F', 'manage:building:delete', '', '2024-01-19 13:53:55');
INSERT INTO `system_function` VALUES (50, '查询', 46, 4, '', '', 'F', 'manage:building:query', '', '2024-01-19 13:54:21');
INSERT INTO `system_function` VALUES (51, '班级管理', 45, 2, 'faculty/index.html', 'views/manage/faculty/index', 'C', 'faculty:list', 'iconquestions', '2024-01-19 15:22:22');
INSERT INTO `system_function` VALUES (52, '新增学院', 51, 1, '', '', 'F', 'faculty:save', '', '2024-01-19 17:06:11');
INSERT INTO `system_function` VALUES (53, '删除学院', 51, 2, '', '', 'F', 'faculty:delete', '', '2024-01-19 17:06:41');
INSERT INTO `system_function` VALUES (54, '查询学院', 51, 3, '', '', 'F', 'faculty:query', '', '2024-01-19 17:07:08');
INSERT INTO `system_function` VALUES (55, '修改学院', 51, 4, '', '', 'F', 'faculty:update', '', '2024-01-19 17:07:31');
INSERT INTO `system_function` VALUES (56, '学生管理', 45, 1, 'student/index.html', 'views/manage/student/index', 'C', 'student:list', 'iconpeople_fill', '2024-01-22 15:19:09');
INSERT INTO `system_function` VALUES (57, '新增学生', 56, 1, '', '', 'F', 'student:save', '', '2024-01-22 15:20:07');
INSERT INTO `system_function` VALUES (58, '更新学生', 56, 2, '', '', 'F', 'student:update', '', '2024-01-22 15:20:40');
INSERT INTO `system_function` VALUES (59, '删除学生', 56, 3, '', '', 'F', 'student:delete', '', '2024-01-22 15:21:11');
INSERT INTO `system_function` VALUES (60, '查询学生', 56, 4, '', '', 'F', 'student:query', '', '2024-01-22 15:22:32');
INSERT INTO `system_function` VALUES (61, '宿舍管理', 45, 0, 'room/index.html', 'views/manage/room/index', 'C', 'room:list', 'icontailor', '2024-01-22 15:25:08');
INSERT INTO `system_function` VALUES (62, '新增宿舍', 61, NULL, '', '', 'F', 'room:save', '', '2024-01-22 15:25:29');
INSERT INTO `system_function` VALUES (63, '修改宿舍', 61, 1, '', '', 'F', 'room:update', '', '2024-01-22 15:26:59');
INSERT INTO `system_function` VALUES (64, '删除宿舍', 61, 4, '', '', 'F', 'room:delete', '', '2024-01-22 15:27:47');
INSERT INTO `system_function` VALUES (65, '查询宿舍', 61, NULL, '', '', 'F', 'room:query', '', '2024-01-22 15:28:48');
INSERT INTO `system_function` VALUES (66, '发送消息', NULL, 3, '', '', 'F', 'home:send:msg', '', '2024-01-27 15:18:42');
INSERT INTO `system_function` VALUES (67, '晚归记录', 77, 4, 'back/index.html', 'views/manage/back/index', 'C', 'back:list', 'iconmarketing_fill', '2024-02-17 19:22:22');
INSERT INTO `system_function` VALUES (68, '晚归查询', 67, 1, '', '', 'F', 'back:query', '', '2024-02-17 19:23:50');
INSERT INTO `system_function` VALUES (69, '删除晚归记录', 67, 2, '', '', 'F', 'back:delete', '', '2024-02-17 19:24:20');
INSERT INTO `system_function` VALUES (70, '新增', 67, 3, '', '', 'F', 'back:save', '', '2024-02-17 19:25:01');
INSERT INTO `system_function` VALUES (71, '更新', 67, 4, '', '', 'F', 'back:update', '', '2024-02-17 19:25:24');
INSERT INTO `system_function` VALUES (72, '请假记录', 77, 5, 'leave/index.html', 'views/manage/leave/index', 'C', 'leave:list', 'iconaccessory', '2024-03-10 11:31:41');
INSERT INTO `system_function` VALUES (73, '新增记录', 72, 0, '', '', 'F', 'leave:save', '', '2024-03-10 15:29:57');
INSERT INTO `system_function` VALUES (74, '更新记录', 72, 1, '', '', 'F', 'leave:update', '', '2024-03-10 15:30:39');
INSERT INTO `system_function` VALUES (75, '删除记录', 72, 2, '', '', 'F', 'leave:delete', '', '2024-03-10 15:31:07');
INSERT INTO `system_function` VALUES (76, '查询记录', 72, 4, '', '', 'F', 'leave:query', '', '2024-03-10 15:31:30');
INSERT INTO `system_function` VALUES (77, '记录', 45, 4, '', '', 'M', '', 'iconactivity', '2024-03-12 14:44:19');
INSERT INTO `system_function` VALUES (78, '维修记录', 77, 1, 'repair/index.html', 'views/manage/repair/index', 'C', 'repair:list', 'iconclock_fill', '2024-04-12 15:15:45');
INSERT INTO `system_function` VALUES (79, '查询', 78, 1, '', '', 'F', 'repair:query', '', '2024-04-13 10:13:19');
INSERT INTO `system_function` VALUES (80, '新增', 78, 2, '', '', 'F', 'repair:save', '', '2024-04-13 11:18:23');
INSERT INTO `system_function` VALUES (81, '更新', 78, 3, '', '', 'F', 'repair:update', '', '2024-04-13 14:07:07');
INSERT INTO `system_function` VALUES (82, '删除', 78, 4, '', '', 'F', 'repair:delete', '', '2024-04-13 14:07:29');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `operate_time` datetime(0) NULL DEFAULT NULL,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `clas` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_ul`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 677 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES (647, '2024-04-28 17:34:17', 1, 'LeaveController', 'save', '0:0:0:0:0:0:0:1', '{\"leave\":{\"reason\":\"123\",\"studentId\":2036,\"target\":\"123\",\"backDate\":{\"year\":2024,\"month\":\"APRIL\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":28,\"dayOfWeek\":\"WEDNESDAY\",\"dayOfYear\":118,\"leapYear\":false,\"monthValue\":4}}}', '/leave/save', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (648, '2024-04-28 17:34:27', 1, 'LeaveController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":16}', '/leave/delete/16', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (649, '2024-04-29 12:28:42', 1, 'BackLateController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":4}', '/backlate/delete/4', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (650, '2024-04-29 12:28:57', 1, 'LeaveController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":15}', '/leave/delete/15', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (651, '2024-04-29 12:29:29', 1, 'RepairController', 'save', '0:0:0:0:0:0:0:1', '{\"repair\":{\"id\":5,\"roomId\":262,\"describe\":\"卫生间漏水\",\"status\":false,\"createDate\":{\"year\":2024,\"month\":\"APRIL\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":13,\"dayOfWeek\":\"TUESDAY\",\"dayOfYear\":103,\"leapYear\":false,\"monthValue\":4},\"room\":{\"id\":262,\"number\":\"B3022\"}}}', '/repair/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (652, '2024-04-29 12:29:36', 1, 'RepairController', 'save', '0:0:0:0:0:0:0:1', '{\"repair\":{\"id\":5,\"roomId\":262,\"describe\":\"卫生间漏水\",\"picture\":[\"8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png\"],\"status\":false,\"createDate\":{\"year\":2024,\"month\":\"APRIL\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":13,\"dayOfWeek\":\"TUESDAY\",\"dayOfYear\":103,\"leapYear\":false,\"monthValue\":4},\"room\":{\"id\":262,\"number\":\"B3022\"}}}', '/repair/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (653, '2024-04-29 16:21:02', 1, 'SystemUserController', 'resetPassword', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/system/user/resetPassword', '重置用户密码', '{\"statusCode\":200,\"msg\":\"密码重置成功\"}');
INSERT INTO `system_log` VALUES (654, '2024-04-29 16:21:04', 1, 'SystemUserController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/system/user/delete', '删除用户', '{\"statusCode\":500,\"msg\":\"该用户为其他人领导，无法删除\"}');
INSERT INTO `system_log` VALUES (655, '2024-04-29 16:21:15', 1, 'SystemUserController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":24}', '/system/user/delete', '删除用户', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (656, '2024-04-29 16:22:52', 1, 'SystemUserController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":29}', '/system/user/delete', '删除用户', '{\"statusCode\":500,\"msg\":\"该用户为其他人领导，无法删除\"}');
INSERT INTO `system_log` VALUES (657, '2024-05-07 11:21:54', 1, 'BuildingController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"building\":{\"id\":1,\"name\":\"清华大学\"}}', '/building/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (658, '2024-05-07 11:22:02', 1, 'BuildingController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"building\":{\"id\":20,\"name\":\"北京大学\"}}', '/building/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (659, '2024-05-07 11:22:13', 1, 'FacultyController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"faculty\":{\"id\":24,\"name\":\"清华大学\",\"orderNum\":1}}', '/faculty/saveOrUpdate', '添加或更新学院', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (660, '2024-05-07 11:22:19', 1, 'FacultyController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"faculty\":{\"id\":24,\"name\":\"北京大学\",\"orderNum\":1}}', '/faculty/saveOrUpdate', '添加或更新学院', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (661, '2024-05-07 11:22:27', 1, 'FacultyController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"faculty\":{\"id\":1,\"name\":\"清华大学\",\"orderNum\":2}}', '/faculty/saveOrUpdate', '添加或更新学院', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (662, '2024-05-07 11:54:03', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":24,\"realName\":\"杨秀梅\",\"loginName\":\"279a797a\",\"icon\":\"8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png\",\"cellphone\":\"15601880680\",\"email\":\"279a797a@163.com\",\"userRoleId\":[2],\"leaderId\":29,\"leader\":{\"id\":29,\"realName\":\"刘琴\"},\"buildingId\":19,\"building\":{\"id\":19,\"name\":\"C2入口\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (663, '2024-05-07 14:08:31', 24, 'StudentController', 'delete', '0:0:0:0:0:0:0:1', '{\"departApplication\":{\"reason\":\".....\",\"studentId\":2033},\"string\":\"1d1ddcca-793b-49d2-8f09-0a31f87dce67\"}', '/student/delete', '', '{\"statusCode\":200,\"msg\":\"退宿申请已提交，等待上一级审核\"}');
INSERT INTO `system_log` VALUES (664, '2024-05-14 10:57:07', 1, 'BackLateController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"backLate\":{\"studentId\":1035,\"reason\":\"1234124\",\"backDate\":{\"hour\":10,\"minute\":57,\"second\":0,\"dayOfMonth\":14,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"month\":\"MAY\",\"monthValue\":5,\"year\":2024,\"nano\":0,\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"}}}}', '/backlate/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (665, '2024-05-14 10:57:14', 1, 'BackLateController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/backlate/delete/1', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (666, '2024-05-14 10:57:45', 1, 'LeaveController', 'save', '0:0:0:0:0:0:0:1', '{\"leave\":{\"reason\":\"123\",\"studentId\":2062,\"target\":\"拉萨\",\"backDate\":{\"year\":2024,\"month\":\"MAY\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":14,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"leapYear\":false,\"monthValue\":5}}}', '/leave/save', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (667, '2024-05-14 10:57:50', 1, 'LeaveController', 'update', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/leave/update/1', '', '{\"statusCode\":200,\"msg\":\"更新成功\"}');
INSERT INTO `system_log` VALUES (668, '2024-05-14 10:57:54', 1, 'LeaveController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/leave/delete/1', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (669, '2024-05-21 14:05:12', 1, 'RoomController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/room/delete/1', '', '{\"statusCode\":500,\"msg\":\"该宿舍还有学生， 无法删除\"}');
INSERT INTO `system_log` VALUES (670, '2024-05-25 13:23:01', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,46,45]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (671, '2024-05-25 13:23:14', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,46]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (672, '2024-05-25 13:24:07', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,46,45]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (673, '2024-05-25 13:24:19', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,45]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (674, '2024-05-25 13:24:32', 23, 'SystemFunctionController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemFunction\":{\"id\":45,\"name\":\"学生宿舍管理\",\"orderNum\":0,\"menuType\":\"M\",\"icon\":\"iconaccessory\",\"createTime\":{\"hour\":13,\"minute\":43,\"second\":28,\"nano\":0,\"dayOfMonth\":19,\"dayOfWeek\":\"TUESDAY\",\"dayOfYear\":19,\"month\":\"JANUARY\",\"monthValue\":1,\"year\":2024,\"chronology\":{\"id\":\"ISO\",\"calendarType\":\"iso8601\"}}}}', '/system/function/saveOrUpdate', '添加修改功能', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (675, '2024-05-25 13:24:50', 23, 'SystemFunctionController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemFunction\":{\"id\":2,\"name\":\"系统管理\",\"orderNum\":2,\"menuType\":\"M\",\"icon\":\"iconflashlight_fill\",\"createTime\":{\"hour\":11,\"minute\":7,\"second\":14,\"nano\":0,\"dayOfMonth\":9,\"dayOfWeek\":\"WEDNESDAY\",\"dayOfYear\":344,\"month\":\"DECEMBER\",\"monthValue\":12,\"year\":2020,\"chronology\":{\"id\":\"ISO\",\"calendarType\":\"iso8601\"}}}}', '/system/function/saveOrUpdate', '添加修改功能', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (676, '2022-02-13 17:12:26', 1, 'LeaveController', 'save', '0:0:0:0:0:0:0:1', '{\"leave\":{\"reason\":\"家里有事\",\"studentId\":1875,\"target\":\"广东\",\"backDate\":{\"year\":2022,\"month\":\"FEBRUARY\",\"dayOfMonth\":9,\"monthValue\":2,\"dayOfWeek\":\"WEDNESDAY\",\"era\":\"CE\",\"dayOfYear\":40,\"leapYear\":false,\"chronology\":{\"id\":\"ISO\",\"calendarType\":\"iso8601\"}}}}', '/leave/save', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (677, '2024-07-09 11:30:35', 1, 'NoticeController', 'sendToBuilding', '0:0:0:0:0:0:0:1', '{\"string\":\"645d3a40-f7b6-4ad7-acb8-55cc70323cd4\",\"long\":20,\"notice\":{\"msg\":\"明天放假，注意早出晚归的同学\"}}', '/notice/sendToBuilding/20', '发送消息给多个用户', '{\"statusCode\":200,\"msg\":\"发送成功\"}');
INSERT INTO `system_log` VALUES (678, '2024-07-09 14:58:28', 1, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,45]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (679, '2024-07-09 15:42:43', 1, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,45,61,56,51,46,77,72,67,78,79,80,81,82,69,68,70,71,73,74,75,76,47,48,49,50,52,53,54,55,57,58,59,60,62,65,63,64]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (680, '2024-07-09 15:50:24', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":24,\"realName\":\"杨阿姨\",\"loginName\":\"279a797a\",\"icon\":\"8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png\",\"cellphone\":\"15601880680\",\"email\":\"279a797a@163.com\",\"userRoleId\":[2],\"buildingId\":19,\"building\":{\"id\":19,\"name\":\"C2入口\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (681, '2024-07-09 15:50:36', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":1,\"realName\":\"管理员\",\"loginName\":\"admin\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"15612345678\",\"email\":\"1246761517@qq.com\",\"userRoleId\":[1],\"buildingId\":1,\"building\":{\"id\":1,\"name\":\"清华大学\"},\"isOnLine\":true}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (682, '2024-07-09 15:52:54', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":1,\"realName\":\"管理员\",\"loginName\":\"admin\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"15612345678\",\"email\":\"12345678@qq.com\",\"userRoleId\":[1],\"buildingId\":1,\"building\":{\"id\":1,\"name\":\"清华大学\"},\"isOnLine\":true}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (683, '2024-07-09 16:14:02', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":1,\"realName\":\"管理员\",\"loginName\":\"admin\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"15612345678\",\"email\":\"12345678@qq.com\",\"userRoleId\":[1],\"buildingId\":20,\"building\":{\"id\":1,\"name\":\"清华大学\"},\"isOnLine\":true}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (684, '2024-07-09 16:15:09', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":24,\"realName\":\"杨阿姨\",\"loginName\":\"279a797a\",\"icon\":\"8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png\",\"cellphone\":\"15612345678\",\"email\":\"12345678@163.com\",\"userRoleId\":[2],\"buildingId\":19,\"building\":{\"id\":19,\"name\":\"C2入口\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (685, '2024-07-09 16:16:17', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":24,\"realName\":\"杨阿姨\",\"loginName\":\"279a797a\",\"icon\":\"8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png\",\"cellphone\":\"15612345678\",\"email\":\"12345678@163.com\",\"userRoleId\":[2],\"leaderId\":1,\"leader\":{\"id\":1,\"realName\":\"管理员\"},\"buildingId\":19,\"building\":{\"id\":19,\"name\":\"C2入口\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (686, '2024-07-09 16:16:28', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":1,\"realName\":\"超级管理员\",\"loginName\":\"admin\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"15612345678\",\"email\":\"12345678@qq.com\",\"userRoleId\":[1],\"buildingId\":20,\"building\":{\"id\":20,\"name\":\"北京大学\"},\"isOnLine\":true}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (687, '2024-07-09 16:21:50', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":23,\"realName\":\"xxx\",\"loginName\":\"user123\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"13757586436\",\"email\":\"644664588@qq.com\",\"userRoleId\":[3],\"leaderId\":1,\"leader\":{\"id\":1,\"realName\":\"超级管理员\"},\"buildingId\":1,\"building\":{\"id\":1,\"name\":\"清华大学\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (688, '2024-07-09 18:32:06', 1, 'NoticeController', 'sendToBuilding', '0:0:0:0:0:0:0:1', '{\"string\":\"6039bfb7-7457-4b97-87c0-6a6415c733b9\",\"long\":1,\"notice\":{\"msg\":\"准备放假\"}}', '/notice/sendToBuilding/1', '发送消息给多个用户', '{\"statusCode\":200,\"msg\":\"发送成功\"}');
INSERT INTO `system_log` VALUES (689, '2024-07-09 18:38:11', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":23,\"realName\":\"xxx\",\"loginName\":\"user\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"13757586436\",\"email\":\"644664588@qq.com\",\"userRoleId\":[1],\"leader\":{\"id\":1,\"realName\":\"超级管理员\"},\"buildingId\":1,\"building\":{\"id\":1,\"name\":\"清华大学\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (690, '2024-07-09 18:38:18', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":23,\"realName\":\"王校长\",\"loginName\":\"user\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"13757586436\",\"email\":\"644664588@qq.com\",\"userRoleId\":[1],\"leaderId\":1,\"leader\":{\"id\":1,\"realName\":\"超级管理员\"},\"buildingId\":1,\"building\":{\"id\":1,\"name\":\"清华大学\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (691, '2024-07-09 18:38:29', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":23,\"realName\":\"王校长\",\"loginName\":\"user\",\"icon\":\"01c8c897-a9ce-43e0-b344-827e70149849.png\",\"cellphone\":\"13712345678\",\"email\":\"12345688@qq.com\",\"userRoleId\":[1],\"leaderId\":1,\"leader\":{\"id\":1,\"realName\":\"超级管理员\"},\"buildingId\":1,\"building\":{\"id\":1,\"name\":\"清华大学\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (692, '2024-07-09 19:01:46', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":1,\"realName\":\"超级管理员\",\"loginName\":\"admin\",\"icon\":\"eecb4cde-2ffd-4539-994f-6a1f6c6f2984.png\",\"cellphone\":\"15612345678\",\"email\":\"12345678@qq.com\",\"userRoleId\":[1],\"buildingId\":1,\"building\":{\"id\":20,\"name\":\"北京大学\"},\"isOnLine\":true}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (693, '2024-07-09 19:05:06', 1, 'StudentController', 'delete', '0:0:0:0:0:0:0:1', '{\"departApplication\":{\"studentId\":8},\"string\":\"5ae026a4-3cd9-4639-8573-73f9b31c9107\"}', '/student/delete', '', '{\"statusCode\":200,\"msg\":\"退宿成功\"}');
INSERT INTO `system_log` VALUES (694, '2024-07-09 19:07:31', 1, 'NoticeController', 'sendToBuilding', '0:0:0:0:0:0:0:1', '{\"string\":\"5ae026a4-3cd9-4639-8573-73f9b31c9107\",\"long\":1,\"notice\":{\"msg\":\"zhunbeifangjia\"}}', '/notice/sendToBuilding/1', '发送消息给多个用户', '{\"statusCode\":200,\"msg\":\"发送成功\"}');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员', '2020-12-09 11:05:12');
INSERT INTO `system_role` VALUES (2, '宿管', '2024-02-04 13:58:02');
INSERT INTO `system_role` VALUES (3, '系统管理员', '2024-03-19 16:44:17');

-- ----------------------------
-- Table structure for system_role_function
-- ----------------------------
DROP TABLE IF EXISTS `system_role_function`;
CREATE TABLE `system_role_function`  (
  `role_id` bigint(0) NOT NULL,
  `function_id` bigint(0) NOT NULL,
  INDEX `fk_ff`(`role_id`) USING BTREE,
  INDEX `fk_rr`(`function_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role_function
-- ----------------------------
INSERT INTO `system_role_function` VALUES (2, 45);
INSERT INTO `system_role_function` VALUES (2, 61);
INSERT INTO `system_role_function` VALUES (2, 56);
INSERT INTO `system_role_function` VALUES (2, 51);
INSERT INTO `system_role_function` VALUES (2, 60);
INSERT INTO `system_role_function` VALUES (2, 54);
INSERT INTO `system_role_function` VALUES (2, 50);
INSERT INTO `system_role_function` VALUES (2, 59);
INSERT INTO `system_role_function` VALUES (2, 67);
INSERT INTO `system_role_function` VALUES (2, 69);
INSERT INTO `system_role_function` VALUES (2, 68);
INSERT INTO `system_role_function` VALUES (2, 70);
INSERT INTO `system_role_function` VALUES (2, 71);
INSERT INTO `system_role_function` VALUES (2, 72);
INSERT INTO `system_role_function` VALUES (2, 74);
INSERT INTO `system_role_function` VALUES (2, 73);
INSERT INTO `system_role_function` VALUES (2, 75);
INSERT INTO `system_role_function` VALUES (2, 76);
INSERT INTO `system_role_function` VALUES (2, 77);
INSERT INTO `system_role_function` VALUES (2, 78);
INSERT INTO `system_role_function` VALUES (2, 79);
INSERT INTO `system_role_function` VALUES (2, 80);
INSERT INTO `system_role_function` VALUES (2, 81);
INSERT INTO `system_role_function` VALUES (1, 2);
INSERT INTO `system_role_function` VALUES (1, 3);
INSERT INTO `system_role_function` VALUES (1, 4);
INSERT INTO `system_role_function` VALUES (1, 5);
INSERT INTO `system_role_function` VALUES (1, 6);
INSERT INTO `system_role_function` VALUES (1, 7);
INSERT INTO `system_role_function` VALUES (1, 10);
INSERT INTO `system_role_function` VALUES (1, 11);
INSERT INTO `system_role_function` VALUES (1, 12);
INSERT INTO `system_role_function` VALUES (1, 13);
INSERT INTO `system_role_function` VALUES (1, 14);
INSERT INTO `system_role_function` VALUES (1, 15);
INSERT INTO `system_role_function` VALUES (1, 16);
INSERT INTO `system_role_function` VALUES (1, 18);
INSERT INTO `system_role_function` VALUES (1, 38);
INSERT INTO `system_role_function` VALUES (1, 44);
INSERT INTO `system_role_function` VALUES (1, 45);
INSERT INTO `system_role_function` VALUES (1, 46);
INSERT INTO `system_role_function` VALUES (1, 47);
INSERT INTO `system_role_function` VALUES (1, 48);
INSERT INTO `system_role_function` VALUES (1, 49);
INSERT INTO `system_role_function` VALUES (1, 50);
INSERT INTO `system_role_function` VALUES (1, 51);
INSERT INTO `system_role_function` VALUES (1, 52);
INSERT INTO `system_role_function` VALUES (1, 53);
INSERT INTO `system_role_function` VALUES (1, 54);
INSERT INTO `system_role_function` VALUES (1, 55);
INSERT INTO `system_role_function` VALUES (1, 57);
INSERT INTO `system_role_function` VALUES (1, 58);
INSERT INTO `system_role_function` VALUES (1, 59);
INSERT INTO `system_role_function` VALUES (1, 60);
INSERT INTO `system_role_function` VALUES (1, 62);
INSERT INTO `system_role_function` VALUES (1, 63);
INSERT INTO `system_role_function` VALUES (1, 64);
INSERT INTO `system_role_function` VALUES (1, 65);
INSERT INTO `system_role_function` VALUES (1, 66);
INSERT INTO `system_role_function` VALUES (1, 67);
INSERT INTO `system_role_function` VALUES (1, 68);
INSERT INTO `system_role_function` VALUES (1, 69);
INSERT INTO `system_role_function` VALUES (1, 70);
INSERT INTO `system_role_function` VALUES (1, 71);
INSERT INTO `system_role_function` VALUES (1, 72);
INSERT INTO `system_role_function` VALUES (1, 73);
INSERT INTO `system_role_function` VALUES (1, 74);
INSERT INTO `system_role_function` VALUES (1, 75);
INSERT INTO `system_role_function` VALUES (1, 76);
INSERT INTO `system_role_function` VALUES (1, 77);
INSERT INTO `system_role_function` VALUES (1, 8);
INSERT INTO `system_role_function` VALUES (1, 78);
INSERT INTO `system_role_function` VALUES (1, 79);
INSERT INTO `system_role_function` VALUES (1, 80);
INSERT INTO `system_role_function` VALUES (1, 61);
INSERT INTO `system_role_function` VALUES (1, 81);
INSERT INTO `system_role_function` VALUES (1, 82);
INSERT INTO `system_role_function` VALUES (1, 56);
INSERT INTO `system_role_function` VALUES (3, 2);
INSERT INTO `system_role_function` VALUES (3, 66);
INSERT INTO `system_role_function` VALUES (3, 3);
INSERT INTO `system_role_function` VALUES (3, 4);
INSERT INTO `system_role_function` VALUES (3, 5);
INSERT INTO `system_role_function` VALUES (3, 38);
INSERT INTO `system_role_function` VALUES (3, 6);
INSERT INTO `system_role_function` VALUES (3, 7);
INSERT INTO `system_role_function` VALUES (3, 8);
INSERT INTO `system_role_function` VALUES (3, 14);
INSERT INTO `system_role_function` VALUES (3, 10);
INSERT INTO `system_role_function` VALUES (3, 12);
INSERT INTO `system_role_function` VALUES (3, 11);
INSERT INTO `system_role_function` VALUES (3, 13);
INSERT INTO `system_role_function` VALUES (3, 15);
INSERT INTO `system_role_function` VALUES (3, 16);
INSERT INTO `system_role_function` VALUES (3, 17);
INSERT INTO `system_role_function` VALUES (3, 18);
INSERT INTO `system_role_function` VALUES (3, 44);
INSERT INTO `system_role_function` VALUES (3, 45);
INSERT INTO `system_role_function` VALUES (3, 61);
INSERT INTO `system_role_function` VALUES (3, 56);
INSERT INTO `system_role_function` VALUES (3, 51);
INSERT INTO `system_role_function` VALUES (3, 46);
INSERT INTO `system_role_function` VALUES (3, 77);
INSERT INTO `system_role_function` VALUES (3, 72);
INSERT INTO `system_role_function` VALUES (3, 67);
INSERT INTO `system_role_function` VALUES (3, 78);
INSERT INTO `system_role_function` VALUES (3, 79);
INSERT INTO `system_role_function` VALUES (3, 80);
INSERT INTO `system_role_function` VALUES (3, 81);
INSERT INTO `system_role_function` VALUES (3, 82);
INSERT INTO `system_role_function` VALUES (3, 69);
INSERT INTO `system_role_function` VALUES (3, 68);
INSERT INTO `system_role_function` VALUES (3, 70);
INSERT INTO `system_role_function` VALUES (3, 71);
INSERT INTO `system_role_function` VALUES (3, 73);
INSERT INTO `system_role_function` VALUES (3, 74);
INSERT INTO `system_role_function` VALUES (3, 75);
INSERT INTO `system_role_function` VALUES (3, 76);
INSERT INTO `system_role_function` VALUES (3, 47);
INSERT INTO `system_role_function` VALUES (3, 48);
INSERT INTO `system_role_function` VALUES (3, 49);
INSERT INTO `system_role_function` VALUES (3, 50);
INSERT INTO `system_role_function` VALUES (3, 52);
INSERT INTO `system_role_function` VALUES (3, 53);
INSERT INTO `system_role_function` VALUES (3, 54);
INSERT INTO `system_role_function` VALUES (3, 55);
INSERT INTO `system_role_function` VALUES (3, 57);
INSERT INTO `system_role_function` VALUES (3, 58);
INSERT INTO `system_role_function` VALUES (3, 59);
INSERT INTO `system_role_function` VALUES (3, 60);
INSERT INTO `system_role_function` VALUES (3, 62);
INSERT INTO `system_role_function` VALUES (3, 65);
INSERT INTO `system_role_function` VALUES (3, 63);
INSERT INTO `system_role_function` VALUES (3, 64);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cellphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT NULL,
  `leader_id` bigint(0) NULL DEFAULT NULL,
  `building_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_leader`(`leader_id`) USING BTREE,
  INDEX `fk_building`(`building_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, '超级管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'eecb4cde-2ffd-4539-994f-6a1f6c6f2984.png', '15612345678', '12345678@qq.com', '2020-12-09 11:04:54', NULL, NULL, 1);
INSERT INTO `system_user` VALUES (23, '王校长', 'wang', 'e10adc3949ba59abbe56e057f20f883e', '01c8c897-a9ce-43e0-b344-827e70149849.png', '13712345678', '12345688@qq.com', '2024-01-08 10:23:37', NULL, 1, 1);
INSERT INTO `system_user` VALUES (24, '杨阿姨', 'yang', 'e10adc3949ba59abbe56e057f20f883e', '8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png', '15612345678', '12345678@163.com', '2024-02-04 13:56:48', NULL, 1, 19);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `user_id` bigint(0) NOT NULL,
  `role_id` bigint(0) NOT NULL,
  INDEX `fk_uid`(`user_id`) USING BTREE,
  INDEX `fk_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (24, 2);
INSERT INTO `system_user_role` VALUES (23, 1);
INSERT INTO `system_user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
