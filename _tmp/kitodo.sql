-- --------------------------------------------------------
-- Host:                         localhost
-- Server Version:               8.0.26 - MySQL Community Server - GPL
-- Server Betriebssystem:        Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für kitodo
CREATE DATABASE IF NOT EXISTS `kitodo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kitodo`;

-- Exportiere Struktur von Tabelle kitodo.authority
CREATE TABLE IF NOT EXISTS `authority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.authority: ~127 rows (ungefähr)
DELETE FROM `authority`;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` (`id`, `title`) VALUES
	(172, 'addAuthority_globalAssignable'),
	(149, 'addBatch_clientAssignable'),
	(6, 'addClient_globalAssignable'),
	(75, 'addDocket_clientAssignable'),
	(44, 'addLdapGroup_globalAssignable'),
	(49, 'addLdapServer_globalAssignable'),
	(85, 'addProcess_clientAssignable'),
	(68, 'addProject_clientAssignable'),
	(121, 'addRole_clientAssignable'),
	(29, 'addRole_globalAssignable'),
	(80, 'addRuleset_clientAssignable'),
	(111, 'addTask_clientAssignable'),
	(24, 'addTask_globalAssignable'),
	(159, 'addTemplate_clientAssignable'),
	(126, 'addUser_clientAssignable'),
	(34, 'addUser_globalAssignable'),
	(140, 'addWorkflow_clientAssignable'),
	(167, 'assignTasks_clientAssignable'),
	(163, 'assignTasks_globalAssignable'),
	(171, 'configureColumns_clientAssignable'),
	(170, 'configureColumns_globalAssignable'),
	(174, 'deleteAuthority_globalAssignable'),
	(151, 'deleteBatch_clientAssignable'),
	(5, 'deleteClient_globalAssignable'),
	(74, 'deleteDocket_clientAssignable'),
	(46, 'deleteLdapGroup_globalAssignable'),
	(51, 'deleteLdapServer_globalAssignable'),
	(187, 'deleteMedia_clientAssignable'),
	(186, 'deleteMedia_globalAssignable'),
	(84, 'deleteProcess_clientAssignable'),
	(67, 'deleteProject_clientAssignable'),
	(120, 'deleteRole_clientAssignable'),
	(31, 'deleteRole_globalAssignable'),
	(79, 'deleteRuleset_clientAssignable'),
	(110, 'deleteTask_clientAssignable'),
	(26, 'deleteTask_globalAssignable'),
	(161, 'deleteTemplate_clientAssignable'),
	(125, 'deleteUser_clientAssignable'),
	(36, 'deleteUser_globalAssignable'),
	(134, 'deleteWorkflow_clientAssignable'),
	(173, 'editAuthority_globalAssignable'),
	(150, 'editBatch_clientAssignable'),
	(63, 'editClient_clientAssignable'),
	(4, 'editClient_globalAssignable'),
	(73, 'editDocket_clientAssignable'),
	(53, 'editIndex_globalAssignable'),
	(45, 'editLdapGroup_globalAssignable'),
	(50, 'editLdapServer_globalAssignable'),
	(83, 'editProcess_clientAssignable'),
	(94, 'editProcessImages_clientAssignable'),
	(57, 'editProcessImages_globalAssignable'),
	(91, 'editProcessMetaData_clientAssignable'),
	(54, 'editProcessMetaData_globalAssignable'),
	(93, 'editProcessPagination_clientAssignable'),
	(56, 'editProcessPagination_globalAssignable'),
	(92, 'editProcessStructureData_clientAssignable'),
	(55, 'editProcessStructureData_globalAssignable'),
	(66, 'editProject_clientAssignable'),
	(119, 'editRole_clientAssignable'),
	(30, 'editRole_globalAssignable'),
	(78, 'editRuleset_clientAssignable'),
	(109, 'editTask_clientAssignable'),
	(25, 'editTask_globalAssignable'),
	(160, 'editTemplate_clientAssignable'),
	(124, 'editUser_clientAssignable'),
	(35, 'editUser_globalAssignable'),
	(133, 'editWorkflow_clientAssignable'),
	(177, 'exportProcess_clientAssignable'),
	(168, 'overrideTasks_clientAssignable'),
	(164, 'overrideTasks_globalAssignable'),
	(166, 'performTask_clientAssignable'),
	(162, 'performTask_globalAssignable'),
	(188, 'runKitodoScript_clientAssignable'),
	(169, 'superviseTasks_clientAssignable'),
	(165, 'superviseTasks_globalAssignable'),
	(183, 'unassignTasks_clientAssignable'),
	(182, 'unassignTasks_globalAssignable'),
	(185, 'uploadMedia_clientAssignable'),
	(184, 'uploadMedia_globalAssignable'),
	(141, 'viewAllAuthorities_globalAssignable'),
	(148, 'viewAllBatches_clientAssignable'),
	(2, 'viewAllClients_globalAssignable'),
	(72, 'viewAllDockets_clientAssignable'),
	(42, 'viewAllLdapGroups_globalAssignable'),
	(47, 'viewAllLdapServers_globalAssignable'),
	(82, 'viewAllProcesses_clientAssignable'),
	(65, 'viewAllProjects_clientAssignable'),
	(118, 'viewAllRoles_clientAssignable'),
	(27, 'viewAllRoles_globalAssignable'),
	(77, 'viewAllRulesets_clientAssignable'),
	(108, 'viewAllTasks_clientAssignable'),
	(22, 'viewAllTasks_globalAssignable'),
	(158, 'viewAllTemplates_clientAssignable'),
	(123, 'viewAllUsers_clientAssignable'),
	(32, 'viewAllUsers_globalAssignable'),
	(132, 'viewAllWorkflows_clientAssignable'),
	(175, 'viewAuthority_globalAssignable'),
	(147, 'viewBatch_clientAssignable'),
	(62, 'viewClient_clientAssignable'),
	(3, 'viewClient_globalAssignable'),
	(178, 'viewDatabaseStatistic_globalAssignable'),
	(71, 'viewDocket_clientAssignable'),
	(52, 'viewIndex_globalAssignable'),
	(43, 'viewLdapGroup_globalAssignable'),
	(48, 'viewLdapServer_globalAssignable'),
	(181, 'viewMigration_globalAssignable'),
	(81, 'viewProcess_clientAssignable'),
	(98, 'viewProcessImages_clientAssignable'),
	(61, 'viewProcessImages_globalAssignable'),
	(95, 'viewProcessMetaData_clientAssignable'),
	(58, 'viewProcessMetaData_globalAssignable'),
	(97, 'viewProcessPagination_clientAssignable'),
	(60, 'viewProcessPagination_globalAssignable'),
	(96, 'viewProcessStructureData_clientAssignable'),
	(59, 'viewProcessStructureData_globalAssignable'),
	(64, 'viewProject_clientAssignable'),
	(117, 'viewRole_clientAssignable'),
	(28, 'viewRole_globalAssignable'),
	(76, 'viewRuleset_clientAssignable'),
	(107, 'viewTask_clientAssignable'),
	(23, 'viewTask_globalAssignable'),
	(179, 'viewTaskManager_globalAssignable'),
	(157, 'viewTemplate_clientAssignable'),
	(180, 'viewTerms_globalAssignable'),
	(122, 'viewUser_clientAssignable'),
	(33, 'viewUser_globalAssignable'),
	(131, 'viewWorkflow_clientAssignable');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.batch
CREATE TABLE IF NOT EXISTS `batch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.batch: ~0 rows (ungefähr)
DELETE FROM `batch`;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.batch_x_process
CREATE TABLE IF NOT EXISTS `batch_x_process` (
  `process_id` int NOT NULL,
  `batch_id` int NOT NULL,
  PRIMARY KEY (`process_id`,`batch_id`),
  KEY `FK_ProzesseID` (`process_id`),
  KEY `FK_BatchID` (`batch_id`),
  CONSTRAINT `FK_batch_x_process_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FK_batch_x_process_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.batch_x_process: ~0 rows (ungefähr)
