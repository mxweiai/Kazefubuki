/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 47.103.214.78:3306
 Source Schema         : distribution_system

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 06/05/2021 18:17:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_ge_bytearray_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'false', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '322501', 130);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.0.0.4)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.0.0.4', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `act_id_membership_ibfk_1` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_id_membership_ibfk_2` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `act_procdef_info_ibfk_1` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_procdef_info_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_re_model_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_re_model_ibfk_2` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_re_model_ibfk_3` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXCEPTION`(`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_deadletter_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_deadletter_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_deadletter_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_deadletter_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `act_ru_event_subscr_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_execution_ibfk_1` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_execution_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_execution_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_4` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_identitylink_ibfk_1` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_identitylink_ibfk_2` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_identitylink_ibfk_3` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXCEPTION`(`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXCEPTION`(`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_suspended_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_suspended_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_suspended_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_suspended_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_task_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_task_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_task_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXCEPTION`(`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_timer_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_timer_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_timer_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_timer_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  CONSTRAINT `act_ru_variable_ibfk_1` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_variable_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_variable_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for database_info
-- ----------------------------
DROP TABLE IF EXISTS `database_info`;
CREATE TABLE `database_info`  (
  `db_id` bigint(20) NOT NULL COMMENT '主键id',
  `db_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库名称（英文名称）',
  `jdbc_driver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'jdbc的驱动类型',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库连接的账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库连接密码',
  `jdbc_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'jdbc的url',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注，摘要',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`db_id`) USING BTREE,
  UNIQUE INDEX `NAME_UNIQUE`(`db_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of database_info
-- ----------------------------
INSERT INTO `database_info` VALUES (1390245568516243458, 'master', 'com.mysql.cj.jdbc.Driver', 'root', 'root', 'jdbc:mysql://47.103.214.78:3306/distribution_system?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=GMT%2B8', '主数据源，项目启动数据源！', '2021-05-06 18:02:27');

-- ----------------------------
-- Table structure for entrust_info
-- ----------------------------
DROP TABLE IF EXISTS `entrust_info`;
CREATE TABLE `entrust_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `start_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出发地地址',
  `start_lon` decimal(10, 6) NULL DEFAULT NULL COMMENT '出发地经度',
  `start_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '出发地纬度',
  `end_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目的地地址',
  `end_lon` decimal(10, 5) NULL DEFAULT NULL COMMENT '目的地经度',
  `end_lat` decimal(10, 5) NULL DEFAULT NULL COMMENT '目的地纬度',
  `distance` bigint(20) NULL DEFAULT NULL COMMENT '距离（米）',
  `weight` decimal(10, 6) NULL DEFAULT NULL COMMENT '货物重量（KG）',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '每千米单价',
  `sum_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `last_time` decimal(10, 0) NULL DEFAULT NULL COMMENT '最长运送时间（小时）',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `is_start` tinyint(1) NULL DEFAULT 0 COMMENT '是否已开始',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '需求委托信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entrust_info
-- ----------------------------

-- ----------------------------
-- Table structure for excel_export_deploy
-- ----------------------------
DROP TABLE IF EXISTS `excel_export_deploy`;
CREATE TABLE `excel_export_deploy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'excel导出配置名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `nid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一标识',
  `template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模版路径',
  `data_source` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '0开启1关闭',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `E_E_D_NID`(`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'excel导出配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of excel_export_deploy
-- ----------------------------

-- ----------------------------
-- Table structure for extract_money_info
-- ----------------------------
DROP TABLE IF EXISTS `extract_money_info`;
CREATE TABLE `extract_money_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `extract_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '提取金额',
  `is_ok` tinyint(1) NULL DEFAULT NULL COMMENT '是否完成',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提现信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of extract_money_info
-- ----------------------------

-- ----------------------------
-- Table structure for oa_myleave
-- ----------------------------
DROP TABLE IF EXISTS `oa_myleave`;
CREATE TABLE `oa_myleave`  (
  `MYLEAVE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `STARTTIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `ENDTIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `WHENLONG` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时长',
  `REASON` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事由',
  PRIMARY KEY (`MYLEAVE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_myleave
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_user_info
-- ----------------------------
DROP TABLE IF EXISTS `oauth_user_info`;
CREATE TABLE `oauth_user_info`  (
  `oauth_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `blog` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户网址',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在公司',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户备注（各平台中的用户个人介绍）',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别，1-男，0-女',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户来源',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户授权的token',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台的用户唯一di',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`oauth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `entrust_id` bigint(20) NULL DEFAULT NULL COMMENT '需求委托ID',
  `is_overtime` tinyint(1) NULL DEFAULT 0 COMMENT '是否超时',
  `status` bigint(1) NULL DEFAULT 1 COMMENT '订单状态(1:未完成，2:待确认，3:已完成)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性编码标识',
  `dict_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是字典中的值',
  `dict_type_id` bigint(20) NULL DEFAULT NULL COMMENT '字典类型的编码',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值，如果是字典中的类型，则为dict的code',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1143324237579165697, '验证码开关', 'GUNS_KAPTCHA_OPEN', 'Y', 1106120265689055233, 'DISABLE', '是否开启验证码', '2019-06-24 12:46:43', 1, '2019-06-25 09:04:42', 1);
INSERT INTO `sys_config` VALUES (1143386834613694465, '阿里云短信的keyId', 'GUNS_SMS_ACCESSKEY_ID', 'N', NULL, 'xxxkey', '阿里云短信的密钥key', '2019-06-25 13:13:59', 1, '2019-06-25 13:19:21', 1);
INSERT INTO `sys_config` VALUES (1143386953933254657, '阿里云短信的secret', 'GUNS_SMS_ACCESSKEY_SECRET', 'N', NULL, 'xxxsecret', '阿里云短信的secret', '2019-06-25 13:14:28', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387023449649154, '阿里云短信的签名', 'GUNS_SMS_SIGN_NAME', 'N', NULL, 'xxxsign', '阿里云短信的签名', '2019-06-25 13:14:44', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387131109044225, '阿里云短信登录的模板号', 'GUNS_SMS_LOGIN_TEMPLATE_CODE', 'N', NULL, 'SMS_XXXXXX', '阿里云短信登录的模板号', '2019-06-25 13:15:10', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387225019510785, '验证码短信失效时间', 'GUNS_SMS_INVALIDATE_MINUTES', 'N', NULL, '2', '验证码短信失效时间', '2019-06-25 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143468689664876546, '管理系统名称', 'GUNS_SYSTEM_NAME', 'N', NULL, '货物配送平台管理系统', '管理系统名称', '2019-06-25 18:39:15', 1, '2021-05-04 14:28:38', 1);
INSERT INTO `sys_config` VALUES (1143468867767607297, '默认系统密码', 'GUNS_DEFAULT_PASSWORD', 'N', NULL, '111111', '默认系统密码', '2019-06-25 18:39:57', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143469008025133058, 'OAuth2登录用户的账号标识', 'GUNS_OAUTH2_PREFIX', 'N', NULL, 'oauth2', 'OAuth2登录用户的账号标识', '2019-06-25 18:40:31', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145207130463191041, '顶部导航条是否开启', 'GUNS_DEFAULT_ADVERT', 'Y', 1106120265689055233, 'DISABLE', '顶部Guns广告是否开启', '2019-06-30 13:47:11', 1, '2020-01-01 17:22:52', 1);
INSERT INTO `sys_config` VALUES (1145915627211370498, 'Guns发布的编号', 'GUNS_SYSTEM_RELEASE_VERSION', 'N', NULL, '20200318', '用于防止浏览器缓存相关的js和css', '2019-07-02 12:42:30', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370499, '文件上传路径', 'GUNS_FILE_UPLOAD_PATH', 'N', NULL, 'D:/tmp/', '文件上传默认目录', '2019-08-30 09:10:40', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370500, 'BPMN文件上传路径', 'GUNS_BPMN_FILE_UPLOAD_PATH', 'N', NULL, 'D:/tmp/', '工作流文件上传默认目录', '2019-08-30 09:10:40', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370501, '获取系统地密钥过期时间', 'GUNS_JWT_SECRET_EXPIRE', 'N', NULL, '86400', '获取系统地密钥过期时间（单位：秒），默认1天', '2019-10-16 23:02:39', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370502, '获取token的header标识', 'GUNS_TOKEN_HEADER_NAME', 'N', NULL, 'Authorization', '获取token的header标识', '2019-10-16 23:02:39', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370503, '获取租户是否开启的标识', 'GUNS_TENANT_OPEN', 'Y', 1106120265689055233, 'DISABLE', '获取租户是否开启的标识，默认是关的', '2019-10-16 23:02:39', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `pids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '父级ids',
  `simple_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1389465031166681089, 0, '[0],', '普通用户组', '普通用户组', '普通用户组', NULL, 1, '2021-05-04 14:20:53', '2021-05-04 14:21:13', 1, 1);
INSERT INTO `sys_dept` VALUES (1389465081447997442, 0, '[0],', '超级管理员', '超级管理员', '超级管理员', NULL, 0, '2021-05-04 14:21:05', '2021-05-04 14:21:23', 1, 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `dict_id` bigint(20) NOT NULL COMMENT '字典id',
  `dict_type_id` bigint(20) NOT NULL COMMENT '所属字典类型的id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `parent_id` bigint(20) NOT NULL COMMENT '上级代码id',
  `parent_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有上级id',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态（字典）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典的描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基础字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1106120532442595330, 1106120208097067009, 'M', '男', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120574163337218, 1106120208097067009, 'F', '女', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:10', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120645697191938, 1106120265689055233, 'ENABLE', '启用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:27', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120699468169217, 1106120265689055233, 'DISABLE', '禁用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:40', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120784318939137, 1106120322450571266, 'ENABLE', '启用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:12:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120825993543682, 1106120322450571266, 'FREEZE', '冻结', 0, '[0]', 'ENABLE', 1, '', '2019-03-14 17:12:10', '2019-03-16 10:56:36', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120875872206849, 1106120322450571266, 'DELETED', '已删除', 0, '[0]', 'ENABLE', -1221, '', '2019-03-14 17:12:22', '2019-03-16 10:56:53', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120935070613505, 1106120388036902914, 'Y', '删除', 0, '[0]', 'ENABLE', 23333, '', '2019-03-14 17:12:36', '2019-03-16 10:58:53', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120968910258177, 1106120388036902914, 'N', '未删除', 0, '[0]', 'ENABLE', 1212211221, '', '2019-03-14 17:12:44', '2019-03-16 10:59:03', 1, 1);
INSERT INTO `sys_dict` VALUES (1149218674746355713, 1149217131989069826, 'BASE_SYSTEM', '基础功能', 0, '[0]', 'ENABLE', 1, '系统管理平台', '2019-07-11 15:27:38', '2020-01-01 17:14:45', 1, 1);
INSERT INTO `sys_dict` VALUES (1160533174626959361, 1160532704105742337, '00101', '办公审批', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:47:25', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533264645111810, 1160532704105742337, '00102', '行政审批', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:47:47', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533377727741954, 1160532775455047681, 'KEY_LEAVE', '请假流程标识', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:48:14', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533455343337474, 1160532775455047681, 'KEY_FINANCE', '财务流程标识', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:48:32', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533574843252737, 1160532886713155585, '00401', '事假', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:49:01', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533625615302658, 1160532886713155585, '00402', '婚假', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:49:13', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533707215486977, 1160532886713155585, '00403', '产假', 0, '[0]', 'ENABLE', 30, '', '2019-08-11 20:49:32', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533765403066370, 1160532886713155585, '00404', '病假', 0, '[0]', 'ENABLE', 40, '', '2019-08-11 20:49:46', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533863834992641, 1160532886713155585, '00405', '公假', 0, '[0]', 'ENABLE', 50, '', '2019-08-11 20:50:09', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533945309347841, 1160532886713155585, '00406', '年假', 0, '[0]', 'ENABLE', 60, '', '2019-08-11 20:50:29', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160534007389241346, 1160532886713155585, '00407', '其他', 0, '[0]', 'ENABLE', 70, '', '2019-08-11 20:50:44', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1212300736972668929, 1149217131989069826, 'ENT_FUNC', '企业功能', 0, '[0]', 'ENABLE', 20, '企业功能', '2020-01-01 17:13:14', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_type_id` bigint(20) NOT NULL COMMENT '字典类型id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型名称',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  `system_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否是系统字典，Y-是，N-否',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态(字典)',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1106120208097067009, 'SEX', '性别', '', 'Y', 'ENABLE', 4, '2019-03-14 17:09:43', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120265689055233, 'STATUS', '状态', '', 'Y', 'ENABLE', 3, '2019-03-14 17:09:57', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120322450571266, 'ACCOUNT_STATUS', '账号状态', '', 'Y', 'ENABLE', 40, '2019-03-14 17:10:10', 1, '2019-08-11 20:46:38', 1);
INSERT INTO `sys_dict_type` VALUES (1106120388036902914, 'DEL_FLAG', '是否删除', '', 'Y', 'ENABLE', 2, '2019-03-14 17:10:26', 1, '2019-03-27 16:26:31', 1);
INSERT INTO `sys_dict_type` VALUES (1149217131989069826, 'SYSTEM_TYPE', '系统分类', '系统所有分类的维护', 'Y', 'ENABLE', 50, '2019-07-11 15:21:30', 1, '2019-08-11 20:46:47', 1);
INSERT INTO `sys_dict_type` VALUES (1160532704105742337, 'FLOW_CATEGARY', '工作流分类', '工作流分类', 'Y', 'ENABLE', 60, '2019-08-11 20:45:33', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1160532775455047681, 'FLOW_KEY', '工作流标识', '工作流标识', 'Y', 'ENABLE', 70, '2019-08-11 20:45:50', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1160532886713155585, 'LEAVE_TYPE', '请假类型', '请假类型', 'Y', 'ENABLE', 80, '2019-08-11 20:46:17', 1, '2019-08-11 20:46:23', 1);

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `file_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `file_bucket` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `file_suffix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_size_kb` bigint(20) NULL DEFAULT NULL COMMENT '文件大小kb',
  `final_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件唯一标识id',
  `file_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO `sys_file_info` VALUES ('1167385745179131905', NULL, '请假流程.bpmn20.xml', 'xml', 6, '1167385745179131905.xml', '/Users/stylefeng/tmp/gunsTempFiles/1167385745179131905.xml', '2019-08-30 18:37:05', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `login_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '具体消息',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1389462863399419905, '登录日志', 1, '2021-05-04 14:12:16', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389464643348750337, '登录日志', 1, '2021-05-04 14:19:21', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389464680585781249, '登录日志', 1, '2021-05-04 14:19:30', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389472399418028034, '登录日志', 1, '2021-05-04 14:50:10', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389473084872069122, '登录日志', 1, '2021-05-04 14:52:53', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389473288799158273, '登录日志', 1, '2021-05-04 14:53:42', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389473376845987841, '登录日志', 1, '2021-05-04 14:54:03', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389473861132910594, '登录日志', 1, '2021-05-04 14:55:58', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389475834011865090, '登录日志', 1, '2021-05-04 15:03:49', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389476097854558210, '登录日志', 1, '2021-05-04 15:04:52', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389476203634905090, '登录日志', 1, '2021-05-04 15:05:17', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389478173405962241, '登录日志', 1, '2021-05-04 15:13:06', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389478577673883650, '登录日志', 1, '2021-05-04 15:14:43', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389478781764521985, '退出日志', 1, '2021-05-04 15:15:31', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389478791222677506, '登录日志', 1, '2021-05-04 15:15:34', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389481506975789057, '登录日志', 1, '2021-05-04 15:26:21', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389483069127581698, '登录日志', 1, '2021-05-04 15:32:34', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389483501342285825, '登录日志', 1, '2021-05-04 15:34:17', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389484107205218305, '登录日志', 1, '2021-05-04 15:36:41', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389485887989256193, '登录日志', 1, '2021-05-04 15:43:46', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389487544047329282, '登录日志', 1, '2021-05-04 15:50:21', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389489792559185922, '登录日志', 1, '2021-05-04 15:59:17', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389495390235316226, '登录日志', 1, '2021-05-04 16:21:31', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389495708754923522, '登录日志', 1, '2021-05-04 16:22:47', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389499985850372097, '登录日志', 1, '2021-05-04 16:39:47', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389500515930705921, '退出日志', 1, '2021-05-04 16:41:53', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389500541151055873, '登录日志', 1, '2021-05-04 16:41:59', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389500823624773633, '登录日志', 1, '2021-05-04 16:43:07', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389501054672244737, '登录日志', 1, '2021-05-04 16:44:02', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389503430997061634, '登录日志', 1, '2021-05-04 16:53:28', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389504395548635138, '登录日志', 1, '2021-05-04 16:57:18', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389504757038944258, '登录日志', 1, '2021-05-04 16:58:44', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389505864666517506, '登录日志', 1, '2021-05-04 17:03:09', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389507128825577474, '登录日志', 1, '2021-05-04 17:08:10', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389511384022491137, '登录日志', 1, '2021-05-04 17:25:04', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389511458827902978, '登录日志', 1, '2021-05-04 17:25:22', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389511860692557826, '登录日志', 1, '2021-05-04 17:26:58', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389512082298535937, '登录日志', 1, '2021-05-04 17:27:51', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389622693158305793, '登录日志', 1389622616251547650, '2021-05-05 00:47:23', '成功', NULL, '192.168.0.102');
INSERT INTO `sys_login_log` VALUES (1389623133019164674, '登录日志', 1389622616251547650, '2021-05-05 00:49:08', '成功', NULL, '192.168.0.102');
INSERT INTO `sys_login_log` VALUES (1389623422241591297, '登录日志', 1389622616251547650, '2021-05-05 00:50:16', '成功', NULL, '192.168.0.102');
INSERT INTO `sys_login_log` VALUES (1389624724799475713, '登录日志', 1389622616251547650, '2021-05-05 00:55:27', '成功', NULL, '192.168.0.102');
INSERT INTO `sys_login_log` VALUES (1389638537309364225, '登录日志', 1, '2021-05-05 01:50:20', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389639660367814657, '登录日志', 1389639643657707521, '2021-05-05 01:54:48', '成功', NULL, '192.168.0.102');
INSERT INTO `sys_login_log` VALUES (1389745567915311106, '登录日志', 1, '2021-05-05 08:55:38', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389755676590612481, '登录日志', 1, '2021-05-05 09:35:48', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389758897547649025, '登录日志', 1389639643657707521, '2021-05-05 09:48:36', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389759127030603777, '登录日志', 1389639643657707521, '2021-05-05 09:49:31', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389759240272617473, '登录日志', 1389639643657707521, '2021-05-05 09:49:58', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389760070371516417, '登录日志', 1389639643657707521, '2021-05-05 09:53:16', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389776571166121986, '登录日志', 1389639643657707521, '2021-05-05 10:58:50', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389777587957686274, '登录日志', 1389639643657707521, '2021-05-05 11:02:52', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389777791356264450, '登录日志', 1389639643657707521, '2021-05-05 11:03:41', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389778792557600769, '登录日志', 1389639643657707521, '2021-05-05 11:07:40', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389779446445400066, '登录日志', 1389639643657707521, '2021-05-05 11:10:16', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389779601009696770, '登录日志', 1389639643657707521, '2021-05-05 11:10:52', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389780599639924737, '登录日志', 1389639643657707521, '2021-05-05 11:14:50', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389781322981203970, '登录日志', 1389639643657707521, '2021-05-05 11:17:43', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389781901245702145, '登录日志', 1389639643657707521, '2021-05-05 11:20:01', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389782335909814273, '登录日志', 1389639643657707521, '2021-05-05 11:21:44', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389783367377305601, '登录日志', 1389639643657707521, '2021-05-05 11:25:50', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389783512894488577, '登录日志', 1389639643657707521, '2021-05-05 11:26:25', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389783639042375682, '登录日志', 1389639643657707521, '2021-05-05 11:26:55', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389784525810515970, '登录日志', 1389639643657707521, '2021-05-05 11:30:27', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389784720166174722, '登录日志', 1389639643657707521, '2021-05-05 11:31:13', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389786335333908481, '登录日志', 1389639643657707521, '2021-05-05 11:37:38', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389805147169030145, '登录日志', 1389639643657707521, '2021-05-05 12:52:23', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389813549832142850, '登录日志', 1389639643657707521, '2021-05-05 13:25:46', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389813623568007169, '登录日志', 1389639643657707521, '2021-05-05 13:26:04', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389814507865702402, '登录日志', 1389639643657707521, '2021-05-05 13:29:35', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389814614812065794, '登录日志', 1389639643657707521, '2021-05-05 13:30:00', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389814950264111106, '登录日志', 1389639643657707521, '2021-05-05 13:31:20', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389815101271638017, '登录日志', 1389639643657707521, '2021-05-05 13:31:56', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389815193365970945, '登录日志', 1389639643657707521, '2021-05-05 13:32:18', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389815348907540481, '登录日志', 1389639643657707521, '2021-05-05 13:32:55', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389815705364660225, '登录日志', 1389639643657707521, '2021-05-05 13:34:20', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389816478731350017, '登录日志', 1389639643657707521, '2021-05-05 13:37:25', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389817346860003330, '登录日志', 1389639643657707521, '2021-05-05 13:40:52', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389817627777708033, '登录日志', 1389639643657707521, '2021-05-05 13:41:59', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389818035518582786, '登录日志', 1389639643657707521, '2021-05-05 13:43:36', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389818692891869185, '登录日志', 1389639643657707521, '2021-05-05 13:46:13', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389819076523876354, '登录日志', 1389639643657707521, '2021-05-05 13:47:44', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389819417684357122, '登录日志', 1389639643657707521, '2021-05-05 13:49:05', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389819951950692353, '登录日志', 1389639643657707521, '2021-05-05 13:51:13', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389820520446603265, '登录日志', 1389639643657707521, '2021-05-05 13:53:28', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389821137596493826, '登录日志', 1389639643657707521, '2021-05-05 13:55:55', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389822311921922050, '登录日志', 1389639643657707521, '2021-05-05 14:00:35', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389822503811330049, '登录日志', 1389639643657707521, '2021-05-05 14:01:21', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389822543325868034, '登录日志', 1389639643657707521, '2021-05-05 14:01:31', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389822609700728834, '登录日志', 1, '2021-05-05 14:01:46', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389822678164353025, '登录日志', 1389639643657707521, '2021-05-05 14:02:03', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389823333608198146, '登录日志', 1389639643657707521, '2021-05-05 14:04:39', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389823398116593666, '登录日志', 1389639643657707521, '2021-05-05 14:04:54', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389823477871284226, '登录日志', 1389639643657707521, '2021-05-05 14:05:13', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389824106702311425, '登录日志', 1389639643657707521, '2021-05-05 14:07:43', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389824369777446913, '登录日志', 1389639643657707521, '2021-05-05 14:08:46', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389827470185992193, '登录日志', 1389639643657707521, '2021-05-05 14:21:05', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389831585632882690, '登录日志', 1389639643657707521, '2021-05-05 14:37:26', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389835127936520194, '登录日志', 1389639643657707521, '2021-05-05 14:51:31', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389836768219762689, '登录日志', 1389639643657707521, '2021-05-05 14:58:02', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389840004779610113, '登录日志', 1389639643657707521, '2021-05-05 15:10:54', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389840235093037058, '登录日志', 1389639643657707521, '2021-05-05 15:11:49', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389840304370356226, '登录日志', 1389639643657707521, '2021-05-05 15:12:05', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389840559321124865, '登录日志', 1389639643657707521, '2021-05-05 15:13:06', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389840956433633282, '登录日志', 1389639643657707521, '2021-05-05 15:14:41', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389842988829773825, '登录日志', 1389639643657707521, '2021-05-05 15:22:45', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389843114117828609, '登录日志', 1389639643657707521, '2021-05-05 15:23:15', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389859779421409281, '登录日志', 1389639643657707521, '2021-05-05 16:29:28', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389864618838724610, '登录日志', 1389639643657707521, '2021-05-05 16:48:42', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389865066840723458, '登录日志', 1389639643657707521, '2021-05-05 16:50:29', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389865227700670466, '登录日志', 1389639643657707521, '2021-05-05 16:51:07', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389865631767334913, '登录日志', 1389639643657707521, '2021-05-05 16:52:44', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389866088266993666, '登录日志', 1389639643657707521, '2021-05-05 16:54:33', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389866558347808769, '登录日志', 1389639643657707521, '2021-05-05 16:56:25', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389866803324522498, '登录日志', 1389639643657707521, '2021-05-05 16:57:23', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389868881035923457, '登录日志', 1389639643657707521, '2021-05-05 17:05:38', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389868995309735937, '登录日志', 1389639643657707521, '2021-05-05 17:06:06', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389869983760388097, '登录日志', 1389639643657707521, '2021-05-05 17:10:01', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389871207788318721, '登录日志', 1389639643657707521, '2021-05-05 17:14:53', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389871375279460353, '登录日志', 1389639643657707521, '2021-05-05 17:15:33', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389871536915353602, '登录日志', 1389639643657707521, '2021-05-05 17:16:12', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389871714724483074, '登录日志', 1389639643657707521, '2021-05-05 17:16:54', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389871817900167170, '登录日志', 1389639643657707521, '2021-05-05 17:17:19', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389872137741012994, '登录日志', 1389639643657707521, '2021-05-05 17:18:35', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389872265981857794, '登录日志', 1389639643657707521, '2021-05-05 17:19:05', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389874575814430722, '登录日志', 1389639643657707521, '2021-05-05 17:28:16', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389874705460367361, '登录日志', 1389639643657707521, '2021-05-05 17:28:47', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389875025225715714, '登录日志', 1389639643657707521, '2021-05-05 17:30:03', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389875647673012225, '登录日志', 1389639643657707521, '2021-05-05 17:32:32', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389875894063206401, '登录日志', 1389639643657707521, '2021-05-05 17:33:30', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389875989101940737, '登录日志', 1389639643657707521, '2021-05-05 17:33:53', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389876060237336577, '登录日志', 1389639643657707521, '2021-05-05 17:34:10', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389876173097668610, '登录日志', 1389639643657707521, '2021-05-05 17:34:37', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389876643413364738, '登录日志', 1389639643657707521, '2021-05-05 17:36:29', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389876942035226626, '登录日志', 1389639643657707521, '2021-05-05 17:37:40', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389879269496459266, '登录日志', 1389639643657707521, '2021-05-05 17:46:55', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389879394188922882, '登录日志', 1389639643657707521, '2021-05-05 17:47:25', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389879507045060610, '登录日志', 1389639643657707521, '2021-05-05 17:47:52', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389879586116079617, '登录日志', 1389639643657707521, '2021-05-05 17:48:11', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389879844871081986, '登录日志', 1389639643657707521, '2021-05-05 17:49:12', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389881464702898177, '登录日志', 1389639643657707521, '2021-05-05 17:55:39', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389883252906659841, '登录日志', 1389639643657707521, '2021-05-05 18:02:45', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389885803316121602, '登录日志', 1389639643657707521, '2021-05-05 18:12:53', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389917597079965697, '登录日志', 1389639643657707521, '2021-05-05 20:19:13', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389917791615979521, '登录日志', 1389639643657707521, '2021-05-05 20:20:00', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389918480241004545, '登录日志', 1389639643657707521, '2021-05-05 20:22:44', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389919202340769794, '登录日志', 1389639643657707521, '2021-05-05 20:25:36', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389919354342346753, '登录日志', 1389639643657707521, '2021-05-05 20:26:12', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389919498387329026, '登录日志', 1389639643657707521, '2021-05-05 20:26:47', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389920804657172482, '登录日志', 1389639643657707521, '2021-05-05 20:31:58', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389921396599296001, '登录日志', 1389639643657707521, '2021-05-05 20:34:19', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389921577675788289, '登录日志', 1389639643657707521, '2021-05-05 20:35:02', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389921625293721601, '登录日志', 1389639643657707521, '2021-05-05 20:35:14', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389921767518375938, '登录日志', 1389639643657707521, '2021-05-05 20:35:48', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389921952592039937, '登录日志', 1389639643657707521, '2021-05-05 20:36:32', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389922206561341442, '登录日志', 1389639643657707521, '2021-05-05 20:37:32', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389929315185201153, '登录日志', 1389639643657707521, '2021-05-05 21:05:47', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389929531875528706, '登录日志', 1389639643657707521, '2021-05-05 21:06:39', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389929636309504001, '登录日志', 1389639643657707521, '2021-05-05 21:07:04', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389929693360427009, '登录日志', 1, '2021-05-05 21:07:17', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389929899992813570, '登录日志', 1389639643657707521, '2021-05-05 21:08:06', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389930226804592641, '登录日志', 1389639643657707521, '2021-05-05 21:09:24', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389930696667303938, '登录日志', 1389639643657707521, '2021-05-05 21:11:16', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389932023812198402, '登录日志', 1389639643657707521, '2021-05-05 21:16:33', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389932183430631425, '登录日志', 1389639643657707521, '2021-05-05 21:17:11', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389932307401674754, '登录日志', 1389639643657707521, '2021-05-05 21:17:40', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389934246902448129, '登录日志', 1389639643657707521, '2021-05-05 21:25:23', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389934275859922945, '登录日志', 1389639643657707521, '2021-05-05 21:25:30', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389934747396161538, '登录日志', 1389639643657707521, '2021-05-05 21:27:22', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389934898638569474, '登录日志', 1389639643657707521, '2021-05-05 21:27:58', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389935412214317058, '登录日志', 1389639643657707521, '2021-05-05 21:30:01', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389936122347732994, '登录日志', 1389639643657707521, '2021-05-05 21:32:50', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389936174638120961, '登录日志', 1389639643657707521, '2021-05-05 21:33:02', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389936589924556801, '登录日志', 1389639643657707521, '2021-05-05 21:34:41', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389936714533134337, '登录日志', 1389639643657707521, '2021-05-05 21:35:11', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389937011166896130, '登录日志', 1389936978954641409, '2021-05-05 21:36:22', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389938642910523393, '登录日志', 1389938628280791041, '2021-05-05 21:42:51', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389939352393805826, '登录日志', 1389939193572290562, '2021-05-05 21:45:40', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389940271562944513, '登录日志', 1389939193572290562, '2021-05-05 21:49:19', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389940555706068993, '登录日志', 1389639643657707521, '2021-05-05 21:50:27', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389941950932893697, '登录日志', 1389639643657707521, '2021-05-05 21:56:00', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389942227643711490, '登录日志', 1389639643657707521, '2021-05-05 21:57:06', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389942272086556673, '登录日志', 1389939193572290562, '2021-05-05 21:57:16', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389943835769225218, '登录日志', 1389939193572290562, '2021-05-05 22:03:29', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389946344722186241, '登录日志', 1389939193572290562, '2021-05-05 22:13:27', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389947387963080705, '登录日志', 1389939193572290562, '2021-05-05 22:17:36', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389947955628494850, '登录日志', 1389939193572290562, '2021-05-05 22:19:51', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389949073670557698, '登录日志', 1389939193572290562, '2021-05-05 22:24:18', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389950832686260225, '登录日志', 1389939193572290562, '2021-05-05 22:31:17', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389952982581592066, '登录日志', 1389939193572290562, '2021-05-05 22:39:50', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389953284181409793, '登录日志', 1389939193572290562, '2021-05-05 22:41:02', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389953569536688130, '登录日志', 1389939193572290562, '2021-05-05 22:42:10', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389956615796768770, '登录日志', 1, '2021-05-05 22:54:16', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389957267226624001, '登录日志', 1, '2021-05-05 22:56:51', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389961878633234433, '登录日志', 1389939193572290562, '2021-05-05 23:15:11', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389962384969613313, '登录日志', 1389939193572290562, '2021-05-05 23:17:11', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389963028162011138, '登录日志', 1389939193572290562, '2021-05-05 23:19:45', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389963179446362113, '登录日志', 1389939193572290562, '2021-05-05 23:20:21', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389963300322009089, '登录日志', 1389939193572290562, '2021-05-05 23:20:50', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389963456962486274, '登录日志', 1389939193572290562, '2021-05-05 23:21:27', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389963505398308865, '登录日志', 1389939193572290562, '2021-05-05 23:21:39', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389966203375968257, '登录日志', 1389939193572290562, '2021-05-05 23:32:22', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389966291162750977, '登录日志', 1389939193572290562, '2021-05-05 23:32:43', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389966428635258882, '登录日志', 1389939193572290562, '2021-05-05 23:33:16', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389966806269419522, '登录日志', 1389939193572290562, '2021-05-05 23:34:46', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389966931263873026, '登录日志', 1389939193572290562, '2021-05-05 23:35:15', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389967123404939265, '登录日志', 1389939193572290562, '2021-05-05 23:36:01', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389967446328598529, '登录日志', 1389939193572290562, '2021-05-05 23:37:18', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389967686746103810, '登录日志', 1389939193572290562, '2021-05-05 23:38:16', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389967987536420866, '登录日志', 1389939193572290562, '2021-05-05 23:39:27', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389968097100029954, '登录日志', 1389939193572290562, '2021-05-05 23:39:53', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389968314729787394, '登录日志', 1389939193572290562, '2021-05-05 23:40:45', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389968460376993794, '登录日志', 1389939193572290562, '2021-05-05 23:41:20', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389974451877416962, '登录日志', 1389939193572290562, '2021-05-06 00:05:08', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389976153632321537, '登录日志', 1389639643657707521, '2021-05-06 00:11:54', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389977591179685889, '登录日志', 1389639643657707521, '2021-05-06 00:17:37', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389980648709861377, '登录日志', 1389639643657707521, '2021-05-06 00:29:46', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389980762291613698, '登录日志', 1389639643657707521, '2021-05-06 00:30:13', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389983535263428610, '登录日志', 1389639643657707521, '2021-05-06 00:41:14', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389984187821633537, '登录日志', 1389639643657707521, '2021-05-06 00:43:50', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389984246814519297, '登录日志', 1389939193572290562, '2021-05-06 00:44:04', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389984343283511298, '登录日志', 1389939193572290562, '2021-05-06 00:44:27', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389989625103400961, '登录日志', 1389939193572290562, '2021-05-06 01:05:26', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389989758935252993, '登录日志', 1389939193572290562, '2021-05-06 01:05:58', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389990966475362305, '登录日志', 1389939193572290562, '2021-05-06 01:10:46', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389991133563850754, '登录日志', 1389939193572290562, '2021-05-06 01:11:26', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389991317974814722, '登录日志', 1389939193572290562, '2021-05-06 01:12:10', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389991566818676737, '登录日志', 1389939193572290562, '2021-05-06 01:13:09', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389997523481137154, '登录日志', 1389939193572290562, '2021-05-06 01:36:49', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389997613285380098, '登录日志', 1389939193572290562, '2021-05-06 01:37:11', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389998161732571138, '登录日志', 1389939193572290562, '2021-05-06 01:39:21', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389998234101092354, '登录日志', 1389639643657707521, '2021-05-06 01:39:39', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389998330855297026, '登录日志', 1389939193572290562, '2021-05-06 01:40:02', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389998689891913730, '登录日志', 1389939193572290562, '2021-05-06 01:41:27', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1389998748796719105, '登录日志', 1, '2021-05-06 01:41:41', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1389999346761932802, '登录日志', 1, '2021-05-06 01:44:04', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1390000167721443329, '退出日志', 1, '2021-05-06 01:47:20', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1390000544072146946, '登录日志', 1390000487788781569, '2021-05-06 01:48:49', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1390001531927207938, '登录日志', 1, '2021-05-06 01:52:45', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1390002348101017601, '登录日志', 1390002319344869377, '2021-05-06 01:55:59', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1390003181597302786, '登录日志', 1390000487788781569, '2021-05-06 01:59:18', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1390003321670279169, '登录日志', 1390002319344869377, '2021-05-06 01:59:52', '成功', NULL, '192.168.0.100');
INSERT INTO `sys_login_log` VALUES (1390245774133608449, '登录日志', 1, '2021-05-06 18:03:17', '成功', NULL, '58.35.193.234');
INSERT INTO `sys_login_log` VALUES (1390245817343328258, '退出日志', 1, '2021-05-06 18:03:27', '成功', NULL, '58.35.193.234');
INSERT INTO `sys_login_log` VALUES (1390248231890894850, '登录日志', 1390000487788781569, '2021-05-06 18:13:03', '成功', NULL, '223.104.212.117');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '主键id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `sort` int(65) NULL DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) NULL DEFAULT NULL COMMENT '菜单层级',
  `menu_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是菜单(字典)',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ENABLE' COMMENT '菜单状态(字典)',
  `new_page_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打开新页面的标识(字典)',
  `open_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打开(字典)',
  `system_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统分类(字典)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (105, 'system', '0', '[0],', '系统管理', 'layui-icon layui-icon-set', '#', 20, 1, 'Y', NULL, 'ENABLE', NULL, '1', 'BASE_SYSTEM', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 10, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (114, 'role', 'system', '[0],[system],', '角色管理', '', '/role', 20, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (119, 'menu', 'system', '[0],[system],', '菜单管理', '', '/menu', 50, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (128, 'log', 'system', '[0],[system],', '业务日志', '', '/log', 70, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (130, 'druid', 'system', '[0],[system],', '监控管理', '', '/druid', 80, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:50:06', NULL, 1);
INSERT INTO `sys_menu` VALUES (131, 'dept', 'system', '[0],[system],', '部门管理', '', '/dept', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (132, 'dict', 'system', '[0],[system],', '字典管理', '', '/dictType', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (133, 'loginLog', 'system', '[0],[system],', '登录日志', '', '/loginLog', 60, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dictType/addItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dictType/editItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dictType/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (141, 'notice', 'system', '[0],[system],', '通知管理', '', '/notice', 90, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (145, 'sys_message', 'dashboard', '[0],[dashboard],', '消息通知', 'layui-icon layui-icon-tips', '/system/notice', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-04-08 22:49:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (149, 'api_mgr', 'dev_tools', '[0],[dev_tools],', '接口文档', 'fa-leaf', '/swagger-ui.html', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-15 18:13:00', NULL, 1);
INSERT INTO `sys_menu` VALUES (150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (171, 'dev_tools', '0', '[0],', '开发管理', 'layui-icon layui-icon-code-circle', '#', 30, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-05-11 13:40:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (172, 'dashboard', '0', '[0],', '主控面板', 'layui-icon layui-icon-home', '#', 10, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-04-08 22:48:15', NULL, 1);
INSERT INTO `sys_menu` VALUES (1110777136265838594, 'demos_show', '0', '[0],', '高级组件', 'layui-icon-diamond', '#', 60, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:34:41', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1110777366856089602, 'excel_import', 'EXCEL_PROCESS', '[0],[EXCEL_PROCESS],', 'excel导入', 'layui-icon-rate-solid', '/excel/import', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:35:36', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1110777491464667137, 'excel_export', 'EXCEL_PROCESS', '[0],[EXCEL_PROCESS],', 'excel导出', 'layui-icon-rate-solid', '/excel/export', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:36:06', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1110787391943098370, 'advanced_form', 'demos_show', '[0],[demos_show],', '高级表单', '', '/egForm', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 14:15:26', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1110839216310329346, 'pdf_view', 'demos_show', '[0],[demos_show],', '文档预览', '', '/loadPdfFile', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 17:41:22', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1111545968697860098, 'console', 'dashboard', '[0],[dashboard],', '项目介绍', '', '/system/console', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-03-29 16:29:45', '2019-04-09 20:57:08', 1, 1);
INSERT INTO `sys_menu` VALUES (1111546189892870145, 'console2', 'dashboard', '[0],[dashboard],', '统计报表', '', '/system/console2', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-03-29 16:30:38', '2019-04-08 22:49:48', 1, 1);
INSERT INTO `sys_menu` VALUES (1127085735660421122, 'code_generate', 'dev_tools', '[0],[dev_tools],', '代码生成', '', '/gen', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-05-11 13:39:14', '2019-06-15 18:12:45', 1, 1);
INSERT INTO `sys_menu` VALUES (1139827152854716418, 'data_source', '0', '[0],', '数据容器', 'layui-icon-template-1', '/databaseInfo', 40, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-06-15 17:29:05', '2020-01-01 18:23:17', 1, 1);
INSERT INTO `sys_menu` VALUES (1140241958563880962, 'tenant_info', 'TENANT_MANAGER', '[0],[TENANT_MANAGER],', '租户管理', 'layui-icon layui-icon-auz', '/tenantInfo', 999, 2, 'Y', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-06-16 20:57:22', '2020-01-01 18:22:29', 1, 1);
INSERT INTO `sys_menu` VALUES (1140241958563880963, 'tenant_info_add', 'tenant_info', '[0],[TENANT_MANAGER],[tenant_info],', '租户表添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-06-16 20:57:22', '2020-01-01 18:22:29', 1, 1);
INSERT INTO `sys_menu` VALUES (1140241958563880964, 'tenant_info_edit', 'tenant_info', '[0],[TENANT_MANAGER],[tenant_info],', '租户表修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-06-16 20:57:22', '2020-01-01 18:22:29', 1, 1);
INSERT INTO `sys_menu` VALUES (1140241958563880965, 'tenant_info_delete', 'tenant_info', '[0],[TENANT_MANAGER],[tenant_info],', '租户表删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-06-16 20:57:22', '2020-01-01 18:22:29', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112257, 'SYS_CONFIG', 'dev_tools', '[0],[dev_tools],', '参数配置', 'fa-star', '/sysConfig', 30, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112258, 'SYS_CONFIG_ADD', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112259, 'SYS_CONFIG_EDIT', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882426306562, 'SYS_CONFIG_DELETE', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684801, 'SYS_POSITION', 'system', '[0],[system],', '职位管理', 'fa-star', '/position', 35, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684802, 'SYS_POSITION_ADD', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684803, 'SYS_POSITION_EDIT', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684804, 'SYS_POSITION_DELETE', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1149955324929765378, 'system_info', 'dashboard', '[0],[dashboard],', '系统监控', 'layui-icon-star-fill', '/system/systemInfo', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-07-13 16:14:49', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1158737199356919809, 'online_office', '0', '[0],', '在线办公', 'layui-icon-cellphone', '#', 30, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:50:51', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158737313060306945, 'office_model', 'online_office', '[0],[online_office],', '工作流程', 'layui-icon-star-fill', '#', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:51:18', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158737441812856834, 'model_manager', 'office_model', '[0],[online_office],[office_model],', '模型管理', 'layui-icon-star-fill', '/model', 10, 3, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:51:49', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158737665570586625, 'procdef', 'office_model', '[0],[online_office],[office_model],', '流程管理', 'layui-icon-star-fill', '/process', 20, 3, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:52:42', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158737892184637441, 'process_on', 'office_model', '[0],[online_office],[office_model],', '运行中流程', 'layui-icon-star-fill', '/taskRunning', 30, 3, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:53:36', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158738158376140801, 'hiprocdef', 'office_model', '[0],[online_office],[office_model],', '历史流程', 'layui-icon-star-fill', '/historyProc', 40, 3, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:54:40', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158738253440040962, 'task_manager', 'online_office', '[0],[online_office],', '任务管理', 'layui-icon-star-fill', '#', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:55:03', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158738549708898305, 'approve', 'online_office', '[0],[online_office],', '申请审批', 'layui-icon-star-fill', '#', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:56:13', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158738875899920385, 'rutask', 'task_manager', '[0],[online_office],[task_manager],', '待办任务', 'layui-icon-star-fill', '/taskWaiting', 10, 3, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:57:31', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158739014999818241, 'havetask', 'task_manager', '[0],[online_office],[task_manager],', '已办任务', 'layui-icon-star-fill', '/taskHistory', 20, 3, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:58:04', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1158739122743099393, 'leave', 'approve', '[0],[online_office],[approve],', '请假审批', 'layui-icon-star-fill', '/myleave', 10, 3, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-08-06 21:58:30', '2020-01-01 18:22:37', 1, 1);
INSERT INTO `sys_menu` VALUES (1184836690833002497, 'TRANSLATION', '0', '[0],', '国际化', 'layui-icon-website', '/translation', 50, 1, 'Y', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-10-17 22:20:54', '2020-01-01 18:23:27', 1, 1);
INSERT INTO `sys_menu` VALUES (1184836690833002498, 'TRANSLATION_ADD', 'TRANSLATION', '[0],[TRANSLATION],', '多语言添加', 'fa-star', '', 999, 2, 'N', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-10-17 22:20:54', '2020-01-01 18:23:27', 1, 1);
INSERT INTO `sys_menu` VALUES (1184836690833002499, 'TRANSLATION_EDIT', 'TRANSLATION', '[0],[TRANSLATION],', '多语言修改', 'fa-star', '', 999, 2, 'N', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-10-17 22:20:54', '2020-01-01 18:23:27', 1, 1);
INSERT INTO `sys_menu` VALUES (1184836690833002500, 'TRANSLATION_DELETE', 'TRANSLATION', '[0],[TRANSLATION],', '多语言删除', 'fa-star', '', 999, 2, 'N', '', 'ENABLE', '', '', 'ENT_FUNC', '2019-10-17 22:20:54', '2020-01-01 18:23:27', 1, 1);
INSERT INTO `sys_menu` VALUES (1212299504967204865, 'EXCEL_PROCESS', '0', '[0],', 'excel处理', 'layui-icon-template', '#', 10, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2020-01-01 17:08:20', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1212299802154614786, 'EXCEL_PROCESS_EXPORT', 'EXCEL_PROCESS', '[0],[EXCEL_PROCESS],', '模板配置', 'layui-icon-template', '/excelExportDeploy', 5, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2020-01-01 17:09:31', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1212307782698782722, 'TENANT_MANAGER', '0', '[0],', '租户管理', 'layui-icon-component', '#', 20, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2020-01-01 17:41:14', '2020-01-01 18:22:29', 1, 1);
INSERT INTO `sys_menu` VALUES (1389471459411517442, 'ENTRUST_INFO', 'entrust_top', '[0],[entrust_top],', '需求委托信息', 'fa-star', '/entrustInfo', 999, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 14:46:25', '2021-05-04 14:51:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1389471459411517443, 'ENTRUST_INFO_ADD', 'ENTRUST_INFO', '[0],[entrust_top],[ENTRUST_INFO],', '需求委托信息表添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 14:46:25', '2021-05-04 14:51:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1389471459411517444, 'ENTRUST_INFO_EDIT', 'ENTRUST_INFO', '[0],[entrust_top],[ENTRUST_INFO],', '需求委托信息表修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 14:46:25', '2021-05-04 14:51:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1389471459411517445, 'ENTRUST_INFO_DELETE', 'ENTRUST_INFO', '[0],[entrust_top],[ENTRUST_INFO],', '需求委托信息表删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 14:46:25', '2021-05-04 14:51:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1389472688594317314, 'entrust_top', '0', '[0],', '需求委托管理', 'layui-icon-template-1', '#', 0, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2021-05-04 14:51:19', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1389482424702087169, 'ORDER_INFO', 'ORDER_TOP', '[0],[ORDER_TOP],', '订单信息', 'fa-star', '/orderInfo', 999, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 15:30:00', '2021-05-04 15:37:40', 1, 1);
INSERT INTO `sys_menu` VALUES (1389482424702087170, 'ORDER_INFO_ADD', 'ORDER_INFO', '[0],[ORDER_TOP],[ORDER_INFO],', '订单信息表添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 15:30:00', '2021-05-04 15:37:40', 1, 1);
INSERT INTO `sys_menu` VALUES (1389482424702087171, 'ORDER_INFO_EDIT', 'ORDER_INFO', '[0],[ORDER_TOP],[ORDER_INFO],', '订单信息表修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 15:30:00', '2021-05-04 15:37:40', 1, 1);
INSERT INTO `sys_menu` VALUES (1389482424702087172, 'ORDER_INFO_DELETE', 'ORDER_INFO', '[0],[ORDER_TOP],[ORDER_INFO],', '订单信息表删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 15:30:00', '2021-05-04 15:37:40', 1, 1);
INSERT INTO `sys_menu` VALUES (1389484304148762625, 'ORDER_TOP', '0', '[0],', '订单管理', 'layui-icon-template', '#', 1, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2021-05-04 15:37:28', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1389499064487530497, 'EXTRACT_MONEY_INFO', 'EXTRCAT_TOP', '[0],[EXTRCAT_TOP],', '提现信息', 'fa-star', '/extractMoneyInfo', 999, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 16:36:07', '2021-05-04 16:41:32', 1, 1);
INSERT INTO `sys_menu` VALUES (1389499064487530498, 'EXTRACT_MONEY_INFO_ADD', 'EXTRACT_MONEY_INFO', '[0],[EXTRCAT_TOP],[EXTRACT_MONEY_INFO],', '提现信息添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 16:36:07', '2021-05-04 16:41:32', 1, 1);
INSERT INTO `sys_menu` VALUES (1389499064550445058, 'EXTRACT_MONEY_INFO_EDIT', 'EXTRACT_MONEY_INFO', '[0],[EXTRCAT_TOP],[EXTRACT_MONEY_INFO],', '提现信息修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 16:36:07', '2021-05-04 16:41:32', 1, 1);
INSERT INTO `sys_menu` VALUES (1389499064550445059, 'EXTRACT_MONEY_INFO_DELETE', 'EXTRACT_MONEY_INFO', '[0],[EXTRCAT_TOP],[EXTRACT_MONEY_INFO],', '提现信息删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2021-05-04 16:36:07', '2021-05-04 16:41:32', 1, 1);
INSERT INTO `sys_menu` VALUES (1389500329661665282, 'EXTRCAT_TOP', '0', '[0],', '司机提现管理', 'layui-icon-rmb', '#', 3, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2021-05-04 16:41:09', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (6, '欢迎', 'hi，Guns旗舰版发布了！', '2017-01-11 08:53:20', 1, '2018-12-28 23:24:48', 1);
INSERT INTO `sys_notice` VALUES (8, '你好', '你好，世界！', '2017-05-10 19:28:57', 1, '2018-12-28 23:28:26', 1);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `operation_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型(字典)',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(65) NULL DEFAULT NULL COMMENT '用户id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '方法名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功(字典)',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '备注',
  PRIMARY KEY (`operation_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (1389464946504654850, '业务日志', '删除部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'delete', '2021-05-04 14:20:33', '成功', '部门名称=');
INSERT INTO `sys_operation_log` VALUES (1389465031619665921, '业务日志', '添加部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'add', '2021-05-04 14:20:53', '成功', '部门简称=普通用户组');
INSERT INTO `sys_operation_log` VALUES (1389465081905176577, '业务日志', '添加部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'add', '2021-05-04 14:21:05', '成功', '部门简称=超级管理员');
INSERT INTO `sys_operation_log` VALUES (1389465114415226882, '业务日志', '修改部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'update', '2021-05-04 14:21:13', '成功', '部门简称=普通用户组;;;');
INSERT INTO `sys_operation_log` VALUES (1389465158384115713, '业务日志', '修改部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'update', '2021-05-04 14:21:23', '成功', '部门简称=超级管理员;;;');
INSERT INTO `sys_operation_log` VALUES (1389465807427493889, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2021-05-04 14:23:58', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,开发管理,接口文档,代码生成,参数配置,参数配置添加,参数配置修改,参数配置删除');
INSERT INTO `sys_operation_log` VALUES (1389466235577851905, '业务日志', '添加角色', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'add', '2021-05-04 14:25:40', '成功', '角色名称=普通用户');
INSERT INTO `sys_operation_log` VALUES (1389466295015333890, '业务日志', '删除角色', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'remove', '2021-05-04 14:25:54', '成功', '角色名称=第三方登录');
INSERT INTO `sys_operation_log` VALUES (1389472661461364738, '异常日志', '', 1, NULL, NULL, '2021-05-04 14:51:12', '失败', 'RequestEmptyException()\r\n');
INSERT INTO `sys_operation_log` VALUES (1389472689185714178, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2021-05-04 14:51:19', '成功', '菜单名称=需求委托管理');
INSERT INTO `sys_operation_log` VALUES (1389472689772916738, '异常日志', '', 1, NULL, NULL, '2021-05-04 14:51:19', '失败', 'cn.stylefeng.roses.kernel.model.exception.ServiceException: 菜单编号重复，不能添加\r\n	at cn.stylefeng.guns.sys.modular.system.service.MenuService.addMenu(MenuService.java:61)\r\n	at cn.stylefeng.guns.sys.modular.system.service.MenuServiceTTFastClassBySpringCGLIBTTe02a93b6.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:295)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.sys.modular.system.service.MenuServiceTTEnhancerBySpringCGLIBTT6bb680eb.addMenu(<generated>)\r\n	at cn.stylefeng.guns.sys.modular.system.controller.MenuController.add(MenuController.java:178)\r\n	at cn.stylefeng.guns.sys.modular.system.controller.MenuControllerTTFastClassBySpringCGLIBTT837cb586.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.sys.core.log.aop.LogAop.recordSysLog(LogAop.java:60)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.base.auth.aop.PermissionAop.doPermission(PermissionAop.java:70)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.GeneratedMethodAccessor135.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.sys.modular.system.controller.MenuControllerTTEnhancerBySpringCGLIBTT6ce408df.add(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES (1389472747608174593, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2021-05-04 14:51:33', '成功', '菜单名称=需求委托信息;;;字段名称:菜单名称,旧值:需求委托信息表,新值:需求委托信息');
INSERT INTO `sys_operation_log` VALUES (1389472786917191682, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2021-05-04 14:51:42', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,开发管理,接口文档,代码生成,参数配置,参数配置添加,参数配置修改,参数配置删除,需求委托管理,需求委托信息,需求委托信息表添加,需求委托信息表修改,需求委托信息表删除');
INSERT INTO `sys_operation_log` VALUES (1389478179408011266, '异常日志', '', 1, NULL, NULL, '2021-05-04 15:13:08', '失败', 'org.springframework.jdbc.UncategorizedSQLException: Error attempting to get column \'createUserName\' from result set.  Cause: java.sql.SQLException: Error\n; uncategorized SQLException; SQL state [null]; error code [0]; Error; nested exception is java.sql.SQLException: Error\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:89)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:81)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:81)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:88)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:348)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplate.selectList(OptionalSqlSessionTemplate.java:155)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:134)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:96)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy123.customPageList(Unknown Source)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImpl.findPageBySpec(EntrustInfoServiceImpl.java:62)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTFastClassBySpringCGLIBTT4f890517.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTEnhancerBySpringCGLIBTTd9ac8ddd.findPageBySpec(<generated>)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoController.list(EntrustInfoController.java:124)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTFastClassBySpringCGLIBTT619cdbdd.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTEnhancerBySpringCGLIBTT67e1045f.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: java.sql.SQLException: Error\r\n	at com.alibaba.druid.pool.DruidDataSource.handleConnectionException(DruidDataSource.java:1758)\r\n	at com.alibaba.druid.pool.DruidPooledConnection.handleException(DruidPooledConnection.java:133)\r\n	at com.alibaba.druid.pool.DruidPooledStatement.checkException(DruidPooledStatement.java:82)\r\n	at com.alibaba.druid.pool.DruidPooledResultSet.checkException(DruidPooledResultSet.java:54)\r\n	at com.alibaba.druid.pool.DruidPooledResultSet.getLong(DruidPooledResultSet.java:303)\r\n	at sun.reflect.GeneratedMethodAccessor75.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.ResultSetLogger.invoke(ResultSetLogger.java:69)\r\n	at com.sun.proxy.TProxy158.getLong(Unknown Source)\r\n	at org.apache.ibatis.type.LongTypeHandler.getNullableResult(LongTypeHandler.java:37)\r\n	at org.apache.ibatis.type.LongTypeHandler.getNullableResult(LongTypeHandler.java:26)\r\n	at org.apache.ibatis.type.BaseTypeHandler.getResult(BaseTypeHandler.java:81)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.applyAutomaticMappings(DefaultResultSetHandler.java:521)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.getRowValue(DefaultResultSetHandler.java:402)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleRowValuesForSimpleResultMap(DefaultResultSetHandler.java:354)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleRowValues(DefaultResultSetHandler.java:328)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleResultSet(DefaultResultSetHandler.java:301)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleResultSets(DefaultResultSetHandler.java:194)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:65)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:79)\r\n	at sun.reflect.GeneratedMethodAccessor103.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy202.query(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor103.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy202.query(Unknown Source)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doQuery(MybatisSimpleExecutor.java:67)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:155)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:90)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy201.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:335)\r\n	... 131 more\r\nCaused by: java.lang.NumberFormatException: For input string: \"stylefeng\"\r\n	at sun.misc.FloatingDecimal.readJavaFormatString(FloatingDecimal.java:2043)\r\n	at sun.misc.FloatingDecimal.parseDouble(FloatingDecimal.java:110)\r\n	at java.lang.Double.parseDouble(Double.java:538)\r\n	at com.mysql.cj.protocol.a.MysqlTextValueDecoder.decodeDouble(MysqlTextValueDecoder.java:228)\r\n	at com.mysql.cj.result.StringConverter.createFromBytes(StringConverter.java:110)\r\n	at com.mysql.cj.protocol.a.MysqlTextValueDecoder.decodeByteArray(MysqlTextValueDecoder.java:238)\r\n	at com.mysql.cj.protocol.result.AbstractResultsetRow.decodeAndCreateReturnValue(AbstractResultsetRow.java:129)\r\n	at com.mysql.cj.protocol.result.AbstractResultsetRow.getValueFromBytes(AbstractResultsetRow.java:233)\r\n	at com.mysql.cj.protocol.a.result.TextBufferRow.getValue(TextBufferRow.java:128)\r\n	at com.mysql.cj.jdbc.result.ResultSetImpl.getNonStringValueFromRow(ResultSetImpl.java:628)\r\n	at com.mysql.cj.jdbc.result.ResultSetImpl.getLong(ResultSetImpl.java:851)\r\n	at com.mysql.cj.jdbc.result.ResultSetImpl.getLong(ResultSetImpl.java:855)\r\n	at com.alibaba.druid.filter.FilterChainImpl.resultSet_getLong(FilterChainImpl.java:1184)\r\n	at com.alibaba.druid.filter.FilterAdapter.resultSet_getLong(FilterAdapter.java:1655)\r\n	at com.alibaba.druid.filter.FilterChainImpl.resultSet_getLong(FilterChainImpl.java:1180)\r\n	at com.alibaba.druid.filter.FilterAdapter.resultSet_getLong(FilterAdapter.java:1655)\r\n	at com.alibaba.druid.filter.FilterChainImpl.resultSet_getLong(FilterChainImpl.java:1180)\r\n	at com.alibaba.druid.proxy.jdbc.ResultSetProxyImpl.getLong(ResultSetProxyImpl.java:508)\r\n	at com.alibaba.druid.pool.DruidPooledResultSet.getLong(DruidPooledResultSet.java:301)\r\n	... 175 more\r\n');
INSERT INTO `sys_operation_log` VALUES (1389478662642094082, '业务日志', '修改管理员', 1, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-04 15:15:03', '成功', '账号=null;;;字段名称:名字,旧值:stylefeng,新值:超级管理员');
INSERT INTO `sys_operation_log` VALUES (1389484304673050626, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2021-05-04 15:37:28', '成功', '菜单名称=订单管理');
INSERT INTO `sys_operation_log` VALUES (1389484353054347265, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2021-05-04 15:37:40', '成功', '菜单名称=订单信息;;;字段名称:菜单名称,旧值:订单信息表,新值:订单信息');
INSERT INTO `sys_operation_log` VALUES (1389484395257434113, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2021-05-04 15:37:50', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,开发管理,接口文档,代码生成,参数配置,参数配置添加,参数配置修改,参数配置删除,需求委托管理,需求委托信息,需求委托信息表添加,需求委托信息表修改,需求委托信息表删除,订单管理,订单信息,订单信息表添加,订单信息表修改,订单信息表删除');
INSERT INTO `sys_operation_log` VALUES (1389495428017606658, '异常日志', '', 1, NULL, NULL, '2021-05-04 16:21:40', '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM order_info a LEFT JOIN entrust_info b ON a.entrust_id = b.id LEFT JOIN sys_user c ON a.create_user = c.user_id WHERE 1 = 1 AND status LIKE CONCAT(\'%\', ?, \'%\') \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\order\\mapper\\mapping\\OrderInfoMapper.xml]\r\n### The error may involve cn.stylefeng.guns.modular.order.mapper.OrderInfoMapper.customPageList-Inline\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM order_info a LEFT JOIN entrust_info b ON a.entrust_id = b.id LEFT JOIN sys_user c ON a.create_user = c.user_id WHERE 1 = 1 AND status LIKE CONCAT(\'%\', ?, \'%\') \n\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:92)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:348)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplate.selectList(OptionalSqlSessionTemplate.java:155)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:134)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:96)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy125.customPageList(Unknown Source)\r\n	at cn.stylefeng.guns.modular.order.service.impl.OrderInfoServiceImpl.findPageBySpec(OrderInfoServiceImpl.java:62)\r\n	at cn.stylefeng.guns.modular.order.service.impl.OrderInfoServiceImplTTFastClassBySpringCGLIBTTab86e177.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.order.service.impl.OrderInfoServiceImplTTEnhancerBySpringCGLIBTT5ba939d4.findPageBySpec(<generated>)\r\n	at cn.stylefeng.guns.modular.order.controller.OrderInfoController.list(OrderInfoController.java:124)\r\n	at cn.stylefeng.guns.modular.order.controller.OrderInfoControllerTTFastClassBySpringCGLIBTT8079547d.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.order.controller.OrderInfoControllerTTEnhancerBySpringCGLIBTTef06e510.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM order_info a LEFT JOIN entrust_info b ON a.entrust_id = b.id LEFT JOIN sys_user c ON a.create_user = c.user_id WHERE 1 = 1 AND status LIKE CONCAT(\'%\', ?, \'%\') \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\order\\mapper\\mapping\\OrderInfoMapper.xml]\r\n### The error may involve cn.stylefeng.guns.modular.order.mapper.OrderInfoMapper.customPageList-Inline\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM order_info a LEFT JOIN entrust_info b ON a.entrust_id = b.id LEFT JOIN sys_user c ON a.create_user = c.user_id WHERE 1 = 1 AND status LIKE CONCAT(\'%\', ?, \'%\') \n\r\n	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:149)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:335)\r\n	... 131 more\r\nCaused by: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM order_info a LEFT JOIN entrust_info b ON a.entrust_id = b.id LEFT JOIN sys_user c ON a.create_user = c.user_id WHERE 1 = 1 AND status LIKE CONCAT(\'%\', ?, \'%\') \n\r\n	at com.baomidou.mybatisplus.core.toolkit.ExceptionUtils.mpe(ExceptionUtils.java:39)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:252)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.intercept(PaginationInterceptor.java:201)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy204.prepare(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor103.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\r\n	at cn.stylefeng.roses.core.datascope.DataScopeInterceptor.intercept(DataScopeInterceptor.java:52)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy204.prepare(Unknown Source)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.prepareStatement(MybatisSimpleExecutor.java:92)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doQuery(MybatisSimpleExecutor.java:66)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:155)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:90)\r\n	at sun.reflect.GeneratedMethodAccessor111.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy203.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\r\n	... 137 more\r\nCaused by: java.sql.SQLIntegrityConstraintViolationException: Column \'status\' in where clause is ambiguous\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:115)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1019)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3240)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_executeQuery(WallFilter.java:648)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeQuery(PreparedStatementProxyImpl.java:181)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeQuery(DruidPooledPreparedStatement.java:227)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:56)\r\n	at com.sun.proxy.TProxy159.executeQuery(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:241)\r\n	... 159 more\r\n');
INSERT INTO `sys_operation_log` VALUES (1389500330051735553, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2021-05-04 16:41:09', '成功', '菜单名称=司机提现管理');
INSERT INTO `sys_operation_log` VALUES (1389500425316962305, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2021-05-04 16:41:32', '成功', '菜单名称=提现信息;;;');
INSERT INTO `sys_operation_log` VALUES (1389500482606960642, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2021-05-04 16:41:45', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,开发管理,接口文档,代码生成,参数配置,参数配置添加,参数配置修改,参数配置删除,需求委托管理,需求委托信息,需求委托信息表添加,需求委托信息表修改,需求委托信息表删除,订单管理,订单信息,订单信息表添加,订单信息表修改,订单信息表删除,司机提现管理,提现信息,提现信息添加,提现信息修改,提现信息删除');
INSERT INTO `sys_operation_log` VALUES (1389504425516937218, '异常日志', '', 1, NULL, NULL, '2021-05-04 16:57:25', '失败', 'org.springframework.dao.DataIntegrityViolationException: Error attempting to get column \'createUserName\' from result set.  Cause: java.sql.SQLDataException: Cannot determine value type from string \'超级管理员\'\n; Cannot determine value type from string \'超级管理员\'; nested exception is java.sql.SQLDataException: Cannot determine value type from string \'超级管理员\'\r\n	at org.springframework.jdbc.support.SQLExceptionSubclassTranslator.doTranslate(SQLExceptionSubclassTranslator.java:84)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:72)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:81)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:88)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:348)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplate.selectList(OptionalSqlSessionTemplate.java:155)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:134)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:96)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy125.customPageList(Unknown Source)\r\n	at cn.stylefeng.guns.modular.extract.service.impl.ExtractMoneyInfoServiceImpl.findPageBySpec(ExtractMoneyInfoServiceImpl.java:62)\r\n	at cn.stylefeng.guns.modular.extract.service.impl.ExtractMoneyInfoServiceImplTTFastClassBySpringCGLIBTTfff15517.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.extract.service.impl.ExtractMoneyInfoServiceImplTTEnhancerBySpringCGLIBTT56cffc5b.findPageBySpec(<generated>)\r\n	at cn.stylefeng.guns.modular.extract.controller.ExtractMoneyInfoController.list(ExtractMoneyInfoController.java:124)\r\n	at cn.stylefeng.guns.modular.extract.controller.ExtractMoneyInfoControllerTTFastClassBySpringCGLIBTT1e996ff7.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.extract.controller.ExtractMoneyInfoControllerTTEnhancerBySpringCGLIBTTca59a888.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: java.sql.SQLDataException: Cannot determine value type from string \'超级管理员\'\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:112)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:87)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:61)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:71)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:96)\r\n	at com.mysql.cj.jdbc.result.ResultSetImpl.getLong(ResultSetImpl.java:851)\r\n	at com.mysql.cj.jdbc.result.ResultSetImpl.getLong(ResultSetImpl.java:855)\r\n	at com.alibaba.druid.filter.FilterChainImpl.resultSet_getLong(FilterChainImpl.java:1184)\r\n	at com.alibaba.druid.filter.FilterAdapter.resultSet_getLong(FilterAdapter.java:1655)\r\n	at com.alibaba.druid.filter.FilterChainImpl.resultSet_getLong(FilterChainImpl.java:1180)\r\n	at com.alibaba.druid.filter.FilterAdapter.resultSet_getLong(FilterAdapter.java:1655)\r\n	at com.alibaba.druid.filter.FilterChainImpl.resultSet_getLong(FilterChainImpl.java:1180)\r\n	at com.alibaba.druid.proxy.jdbc.ResultSetProxyImpl.getLong(ResultSetProxyImpl.java:508)\r\n	at com.alibaba.druid.pool.DruidPooledResultSet.getLong(DruidPooledResultSet.java:301)\r\n	at sun.reflect.GeneratedMethodAccessor76.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.ResultSetLogger.invoke(ResultSetLogger.java:69)\r\n	at com.sun.proxy.TProxy162.getLong(Unknown Source)\r\n	at org.apache.ibatis.type.LongTypeHandler.getNullableResult(LongTypeHandler.java:37)\r\n	at org.apache.ibatis.type.LongTypeHandler.getNullableResult(LongTypeHandler.java:26)\r\n	at org.apache.ibatis.type.BaseTypeHandler.getResult(BaseTypeHandler.java:81)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.applyAutomaticMappings(DefaultResultSetHandler.java:521)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.getRowValue(DefaultResultSetHandler.java:402)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleRowValuesForSimpleResultMap(DefaultResultSetHandler.java:354)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleRowValues(DefaultResultSetHandler.java:328)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleResultSet(DefaultResultSetHandler.java:301)\r\n	at org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleResultSets(DefaultResultSetHandler.java:194)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:65)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:79)\r\n	at sun.reflect.GeneratedMethodAccessor105.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy206.query(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor105.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy206.query(Unknown Source)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doQuery(MybatisSimpleExecutor.java:67)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:155)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:90)\r\n	at sun.reflect.GeneratedMethodAccessor111.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy205.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:335)\r\n	... 131 more\r\nCaused by: com.mysql.cj.exceptions.DataConversionException: Cannot determine value type from string \'超级管理员\'\r\n	at com.mysql.cj.result.StringConverter.createFromBytes(StringConverter.java:127)\r\n	at com.mysql.cj.protocol.a.MysqlTextValueDecoder.decodeByteArray(MysqlTextValueDecoder.java:238)\r\n	at com.mysql.cj.protocol.result.AbstractResultsetRow.decodeAndCreateReturnValue(AbstractResultsetRow.java:129)\r\n	at com.mysql.cj.protocol.result.AbstractResultsetRow.getValueFromBytes(AbstractResultsetRow.java:233)\r\n	at com.mysql.cj.protocol.a.result.ByteArrayRow.getValue(ByteArrayRow.java:91)\r\n	at com.mysql.cj.jdbc.result.ResultSetImpl.getNonStringValueFromRow(ResultSetImpl.java:628)\r\n	... 183 more\r\n');
INSERT INTO `sys_operation_log` VALUES (1389638700308406274, '业务日志', '删除管理员', 1, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'delete', '2021-05-05 01:50:59', '成功', '账号=15755468096');
INSERT INTO `sys_operation_log` VALUES (1389782344881430530, '异常日志', '', 1389639643657707521, NULL, NULL, '2021-05-05 11:21:47', '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:92)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:348)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplate.selectList(OptionalSqlSessionTemplate.java:155)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:134)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:96)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy124.listByCondition(Unknown Source)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImpl.listByCondition(EntrustInfoServiceImpl.java:69)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTFastClassBySpringCGLIBTT4f890517.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTEnhancerBySpringCGLIBTT6dde507d.listByCondition(<generated>)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoController.listByCondition(EntrustInfoController.java:146)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTFastClassBySpringCGLIBTT619cdbdd.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTEnhancerBySpringCGLIBTT6c65202f.listByCondition(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:149)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\r\n	at sun.reflect.GeneratedMethodAccessor126.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:335)\r\n	... 131 more\r\nCaused by: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at com.baomidou.mybatisplus.core.toolkit.ExceptionUtils.mpe(ExceptionUtils.java:39)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:252)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.intercept(PaginationInterceptor.java:201)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor99.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\r\n	at cn.stylefeng.roses.core.datascope.DataScopeInterceptor.intercept(DataScopeInterceptor.java:52)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.prepareStatement(MybatisSimpleExecutor.java:92)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doQuery(MybatisSimpleExecutor.java:66)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:155)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:90)\r\n	at sun.reflect.GeneratedMethodAccessor106.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy207.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\r\n	... 136 more\r\nCaused by: java.sql.SQLSyntaxErrorException: Duplicate column name \'distance\'\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1019)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3240)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_executeQuery(WallFilter.java:648)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeQuery(PreparedStatementProxyImpl.java:181)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeQuery(DruidPooledPreparedStatement.java:227)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:56)\r\n	at com.sun.proxy.TProxy162.executeQuery(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:241)\r\n	... 158 more\r\n');
INSERT INTO `sys_operation_log` VALUES (1389782359922204673, '异常日志', '', 1389639643657707521, NULL, NULL, '2021-05-05 11:21:50', '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:92)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:348)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplate.selectList(OptionalSqlSessionTemplate.java:155)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:134)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:96)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy124.listByCondition(Unknown Source)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImpl.listByCondition(EntrustInfoServiceImpl.java:69)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTFastClassBySpringCGLIBTT4f890517.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTEnhancerBySpringCGLIBTT6dde507d.listByCondition(<generated>)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoController.listByCondition(EntrustInfoController.java:146)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTFastClassBySpringCGLIBTT619cdbdd.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTEnhancerBySpringCGLIBTT6c65202f.listByCondition(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:149)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\r\n	at sun.reflect.GeneratedMethodAccessor126.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:335)\r\n	... 131 more\r\nCaused by: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at com.baomidou.mybatisplus.core.toolkit.ExceptionUtils.mpe(ExceptionUtils.java:39)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:252)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.intercept(PaginationInterceptor.java:201)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor99.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\r\n	at cn.stylefeng.roses.core.datascope.DataScopeInterceptor.intercept(DataScopeInterceptor.java:52)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.prepareStatement(MybatisSimpleExecutor.java:92)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doQuery(MybatisSimpleExecutor.java:66)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:155)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:90)\r\n	at sun.reflect.GeneratedMethodAccessor106.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy207.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\r\n	... 136 more\r\nCaused by: java.sql.SQLSyntaxErrorException: Duplicate column name \'distance\'\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1019)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3240)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_executeQuery(WallFilter.java:648)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeQuery(PreparedStatementProxyImpl.java:181)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeQuery(DruidPooledPreparedStatement.java:227)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:56)\r\n	at com.sun.proxy.TProxy162.executeQuery(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:241)\r\n	... 158 more\r\n');
INSERT INTO `sys_operation_log` VALUES (1389782371355877378, '异常日志', '', 1389639643657707521, NULL, NULL, '2021-05-05 11:21:53', '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:92)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:348)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplate.selectList(OptionalSqlSessionTemplate.java:155)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:134)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:96)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy124.listByCondition(Unknown Source)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImpl.listByCondition(EntrustInfoServiceImpl.java:69)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTFastClassBySpringCGLIBTT4f890517.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTEnhancerBySpringCGLIBTT6dde507d.listByCondition(<generated>)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoController.listByCondition(EntrustInfoController.java:146)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTFastClassBySpringCGLIBTT619cdbdd.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTEnhancerBySpringCGLIBTT6c65202f.listByCondition(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:149)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\r\n	at sun.reflect.GeneratedMethodAccessor126.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:335)\r\n	... 131 more\r\nCaused by: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at com.baomidou.mybatisplus.core.toolkit.ExceptionUtils.mpe(ExceptionUtils.java:39)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:252)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.intercept(PaginationInterceptor.java:201)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor99.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\r\n	at cn.stylefeng.roses.core.datascope.DataScopeInterceptor.intercept(DataScopeInterceptor.java:52)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.prepareStatement(MybatisSimpleExecutor.java:92)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doQuery(MybatisSimpleExecutor.java:66)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:155)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:90)\r\n	at sun.reflect.GeneratedMethodAccessor106.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy207.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\r\n	... 136 more\r\nCaused by: java.sql.SQLSyntaxErrorException: Duplicate column name \'distance\'\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1019)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3240)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_executeQuery(WallFilter.java:648)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeQuery(PreparedStatementProxyImpl.java:181)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeQuery(DruidPooledPreparedStatement.java:227)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:56)\r\n	at com.sun.proxy.TProxy162.executeQuery(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:241)\r\n	... 158 more\r\n');
INSERT INTO `sys_operation_log` VALUES (1389782402767020034, '异常日志', '', 1389639643657707521, NULL, NULL, '2021-05-05 11:22:00', '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:92)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:348)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplate.selectList(OptionalSqlSessionTemplate.java:155)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:134)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:96)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy124.listByCondition(Unknown Source)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImpl.listByCondition(EntrustInfoServiceImpl.java:69)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTFastClassBySpringCGLIBTT4f890517.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.service.impl.EntrustInfoServiceImplTTEnhancerBySpringCGLIBTT6dde507d.listByCondition(<generated>)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoController.listByCondition(EntrustInfoController.java:146)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTFastClassBySpringCGLIBTT619cdbdd.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.entrust.controller.EntrustInfoControllerTTEnhancerBySpringCGLIBTT6c65202f.listByCondition(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n### The error may exist in file [D:\\毕设\\distribution_system\\guns-vip-main\\target\\classes\\cn\\stylefeng\\guns\\modular\\entrust\\mapper\\mapping\\EntrustInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:149)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\r\n	at sun.reflect.GeneratedMethodAccessor126.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at cn.stylefeng.roses.core.mutidatasource.mybatis.OptionalSqlSessionTemplateTSqlSessionInterceptor.invoke(OptionalSqlSessionTemplate.java:335)\r\n	... 131 more\r\nCaused by: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql : \n SELECT COUNT(1) FROM (SELECT *, (SQRT((((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180) * ((? - `start_lon`) * PI() * 12656 * COS(((? + `start_lat`) / 2) * PI() / 180) / 180)) + (((? - `start_lat`) * PI() * 12656 / 180) * ((? - `start_lat`) * PI() * 12656 / 180)))) AS distance FROM `entrust_info` a) b LEFT JOIN sys_user c ON b.create_user = c.user_id WHERE `start_lat` BETWEEN (? - (? / 100)) AND (? + (? / 100)) AND `start_lon` BETWEEN (? - (? / 100)) AND (? + (? / 100)) \n\r\n	at com.baomidou.mybatisplus.core.toolkit.ExceptionUtils.mpe(ExceptionUtils.java:39)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:252)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.intercept(PaginationInterceptor.java:201)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor99.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\r\n	at cn.stylefeng.roses.core.datascope.DataScopeInterceptor.intercept(DataScopeInterceptor.java:52)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy208.prepare(Unknown Source)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.prepareStatement(MybatisSimpleExecutor.java:92)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doQuery(MybatisSimpleExecutor.java:66)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:155)\r\n	at com.baomidou.mybatisplus.core.executor.MybatisCachingExecutor.query(MybatisCachingExecutor.java:90)\r\n	at sun.reflect.GeneratedMethodAccessor106.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy207.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\r\n	... 136 more\r\nCaused by: java.sql.SQLSyntaxErrorException: Duplicate column name \'distance\'\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1019)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3240)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_executeQuery(WallFilter.java:648)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeQuery(PreparedStatementProxyImpl.java:181)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeQuery(DruidPooledPreparedStatement.java:227)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:56)\r\n	at com.sun.proxy.TProxy162.executeQuery(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:241)\r\n	... 158 more\r\n');
INSERT INTO `sys_operation_log` VALUES (1389956619269652481, '异常日志', '', 1, NULL, NULL, '2021-05-05 22:54:17', '失败', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported\r\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:200)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:419)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:365)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:65)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:401)\r\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1232)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1015)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES (1389956779315904513, '异常日志', '', 1, NULL, NULL, '2021-05-05 22:54:55', '失败', 'java.lang.NullPointerException\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:104)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\r\n	at com.sun.proxy.TProxy129.listByCondition(Unknown Source)\r\n	at cn.stylefeng.guns.modular.order.service.impl.OrderInfoServiceImpl.listByCondition(OrderInfoServiceImpl.java:79)\r\n	at cn.stylefeng.guns.modular.order.service.impl.OrderInfoServiceImplTTFastClassBySpringCGLIBTTab86e177.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.order.service.impl.OrderInfoServiceImplTTEnhancerBySpringCGLIBTTc3bd2a46.listByCondition(<generated>)\r\n	at cn.stylefeng.guns.modular.order.controller.OrderInfoController.listByCondition(OrderInfoController.java:143)\r\n	at cn.stylefeng.guns.modular.order.controller.OrderInfoControllerTTFastClassBySpringCGLIBTT8079547d.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at cn.stylefeng.guns.tenant.aop.TenantSourceExAop.around(TenantSourceExAop.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.stylefeng.guns.modular.order.controller.OrderInfoControllerTTEnhancerBySpringCGLIBTTa1e19170.listByCondition(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES (1389957271605477378, '异常日志', '', 1, NULL, NULL, '2021-05-05 22:56:52', '失败', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported\r\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:200)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:419)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:365)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:65)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:401)\r\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1232)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1015)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES (1389977648926863362, '业务日志', '修改管理员', 1389639643657707521, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-06 00:17:51', '成功', '账号=null;;;');
INSERT INTO `sys_operation_log` VALUES (1389980711741861889, '业务日志', '修改管理员', 1389639643657707521, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-06 00:30:01', '成功', '账号=null;;;');
INSERT INTO `sys_operation_log` VALUES (1389989724533571585, '业务日志', '修改管理员', 1389939193572290562, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-06 01:05:50', '成功', '账号=null;;;');
INSERT INTO `sys_operation_log` VALUES (1389991109694066690, '业务日志', '修改管理员', 1389939193572290562, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-06 01:11:20', '成功', '账号=null;;;');
INSERT INTO `sys_operation_log` VALUES (1389998757743169538, '异常日志', '', 1, NULL, NULL, '2021-05-06 01:41:43', '失败', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported\r\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:200)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:419)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:365)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:65)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:401)\r\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1232)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1015)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES (1390000147983048706, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2021-05-06 01:47:15', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,需求委托管理,需求委托信息,需求委托信息表添加,需求委托信息表修改,需求委托信息表删除,订单管理,订单信息,订单信息表添加,订单信息表修改,订单信息表删除,司机提现管理,提现信息,提现信息添加,提现信息修改,提现信息删除');
INSERT INTO `sys_operation_log` VALUES (1390002060032024578, '业务日志', '修改管理员', 1390000487788781569, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-06 01:54:51', '成功', '账号=null;;;');
INSERT INTO `sys_operation_log` VALUES (1390002752419340290, '业务日志', '修改管理员', 1390002319344869377, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-06 01:57:36', '成功', '账号=null;;;');
INSERT INTO `sys_operation_log` VALUES (1390002877443153922, '业务日志', '修改管理员', 1390002319344869377, 'cn.stylefeng.guns.sys.modular.system.controller.UserMgrController', 'edit', '2021-05-06 01:58:06', '成功', '账号=null;;;');

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `position_id` bigint(20) NOT NULL COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位编码',
  `sort` int(11) NOT NULL COMMENT '顺序',
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态(字典)',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`position_id`) USING BTREE,
  UNIQUE INDEX `CODE_UNI`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES (1, '董事长', 'President', 1, 'ENABLE', NULL, '2019-06-27 18:14:43', 1, NULL, NULL);
INSERT INTO `sys_position` VALUES (2, '总经理', 'GM', 2, 'ENABLE', NULL, '2019-06-27 18:14:43', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation`  (
  `relation_id` bigint(20) NOT NULL COMMENT '主键',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES (1390000142593368066, 105, 1);
INSERT INTO `sys_relation` VALUES (1390000142719197185, 106, 1);
INSERT INTO `sys_relation` VALUES (1390000142782111746, 107, 1);
INSERT INTO `sys_relation` VALUES (1390000142912135170, 108, 1);
INSERT INTO `sys_relation` VALUES (1390000142975049729, 109, 1);
INSERT INTO `sys_relation` VALUES (1390000143037964289, 110, 1);
INSERT INTO `sys_relation` VALUES (1390000143100878850, 111, 1);
INSERT INTO `sys_relation` VALUES (1390000143167987713, 112, 1);
INSERT INTO `sys_relation` VALUES (1390000143235096578, 113, 1);
INSERT INTO `sys_relation` VALUES (1390000143302205441, 165, 1);
INSERT INTO `sys_relation` VALUES (1390000143428034561, 166, 1);
INSERT INTO `sys_relation` VALUES (1390000143495143425, 167, 1);
INSERT INTO `sys_relation` VALUES (1390000143620972545, 114, 1);
INSERT INTO `sys_relation` VALUES (1390000143688081409, 115, 1);
INSERT INTO `sys_relation` VALUES (1390000143813910529, 116, 1);
INSERT INTO `sys_relation` VALUES (1390000143876825090, 117, 1);
INSERT INTO `sys_relation` VALUES (1390000144002654210, 118, 1);
INSERT INTO `sys_relation` VALUES (1390000144065568770, 162, 1);
INSERT INTO `sys_relation` VALUES (1390000144128483329, 163, 1);
INSERT INTO `sys_relation` VALUES (1390000144262701058, 164, 1);
INSERT INTO `sys_relation` VALUES (1390000144329809921, 1389472688594317314, 1);
INSERT INTO `sys_relation` VALUES (1390000144392724482, 1389471459411517442, 1);
INSERT INTO `sys_relation` VALUES (1390000144455639042, 1389471459411517443, 1);
INSERT INTO `sys_relation` VALUES (1390000144589856769, 1389471459411517444, 1);
INSERT INTO `sys_relation` VALUES (1390000144652771330, 1389471459411517445, 1);
INSERT INTO `sys_relation` VALUES (1390000144719880193, 1389484304148762625, 1);
INSERT INTO `sys_relation` VALUES (1390000144849903618, 1389482424702087169, 1);
INSERT INTO `sys_relation` VALUES (1390000144917012481, 1389482424702087170, 1);
INSERT INTO `sys_relation` VALUES (1390000144984121346, 1389482424702087171, 1);
INSERT INTO `sys_relation` VALUES (1390000145051230209, 1389482424702087172, 1);
INSERT INTO `sys_relation` VALUES (1390000145118339073, 1389500329661665282, 1);
INSERT INTO `sys_relation` VALUES (1390000145185447938, 1389499064487530497, 1);
INSERT INTO `sys_relation` VALUES (1390000145311277057, 1389499064487530498, 1);
INSERT INTO `sys_relation` VALUES (1390000145374191617, 1389499064550445058, 1);
INSERT INTO `sys_relation` VALUES (1390000145441300482, 1389499064550445059, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `sort` int(11) NULL DEFAULT NULL COMMENT '序号',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 0, '超级管理员', 'administrator', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (1389466235040980994, 0, '普通用户', '普通用户', NULL, NULL, '2021-05-04 14:25:40', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_translation
-- ----------------------------
DROP TABLE IF EXISTS `sys_translation`;
CREATE TABLE `sys_translation`  (
  `tran_id` bigint(20) NOT NULL COMMENT '主键id',
  `tran_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `tran_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '多语言条例名称',
  `languages` int(11) NOT NULL COMMENT '1:中文  2:英语',
  `tran_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '翻译的值',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`tran_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '多语言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_translation
-- ----------------------------
INSERT INTO `sys_translation` VALUES (1184999114561286145, 'BTN_SEARCH', '搜索按钮', 1, '搜索', '2019-10-18 09:06:20', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1184999114561286146, 'BTN_SEARCH', '搜索按钮', 2, 'search', NULL, NULL, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1184999114561286147, 'BTN_ADD', '添加按钮', 1, '添加', NULL, NULL, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1184999114561286148, 'BTN_ADD', '添加按钮', 2, 'add', NULL, NULL, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1184999114561286150, 'BTN_EXPORT', '导出按钮', 1, '导出', NULL, NULL, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1184999114561286151, 'BTN_EXPORT', '导出按钮', 2, 'export', NULL, NULL, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185127290116263937, 'BTN_DELETE', '删除按钮', 1, '删除', '2019-10-18 17:35:39', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185127461399056385, 'BTN_DELETE', '删除按钮', 2, 'delete', '2019-10-18 17:36:20', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185127896490987522, 'BTN_EDIT', '修改按钮', 1, '修改', '2019-10-18 17:38:04', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185127978657402881, 'BTN_EDIT', '修改按钮', 2, 'edit', '2019-10-18 17:38:23', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185128265912700929, 'BTN_ASSIGN_ROLES', '分配角色按钮', 1, '分配角色', '2019-10-18 17:39:32', 1, '2019-10-18 17:50:38', 1);
INSERT INTO `sys_translation` VALUES (1185128442824249345, 'BTN_ASSIGN_ROLES', '分配角色按钮', 2, 'assign roles', '2019-10-18 17:40:14', 1, '2019-10-18 20:47:46', 1);
INSERT INTO `sys_translation` VALUES (1185128740447866881, 'BTN_RESET_PASSWORD', '重置密码', 1, '重置密码', '2019-10-18 17:41:25', 1, '2019-10-18 17:49:25', 1);
INSERT INTO `sys_translation` VALUES (1185128883926618114, 'BTN_RESET_PASSWORD', '重置密码', 2, 'reset password', '2019-10-18 17:41:59', 1, '2019-10-18 17:49:55', 1);
INSERT INTO `sys_translation` VALUES (1185129198088376321, 'BTN_SUBMIT', '提交按钮', 1, '提交', '2019-10-18 17:43:14', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185129308289519618, 'BTN_SUBMIT', '提交按钮', 2, 'submit', '2019-10-18 17:43:40', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185129491752570882, 'BTN_CANCEL', '取消按钮', 1, '取消', '2019-10-18 17:44:24', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185129607062376450, 'BTN_CANCEL', '取消按钮', 2, 'cancel', '2019-10-18 17:44:52', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185129934188728322, 'BTN_CONFIRM', '确定按钮', 1, '确定', '2019-10-18 17:46:10', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185130144491130881, 'BTN_CONFIRM', '确定按钮', 2, 'confirm', '2019-10-18 17:47:00', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185130586352668673, 'BTN_SAVE', '保存按钮', 1, '保存', '2019-10-18 17:48:45', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185130686109995009, 'BTN_SAVE', '保存按钮', 2, 'save', '2019-10-18 17:49:09', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185131904605638657, 'BTN_PERMISSION_CONFIG', '权限配置按钮', 1, '权限配置', '2019-10-18 17:53:59', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185132038101946370, 'BTN_PERMISSION_CONFIG', '权限配置按钮', 2, 'permission config', '2019-10-18 17:54:31', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185132531570200577, 'BTN_EXPAND_ALL', '展开所有按钮', 1, '展开所有', '2019-10-18 17:56:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185132702320316418, 'BTN_EXPAND_ALL', '展开所有按钮', 2, 'expand all', '2019-10-18 17:57:10', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185133005677547522, 'BTN_COLLAPSE_ALL', '折叠所有按钮', 1, '折叠所有', '2019-10-18 17:58:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185133152151031810, 'BTN_COLLAPSE_ALL', '折叠所有按钮', 2, 'collapse all', '2019-10-18 17:58:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185133716238782466, 'BTN_CLEAR_LOG', '清空日志按钮', 1, '清空日志', '2019-10-18 18:01:11', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185133818449776642, 'BTN_CLEAR_LOG', '清空日志按钮', 2, 'clear log', '2019-10-18 18:01:36', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185134961246621697, 'BTN_BACK', '返回按钮', 1, '返回', '2019-10-18 18:06:08', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185135058730635265, 'BTN_BACK', '返回按钮', 2, 'back', '2019-10-18 18:06:31', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185135339954524162, 'BTN_GENERATE_CODE', '生成代码按钮', 1, '生成代码', '2019-10-18 18:07:38', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185135449107091458, 'BTN_GENERATE_CODE', '生成代码按钮', 2, 'generate code ', '2019-10-18 18:08:04', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185135668041371650, 'BTN_RESET', '重置按钮', 1, '重置', '2019-10-18 18:08:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185135783120490497, 'BTN_RESET', '重置按钮', 2, 'reset', '2019-10-18 18:09:24', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185136595410374658, 'BTN_IMPORT_PROCESS', '导入流程按钮', 1, '导入流程', '2019-10-18 18:12:38', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185136784481210369, 'BTN_IMPORT_PROCESS', '导入流程按钮', 2, 'import process', '2019-10-18 18:13:23', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185137183988666370, 'BTN_BATCH_DELETE', '批量删除按钮', 1, '批量删除', '2019-10-18 18:14:58', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185137301957660673, 'BTN_BATCH_DELETE', '批量删除按钮', 2, 'batch delete', '2019-10-18 18:15:26', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185138720563548161, 'BTN_LEAVE_APPLICATION', '新建请假单按钮', 1, '新建请假单', '2019-10-18 18:21:04', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185138909642772482, 'BTN_LEAVE_APPLICATION', '新建请假单按钮', 2, 'leave application', '2019-10-18 18:21:50', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185189608899715074, 'LAYER_TITLE', '提示框标题', 1, '信息', '2019-10-18 21:43:17', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185189726621245441, 'LAYER_TITLE', '提示框标题', 2, 'infomation', '2019-10-18 21:43:45', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185192392994803714, 'BTN_ADD_TYPE', '添加类型', 1, '添加类型', '2019-10-18 21:54:21', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185192465178775553, 'BTN_ADD_TYPE', '添加类型', 2, 'add dict type', '2019-10-18 21:54:38', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185196578591412226, 'BTN_DETAIL', '查看详情按钮', 1, '查看详情', '2019-10-18 22:10:59', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185196624628092930, 'BTN_DETAIL', '查看详情按钮', 2, 'detail', '2019-10-18 22:11:10', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185198263422390273, 'BTN_CONDITION', '查询条件', 1, '查询条件', '2019-10-18 22:17:41', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185198328505405442, 'BTN_CONDITION', '查询条件', 2, 'condition', '2019-10-18 22:17:56', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185202736316248065, 'BTN_PROCESS_DESIGNER', '流程设计器按钮', 1, '流程设计器', '2019-10-18 22:35:27', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185202834534264834, 'BTN_PROCESS_DESIGNER', '流程设计器按钮', 2, 'process designer', '2019-10-18 22:35:50', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185202924925710337, 'BTN_DEPLOY', '部署按钮', 1, '部署', '2019-10-18 22:36:12', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185202963215511553, 'BTN_DEPLOY', '部署按钮', 2, 'deploy', '2019-10-18 22:36:21', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203057667043330, 'BTN_PREVIEW', '预览按钮', 1, '预览', '2019-10-18 22:36:44', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203128915685378, 'BTN_PREVIEW', '预览按钮', 2, 'preview', '2019-10-18 22:37:01', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203319320309762, 'BTN_MAP_MODEL', '映射模型按钮', 1, '映射模型', '2019-10-18 22:37:46', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203369178001410, 'BTN_MAP_MODEL', '映射模型按钮', 2, 'map model', '2019-10-18 22:37:58', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203453026332673, 'BTN_DOWNLOAD', '打包下载', 1, '打包下载', '2019-10-18 22:38:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203497880219649, 'BTN_DOWNLOAD', '打包下载', 2, 'download', '2019-10-18 22:38:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203615111016450, 'BTN_HANG_UP', '挂起按钮', 1, '挂起', '2019-10-18 22:38:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203690688180226, 'BTN_HANG_UP', '挂起按钮', 2, 'hang-up', '2019-10-18 22:39:15', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203748275974146, 'BTN_ACTIVE', '激活按钮', 1, '激活', '2019-10-18 22:39:28', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185203805092016130, 'BTN_ACTIVE', '激活按钮', 2, 'active', '2019-10-18 22:39:42', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204123397746689, 'BTN_PROCESS_INFO', '流程信息按钮', 1, '流程信息', '2019-10-18 22:40:58', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204183095275522, 'BTN_PROCESS_INFO', '流程信息按钮', 2, 'process info', '2019-10-18 22:41:12', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204321981263874, 'BTN_APPOINT', '委派按钮', 1, '委派', '2019-10-18 22:41:45', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204360698884097, 'BTN_APPOINT', '委派按钮', 2, 'appoint', '2019-10-18 22:41:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204489879252993, 'BTN_DISABLE', '作废按钮', 1, '作废', '2019-10-18 22:42:25', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204530614333441, 'BTN_DISABLE', '作废按钮', 2, 'disable', '2019-10-18 22:42:35', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204645152387073, 'BTN_APPOINT_ROLE', '指定角色按钮', 1, '指定角色', '2019-10-18 22:43:02', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185204717277638657, 'BTN_APPOINT_ROLE', '指定角色按钮', 2, 'appoint role', '2019-10-18 22:43:19', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205156547096577, 'BTN_CHOOSE', '选择按钮', 1, '选择', '2019-10-18 22:45:04', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205205565927426, 'BTN_CHOOSE', '选择按钮', 2, 'choose', '2019-10-18 22:45:16', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205330925285377, 'BTN_DEAL', '办理按钮', 1, '办理', '2019-10-18 22:45:46', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205405613256705, 'BTN_DEAL', '办理按钮', 2, 'deal', '2019-10-18 22:46:03', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205639139520513, 'BTN_APPOINT_PERSON', '指定人员按钮', 1, '指定人员', '2019-10-18 22:46:59', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205725617680386, 'BTN_APPOINT_PERSON', '指定人员', 2, 'appoint person', '2019-10-18 22:47:20', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205860275810306, 'BTN_APPROVE', '批准按钮', 1, '批准', '2019-10-18 22:47:52', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185205911563759617, 'BTN_APPROVE', '批准按钮', 2, 'approve', '2019-10-18 22:48:04', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185206072910245890, 'BTN_REJECT', '驳回按钮', 1, '驳回', '2019-10-18 22:48:43', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185206116057051138, 'BTN_REJECT', '驳回按钮', 2, 'reject', '2019-10-18 22:48:53', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185415573330403330, 'FIELD_ACCOUNT', '账号字段', 1, '账号', '2019-10-19 12:41:11', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185415640732868609, 'FIELD_ACCOUNT', '账号字段', 2, 'account', '2019-10-19 12:41:27', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185415905989042177, 'FIELD_DEPT', '部门字段', 1, '部门', '2019-10-19 12:42:31', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185415962184327170, 'FIELD_DEPT', '部门字段', 2, 'dept', '2019-10-19 12:42:44', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416053171363842, 'FIELD_POST', '职位字段', 1, '职位', '2019-10-19 12:43:06', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416141247553537, 'FIELD_POST', '职位字段', 2, 'post', '2019-10-19 12:43:27', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416219261607937, 'FIELD_PHONE', '电话字段', 1, '电话', '2019-10-19 12:43:45', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416277042339841, 'FIELD_PHONE', '电话字段', 2, 'phone', '2019-10-19 12:43:59', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416377336537090, 'FIELD_CREATE_TIME', '创建时间字段', 1, '创建时间', '2019-10-19 12:44:23', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416420625948673, 'FIELD_CREATE_TIME', '创建时间字段', 2, 'create time', '2019-10-19 12:44:33', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416504335867906, 'FIELD_UPDATE_TIME', '更新时间字段', 1, '更新时间', '2019-10-19 12:44:53', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416545180000257, 'FIELD_UPDATE_TIME', '更新时间字段', 2, 'update time', '2019-10-19 12:45:03', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416642995363841, 'FIELD_STATUS', '状态字段', 1, '状态', '2019-10-19 12:45:26', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185416711777755138, 'FIELD_STATUS', '状态字段', 2, 'status', '2019-10-19 12:45:43', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185423973135941633, 'FIELD_BIRTHDAY', '出生日期字段', 1, '出生日期', '2019-10-19 13:14:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424101922045953, 'FIELD_BIRTHDAY', '出生日期字段', 2, 'birthday', '2019-10-19 13:15:05', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794819, 'TITLE_ADD_USER', '添加用户标题', 1, '添加用户', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794820, 'TITLE_ADD_USER', '添加用户标题', 2, 'add user', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794821, 'TITLE_EDIT_USER', '编辑用户标题', 1, '编辑用户', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794822, 'TITLE_EDIT_USER', '编辑用户标题', 2, 'edit user', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794823, 'TITLE_ROLE_ASSIGN', '角色分配标题', 1, '角色分配', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794824, 'TITLE_ROLE_ASSIGN', '角色分配标题', 2, 'role assign', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794825, 'TITLE_ADD_ROLE', '添加角色标题', 1, '添加角色', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794826, 'TITLE_ADD_ROLE', '添加角色标题', 2, 'add role', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794827, 'TITLE_EDIT_ROLE', '修改角色标题', 1, '修改角色', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794828, 'TITLE_EDIT_ROLE', '修改角色标题', 2, 'edit role', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794829, 'TITLE_ROLE_CONFIG', '权限配置标题', 1, '权限配置', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794830, 'TITLE_ROLE_CONFIG', '权限配置标题', 2, 'role config', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794831, 'TITLE_ADD_DEPT', '添加部门标题', 1, '添加部门', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794832, 'TITLE_ADD_DEPT', '添加部门标题', 2, 'add dept', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794833, 'TITLE_EDIT_DEPT', '修改部门标题', 1, '修改部门', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794834, 'TITLE_EDIT_DEPT', '修改部门标题', 2, 'edit dept', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794835, 'TITLE_ADD_POST', '添加职位标题', 1, '添加职位', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794836, 'TITLE_ADD_POST', '添加职位标题', 2, 'add post', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794837, 'TITLE_EDIT_POST', '修改职位标题', 1, '修改职位', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794838, 'TITLE_EDIT_POST', '修改职位标题', 2, 'edit post', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794839, 'TITLE_ADD_DICT_TYPE', '添加字典类型标题', 1, '添加字典类型', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794840, 'TITLE_ADD_DICT_TYPE', '添加字典类型标题', 2, 'add dict type', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794841, 'TITLE_EDIT_DICT_TYPE', '修改字典类型标题', 1, '修改字典类型', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794842, 'TITLE_EDIT_DICT_TYPE', '修改字典类型标题', 2, 'edit dict type', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794843, 'TITLE_ADD_DICT', '添加字典标题', 1, '添加字典', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794844, 'TITLE_ADD_DICT', '添加字典标题', 2, 'add dict', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794845, 'TITLE_EDIT_DICT', '修改字典标题', 1, '修改字典', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794846, 'TITLE_EDIT_DICT', '修改字典标题', 2, 'edit dict', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794847, 'TITLE_ADD_MENU', '添加菜单标题', 1, '添加菜单', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794848, 'TITLE_ADD_MENU', '添加菜单标题', 2, 'add menu', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794849, 'TITLE_EDIT_MENU', '修改菜单标题', 1, '修改菜单', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794850, 'TITLE_EDIT_MENU', '修改菜单标题', 2, 'edit menu', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794851, 'TITLE_LOG_DETAIL', '日志详情标题', 1, '日志详情', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794852, 'TITLE_LOG_DETAIL', '日志详情标题', 2, 'log detail', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794853, 'TITLE_SELECT_FIELD', '选择字段标题', 1, '选择字段', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794854, 'TITLE_SELECT_FIELD', '选择字段标题', 2, 'select field', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794855, 'TITLE_ADD_LANGUAGE', '添加多语言标题', 1, '添加多语言', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794856, 'TITLE_ADD_LANGUAGE', '添加多语言标题', 2, 'add language', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794857, 'TITLE_EDIT_LANGUAGE', '修改多语言标题', 1, '修改多语言', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794858, 'TITLE_EDIT_LANGUAGE', '修改多语言标题', 2, 'edit language', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794859, 'TITLE_ADD', '添加标题', 1, '添加', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794860, 'TITLE_ADD', '添加标题', 2, 'add', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794861, 'TITLE_PROCESS_DESIGNER', '流程设计器标题', 1, '流程设计器', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794862, 'TITLE_PROCESS_DESIGNER', '流程设计器标题', 2, 'process designer', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794863, 'TITLE_IMPORT_PROCESS', '导入流程标题', 1, '导入流程', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794864, 'TITLE_IMPORT_PROCESS', '导入流程标题', 2, 'import process', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794865, 'TITLE_EDIT', '修改标题', 1, '修改标题', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794866, 'TITLE_EDIT', '修改标题', 2, 'edit', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794867, 'TITLE_PREVIEW_PROCESS', '预览流程xml标题', 1, '预览流程xml', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794868, 'TITLE_PREVIEW_PROCESS', '预览流程xml标题', 2, 'preview process xml', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794869, 'TITLE_APPOINT', '指定委派对象标题', 1, '指定委派对象', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794870, 'TITLE_APPOINT', '指定委派对象标题', 2, 'appoint', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794871, 'TITLE_HANDLE', '办理标题', 1, '办理', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794872, 'TITLE_HANDLE', '办理标题', 2, 'handle', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794873, 'TITLE_PROCESS_INFO', '流程信息标题', 1, '流程信息', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794874, 'TITLE_PROCESS_INFO', '流程信息标题', 2, 'process info', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794876, 'MENU_DASHBOARD', '菜单_主控面板', 2, 'dashboard', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794878, 'MENU_CONSOLE', '菜单_项目介绍', 2, 'project info', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794880, 'MENU_CONSOLE2', '菜单_统计报表', 2, 'stat', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794882, 'MENU_SYS_MESSAGE', '菜单_消息通知', 2, 'message info', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794884, 'MENU_SYSTEM_INFO', '菜单_系统监控', 2, 'monitor', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794886, 'MENU_SYSTEM', '菜单_系统管理', 2, 'system', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794888, 'MENU_MGR', '菜单_用户管理', 2, 'users', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794890, 'MENU_ROLE', '菜单_角色管理', 2, 'roles', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794892, 'MENU_DEPT', '菜单_部门管理', 2, 'depts', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794894, 'MENU_SYS_POSITION', '菜单_职位管理', 2, 'posts', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794896, 'MENU_DICT', '菜单_字典管理', 2, 'dict type', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794898, 'MENU_MENU', '菜单_菜单管理', 2, 'menus', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794900, 'MENU_LOGINLOG', '菜单_登录日志', 2, 'login log', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794902, 'MENU_LOG', '菜单_业务日志', 2, 'business log', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794904, 'MENU_DRUID', '菜单_监控管理', 2, 'druid monitor', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794906, 'MENU_NOTICE', '菜单_通知管理', 2, 'messages', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794908, 'MENU_TENANT_INFO', '菜单_租户管理', 2, 'tenants', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794910, 'MENU_DEV_TOOLS', '菜单_开发管理', 2, 'developer', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794912, 'MENU_META_DATA', '菜单_系统配置', 2, 'system config', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794914, 'MENU_SYS_CONFIG', '菜单_参数配置', 2, 'parameters', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794916, 'MENU_DATA_SOURCE', '菜单_数据源管理', 2, 'datasources', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794918, 'MENU_CODE_GENERATE', '菜单_代码生成', 2, 'generator', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794920, 'MENU_API_MGR', '菜单_接口文档', 2, 'api docs', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794922, 'MENU_DEMOS_SHOW', '菜单_模板页面', 2, 'examples', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794924, 'MENU_EXCEL_IMPORT', '菜单_excel导入', 2, 'excel import', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794926, 'MENU_EXCEL_EXPORT', '菜单_excel导出', 2, 'excel export', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794928, 'MENU_ADVANCED_FORM', '菜单_高级表单', 2, 'advanced form', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794930, 'MENU_PDF_VIEW', '菜单_文档预览', 2, 'preview office', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794932, 'MENU_TRANSLATION', '菜单_多语言配置', 2, 'languages', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794934, 'MENU_ONLINE_OFFICE', '菜单_在线办公', 2, 'online office', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794936, 'MENU_OFFICE_MODEL', '菜单_工作流程', 2, 'workflow', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794938, 'MENU_MODEL_MANAGER', '菜单_模型管理', 2, 'models', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794940, 'MENU_PROCDEF', '菜单_流程管理', 2, 'workflow manager', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794942, 'MENU_PROCESS_ON', '菜单_运行中流程', 2, 'running', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794944, 'MENU_HIPROCDEF', '菜单_历史流程', 2, 'history', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794946, 'MENU_TASK_MANAGER', '菜单_任务管理', 2, 'task manager', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794948, 'MENU_RUTASK', '菜单_待办任务', 2, 'task to do', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794950, 'MENU_HAVETASK', '菜单_已办任务', 2, 'done task', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794952, 'MENU_APPROVE', '菜单_申请审批', 2, 'apply for', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794954, 'MENU_LEAVE', '菜单_请假审批', 2, 'apply for leave', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794955, 'TITLE_BASE_INFO', '标题_基本信息', 1, '基本信息', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794956, 'TITLE_BASE_INFO', '标题_基本信息', 2, 'base info', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794957, 'TITLE_DUTY_INFO', '标题_职务信息', 1, '职务信息', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424218197794958, 'TITLE_DUTY_INFO', '标题_职务信息', 2, 'duty info', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424226450931714, 'FIELD_PASSWORD', '密码字段', 1, '密码', '2019-10-19 13:15:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424290489565185, 'FIELD_PASSWORD', '密码字段', 2, 'password', '2019-10-19 13:15:50', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424619130060801, 'FIELD_REPEAT_PASSWORD', '重复密码字段', 2, 'repeat password', '2019-10-19 13:17:08', 1, '2019-10-19 13:48:44', 1);
INSERT INTO `sys_translation` VALUES (1185424729297649665, 'FIELD_REPEAT_PASSWORD', '重复密码字段', 1, '重复密码', '2019-10-19 13:17:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424867197976577, 'FIELD_EMAIL', '邮箱字段', 1, '邮箱', '2019-10-19 13:18:07', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185424928715833346, 'FIELD_EMAIL', '邮箱字段', 2, 'email', '2019-10-19 13:18:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185425063239745538, 'FIELD_SEX', '性别字段', 1, '性别', '2019-10-19 13:18:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185425140188446722, 'FIELD_SEX', '性别字段', 2, 'sex', '2019-10-19 13:19:12', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185426601941139661, 'FIELD_OPERATION', '操作字段', 1, '操作', '2019-10-19 13:25:01', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185426601941139662, 'FIELD_OPERATION', '操作字段', 2, 'operation', '2019-10-19 13:25:01', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185426859010031617, 'FIELD_NAME', '名称字段', 1, '名称', '2019-10-19 13:26:02', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185426937057640450, 'FIELD_NAME', '名称字段', 2, 'name', '2019-10-19 13:26:21', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185427225235685377, 'FIELD_SUPERIOR_ROLE', '上级角色字段', 1, '上级角色', '2019-10-19 13:27:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185427320681267202, 'FIELD_SUPERIOR_ROLE', '上级角色字段', 2, 'superior role', '2019-10-19 13:27:52', 1, '2019-10-19 13:48:32', 1);
INSERT INTO `sys_translation` VALUES (1185427531721867266, 'FIELD_ALIAS', '别名字段', 2, 'alias', '2019-10-19 13:28:42', 1, '2019-10-19 13:29:24', 1);
INSERT INTO `sys_translation` VALUES (1185427681475297281, 'FIELD_ALIAS', '别名字段', 1, '别名', '2019-10-19 13:29:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185427922840715265, 'FIELD_ROLE_NAME', '角色名称字段', 1, '角色名称', '2019-10-19 13:30:16', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185428016252059650, 'FIELD_ROLE_NAME', '角色名称字段', 2, 'role name', '2019-10-19 13:30:38', 1, '2019-10-19 13:48:24', 1);
INSERT INTO `sys_translation` VALUES (1185428250399080450, 'FIELD_SUPERIOR_NAME', '上级名称字段', 1, '上级名称', '2019-10-19 13:31:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185428394779607041, 'FIELD_SUPERIOR_NAME', '上级名称字段', 2, 'superior name', '2019-10-19 13:32:08', 1, '2019-10-19 13:48:16', 1);
INSERT INTO `sys_translation` VALUES (1185428542482022402, 'FIELD_SORT', '排序字段', 1, '排序', '2019-10-19 13:32:43', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185428621955694593, 'FIELD_SORT', '排序字段', 2, 'sort', '2019-10-19 13:33:02', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185429113037389826, 'FIELD_DEPT_SHORT_NAME', '部门简称字段', 1, '部门简称', '2019-10-19 13:34:59', 1, '2019-10-19 13:37:53', 1);
INSERT INTO `sys_translation` VALUES (1185429265257070594, 'FIELD_DEPT_SHORT_NAME', '部门简称字段', 2, 'dept short name', '2019-10-19 13:35:36', 1, '2019-10-19 13:48:09', 1);
INSERT INTO `sys_translation` VALUES (1185429532220325889, 'FIELD_DEPT_FULL_NAME', '部门全称字段', 1, '部门全称', '2019-10-19 13:36:39', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185429673622896642, 'FIELD_DEPT_FULL_NAME', '部门全称字段', 2, 'dept full name', '2019-10-19 13:37:13', 1, '2019-10-19 13:47:53', 1);
INSERT INTO `sys_translation` VALUES (1185430031527051266, 'FIELD_REMARK', '备注字段', 1, '备注', '2019-10-19 13:38:38', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185430121348071425, 'FIELD_REMARK', '备注字段', 2, 'remark', '2019-10-19 13:39:00', 1, '2019-10-19 13:47:39', 1);
INSERT INTO `sys_translation` VALUES (1185430332564832258, 'FIELD_DEPT_NAME', '部门名称字段', 1, '部门名称', '2019-10-19 13:39:50', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185430445257392130, 'FIELD_DEPT_NAME', '部门名称字段', 2, 'dept name', '2019-10-19 13:40:17', 1, '2019-10-19 13:49:02', 1);
INSERT INTO `sys_translation` VALUES (1185430718591795201, 'FIELD_POST_NAME', '职位名称字段', 1, '职位名称', '2019-10-19 13:41:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185430791140671489, 'FIELD_POST_NAME', '职位名称字段', 2, 'post name', '2019-10-19 13:41:40', 1, '2019-10-19 13:49:09', 1);
INSERT INTO `sys_translation` VALUES (1185430947961503745, 'FIELD_POST_CODE', '职位编码字段', 1, '职位编码', '2019-10-19 13:42:17', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185431063556521985, 'FIELD_POST_CODE', '职位编码字段', 2, 'post code', '2019-10-19 13:42:44', 1, '2019-10-19 13:49:17', 1);
INSERT INTO `sys_translation` VALUES (1185431297082785793, 'FIELD_ORDER', '顺序字段', 1, '顺序', '2019-10-19 13:43:40', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185431380062896129, 'FIELD_ORDER', '顺序字段', 2, 'order', '2019-10-19 13:44:00', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185431632866181121, 'FIELD_TYPE_NAME', '类型名称字段', 1, '类型名称', '2019-10-19 13:45:00', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185431700226703361, 'FIELD_TYPE_NAME', '类型名称字段', 2, 'type name', '2019-10-19 13:45:16', 1, '2019-10-19 13:50:52', 1);
INSERT INTO `sys_translation` VALUES (1185432944068526081, 'FIELD_TYPE_CODE', '类型编码字段', 1, '类型编码', '2019-10-19 13:50:13', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185433063430029314, 'FIELD_TYPE_CODE', '类型编码字段', 2, 'type code', '2019-10-19 13:50:41', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185433367965859841, 'FIELD_SYSTEM_DICT_FLAG', '是否是系统字典字段', 1, '是否是系统字典', '2019-10-19 13:51:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185433533968023554, 'FIELD_SYSTEM_DICT_FLAG', '是否是系统字典字段', 2, 'system dictionary or not', '2019-10-19 13:52:33', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185433719826022402, 'FIELD_DICT_DESCRIPTION', '字典描述字段', 1, '字典描述', '2019-10-19 13:53:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185433828135534593, 'FIELD_DICT_DESCRIPTION', '字典描述字段', 2, 'dict deion', '2019-10-19 13:53:44', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185434066179063809, 'FIELD_ADD_TIME', '添加时间字段', 1, '添加时间', '2019-10-19 13:54:40', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185434203345387522, 'FIELD_ADD_TIME', '添加时间字段', 2, 'add time', '2019-10-19 13:55:13', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185434492697837569, 'FIELD_SYSTEM_DICT', '系统字典字段', 1, '系统字典', '2019-10-19 13:56:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185434574587428865, 'FIELD_SYSTEM_DICT', '系统字典字段', 2, 'system dict', '2019-10-19 13:56:42', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185434888703049729, 'FIELD_YES', '是字段', 1, '是', '2019-10-19 13:57:56', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185435024334258177, 'FIELD_YES', '是字段', 2, 'yes', '2019-10-19 13:58:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185435102755160066, 'FIELD_NO', '否字段', 1, '否', '2019-10-19 13:58:47', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185435206937477122, 'FIELD_NO', '否字段', 2, 'no', '2019-10-19 13:59:12', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185435476765442049, 'FIELD_MENU_NAME', '菜单名称字段', 1, '菜单名称', '2019-10-19 14:00:17', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185435537318608897, 'FIELD_MENU_NAME', '菜单名称字段', 2, 'menu name', '2019-10-19 14:00:31', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185435685855690754, 'FIELD_MENU_CODE', '菜单编号字段', 1, '菜单编号', '2019-10-19 14:01:06', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185435816109801473, 'FIELD_MENU_CODE', '菜单编号字段', 2, 'menu code', '2019-10-19 14:01:38', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185436012176736257, 'FIELD_MENU_PCODE', '菜单父编号字段', 1, '菜单父编号', '2019-10-19 14:02:24', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185436181475622913, 'FIELD_MENU_PCODE', '菜单父编号字段', 2, 'menu parent code', '2019-10-19 14:03:05', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185436494915960834, 'FIELD_REQUEST_URL', '请求地址字段', 1, '请求地址', '2019-10-19 14:04:19', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185436554617683970, 'FIELD_REQUEST_URL', '请求地址字段', 2, 'request url', '2019-10-19 14:04:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185437647829467138, 'FIELD_LEVEL', '层级字段', 1, '层级', '2019-10-19 14:08:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185437715454230530, 'FIELD_LEVEL', '层级字段', 2, 'level', '2019-10-19 14:09:10', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185437912972394497, 'FIELD_MENU_FLAG', '是否是菜单字段', 1, '是否是菜单', '2019-10-19 14:09:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185438098784256002, 'FIELD_MENU_FLAG', '是否是菜单字段', 2, 'Is it the menu', '2019-10-19 14:10:42', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185438543414034433, 'FIELD_PARENT_CODE', '父级编号字段', 1, '父级编号', '2019-10-19 14:12:28', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185438666789486594, 'FIELD_PARENT_CODE', '父级编号字段', 2, 'parent code', '2019-10-19 14:12:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185438827003510786, 'FIELD_ICON', '图标字段', 1, '图标', '2019-10-19 14:13:35', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185438903448895489, 'FIELD_ICON', '图标字段', 2, 'icon', '2019-10-19 14:13:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185439184152690689, 'FIELD_SYSTEM_CLASSIFY', '系统分类字段', 1, '系统分类', '2019-10-19 14:15:01', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185439285638070273, 'FIELD_SYSTEM_CLASSIFY', '系统分类字段', 2, 'system classify', '2019-10-19 14:15:25', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185439883024400386, 'FIELD_LOG_NAME', '日志名称字段', 1, '日志名称', '2019-10-19 14:17:47', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185439985445109761, 'FIELD_LOG_NAME', '日志名称字段', 2, 'log name', '2019-10-19 14:18:12', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185440188059353089, 'FIELD_USER_NAME', '用户名称字段', 1, '用户名称', '2019-10-19 14:19:00', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185440312504352770, 'FIELD_USER_NAME', '用户名称字段', 2, 'username', '2019-10-19 14:19:30', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185440464552067074, 'FIELD_TIME', '时间字段', 1, '时间', '2019-10-19 14:20:06', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185440522823532545, 'FIELD_TIME', '时间字段', 2, 'time', '2019-10-19 14:20:20', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185440770258108418, 'FIELD_SPECIFIC_MESSAGE', '具体消息字段', 1, '具体消息', '2019-10-19 14:21:19', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185440854764945410, 'FIELD_SPECIFIC_MESSAGE', '具体消息字段', 2, 'specific message', '2019-10-19 14:21:39', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185441078254239745, 'FIELD_IP', 'ip字段', 1, 'IP 地址', '2019-10-19 14:22:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185441170583453698, 'FIELD_IP', 'ip字段', 2, 'IP address', '2019-10-19 14:22:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185441349017534466, 'FIELD_LOG_TYPE', '日志类型字段', 1, '日志类型', '2019-10-19 14:23:37', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185441443485843457, 'FIELD_LOG_TYPE', '日志类型字段', 2, 'log type', '2019-10-19 14:23:59', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185441718556688385, 'FIELD_CLASS_NAME', '类名字段', 1, '类名', '2019-10-19 14:25:05', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185441804468617217, 'FIELD_CLASS_NAME', '类名字段', 2, 'class name', '2019-10-19 14:25:25', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185441942285058050, 'FIELD_METHOD_NAME', '方法名字段', 1, '方法名', '2019-10-19 14:25:58', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185442053983567873, 'FIELD_METHOD_NAME', '方法名字段', 2, 'method name', '2019-10-19 14:26:25', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185442292647854082, 'FIELD_TITLE', '标题字段', 1, '标题', '2019-10-19 14:27:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185442345877766146, 'FIELD_TITLE', '标题字段', 2, 'title', '2019-10-19 14:27:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185442451666501634, 'FIELD_CONTENT', '内容字段', 1, '内容', '2019-10-19 14:28:00', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185442509879246850, 'FIELD_CONTENT', '内容字段', 2, 'content', '2019-10-19 14:28:13', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185442781288464386, 'FIELD_PUBLISHER', '发布者字段', 1, '发布者', '2019-10-19 14:29:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185442840667226114, 'FIELD_PUBLISHER', '发布者字段', 2, 'publisher', '2019-10-19 14:29:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185443425298677761, 'FIELD_TENANT_NAME', '租户名称字段', 1, '租户名称', '2019-10-19 14:31:52', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185443487567314946, 'FIELD_TENANT_NAME', '租户名称字段', 2, 'tenant name', '2019-10-19 14:32:07', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185443685811093505, 'FIELD_TENANT_CODE', '租户编码字段', 1, '租户编码', '2019-10-19 14:32:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185443788189859842, 'FIELD_TENANT_CODE', '租户编码字段', 2, 'tenant code', '2019-10-19 14:33:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185444109146390529, 'FIELD_RELATED_DBNAME', '关联的数据库名称字段', 1, '关联的数据库名称', '2019-10-19 14:34:35', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185444234589634562, 'FIELD_RELATED_DBNAME', '关联的数据库名称字段', 2, 'related database name', '2019-10-19 14:35:05', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185444365300924418, 'FIELD_CREATE_USER', '创建人字段', 1, '创建人', '2019-10-19 14:35:36', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185444442509672450, 'FIELD_CREATE_USER', '创建人字段', 2, 'create user', '2019-10-19 14:35:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185444600110645250, 'FIELD_UPDATE_USER', '更新人字段', 1, '更新人', '2019-10-19 14:36:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185444724622753794, 'FIELD_UPDATE_USER', '更新人字段', 2, 'update user', '2019-10-19 14:37:02', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185445022653218817, 'FIELD_MANAGE_ACCOUNT', '管理账号字段', 1, '管理账号', '2019-10-19 14:38:13', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185445110721019906, 'FIELD_MANAGE_ACCOUNT', '管理账号字段', 2, 'manage account', '2019-10-19 14:38:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185445335120478210, 'FIELD_MANAGE_PASSWORD', '管理密码字段', 1, '管理密码', '2019-10-19 14:39:27', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185445433598541826, 'FIELD_MANAGE_PASSWORD', '管理密码字段', 2, 'manage password', '2019-10-19 14:39:51', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185445960260517890, 'FIELD_PROPERTY_CODE', '属性编码字段', 1, '属性编码', '2019-10-19 14:41:56', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185446030070513665, 'FIELD_PROPERTY_CODE', '属性编码字段', 2, 'property code', '2019-10-19 14:42:13', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185446413727694849, 'FIELD_PROPERTY_VALUE', '属性值字段', 1, '属性值', '2019-10-19 14:43:44', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185446595869540354, 'FIELD_PROPERTY_VALUE', '属性值字段', 2, 'property value', '2019-10-19 14:44:28', 1, '2019-10-19 14:44:38', 1);
INSERT INTO `sys_translation` VALUES (1185446801579180034, 'FIELD_CODE', '编码字段', 1, '编码', '2019-10-19 14:45:17', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185446851126493185, 'FIELD_CODE', '编码字段', 2, 'code', '2019-10-19 14:45:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447058786484225, 'FIELD_VALUE_RANGE', '取值范围字段', 1, '取值范围', '2019-10-19 14:46:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447132077752322, 'FIELD_VALUE_RANGE', '取值范围字段', 2, 'value range', '2019-10-19 14:46:35', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447295194234881, 'FIELD_DICT_TYPE', '字典类型字段', 1, '字典类型', '2019-10-19 14:47:14', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447371748671489, 'FIELD_DICT_TYPE', '字典类型字段', 2, 'dict type', '2019-10-19 14:47:33', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447599964946434, 'FIELD_PARAMETER_VALUES', '参数值字段', 1, '参数值', '2019-10-19 14:48:27', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447680533331969, 'FIELD_PARAMETER_VALUES', '参数值字段', 2, 'parameter values', '2019-10-19 14:48:46', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447840881573889, 'FIELD_DATABASE_NAME', '数据库名称字段', 1, '数据库名称', '2019-10-19 14:49:24', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185447972238786561, 'FIELD_DATABASE_NAME', '数据库名称字段', 2, 'database name', '2019-10-19 14:49:56', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185448164220469250, 'FIELD_DRIVER_TYPE', '驱动类型字段', 1, '驱动类型', '2019-10-19 14:50:42', 1, '2019-10-19 14:51:28', 1);
INSERT INTO `sys_translation` VALUES (1185448326716194817, 'FIELD_DRIVER_TYPE', '驱动类型字段', 2, 'driver type', '2019-10-19 14:51:20', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185448672251346946, 'FIELD_URL_OF_JDBC', 'JDBC URL字段', 1, 'JDBC URL', '2019-10-19 14:52:43', 1, '2019-10-19 14:57:25', 1);
INSERT INTO `sys_translation` VALUES (1185448754677809154, 'FIELD_URL_OF_JDBC', 'JDBC URL字段', 2, 'JDBC URL', '2019-10-19 14:53:02', 1, '2019-10-19 14:57:49', 1);
INSERT INTO `sys_translation` VALUES (1185449056055328770, 'FIELD_JDBC_DRIVER', 'JDBC驱动字段', 1, 'JDBC驱动', '2019-10-19 14:54:14', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185449139245154305, 'FIELD_JDBC_DRIVER', 'JDBC驱动字段', 1, 'JDBC DRIVER', '2019-10-19 14:54:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185449295659139073, 'FIELD_JDBC_ACCOUNT', 'JDBC账号字段', 1, 'JDBC账号', '2019-10-19 14:55:11', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185449405960945666, 'FIELD_JDBC_ACCOUNT', 'JDBC账号字段', 2, 'JDBC ACCOUNT', '2019-10-19 14:55:38', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185449617840406530, 'FIELD_JDBC_PASSWORD', 'JDBC密码字段', 1, 'JDBC密码', '2019-10-19 14:56:28', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185449694109630466, 'FIELD_JDBC_PASSWORD', 'JDBC密码字段', 2, 'JDBC PASSWORD', '2019-10-19 14:56:46', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185450328393252866, 'FIELD_AUTHOR', '作者字段', 1, '作者', '2019-10-19 14:59:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185450389260992513, 'FIELD_AUTHOR', '作者字段', 2, 'author', '2019-10-19 14:59:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185450575773302785, 'FIELD_PROJECT_PACKAGE_NAME', '项目包名称字段', 1, '项目包名称', '2019-10-19 15:00:17', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185450683680161793, 'FIELD_PROJECT_PACKAGE_NAME', '项目包名称字段', 2, 'project package name', '2019-10-19 15:00:42', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185450910927552514, 'FIELD_MODULE_NAME', '模块名称字段', 1, '模块名称', '2019-10-19 15:01:36', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185450981513494530, 'FIELD_MODULE_NAME', '模块名称字段', 2, 'module name', '2019-10-19 15:01:53', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185451130771996673, 'FIELD_TABLE_REMOVE_PREFIX', '表前缀移除字段', 1, '表前缀移除', '2019-10-19 15:02:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185451233670856706, 'FIELD_TABLE_REMOVE_PREFIX', '表前缀移除字段', 2, 'remove table prefix', '2019-10-19 15:02:53', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185451382853861377, 'FIELD_CHOOSE_DATABASE', '数据源选择字段', 1, '数据源选择', '2019-10-19 15:03:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185451502580269058, 'FIELD_CHOOSE_DATABASE', '数据源选择字段', 2, 'choose database', '2019-10-19 15:03:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185451879371374593, 'FIELD_CHOOSE_VERSION', '版本选择字段', 1, '版本选择', '2019-10-19 15:05:27', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185451990151331842, 'FIELD_CHOOSE_VERSION', '版本选择字段', 2, 'choose version', '2019-10-19 15:05:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185452118270541825, 'FIELD_CHOOSE_TABLE', '选择表字段', 1, '选择表', '2019-10-19 15:06:24', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185452193617018882, 'FIELD_CHOOSE_TABLE', '选择表字段', 2, 'choose table', '2019-10-19 15:06:42', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185452567182704642, 'FIELD_LANGUAGE', '语种字段', 1, '语种', '2019-10-19 15:08:11', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185452630323757057, 'FIELD_LANGUAGE', '语种字段', 2, 'language', '2019-10-19 15:08:26', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185452939716591618, 'FIELD_TRANSLATION_VALUE', '翻译值字段', 1, '翻译值', '2019-10-19 15:09:40', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185453377996193793, 'FIELD_TRANSLATION_VALUE', '翻译值字段', 2, 'the value of the translation', '2019-10-19 15:11:25', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185454151333576706, 'FIELD_MODEL_NAME', '模型名称字段', 1, '模型名称', '2019-10-19 15:14:29', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185454213409275905, 'FIELD_MODEL_NAME', '模型名称字段', 2, 'model name', '2019-10-19 15:14:44', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185454352857300993, 'FIELD_CLASSIFY', '分类字段', 1, '分类', '2019-10-19 15:15:17', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185454468288741377, 'FIELD_CLASSIFY', '分类字段', 2, 'classify', '2019-10-19 15:15:45', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185454911110774786, 'FIELD_MODEL_CLASSIFY', '模型分类字段', 1, '模型分类', '2019-10-19 15:17:30', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185454993281384449, 'FIELD_MODEL_CLASSIFY', '模型分类字段', 2, 'model classify', '2019-10-19 15:17:50', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455123162202113, 'FIELD_MODEL_DESCRIPTION', '模型描述字段', 1, '模型描述', '2019-10-19 15:18:21', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455205060182018, 'FIELD_MODEL_DESCRIPTION', '模型描述字段', 2, 'model deion', '2019-10-19 15:18:40', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455362581463042, 'FIELD_FLOW_NAME', '流程名称字段', 1, '流程名称', '2019-10-19 15:19:18', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455438246707202, 'FIELD_FLOW_NAME', '流程名称字段', 2, 'flow name', '2019-10-19 15:19:36', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455542206726146, 'FIELD_FLOW_FLAG', '流程标识字段', 1, '流程标识', '2019-10-19 15:20:01', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455611786035202, 'FIELD_FLOW_FLAG', '流程标识字段', 2, 'flow flag', '2019-10-19 15:20:17', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455731176898562, 'FIELD_FLOW_AUTHOR', '流程作者字段', 1, '流程作者', '2019-10-19 15:20:46', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185455843567468545, 'FIELD_FLOW_AUTHOR', '流程作者字段', 2, 'flow author', '2019-10-19 15:21:12', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185456133762973697, 'FIELD_FLOW_KEY', '流程定义KEY字段', 1, '流程定义KEY', '2019-10-19 15:22:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185456245516009473, 'FIELD_FLOW_KEY', '流程定义KEY字段', 2, 'the key of flow', '2019-10-19 15:22:48', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185456382304845825, 'FIELD_VERSION', '版本字段', 1, '版本', '2019-10-19 15:23:21', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185456443038367746, 'FIELD_VERSION', '版本字段', 2, 'version', '2019-10-19 15:23:35', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185456707891888130, 'FIELD_DEPLOY_TIME', '部署时间字段', 1, '部署时间', '2019-10-19 15:24:39', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185456786539282433, 'FIELD_DEPLOY_TIME', '部署时间字段', 2, 'deploy time', '2019-10-19 15:24:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185456999723171842, 'FIELD_FLOW_BPMN_NAME', '流程bpmn文件名称字段', 1, '流程bpmn文件名称', '2019-10-19 15:25:48', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185457145794002945, 'FIELD_FLOW_BPMN_NAME', '流程bpmn文件名称字段', 2, 'process BPMN file name', '2019-10-19 15:26:23', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185457317659803649, 'FIELD_PIC_NAME', '流程图片名称字段', 1, '流程图片名称', '2019-10-19 15:27:04', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185457486820278274, 'FIELD_PIC_NAME', '流程图片名称字段', 2, 'process picture name', '2019-10-19 15:27:44', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185457756451110914, 'FIELD_PROPOSER', '申请人字段', 1, '申请人', '2019-10-19 15:28:49', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185457820938534913, 'FIELD_PROPOSER', '申请人字段', 2, 'proposer', '2019-10-19 15:29:04', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185458019140370433, 'FIELD_CURRENT_NODE', '当前节点(审批人)字段', 1, '当前节点(审批人)', '2019-10-19 15:29:51', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185458125159792642, 'FIELD_CURRENT_NODE', '当前节点(审批)字段', 2, 'current node(proposer)', '2019-10-19 15:30:16', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185458283322802178, 'FIELD_CURRENT_TASK', '当前任务字段', 1, '当前任务', '2019-10-19 15:30:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185458463648514049, 'FIELD_CURRENT_TASK', '当前任务字段', 2, 'current task', '2019-10-19 15:31:37', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185458668015976449, 'FIELD_FLOW_VERSION', '流程版本字段', 1, '流程版本', '2019-10-19 15:32:26', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185458770356994050, 'FIELD_FLOW_VERSION', '流程版本字段', 2, 'flow version', '2019-10-19 15:32:50', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185458987953291266, 'FIELD_START_TIME', '开始时间字段', 1, '开始时间', '2019-10-19 15:33:42', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185459059571032066, 'FIELD_START_TIME', '开始时间字段', 2, 'start time', '2019-10-19 15:33:59', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185459223505403906, 'FIELD_END_TIME', '结束时间字段', 1, '结束时间', '2019-10-19 15:34:38', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185459286055059458, 'FIELD_END_TIME', '结束时间字段', 2, 'end time', '2019-10-19 15:34:53', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185459456683540481, 'FIELD_USED_TIME', '用时字段', 1, '用时', '2019-10-19 15:35:34', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185459592042119170, 'FIELD_USED_TIME', '用时字段', 2, 'total time', '2019-10-19 15:36:06', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185459909597069314, 'FIELD_CURRENT_COMMISSION', '当前节点(代办人)字段', 1, '当前节点(代办人)', '2019-10-19 15:37:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185460049523245057, 'FIELD_CURRENT_COMMISSION', '当前节点(代办人)字段', 2, 'current node(commission)', '2019-10-19 15:37:55', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185460365564051458, 'FIELD_COMMISSON_OR_ROLE', '办理人 or 角色字段', 1, '办理人 or 角色', '2019-10-19 15:39:11', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185460556107087873, 'FIELD_COMMISSON_OR_ROLE', '办理人 or 角色字段', 2, 'transactor or role', '2019-10-19 15:39:56', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185460758096379905, 'FIELD_TYPE', '类型字段', 1, '类型', '2019-10-19 15:40:44', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185460807480115202, 'FIELD_TYPE', '类型字段', 2, 'type', '2019-10-19 15:40:56', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185461111927865346, 'FIELD_SHIYOU', '事由字段', 1, '事由', '2019-10-19 15:42:09', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185461185273659393, 'FIELD_SHIYOU', '事由字段', 2, 'the origin of an incident', '2019-10-19 15:42:26', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185461553730682882, 'FIELD_LEAVE_TYPE', '请假类型字段', 1, '请假类型', '2019-10-19 15:43:54', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185461741706805250, 'FIELD_LEAVE_TYPE', '请假类型字段', 2, 'type of the ask for leave', '2019-10-19 15:44:39', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185496726711160834, 'FIELD_NUMBER', '序号字段', 1, '序号', '2019-10-19 18:03:40', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185497214294806530, 'FIELD_NUMBER', '序号字段', 2, 'number', '2019-10-19 18:05:36', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185506150615994369, 'FIELD_FILE', '文件字段', 1, '文件', '2019-10-19 18:41:07', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185506213719298049, 'FIELD_FILE', '文件字段', 2, 'file', '2019-10-19 18:41:22', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185506474894413826, 'FIELD_CHOOSE_FILE', '选择文件字段', 1, '选择文件', '2019-10-19 18:42:24', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185506615659450369, 'FIELD_CHOOSE_FILE', '选择文件字段', 2, 'select the file', '2019-10-19 18:42:57', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513372263727106, 'FIELD_RUNNING', '正在运行字段', 1, '正在运行', '2019-10-19 19:09:48', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513454203650049, 'FIELD_RUNNING', '正在运行字段', 2, 'running', '2019-10-19 19:10:08', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513675730010113, 'FIELD_HANG_UP', '已挂起字段', 1, '已挂起', '2019-10-19 19:11:01', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513675730010114, 'FIELD_HANG_UP', '已挂起字段', 2, 'hang up', '2019-10-19 19:11:23', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513675730011111, 'TIPS_NAME_PHONE', '提示_姓名手机号', 1, '账号/姓名/手机号', '2019-10-19 19:11:01', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017211112, 'TIPS_NAME_PHONE', '提示_姓名手机号', 2, 'account/name/mobile', '2019-10-19 19:11:23', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281027, 'TIPS_REG_TIME', '提示_注册时间', 1, '注册时间', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281028, 'TIPS_REG_TIME', '提示_注册时间', 2, 'register time', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281029, 'TIPS_ROLE_NAME', '提示_角色名称', 1, '角色名称', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281030, 'TIPS_ROLE_NAME', '提示_角色名称', 2, 'role name', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281031, 'TIPS_DEPT_NAME', '提示_部门名称', 1, '部门名称', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281032, 'TIPS_DEPT_NAME', '提示_部门名称', 2, 'dept name', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281035, 'TIPS_POST_NAME', '提示_职务名称', 1, '职务名称', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281036, 'TIPS_POST_NAME', '提示_职务名称', 2, 'duty name', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281037, 'TIPS_NAME_CODE', '提示_名称编码', 1, '名称/编码', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281038, 'TIPS_NAME_CODE', '提示_名称编码', 2, 'name/code', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281039, 'TIPS_MENU_NAME', '提示_菜单名称编码', 1, '菜单名称/编码', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281040, 'TIPS_MENU_NAME', '提示_菜单名称编码', 2, 'menu name/code', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281041, 'TIPS_LEVEL', '提示_层级', 1, '层级', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281042, 'TIPS_LEVEL', '提示_层级', 2, 'level', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281043, 'TIPS_BEGIN_TIME', '提示_开始时间', 1, '开始时间', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281044, 'TIPS_BEGIN_TIME', '提示_开始时间', 2, 'begin time', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281045, 'TIPS_END_TIME', '提示_结束时间', 1, '结束时间', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281046, 'TIPS_END_TIME', '提示_结束时间', 2, 'end time', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281047, 'TIPS_LOG_NAME', '提示_日志名称', 1, '日志名称', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281048, 'TIPS_LOG_NAME', '提示_日志名称', 2, 'log name', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281049, 'TIPS_TYPE', '提示_类型', 1, '类型', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281050, 'TIPS_TYPE', '提示_类型', 2, 'type', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281051, 'TIPS_MESSAGE_NAME', '提示_通知名称', 1, '通知名称', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281052, 'TIPS_MESSAGE_NAME', '提示_通知名称', 2, 'message name', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281053, 'TIPS_TENANT_NAME', '提示_租户名称', 1, '租户名称', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281054, 'TIPS_TENANT_NAME', '提示_租户名称', 2, 'tenant name', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281055, 'TIPS_STATUS', '提示_状态', 1, '状态', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281056, 'TIPS_STATUS', '提示_状态', 2, 'status', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281057, 'MENU_PERSONAL_INFO', '菜单_个人中心', 1, '个人中心', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281058, 'MENU_PERSONAL_INFO', '菜单_个人中心', 2, 'personal info', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281059, 'MENU_CHANGE_PASSWORD', '菜单_修改密码', 1, '修改密码', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281060, 'MENU_CHANGE_PASSWORD', '菜单_修改密码', 2, 'change password', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281061, 'MENU_LOGOUT', '菜单_退出', 1, '退出', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281062, 'MENU_LOGOUT', '菜单_退出', 2, 'logout', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281063, 'MENU_OTHER', '菜单_其他', 1, '其他', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281064, 'MENU_OTHER', '菜单_其他', 2, 'other', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281065, 'MENU_BASE_INFO', '菜单_基本信息', 1, '基本信息', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281066, 'MENU_BASE_INFO', '菜单_基本信息', 2, 'base info', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281067, 'BTN_UPDATE_INFO', '按钮_更新基本信息', 1, '更新基本信息', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281068, 'BTN_UPDATE_INFO', '按钮_更新基本信息', 2, 'update', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281069, 'FIELD_OLD_PASSWORD', '字段_旧密码', 1, '旧密码', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281070, 'FIELD_OLD_PASSWORD', '字段_旧密码', 2, 'old password', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281071, 'FIELD_NEW_PASSWORD', '字段_新密码', 1, '新密码', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281072, 'FIELD_NEW_PASSWORD', '字段_新密码', 2, 'new password', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281073, 'FIELD_RE_PASSWORD', '字段_确认密码', 1, '确认密码', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281074, 'FIELD_RE_PASSWORD', '字段_确认密码', 2, 'confirm password', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281083, 'MENU_INDEX', '菜单_首页', 1, '首页', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1185513768017281084, 'MENU_INDEX', '菜单_首页', 2, 'index', '2019-10-19 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1212300136151236610, 'MENU_EXCEL_PROCESS', 'excel处理', 2, 'excel process', '2020-01-01 17:10:51', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1212300366171062273, 'MENU_EXCEL_PROCESS_EXPORT', '菜单_模板管理', 2, 'templates', '2020-01-01 17:11:45', 1, NULL, NULL);
INSERT INTO `sys_translation` VALUES (1212310216473038850, 'MENU_TENANT_MANAGER', '租户管理', 2, 'tenants', '2020-01-01 17:50:54', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '主键id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(字典)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id(多个逗号隔开)',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id(多个逗号隔开)',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(字典)',
  `profit_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '账户总收益',
  `extract_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '账户总提现金额',
  `alipay_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝用户名',
  `is_driver` tinyint(1) NULL DEFAULT 0 COMMENT '是否是司机',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '1124606971782160385', 'admin', '17db03c22596b7609c7c9704f16663e0', 'abcdef', '超级管理员', '2018-11-16 00:00:00', 'M', 'sn93@qq.com', '18200000000', '1', 1389465081447997442, 'ENABLE', 32.12, 0.00, '15755468096', NULL, '2016-01-29 08:49:53', NULL, '2021-05-04 15:15:03', 24, 25);
INSERT INTO `sys_user` VALUES (1390000487788781569, NULL, '15755468096', '2aab14407df20cc75616962ea73c5739', 'iyvlx', '15755468096', NULL, NULL, '1171636667@qq.com', '15755468096', '1389466235040980994', 1389465031166681089, 'ENABLE', 0.00, 0.00, NULL, 0, '2021-05-06 01:48:36', -100, '2021-05-06 01:54:50', 1390000487788781569, NULL);
INSERT INTO `sys_user` VALUES (1390002319344869377, NULL, '18734773548', '6bccff9000327c7bb152958fc18fa7d0', '3vubv', '张三', NULL, NULL, '117163667@qq.com', '18734773548', '1389466235040980994', 1389465031166681089, 'ENABLE', 4.00, 4.00, '1171636667', 1, '2021-05-06 01:55:53', -100, '2021-05-06 02:00:14', 1390002319344869377, NULL);

-- ----------------------------
-- Table structure for sys_user_pos
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_pos`;
CREATE TABLE `sys_user_pos`  (
  `user_pos_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `pos_id` bigint(20) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`user_pos_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户职位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_pos
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `tenant_id` bigint(20) NOT NULL COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户的编码',
  `db_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的数据库名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