DELETE FROM `batch_x_process`;
/*!40000 ALTER TABLE `batch_x_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_x_process` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.client
CREATE TABLE IF NOT EXISTS `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.client: ~0 rows (ungefähr)
DELETE FROM `client`;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`id`, `name`) VALUES
	(1, 'Client_ChangeMe');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.client_x_listcolumn
CREATE TABLE IF NOT EXISTS `client_x_listcolumn` (
  `client_id` int NOT NULL,
  `column_id` int NOT NULL,
  PRIMARY KEY (`client_id`,`column_id`),
  KEY `FK_client_x_listColumn_client_id` (`client_id`),
  KEY `FK_client_x_listColumn_column_id` (`column_id`),
  CONSTRAINT `FK_client_x_listColumn_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_client_x_listColumn_column_id` FOREIGN KEY (`column_id`) REFERENCES `listcolumn` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle kitodo.client_x_listcolumn: ~32 rows (ungefähr)
DELETE FROM `client_x_listcolumn`;
/*!40000 ALTER TABLE `client_x_listcolumn` DISABLE KEYS */;
INSERT INTO `client_x_listcolumn` (`client_id`, `column_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33);
/*!40000 ALTER TABLE `client_x_listcolumn` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.client_x_user
CREATE TABLE IF NOT EXISTS `client_x_user` (
  `client_id` int NOT NULL,
  `user_id` int NOT NULL,
  KEY `FK_client_x_user_user_id` (`user_id`),
  KEY `FK_client_x_user_client_id` (`client_id`),
  CONSTRAINT `FK_client_x_user_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_client_x_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.client_x_user: ~6 rows (ungefähr)
DELETE FROM `client_x_user`;
/*!40000 ALTER TABLE `client_x_user` DISABLE KEYS */;
INSERT INTO `client_x_user` (`client_id`, `user_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6);
/*!40000 ALTER TABLE `client_x_user` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isCorrected` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` datetime DEFAULT NULL,
  `correctionDate` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `currentTask_id` int DEFAULT NULL,
  `correctionTask_id` int DEFAULT NULL,
  `process_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_id` (`user_id`),
  KEY `FK_currentTask_id` (`currentTask_id`),
  KEY `FK_correctionTask_id` (`correctionTask_id`),
  KEY `FK_process_id` (`process_id`),
  CONSTRAINT `FK_comment_correctionTask_id` FOREIGN KEY (`correctionTask_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK_comment_currentTask_id` FOREIGN KEY (`currentTask_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK_comment_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`),
  CONSTRAINT `FK_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.comment: ~4 rows (ungefähr)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `message`, `type`, `isCorrected`, `creationDate`, `correctionDate`, `user_id`, `currentTask_id`, `correctionTask_id`, `process_id`) VALUES
	(1, '3', 'INFO', 0, '2022-03-30 12:29:12', NULL, 1, NULL, NULL, 3),
	(2, '3', 'INFO', 0, '2022-03-30 12:29:57', NULL, 1, NULL, NULL, 3),
	(3, '3', 'INFO', 0, '2022-03-30 12:31:49', NULL, 1, NULL, NULL, 3),
	(4, '3', 'INFO', 0, '2022-03-30 12:40:16', NULL, 1, NULL, NULL, 3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.dataeditor_setting
CREATE TABLE IF NOT EXISTS `dataeditor_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `task_id` int NOT NULL,
  `structure_width` float DEFAULT NULL,
  `metadata_width` float DEFAULT NULL,
  `gallery_width` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dataeditorsetting_user_id` (`user_id`),
  KEY `FK_dataeditorsetting_task_id` (`task_id`),
  CONSTRAINT `FK_dataeditorsetting_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK_dataeditorsetting_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.dataeditor_setting: ~0 rows (ungefähr)
DELETE FROM `dataeditor_setting`;
/*!40000 ALTER TABLE `dataeditor_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataeditor_setting` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.docket
CREATE TABLE IF NOT EXISTS `docket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_docket_client_id` (`client_id`),
  CONSTRAINT `FK_docket_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.docket: ~0 rows (ungefähr)
DELETE FROM `docket`;
/*!40000 ALTER TABLE `docket` DISABLE KEYS */;
INSERT INTO `docket` (`id`, `title`, `file`, `indexAction`, `active`, `client_id`) VALUES
	(1, 'default', 'docket.xsl', 'DONE', 1, 1);
/*!40000 ALTER TABLE `docket` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.filter
CREATE TABLE IF NOT EXISTS `filter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `creationDate` datetime DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_filter_x_user_id` (`user_id`),
  CONSTRAINT `FK_filter_x_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.filter: ~0 rows (ungefähr)
DELETE FROM `filter`;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.flyway_schema_history
CREATE TABLE IF NOT EXISTS `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle kitodo.flyway_schema_history: ~110 rows (ungefähr)
DELETE FROM `flyway_schema_history`;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
	(1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2021-11-22 16:39:58', 0, 1),
	(2, '2.0', 'Translate tables names English', 'SQL', 'V2_0__Translate_tables_names_English.sql', 1003915713, 'root', '2021-11-22 16:40:14', 155, 1),
	(3, '2.1', 'Translate columns names to English', 'SQL', 'V2_1__Translate_columns_names_to_English.sql', 678095644, 'root', '2021-11-22 16:40:14', 261, 1),
	(4, '2.2', 'Remove dangling data', 'SQL', 'V2_2__Remove_dangling_data.sql', 1931059347, 'root', '2021-11-22 16:40:14', 7, 1),
	(5, '2.3', 'Add foreign keys', 'SQL', 'V2_3__Add_foreign_keys.sql', 1283934716, 'root', '2021-11-22 16:40:15', 1080, 1),
	(6, '2.4', 'Adjust database for datamanagement module', 'SQL', 'V2_4__Adjust_database_for_datamanagement_module.sql', -2020492123, 'root', '2021-11-22 16:40:15', 106, 1),
	(7, '2.5', 'Rename docket name', 'SQL', 'V2_5__Rename_docket_name.sql', -986073616, 'root', '2021-11-22 16:40:15', 18, 1),
	(8, '2.6', 'Store properties only in one table', 'SQL', 'V2_6__Store_properties_only_in_one_table.sql', -1714665569, 'root', '2021-11-22 16:40:16', 1116, 1),
	(9, '2.7', 'Add column indexAction for ElasticSearch', 'SQL', 'V2_7__Add_column_indexAction_for_ElasticSearch.sql', -1126446108, 'root', '2021-11-22 16:40:17', 715, 1),
	(10, '2.8', 'Add uri field to process', 'SQL', 'V2_8__Add_uri_field_to_process.sql', -227692621, 'root', '2021-11-22 16:40:17', 157, 1),
	(11, '2.9', 'Move user property to filter table', 'SQL', 'V2_9__Move_user_property_to_filter_table.sql', -2029373619, 'root', '2021-11-22 16:40:17', 147, 1),
	(12, '2.10', 'Change visible from varchar to tinyint', 'SQL', 'V2_10__Change_visible_from_varchar_to_tinyint.sql', -2037286993, 'root', '2021-11-22 16:40:17', 43, 1),
	(13, '2.11', 'Remove script columns from task table', 'SQL', 'V2_11__Remove_script_columns_from_task_table.sql', 653887945, 'root', '2021-11-22 16:40:18', 91, 1),
	(14, '2.12', 'Convert encoding of tables to utf8', 'SQL', 'V2_12__Convert_encoding_of_tables_to_utf8.sql', -1434370806, 'root', '2021-11-22 16:40:18', 693, 1),
	(15, '2.13', 'Set css values of users to null', 'SQL', 'V2_13__Set_css_values_of_users_to_null.sql', -1595856457, 'root', '2021-11-22 16:40:18', 3, 1),
	(16, '2.14', 'Remove module from task', 'SQL', 'V2_14__Remove_module_from_task.sql', -2077041126, 'root', '2021-11-22 16:40:19', 266, 1),
	(17, '2.15', 'Remove plugins from task', 'SQL', 'V2_15__Remove_plugins_from_task.sql', -1210428766, 'root', '2021-11-22 16:40:19', 160, 1),
	(18, '2.16', 'Rename and remove columns in task', 'SQL', 'V2_16__Rename_and_remove_columns_in_task.sql', 2143230672, 'root', '2021-11-22 16:40:19', 90, 1),
	(19, '2.17', 'Add authorization table', 'SQL', 'V2_17__Add_authorization_table.sql', 1341768269, 'root', '2021-11-22 16:40:19', 268, 1),
	(20, '2.18', 'Change process id to not null for template', 'SQL', 'V2_18__Change_process_id_to_not_null_for_template.sql', -1132392981, 'root', '2021-11-22 16:40:19', 28, 1),
	(21, '2.19', 'Set properies to unique not null', 'SQL', 'V2_19__Set_properies_to_unique_not_null.sql', -163526521, 'root', '2021-11-22 16:40:20', 444, 1),
	(22, '2.20', 'Simplify properties', 'SQL', 'V2_20__Simplify_properties.sql', -1094690472, 'root', '2021-11-22 16:40:20', 480, 1),
	(23, '2.21', 'Remove container column from property table', 'SQL', 'V2_21__Remove_container_column_from_property_table.sql', -1630933214, 'root', '2021-11-22 16:40:20', 32, 1),
	(24, '2.22', 'Add ldapServer table', 'SQL', 'V2_22__Add_ldapServer_table.sql', -1454346803, 'root', '2021-11-22 16:40:20', 136, 1),
	(25, '2.23', 'Rename authorization add client project relation', 'SQL', 'V2_23__Rename_authorization_add_client_project_relation.sql', -219677408, 'root', '2021-11-22 16:40:21', 530, 1),
	(26, '2.24', 'Add assignable columns to authority table', 'SQL', 'V2_24__Add_assignable_columns_to_authority_table.sql', -1871778020, 'root', '2021-11-22 16:40:21', 88, 1),
	(27, '2.25', 'Remove history table', 'SQL', 'V2_25__Remove_history_table.sql', 630878678, 'root', '2021-11-22 16:40:21', 13, 1),
	(28, '2.26', 'Add first authorities', 'SQL', 'V2_26__Add_first_authorities.sql', -1054939046, 'root', '2021-11-22 16:40:21', 33, 1),
	(29, '2.27', 'Replace project archived with active', 'SQL', 'V2_27__Replace_project_archived_with_active.sql', -122579497, 'root', '2021-11-22 16:40:21', 11, 1),
	(30, '2.28', 'Remove permission column from userGroup add authorities', 'SQL', 'V2_28__Remove_permission_column_from_userGroup_add_authorities.sql', 232093684, 'root', '2021-11-22 16:40:21', 77, 1),
	(31, '2.29', 'Split processes and templates', 'SQL', 'V2_29__Split_processes_and_templates.sql', -1124676778, 'root', '2021-11-22 16:40:22', 667, 1),
	(32, '2.30', 'Remove template column from process', 'SQL', 'V2_30__Remove_template_column_from_process.sql', -760773527, 'root', '2021-11-22 16:40:22', 35, 1),
	(33, '2.31', 'Remove session timeout in user table', 'SQL', 'V2_31__Remove_session_timeout_in_user_table.sql', -131626747, 'root', '2021-11-22 16:40:22', 73, 1),
	(34, '2.32', 'Add workflow table', 'SQL', 'V2_32__Add_workflow_table.sql', -393715476, 'root', '2021-11-22 16:40:22', 218, 1),
	(35, '2.33', 'Add workflowId column to task table', 'SQL', 'V2_33__Add_workflowId_column_to_task_table.sql', -1650737766, 'root', '2021-11-22 16:40:22', 88, 1),
	(36, '2.34', 'Add authorities', 'SQL', 'V2_34__Add_authorities.sql', -600235642, 'root', '2021-11-22 16:40:22', 10, 1),
	(37, '2.35', 'Add flags for workflow', 'SQL', 'V2_35__Add_flags_for_workflow.sql', 829804577, 'root', '2021-11-22 16:40:22', 70, 1),
	(38, '2.36', 'Add active flags to docket ruleset workflow', 'SQL', 'V2_36__Add_active_flags_to_docket_ruleset_workflow.sql', 1219224149, 'root', '2021-11-22 16:40:22', 156, 1),
	(39, '2.37', 'Add indexAction to workflow table', 'SQL', 'V2_37__Add_indexAction_to_workflow_table.sql', 1071486182, 'root', '2021-11-22 16:40:23', 28, 1),
	(40, '2.38', 'Add client column to docket and ruleset', 'SQL', 'V2_38__Add_client_column_to_docket_and_ruleset.sql', -675462076, 'root', '2021-11-22 16:40:23', 245, 1),
	(41, '2.39', 'Add language column to user table', 'SQL', 'V2_39__Add_language_column_to_user_table.sql', -1292882401, 'root', '2021-11-22 16:40:23', 77, 1),
	(42, '2.40', 'Change projectfilegroup to folder', 'SQL', 'V2_40__Change_projectfilegroup_to_folder.sql', 1467010213, 'root', '2021-11-22 16:40:23', 353, 1),
	(43, '2.41', 'Add active flag to template', 'SQL', 'V2_41__Add_active_flag_to_template.sql', -1657644448, 'root', '2021-11-22 16:40:23', 110, 1),
	(44, '2.42', 'Change project template to many', 'SQL', 'V2_42__Change_project_template_to_many.sql', -377174417, 'root', '2021-11-22 16:40:24', 193, 1),
	(45, '2.43', 'Add dummy client', 'SQL', 'V2_43__Add_dummy_client.sql', -908260322, 'root', '2021-11-22 16:40:24', 82, 1),
	(46, '2.44', 'Change authority concept', 'SQL', 'V2_44__Change_authority_concept.sql', -1884580473, 'root', '2021-11-22 16:40:24', 295, 1),
	(47, '2.45', 'Add selectable folders to project', 'SQL', 'V2_45__Add_selectable_folders_to_project.sql', -293571299, 'root', '2021-11-22 16:40:24', 73, 1),
	(48, '2.46', 'Increase length of scriptPath', 'SQL', 'V2_46__Increase_length_of_scriptPath.sql', 176458964, 'root', '2021-11-22 16:40:24', 8, 1),
	(49, '2.47', 'Remove column outputName', 'SQL', 'V2_47__Remove_column_outputName.sql', 781566833, 'root', '2021-11-22 16:40:24', 180, 1),
	(50, '2.48', 'Add first example workflow', 'SQL', 'V2_48__Add_first_example_workflow.sql', -1088782537, 'root', '2021-11-22 16:40:24', 2, 1),
	(51, '2.49', 'Remove css column', 'SQL', 'V2_49__Remove_css_column.sql', 1579291855, 'root', '2021-11-22 16:40:24', 79, 1),
	(52, '2.50', 'Add missing rights for workflow', 'SQL', 'V2_50__Add_missing_rights_for_workflow.sql', 2016906006, 'root', '2021-11-22 16:40:24', 5, 1),
	(53, '2.51', 'Create table contentFolders task x folder', 'SQL', 'V2_51__Create_table_contentFolders_task_x_folder.sql', -1422647784, 'root', '2021-11-22 16:40:24', 19, 1),
	(54, '2.52', 'Remove importfilebyupload and exportrussian', 'SQL', 'V2_52__Remove_importfilebyupload_and_exportrussian.sql', -2092772211, 'root', '2021-11-22 16:40:25', 185, 1),
	(55, '2.53', 'Add missing authorities', 'SQL', 'V2_53__Add_missing_authorities.sql', 851537434, 'root', '2021-11-22 16:40:25', 8, 1),
	(56, '2.54', 'update LDAP Group table', 'SQL', 'V2_54__update_LDAP_Group_table.sql', -2050356457, 'root', '2021-11-22 16:40:25', 4, 1),
	(57, '2.55', 'Create table validationFolders task x folder', 'SQL', 'V2_55__Create_table_validationFolders_task_x_folder.sql', 681595144, 'root', '2021-11-22 16:40:25', 19, 1),
	(58, '2.56', 'Add client user group remove user task', 'SQL', 'V2_56__Add_client_user_group_remove_user_task.sql', 791979796, 'root', '2021-11-22 16:40:25', 105, 1),
	(59, '2.57', 'Remove project authorities', 'SQL', 'V2_57__Remove_project_authorities.sql', 605287867, 'root', '2021-11-22 16:40:25', 55, 1),
	(60, '2.58', 'Change relationship usegroup client and add dumy client to docket ruleset and usergroup', 'SQL', 'V2_58__Change_relationship_usegroup_client_and_add_dumy_client_to_docket_ruleset_and_usergroup.sql', 348902989, 'root', '2021-11-22 16:40:25', 146, 1),
	(61, '2.59', 'Change usergroup to role', 'SQL', 'V2_59__Change_usergroup_to_role.sql', -1992320266, 'root', '2021-11-22 16:40:25', 434, 1),
	(62, '2.60', 'Add client to workflow', 'SQL', 'V2_60__Add_client_to_workflow.sql', -1534154878, 'root', '2021-11-22 16:40:26', 117, 1),
	(63, '2.61', 'Add initial authorties', 'SQL', 'V2_61__Add_initial_authorties.sql', 1769151973, 'root', '2021-11-22 16:40:26', 30, 1),
	(64, '2.62', 'Convert encoding of project x template table to utf8', 'SQL', 'V2_62__Convert_encoding_of_project_x_template_table_to_utf8.sql', -1380936332, 'root', '2021-11-22 16:40:26', 9, 1),
	(65, '2.63', 'Add columns for parallel tasks', 'SQL', 'V2_63__Add_columns_for_parallel_tasks.sql', 1917871253, 'root', '2021-11-22 16:40:26', 194, 1),
	(66, '2.64', 'Fill values for last and concurrent', 'SQL', 'V2_64__Fill_values_for_last_and_concurrent.sql', -1570105798, 'root', '2021-11-22 16:40:26', 3, 1),
	(67, '2.65', 'Remove wikifield from template', 'SQL', 'V2_65__Remove_wikifield_from_template.sql', 1893068703, 'root', '2021-11-22 16:40:26', 83, 1),
	(68, '2.66', 'Remove index column from client user and role', 'SQL', 'V2_66__Remove_index_column_from_client_user_and_role.sql', -25533809, 'root', '2021-11-22 16:40:26', 287, 1),
	(69, '2.67', 'Add workflowcondition table', 'SQL', 'V2_67__Add_workflowcondition_table.sql', -1385573588, 'root', '2021-11-22 16:40:26', 108, 1),
	(70, '2.68', 'Add table for list columns', 'SQL', 'V2_68__Add_table_for_list_columns.sql', 1266171681, 'root', '2021-11-22 16:40:26', 48, 1),
	(71, '2.69', 'Remove filename column in workflow and index column in authority', 'SQL', 'V2_69__Remove_filename_column_in_workflow_and_index_column_in_authority.sql', 1489482844, 'root', '2021-11-22 16:40:27', 188, 1),
	(72, '2.70', 'Change active and ready to status in workflow', 'SQL', 'V2_70__Change_active_and_ready_to_status_in_workflow.sql', 814830437, 'root', '2021-11-22 16:40:27', 342, 1),
	(73, '2.71', 'Update initial roles', 'SQL', 'V2_71__Update_initial_roles.sql', -1061746512, 'root', '2021-11-22 16:40:27', 11, 1),
	(74, '2.72', 'Add client to template', 'SQL', 'V2_72__Add_client_to_template.sql', -1991283519, 'root', '2021-11-22 16:40:27', 132, 1),
	(75, '2.73', 'Add autohrities for authorities management', 'SQL', 'V2_73__Add_autohrities_for_authorities_management.sql', -1673949233, 'root', '2021-11-22 16:40:27', 3, 1),
	(76, '2.74', 'Add repeatOnCorrection to task table', 'SQL', 'V2_74__Add_repeatOnCorrection_to_task_table.sql', 616175597, 'root', '2021-11-22 16:40:27', 97, 1),
	(77, '2.75', 'Add comment table', 'SQL', 'V2_75__Add_comment_table.sql', -303023255, 'root', '2021-11-22 16:40:27', 22, 1),
	(78, '2.76', 'Add exportprocess authority', 'SQL', 'V2_76__Add_exportprocess_authority.sql', 1244739167, 'root', '2021-11-22 16:40:27', 2, 1),
	(79, '2.77', 'Add task list columns', 'SQL', 'V2_77__Add_task_list_columns.sql', 1520760884, 'root', '2021-11-22 16:40:27', 2, 1),
	(80, '2.78', 'Add hierarchy columns to process', 'SQL', 'V2_78__Add_hierarchy_columns_to_process.sql', 98312668, 'root', '2021-11-22 16:40:27', 124, 1),
	(81, '2.79', 'Increase comment message size', 'SQL', 'V2_79__Increase_comment_message_size.sql', -692515316, 'root', '2021-11-22 16:40:28', 42, 1),
	(82, '2.80', 'Replace priority with correction', 'SQL', 'V2_80__Replace_priority_with_correction.sql', -788794095, 'root', '2021-11-22 16:40:28', 166, 1),
	(83, '2.81', 'Remove unique from role title', 'SQL', 'V2_81__Remove_unique_from_role_title.sql', -165176391, 'root', '2021-11-22 16:40:28', 14, 1),
	(84, '2.82', 'Remove obsolete project fields', 'SQL', 'V2_82__Remove_obsolete_project_fields.sql', 1342021972, 'root', '2021-11-22 16:40:28', 553, 1),
	(85, '2.83', 'Remove unique from project title', 'SQL', 'V2_83__Remove_unique_from_project_title.sql', 352420284, 'root', '2021-11-22 16:40:28', 10, 1),
	(86, '2.84', 'Add separateStructure to task table', 'SQL', 'V2_84__Add_separateStructure_to_task_table.sql', -1931580638, 'root', '2021-11-22 16:40:28', 77, 1),
	(87, '2.85', 'Add images properties to task table', 'SQL', 'V2_85__Add_images_properties_to_task_table.sql', 431938112, 'root', '2021-11-22 16:40:28', 81, 1),
	(88, '2.86', 'Add validateFolder to folder table', 'SQL', 'V2_86__Add_validateFolder_to_folder_table.sql', -2086118568, 'root', '2021-11-22 16:40:29', 80, 1),
	(89, '2.87', 'Delete contentFolders and validationFolders', 'SQL', 'V2_87__Delete_contentFolders_and_validationFolders.sql', 2012537538, 'root', '2021-11-22 16:40:29', 17, 1),
	(90, '2.88', 'Add Database statistics authority and role', 'SQL', 'V2_88__Add_Database_statistics_authority_and_role.sql', -135524572, 'root', '2021-11-22 16:40:29', 4, 1),
	(91, '2.89', 'Remove dms import timeout', 'SQL', 'V2_89__Remove_dms_import_timeout.sql', -224511192, 'root', '2021-11-22 16:40:29', 86, 1),
	(92, '2.90', 'Delete templates', 'SQL', 'V2_90__Delete_templates.sql', -1593547779, 'root', '2021-11-22 16:40:29', 36, 1),
	(93, '2.91', 'Add exported flag', 'SQL', 'V2_91__Add_exported_flag.sql', 831080754, 'root', '2021-11-22 16:40:29', 41, 1),
	(94, '2.92', 'Remove unused columns from project', 'SQL', 'V2_92__Remove_unused_columns_from_project.sql', 1509577098, 'root', '2021-11-22 16:40:29', 85, 1),
	(95, '2.93', 'Change URI to String', 'SQL', 'V2_93__Change_URI_to_String.sql', 1681987630, 'root', '2021-11-22 16:40:29', 45, 1),
	(96, '2.94', 'Add correctionMessage list columns', 'SQL', 'V2_94__Add_correctionMessage_list_columns.sql', 2133571698, 'root', '2021-11-22 16:40:29', 1, 1),
	(97, '2.95', 'Add list column for process id', 'SQL', 'V2_95__Add_list_column_for_process_id.sql', 1750635005, 'root', '2021-11-22 16:40:29', 1, 1),
	(98, '2.96', 'Remove format columns from project', 'SQL', 'V2_96__Remove_format_columns_from_project.sql', 812344874, 'root', '2021-11-22 16:40:29', 85, 1),
	(99, '2.97', 'Add columns for last processed task', 'SQL', 'V2_97__Add_columns_for_last_processed_task.sql', -1426795086, 'root', '2021-11-22 16:40:29', 2, 1),
	(100, '2.98', 'Add user shortcuts', 'SQL', 'V2_98__Add_user_shortcuts.sql', -1121124039, 'root', '2021-11-22 16:40:29', 71, 1),
	(101, '2.99', 'Set booleans not null', 'SQL', 'V2_99__Set_booleans_not_null.sql', -700835014, 'root', '2021-11-22 16:40:30', 484, 1),
	(102, '2.100', 'Add authorities for system page tabs', 'SQL', 'V2_100__Add_authorities_for_system_page_tabs.sql', -1211298404, 'root', '2021-11-22 16:40:30', 5, 1),
	(103, '2.101', 'Add table for metadataeditor settings', 'SQL', 'V2_101__Add_table_for_metadataeditor_settings.sql', -804651963, 'root', '2021-11-22 16:40:30', 19, 1),
	(104, '2.102', 'Add Authorities for unassign tasks', 'SQL', 'V2_102__Add_Authorities_for_unassign_tasks.sql', 382647082, 'root', '2021-11-22 16:40:30', 2, 1),
	(105, '2.103', 'Rename list column user active to logged in', 'SQL', 'V2_103__Rename_list_column_user_active_to_logged_in.sql', -780481765, 'root', '2021-11-22 16:40:30', 1, 1),
	(106, '2.104', 'Move separateStructure to workflow', 'SQL', 'V2_104__Move_separateStructure_to_workflow.sql', -899238404, 'root', '2021-11-22 16:40:30', 131, 1),
	(107, '2.105', 'Fixes #3998', 'SQL', 'V2_105__Fixes_#3998.sql', 717475100, 'root', '2021-11-22 16:40:30', 6, 1),
	(108, '2.106', 'Remove inChoiceListShown column from templates', 'SQL', 'V2_106__Remove_inChoiceListShown_column_from_templates.sql', -466236680, 'root', '2021-11-22 16:40:30', 35, 1),
	(109, '2.107', 'Add authorities for upload and delete media', 'SQL', 'V2_107__Add_authorities_for_upload_and_delete_media.sql', -1919067915, 'root', '2021-11-22 16:40:30', 7, 1),
	(110, '2.108', 'Add authority to run Kitodo Scripts', 'SQL', 'V2_108__Add_authority_to_run_Kitodo_Scripts.sql', 832272565, 'kitodo', '2022-03-11 13:56:28', 37, 1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.folder
CREATE TABLE IF NOT EXISTS `folder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fileGroup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'USE attribute for METS fileGroup',
  `urlStructure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Path where the folder is published on a web server',
  `mimeType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Path to the folder relative to the process directory, may contain variables',
  `project_id` int DEFAULT NULL,
  `copyFolder` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'whether the folder is copied during export',
  `createFolder` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'whether the folder is created with a new process',
  `derivative` double DEFAULT NULL COMMENT 'the percentage of scaling for createDerivative()',
  `dpi` int DEFAULT NULL COMMENT 'the new DPI for changeDpi()',
  `imageScale` double DEFAULT NULL COMMENT 'the percentage of scaling for getScaledWebImage()',
  `imageSize` int DEFAULT NULL COMMENT 'the new width in pixels for getSizedWebImage()',
  `linkingMode` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ALL' COMMENT 'how to link the contents in a METS fileGrp',
  `validateFolder` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_ProjekteID` (`project_id`),
  CONSTRAINT `FK_folder_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.folder: ~6 rows (ungefähr)
DELETE FROM `folder`;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` (`id`, `fileGroup`, `urlStructure`, `mimeType`, `path`, `project_id`, `copyFolder`, `createFolder`, `derivative`, `dpi`, `imageScale`, `imageSize`, `linkingMode`, `validateFolder`) VALUES
	(1, 'MAX', 'http://www.example.com/content/$(meta.CatalogIDDigital)/jpgs/max/', 'image/jpeg', 'jpgs/max', 1, 1, 1, NULL, NULL, NULL, NULL, 'ALL', 1),
	(2, 'DEFAULT', 'http://www.example.com/content/$(meta.CatalogIDDigital)/jpgs/default/', 'image/jpeg', 'jpgs/default', 1, 1, 1, NULL, NULL, NULL, NULL, 'ALL', 1),
	(3, 'THUMBS', 'http://www.example.com/content/$(meta.CatalogIDDigital)/jpgs/thumbs/', 'image/jpeg', 'jpgs/thumbs', 1, 1, 1, NULL, NULL, NULL, NULL, 'ALL', 1),
	(4, 'FULLTEXT', 'http://www.example.com/content/$(meta.CatalogIDDigital)/ocr/alto/', 'application/alto+xml', 'ocr/alto', 1, 1, 1, NULL, NULL, NULL, NULL, 'ALL', 1),
	(5, 'DOWNLOAD', 'http://www.example.com/content/$(meta.CatalogIDDigital)/pdf/', 'application/pdf', 'pdf', 1, 1, 1, NULL, NULL, NULL, NULL, 'ALL', 1),
	(6, 'LOCAL', '', 'image/tiff', 'images/(processtitle)_tif', 1, 0, 1, NULL, NULL, NULL, NULL, 'NO', 1);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.ldapgroup
CREATE TABLE IF NOT EXISTS `ldapgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homeDirectory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gidNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userDn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectClasses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaSid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `displayName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gecos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loginShell` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaAcctFlags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaLogonScript` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaPrimaryGroupSid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaPasswordMustChange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaPasswordHistory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaLogonHours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sambaKickoffTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldapserver_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ldapGroup_ldapServer_id` (`ldapserver_id`),
  CONSTRAINT `FK_ldapGroup_ldapServer_id` FOREIGN KEY (`ldapserver_id`) REFERENCES `ldapserver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.ldapgroup: ~0 rows (ungefähr)
DELETE FROM `ldapgroup`;
/*!40000 ALTER TABLE `ldapgroup` DISABLE KEYS */;
INSERT INTO `ldapgroup` (`id`, `title`, `homeDirectory`, `gidNumber`, `userDn`, `objectClasses`, `sambaSid`, `sn`, `uid`, `description`, `displayName`, `gecos`, `loginShell`, `sambaAcctFlags`, `sambaLogonScript`, `sambaPrimaryGroupSid`, `sambaPasswordMustChange`, `sambaPasswordHistory`, `sambaLogonHours`, `sambaKickoffTime`, `ldapserver_id`) VALUES
	(2, 'Local LDAP', '/usr/local/kitodo/users/{login}', '100', 'cn={login},ou=users,dc=nodomain', 'top,inetOrgPerson,posixAccount,shadowAccount,sambaSamAccount', 'S-1-5-21-1234567890-123456789-1234567890-{uidnumber*2+1001}', '{login}', '{login}', 'Exemplary configuration of an LDAP group', '{user full name}', '{user full name}', '/bin/false', '[U          ]', '_{login}.bat', 'S-1-5-21-1234567890-123456789-1234567890-1000', '2147483647', '00000000000000000000000000000000000000', 'FFFFFFFFFFFFFFFFFFFF', '0', NULL);
/*!40000 ALTER TABLE `ldapgroup` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.ldapserver
CREATE TABLE IF NOT EXISTS `ldapserver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `managerLogin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `managerPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nextFreeUnixIdPattern` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useSsl` tinyint(1) NOT NULL DEFAULT '0',
  `readOnly` tinyint(1) NOT NULL DEFAULT '0',
  `passwordEncryption` int NOT NULL DEFAULT '0',
  `rootCertificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdcCertificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keystore` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keystorePassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.ldapserver: ~0 rows (ungefähr)
DELETE FROM `ldapserver`;
/*!40000 ALTER TABLE `ldapserver` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldapserver` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.listcolumn
CREATE TABLE IF NOT EXISTS `listcolumn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.listcolumn: ~44 rows (ungefähr)
DELETE FROM `listcolumn`;
/*!40000 ALTER TABLE `listcolumn` DISABLE KEYS */;
INSERT INTO `listcolumn` (`id`, `title`, `custom`) VALUES
	(1, 'project.title', 0),
	(2, 'project.metsRightsOwner', 0),
	(3, 'project.active', 0),
	(4, 'template.title', 0),
	(5, 'template.ruleset', 0),
	(6, 'workflow.title', 0),
	(7, 'workflow.filename', 0),
	(8, 'workflow.status', 0),
	(10, 'docket.title', 0),
	(11, 'docket.filename', 0),
	(12, 'ruleset.title', 0),
	(13, 'ruleset.filename', 0),
	(14, 'ruleset.sorting', 0),
	(15, 'task.title', 0),
	(16, 'task.process', 0),
	(17, 'task.project', 0),
	(18, 'task.state', 0),
	(19, 'process.title', 0),
	(20, 'process.state', 0),
	(21, 'process.project', 0),
	(22, 'user.username', 0),
	(23, 'user.location', 0),
	(24, 'user.roles', 0),
	(25, 'user.clients', 0),
	(26, 'user.projects', 0),
	(27, 'user.loggedIn', 0),
	(28, 'role.role', 0),
	(29, 'role.client', 0),
	(30, 'client.client', 0),
	(31, 'ldapgroup.ldapgroup', 0),
	(32, 'ldapgroup.home_directory', 0),
	(33, 'ldapgroup.gidNumber', 0),
	(34, 'task.priority', 0),
	(35, 'task.duration', 0),
	(36, 'process.duration', 0),
	(37, 'process.correctionMessage', 0),
	(38, 'task.correctionMessage', 0),
	(39, 'task.processId', 0),
	(40, 'process.lastEditingUser', 0),
	(41, 'process.processingBeginLastTask', 0),
	(42, 'process.processingEndLastTask', 0),
	(43, 'task.lastEditingUser', 0),
	(44, 'task.processingBegin', 0),
	(45, 'task.processingEnd', 0);
/*!40000 ALTER TABLE `listcolumn` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.process
CREATE TABLE IF NOT EXISTS `process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inChoiceListShown` tinyint(1) NOT NULL DEFAULT '0',
  `sortHelperStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortHelperImages` int DEFAULT NULL,
  `sortHelperArticles` int DEFAULT NULL,
  `sortHelperDocstructs` int DEFAULT NULL,
  `sortHelperMetadata` int DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `wikiField` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_id` int DEFAULT NULL,
  `ruleset_id` int DEFAULT NULL,
  `docket_id` int DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processBaseUri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `ordering` int DEFAULT NULL,
  `exported` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_ProjekteID` (`project_id`),
  KEY `FK_MetadatenKonfigurationID` (`ruleset_id`),
  KEY `FK_DocketID` (`docket_id`),
  KEY `FK_process_template_id` (`template_id`),
  KEY `FK_process_parent_id` (`parent_id`),
  CONSTRAINT `FK_process_docket_id` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  CONSTRAINT `FK_process_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `process` (`id`),
  CONSTRAINT `FK_process_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_process_ruleset_id` FOREIGN KEY (`ruleset_id`) REFERENCES `ruleset` (`id`),
  CONSTRAINT `FK_process_template_id` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.process: ~0 rows (ungefähr)
DELETE FROM `process`;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` (`id`, `title`, `inChoiceListShown`, `sortHelperStatus`, `sortHelperImages`, `sortHelperArticles`, `sortHelperDocstructs`, `sortHelperMetadata`, `creationDate`, `wikiField`, `project_id`, `ruleset_id`, `docket_id`, `indexAction`, `processBaseUri`, `template_id`, `parent_id`, `ordering`, `exported`) VALUES
	(3, 'CaelCaFeD_1761630636', 0, '060020000020', 0, 0, 0, 0, '2022-03-10 16:43:28', '', 1, 4, 1, 'DONE', '3/', 2, NULL, NULL, 0);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.process_x_property
CREATE TABLE IF NOT EXISTS `process_x_property` (
  `process_id` int NOT NULL,
  `property_id` int NOT NULL,
  KEY `FK_process_x_property_process_id` (`process_id`),
  KEY `FK_process_x_property_property_id` (`property_id`),
  CONSTRAINT `FK_process_x_property_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`),
  CONSTRAINT `FK_process_x_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.process_x_property: ~2 rows (ungefähr)
DELETE FROM `process_x_property`;
/*!40000 ALTER TABLE `process_x_property` DISABLE KEYS */;
INSERT INTO `process_x_property` (`process_id`, `property_id`) VALUES
	(3, 21),
	(3, 22);
/*!40000 ALTER TABLE `process_x_property` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.project
CREATE TABLE IF NOT EXISTS `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dmsImportRootPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsRightsOwner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsRightsOwnerLogo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsRightsOwnerSite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsRightsOwnerMail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsDigiprovReference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsDigiprovPresentation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsPointerPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsPurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metsContentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `numberOfPages` int DEFAULT NULL,
  `numberOfVolumes` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int NOT NULL,
  `generatorSource_folder_id` int DEFAULT NULL COMMENT 'folder with templates to create derived media from',
  `mediaView_folder_id` int DEFAULT NULL COMMENT 'media to use for single medium view',
  `preview_folder_id` int DEFAULT NULL COMMENT 'media to use for gallery preview',
  PRIMARY KEY (`id`),
  KEY `FK_project_client_id` (`client_id`),
  KEY `CK_project_generatorSource_folder_id` (`generatorSource_folder_id`),
  KEY `CK_project_mediaView_folder_id` (`mediaView_folder_id`),
  KEY `CK_project_preview_folder_id` (`preview_folder_id`),
  CONSTRAINT `CK_project_generatorSource_folder_id` FOREIGN KEY (`generatorSource_folder_id`) REFERENCES `folder` (`id`),
  CONSTRAINT `CK_project_mediaView_folder_id` FOREIGN KEY (`mediaView_folder_id`) REFERENCES `folder` (`id`),
  CONSTRAINT `CK_project_preview_folder_id` FOREIGN KEY (`preview_folder_id`) REFERENCES `folder` (`id`),
  CONSTRAINT `FK_project_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.project: ~0 rows (ungefähr)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `title`, `dmsImportRootPath`, `metsRightsOwner`, `metsRightsOwnerLogo`, `metsRightsOwnerSite`, `metsRightsOwnerMail`, `metsDigiprovReference`, `metsDigiprovPresentation`, `metsPointerPath`, `metsPurl`, `metsContentId`, `startDate`, `endDate`, `numberOfPages`, `numberOfVolumes`, `active`, `indexAction`, `client_id`, `generatorSource_folder_id`, `mediaView_folder_id`, `preview_folder_id`) VALUES
	(1, 'Example Project', '/usr/local/kitodo/hotfolder/', 'Digital Library Kitodo', 'http://www.example.com/fileadmin/groups/kitodo/Logo/kitodo_logo_rgb.png', 'http://www.example.com', 'info@kitodo.org', 'http://www.example.com/DB=1/PPN?PPN=$(meta.topstruct.CatalogIDDigital)', 'http://www.example.com/resolver?id=$(meta.topstruct.CatalogIDDigital)', 'http://www.example.com/content/$(meta.CatalogIDDigital)/$(meta.topstruct.CatalogIDDigital).xml', 'http://www.example.com/resolver?id=$(meta.CatalogIDDigital)', '', '2016-01-01 00:00:00', '2019-12-31 00:00:00', 0, 0, 1, 'DONE', 1, 6, 1, 3);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.project_x_template
CREATE TABLE IF NOT EXISTS `project_x_template` (
  `project_id` int NOT NULL,
  `template_id` int NOT NULL,
  KEY `FK_project_x_template_project_id` (`project_id`),
  KEY `FK_project_x_template_template_id` (`template_id`),
  CONSTRAINT `FK_project_x_template_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_project_x_template_template_id` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.project_x_template: ~0 rows (ungefähr)
DELETE FROM `project_x_template`;
/*!40000 ALTER TABLE `project_x_template` DISABLE KEYS */;
INSERT INTO `project_x_template` (`project_id`, `template_id`) VALUES
	(1, 2);
/*!40000 ALTER TABLE `project_x_template` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.project_x_user
CREATE TABLE IF NOT EXISTS `project_x_user` (
  `user_id` int NOT NULL,
  `project_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`),
  KEY `FK_ProjekteID` (`project_id`),
  KEY `FK_BenutzerID` (`user_id`),
  CONSTRAINT `FK_project_x_user_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_project_x_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.project_x_user: ~6 rows (ungefähr)
DELETE FROM `project_x_user`;
/*!40000 ALTER TABLE `project_x_user` DISABLE KEYS */;
INSERT INTO `project_x_user` (`user_id`, `project_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1);
/*!40000 ALTER TABLE `project_x_user` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.property
CREATE TABLE IF NOT EXISTS `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `obligatory` tinyint(1) NOT NULL DEFAULT '0',
  `dataType` int DEFAULT NULL,
  `choice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.property: ~20 rows (ungefähr)
DELETE FROM `property`;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` (`id`, `title`, `value`, `obligatory`, `dataType`, `choice`, `creationDate`, `indexAction`) VALUES
	(21, 'Template', 'Template_OCR', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(22, 'TemplateID', '2', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(23, 'PPN (digital)', '1761630636', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(24, 'PPN (Vorlage)', '1106334698', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(25, 'Sprache', 'lat', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(26, 'Dokumenttyp', 'Monograph', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(27, 'Haupttitel ‹METS›', 'Caelii Calcagnini Ferrariensis, De Evcharistia Sermo Brevis, Ac Perspicvvs', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(28, 'Haupttitel (Sortierung) ‹METS›', 'Caelii Calcagnini Ferrariensis, De Evcharistia Sermo Brevis, Ac Perspicvvs', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(29, 'Person (Gruppe)', 'CalcagniniCelio', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(30, 'Erscheinungsort', 'Bvdissae', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(31, 'Verleger', 'Literis Richterianis', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(32, 'Signatur (Vorlage)', '4.A.1080,angeb.4', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(33, 'Digitale Kollektionen', 'Drucke des 18. Jahrhunderts', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(34, 'Haupttitel', 'Caelii Calcagnini Ferrariensis, De Evcharistia Sermo Brevis, Ac Perspicvvs', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(35, 'Haupttitel (Sortierung)', 'Caelii Calcagnini Ferrariensis, De Evcharistia Sermo Brevis, Ac Perspicvvs', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(36, 'Untertitel', 'In Vsum Athenaei Bvdissinensis', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(37, 'TSL/ATS', 'CaelCaFeD', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(38, 'DocType', 'Monograph', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(39, 'TifHeaderImagedescription', '|<DOC_TYPE>|<HAUPTTITEL>|<AUTOREN/HERAUSGEBER>|<JAHR>|<ERSCHEINUNGSORT>|<VERZ_STRCT>_|', 0, 5, NULL, '2022-03-10 16:43:38', NULL),
	(40, 'TifHeaderDocumentname', 'CaelCaFeD_1761630636', 0, 5, NULL, '2022-03-10 16:43:38', NULL);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_role_client_id` (`client_id`),
  CONSTRAINT `FK_role_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.role: ~13 rows (ungefähr)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `title`, `client_id`) VALUES
	(1, 'Administration', 1),
	(2, 'Scanning', 1),
	(3, 'QualityControl', 1),
	(4, 'Imaging', 1),
	(5, 'Metadata', 1),
	(6, 'Projectmanagement', 1),
	(8, 'ClientManagement', 1),
	(9, 'RoleManagement', 1),
	(10, 'UserManagement', 1),
	(11, 'ProcessManagement', 1),
	(15, 'ConfigureColumns', 1),
	(16, 'WorkflowManagement', 1),
	(17, 'DatabaseStatistic', 1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.role_x_authority
CREATE TABLE IF NOT EXISTS `role_x_authority` (
  `role_id` int NOT NULL,
  `authority_id` int NOT NULL,
  PRIMARY KEY (`authority_id`,`role_id`),
  KEY `FK_userGroup_x_authority_userGroup_id` (`role_id`),
  CONSTRAINT `FK_role_x_authority_authority_id` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`),
  CONSTRAINT `FK_role_x_authority_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.role_x_authority: ~210 rows (ungefähr)
DELETE FROM `role_x_authority`;
/*!40000 ALTER TABLE `role_x_authority` DISABLE KEYS */;
INSERT INTO `role_x_authority` (`role_id`, `authority_id`) VALUES
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 35),
	(1, 36),
	(1, 42),
	(1, 43),
	(1, 44),
	(1, 45),
	(1, 46),
	(1, 47),
	(1, 48),
	(1, 49),
	(1, 50),
	(1, 51),
	(1, 52),
	(1, 53),
	(1, 54),
	(1, 55),
	(1, 56),
	(1, 57),
	(1, 58),
	(1, 59),
	(1, 60),
	(1, 61),
	(1, 62),
	(1, 63),
	(1, 64),
	(1, 65),
	(1, 66),
	(1, 67),
	(1, 68),
	(1, 71),
	(1, 72),
	(1, 73),
	(1, 74),
	(1, 75),
	(1, 76),
	(1, 77),
	(1, 78),
	(1, 79),
	(1, 80),
	(1, 81),
	(1, 82),
	(1, 83),
	(1, 84),
	(1, 85),
	(1, 91),
	(1, 92),
	(1, 93),
	(1, 94),
	(1, 95),
	(1, 96),
	(1, 97),
	(1, 98),
	(1, 107),
	(1, 108),
	(1, 109),
	(1, 110),
	(1, 111),
	(1, 117),
	(1, 118),
	(1, 119),
	(1, 120),
	(1, 121),
	(1, 122),
	(1, 123),
	(1, 124),
	(1, 125),
	(1, 126),
	(1, 131),
	(1, 132),
	(1, 133),
	(1, 134),
	(1, 140),
	(1, 141),
	(1, 147),
	(1, 148),
	(1, 149),
	(1, 150),
	(1, 151),
	(1, 157),
	(1, 158),
	(1, 159),
	(1, 160),
	(1, 161),
	(1, 162),
	(1, 163),
	(1, 164),
	(1, 165),
	(1, 166),
	(1, 167),
	(1, 168),
	(1, 169),
	(1, 170),
	(1, 171),
	(1, 172),
	(1, 173),
	(1, 174),
	(1, 175),
	(1, 177),
	(1, 178),
	(1, 179),
	(1, 180),
	(1, 181),
	(1, 182),
	(1, 183),
	(1, 184),
	(1, 185),
	(1, 186),
	(1, 187),
	(1, 188),
	(2, 81),
	(2, 82),
	(2, 94),
	(2, 98),
	(5, 81),
	(5, 82),
	(5, 91),
	(5, 92),
	(5, 93),
	(5, 95),
	(5, 96),
	(5, 97),
	(5, 98),
	(6, 64),
	(6, 65),
	(6, 66),
	(6, 67),
	(6, 68),
	(6, 71),
	(6, 72),
	(6, 76),
	(6, 77),
	(6, 131),
	(6, 132),
	(6, 157),
	(6, 158),
	(8, 2),
	(8, 3),
	(8, 4),
	(8, 5),
	(8, 6),
	(8, 27),
	(8, 28),
	(8, 29),
	(8, 30),
	(8, 31),
	(8, 32),
	(8, 33),
	(8, 34),
	(8, 35),
	(8, 36),
	(9, 117),
	(9, 118),
	(9, 119),
	(9, 120),
	(9, 121),
	(10, 117),
	(10, 118),
	(10, 122),
	(10, 123),
	(10, 124),
	(10, 125),
	(10, 126),
	(11, 65),
	(11, 81),
	(11, 82),
	(11, 83),
	(11, 84),
	(11, 85),
	(11, 158),
	(15, 170),
	(15, 171),
	(16, 71),
	(16, 72),
	(16, 73),
	(16, 74),
	(16, 75),
	(16, 76),
	(16, 77),
	(16, 78),
	(16, 79),
	(16, 80),
	(16, 131),
	(16, 132),
	(16, 133),
	(16, 134),
	(16, 140),
	(16, 157),
	(16, 158),
	(16, 159),
	(16, 160),
	(16, 161),
	(17, 178);
/*!40000 ALTER TABLE `role_x_authority` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.ruleset
CREATE TABLE IF NOT EXISTS `ruleset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderMetadataByRuleset` tinyint(1) NOT NULL DEFAULT '1',
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ruleset_client_id` (`client_id`),
  CONSTRAINT `FK_ruleset_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.ruleset: ~0 rows (ungefähr)
DELETE FROM `ruleset`;
/*!40000 ALTER TABLE `ruleset` DISABLE KEYS */;
INSERT INTO `ruleset` (`id`, `title`, `file`, `orderMetadataByRuleset`, `indexAction`, `active`, `client_id`) VALUES
	(4, 'Ruleset', 'ruleset_default.xml', 0, 'DONE', 1, 1);
/*!40000 ALTER TABLE `ruleset` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordering` int DEFAULT NULL,
  `processingStatus` int DEFAULT NULL,
  `editType` int DEFAULT NULL,
  `processingTime` datetime DEFAULT NULL,
  `processingBegin` datetime DEFAULT NULL,
  `processingEnd` datetime DEFAULT NULL,
  `homeDirectory` smallint DEFAULT NULL,
  `typeMetadata` tinyint(1) NOT NULL DEFAULT '0',
  `typeAutomatic` tinyint(1) NOT NULL DEFAULT '0',
  `typeImagesRead` tinyint(1) NOT NULL DEFAULT '0',
  `typeImagesWrite` tinyint(1) NOT NULL DEFAULT '0',
  `typeExportDms` tinyint(1) NOT NULL DEFAULT '0',
  `typeAcceptClose` tinyint(1) NOT NULL DEFAULT '0',
  `scriptName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scriptPath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeCloseVerify` tinyint(1) NOT NULL DEFAULT '0',
  `batchStep` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL COMMENT 'This field contains information about user, which works on this task.',
  `process_id` int DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `workflowCondition_id` int DEFAULT NULL,
  `workflowId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `concurrent` tinyint(1) NOT NULL DEFAULT '0',
  `last` tinyint(1) NOT NULL DEFAULT '0',
  `repeatOnCorrection` tinyint(1) DEFAULT '0',
  `correction` tinyint(1) NOT NULL DEFAULT '0',
  `typeGenerateImages` tinyint(1) NOT NULL DEFAULT '0',
  `typeValidateImages` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_ProzesseID` (`process_id`),
  KEY `FK_BearbeitungsBenutzerID` (`user_id`),
  KEY `FK_task_template_id` (`template_id`),
  KEY `FK_task_workflowCondition_workflowCondition_id` (`workflowCondition_id`),
  CONSTRAINT `FK_task_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`),
  CONSTRAINT `FK_task_template_id` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`),
  CONSTRAINT `FK_task_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_task_workflowCondition_workflowCondition_id` FOREIGN KEY (`workflowCondition_id`) REFERENCES `workflowcondition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.task: ~14 rows (ungefähr)
DELETE FROM `task`;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` (`id`, `title`, `ordering`, `processingStatus`, `editType`, `processingTime`, `processingBegin`, `processingEnd`, `homeDirectory`, `typeMetadata`, `typeAutomatic`, `typeImagesRead`, `typeImagesWrite`, `typeExportDms`, `typeAcceptClose`, `scriptName`, `scriptPath`, `typeCloseVerify`, `batchStep`, `user_id`, `process_id`, `indexAction`, `template_id`, `workflowCondition_id`, `workflowId`, `concurrent`, `last`, `repeatOnCorrection`, `correction`, `typeGenerateImages`, `typeValidateImages`) VALUES
	(5, 'Scanning', 1, 1, 4, '2021-11-22 17:53:07', NULL, NULL, 0, 0, 0, 1, 1, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 1, NULL, 'Task_1', 0, 0, 0, 0, 0, 0),
	(6, 'QC', 2, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 1, NULL, 'Task_2', 0, 0, 0, 0, 0, 0),
	(7, 'Structure and Metadata', 3, 0, 0, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 1, NULL, 'Task_3', 0, 0, 0, 0, 0, 0),
	(8, 'Export DMS', 4, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 1, NULL, 'Task_4', 0, 1, 0, 0, 0, 0),
	(18, 'Scanning', 1, 1, 4, '2022-03-10 16:42:51', NULL, NULL, 0, 0, 0, 1, 1, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 2, NULL, 'Task_1', 0, 0, 0, 0, 0, 0),
	(19, 'QC', 2, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 2, NULL, 'Task_2', 0, 0, 0, 0, 0, 0),
	(20, 'Structure and Metadata', 3, 0, 0, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 2, NULL, 'Task_3', 0, 0, 0, 0, 0, 0),
	(21, 'OCR', 4, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 'OCR', '/usr/local/kitodo/scripts/script_ocr.sh {processid} {stepid}', 0, 0, NULL, NULL, 'DONE', 2, NULL, 'Activity_0y2ldc1', 0, 0, 0, 0, 0, 0),
	(22, 'Export DMS', 5, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, NULL, NULL, 'DONE', 2, NULL, 'Task_4', 0, 1, 0, 0, 0, 0),
	(23, 'Scanning', 1, 3, 3, '2022-03-30 12:31:29', NULL, '2022-03-30 12:31:29', 0, 0, 0, 1, 1, 0, 0, NULL, NULL, 0, 0, 1, 3, 'INDEX', NULL, NULL, 'Task_1', 0, 0, 0, 0, 0, 0),
	(24, 'QC', 2, 3, 3, '2022-03-30 12:31:32', NULL, '2022-03-30 12:31:32', 0, 0, 0, 1, 0, 0, 0, NULL, NULL, 0, 0, 1, 3, 'INDEX', NULL, NULL, 'Task_2', 0, 0, 0, 0, 0, 0),
	(25, 'Structure and Metadata', 3, 3, 3, '2022-03-30 12:31:35', NULL, '2022-03-30 12:31:35', 0, 1, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 1, 3, 'INDEX', NULL, NULL, 'Task_3', 0, 0, 0, 0, 0, 0),
	(26, 'OCR', 4, 2, 1, '2022-03-30 12:40:16', NULL, '2022-03-30 12:40:16', 0, 0, 0, 0, 0, 0, 0, 'OCR', '/usr/local/kitodo/scripts/script_ocr.sh {processid} {stepid}', 0, 0, 1, 3, 'DONE', NULL, NULL, 'Activity_0y2ldc1', 0, 0, 0, 0, 0, 0),
	(27, 'Export DMS', 5, 0, 3, '2022-03-30 14:09:36', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 3, 'DONE', NULL, NULL, 'Task_4', 0, 1, 0, 0, 0, 0);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.task_x_role
CREATE TABLE IF NOT EXISTS `task_x_role` (
  `role_id` int NOT NULL,
  `task_id` int NOT NULL,
  PRIMARY KEY (`task_id`,`role_id`),
  KEY `FK_SchritteID` (`task_id`),
  KEY `FK_BenutzerGruppenID` (`role_id`),
  CONSTRAINT `FK_task_x_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_task_x_role_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.task_x_role: ~26 rows (ungefähr)
DELETE FROM `task_x_role`;
/*!40000 ALTER TABLE `task_x_role` DISABLE KEYS */;
INSERT INTO `task_x_role` (`role_id`, `task_id`) VALUES
	(1, 5),
	(2, 5),
	(1, 6),
	(3, 6),
	(1, 7),
	(5, 7),
	(1, 8),
	(6, 8),
	(1, 18),
	(2, 18),
	(1, 19),
	(3, 19),
	(1, 20),
	(5, 20),
	(1, 21),
	(1, 22),
	(6, 22),
	(1, 23),
	(2, 23),
	(1, 24),
	(3, 24),
	(1, 25),
	(5, 25),
	(1, 26),
	(1, 27),
	(6, 27);
/*!40000 ALTER TABLE `task_x_role` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.template
CREATE TABLE IF NOT EXISTS `template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `sortHelperStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruleset_id` int DEFAULT NULL,
  `docket_id` int DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workflow_id` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_template_ruleset_id` (`ruleset_id`),
  KEY `FK_template_docket_id` (`docket_id`),
  KEY `FK_template_workflow_id` (`workflow_id`),
  KEY `FK_template_client_id` (`client_id`),
  CONSTRAINT `FK_template_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_template_docket_id` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  CONSTRAINT `FK_template_ruleset_id` FOREIGN KEY (`ruleset_id`) REFERENCES `ruleset` (`id`),
  CONSTRAINT `FK_template_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.template: ~2 rows (ungefähr)
DELETE FROM `template`;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` (`id`, `title`, `creationDate`, `sortHelperStatus`, `ruleset_id`, `docket_id`, `indexAction`, `workflow_id`, `active`, `client_id`) VALUES
	(1, 'Example Template', '2021-11-22 17:52:48', NULL, 4, 1, 'DONE', 1, 1, 1),
	(2, 'Template_OCR', '2022-03-10 16:42:15', NULL, 4, 1, 'DONE', 2, 1, 1);
/*!40000 ALTER TABLE `template` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.template_x_property
CREATE TABLE IF NOT EXISTS `template_x_property` (
  `process_id` int NOT NULL,
  `property_id` int NOT NULL,
  KEY `FK_template_x_property_template_id` (`process_id`),
  KEY `FK_template_x_property_property_id` (`property_id`),
  CONSTRAINT `FK_template_x_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  CONSTRAINT `FK_template_x_property_template_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.template_x_property: ~0 rows (ungefähr)
DELETE FROM `template_x_property`;
/*!40000 ALTER TABLE `template_x_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_x_property` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldapLogin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadataLanguage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withMassDownload` tinyint(1) NOT NULL DEFAULT '0',
  `configProductionDateShow` tinyint(1) NOT NULL DEFAULT '0',
  `tableSize` int DEFAULT NULL,
  `ldapGroup_id` int DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'de',
  `shortcuts` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '{"detailView":"Control Shift BracketRight","help":"Shift Minus","nextItem":"Control ArrowDown","nextItemMulti":"Control Shift ArrowDown","previousItem":"Control ArrowUp","previousItemMulti":"Control Shift ArrowUp","structuredView":"Control Shift Slash"}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `FK_LdapgruppenID` (`ldapGroup_id`),
  CONSTRAINT `FK_user_ldapGroup_id` FOREIGN KEY (`ldapGroup_id`) REFERENCES `ldapgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.user: ~6 rows (ungefähr)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `surname`, `login`, `ldapLogin`, `password`, `active`, `deleted`, `location`, `metadataLanguage`, `withMassDownload`, `configProductionDateShow`, `tableSize`, `ldapGroup_id`, `language`, `shortcuts`) VALUES
	(1, 'test', 'Admin', 'testAdmin', NULL, 'OvEJ00yyYZQ=', 1, 0, 'Göttingen', 'de', 0, 0, 10, NULL, 'en', '{"detailView":"Control Shift BracketRight","help":"Shift Minus","nextItem":"Control ArrowDown","nextItemMulti":"Control Shift ArrowDown","previousItem":"Control ArrowUp","previousItemMulti":"Control Shift ArrowUp","structuredView":"Control Shift Slash"}'),
	(2, 'test', 'Scanning', 'testScanning', NULL, 'OvEJ00yyYZQ=', 1, 0, 'Göttingen', 'de', 0, 0, 10, NULL, 'de', '{"detailView":"Control Shift BracketRight","help":"Shift Minus","nextItem":"Control ArrowDown","nextItemMulti":"Control Shift ArrowDown","previousItem":"Control ArrowUp","previousItemMulti":"Control Shift ArrowUp","structuredView":"Control Shift Slash"}'),
	(3, 'test', 'QC', 'testQC', NULL, 'OvEJ00yyYZQ=', 1, 0, 'Göttingen', 'de', 0, 0, 10, NULL, 'de', '{"detailView":"Control Shift BracketRight","help":"Shift Minus","nextItem":"Control ArrowDown","nextItemMulti":"Control Shift ArrowDown","previousItem":"Control ArrowUp","previousItemMulti":"Control Shift ArrowUp","structuredView":"Control Shift Slash"}'),
	(4, 'test', 'Imaging', 'testImaging', NULL, 'OvEJ00yyYZQ=', 1, 0, 'Göttingen', 'de', 0, 0, 10, NULL, 'de', '{"detailView":"Control Shift BracketRight","help":"Shift Minus","nextItem":"Control ArrowDown","nextItemMulti":"Control Shift ArrowDown","previousItem":"Control ArrowUp","previousItemMulti":"Control Shift ArrowUp","structuredView":"Control Shift Slash"}'),
	(5, 'test', 'MetaData', 'testMetaData', NULL, 'OvEJ00yyYZQ=', 1, 0, 'Göttingen', 'de', 0, 0, 10, NULL, 'de', '{"detailView":"Control Shift BracketRight","help":"Shift Minus","nextItem":"Control ArrowDown","nextItemMulti":"Control Shift ArrowDown","previousItem":"Control ArrowUp","previousItemMulti":"Control Shift ArrowUp","structuredView":"Control Shift Slash"}'),
	(6, 'test', 'Projectmanagement', 'testProjectmanagement', NULL, 'OvEJ00yyYZQ=', 1, 0, 'Göttingen', 'de', 0, 0, 10, NULL, 'de', '{"detailView":"Control Shift BracketRight","help":"Shift Minus","nextItem":"Control ArrowDown","nextItemMulti":"Control Shift ArrowDown","previousItem":"Control ArrowUp","previousItemMulti":"Control Shift ArrowUp","structuredView":"Control Shift Slash"}');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.user_x_role
CREATE TABLE IF NOT EXISTS `user_x_role` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_BenutzerGruppenID` (`role_id`),
  KEY `FK_BenutzerID` (`user_id`),
  CONSTRAINT `FK_user_x_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_user_x_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.user_x_role: ~8 rows (ungefähr)
DELETE FROM `user_x_role`;
/*!40000 ALTER TABLE `user_x_role` DISABLE KEYS */;
INSERT INTO `user_x_role` (`role_id`, `user_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(8, 1),
	(16, 6);
/*!40000 ALTER TABLE `user_x_role` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.workflow
CREATE TABLE IF NOT EXISTS `workflow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indexAction` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `separateStructure` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `FK_workflow_client_id` (`client_id`),
  CONSTRAINT `FK_workflow_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.workflow: ~2 rows (ungefähr)
DELETE FROM `workflow`;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
INSERT INTO `workflow` (`id`, `title`, `status`, `indexAction`, `client_id`, `separateStructure`) VALUES
	(1, 'Example_Workflow', 'ACTIVE', 'DONE', 1, 0),
	(2, 'OCR_Workflow', 'ACTIVE', 'DONE', 1, 0);
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.workflowcondition
CREATE TABLE IF NOT EXISTS `workflowcondition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.workflowcondition: ~0 rows (ungefähr)
DELETE FROM `workflowcondition`;
/*!40000 ALTER TABLE `workflowcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowcondition` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle kitodo.workpiece_x_property
CREATE TABLE IF NOT EXISTS `workpiece_x_property` (
  `process_id` int NOT NULL,
  `property_id` int NOT NULL,
  KEY `FK_workpiece_x_property_workpiece_id` (`process_id`),
  KEY `FK_workpiece_x_property_property_id` (`property_id`),
  CONSTRAINT `FK_workpiece_x_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  CONSTRAINT `FK_workpiece_x_property_workpiece_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle kitodo.workpiece_x_property: ~18 rows (ungefähr)
DELETE FROM `workpiece_x_property`;
/*!40000 ALTER TABLE `workpiece_x_property` DISABLE KEYS */;
INSERT INTO `workpiece_x_property` (`process_id`, `property_id`) VALUES
	(3, 23),
	(3, 24),
	(3, 25),
	(3, 26),
	(3, 27),
	(3, 28),
	(3, 29),
	(3, 30),
	(3, 31),
	(3, 32),
	(3, 33),
	(3, 34),
	(3, 35),
	(3, 36),
	(3, 37),
	(3, 38),
	(3, 39),
	(3, 40);
/*!40000 ALTER TABLE `workpiece_x_property` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
