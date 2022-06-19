# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20033
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: localhost (MySQL 5.7.38)
# 数据库: lemon
# 生成时间: 2022-06-19 04:32:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;




# 转储表 casbin_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `casbin_rule`;

CREATE TABLE `casbin_rule` (
  `p_type` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;

INSERT INTO `casbin_rule` (`p_type`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`)
VALUES
	('p','8881','/base/login','POST','','',''),
	('p','8881','/user/register','POST','','',''),
	('p','8881','/api/createApi','POST','','',''),
	('p','8881','/api/getApiList','POST','','',''),
	('p','8881','/api/getApiById','POST','','',''),
	('p','8881','/api/deleteApi','POST','','',''),
	('p','8881','/api/updateApi','POST','','',''),
	('p','8881','/api/getAllApis','POST','','',''),
	('p','8881','/authority/createAuthority','POST','','',''),
	('p','8881','/authority/deleteAuthority','POST','','',''),
	('p','8881','/authority/getAuthorityList','POST','','',''),
	('p','8881','/authority/setDataAuthority','POST','','',''),
	('p','8881','/menu/getMenu','POST','','',''),
	('p','8881','/menu/getMenuList','POST','','',''),
	('p','8881','/menu/addBaseMenu','POST','','',''),
	('p','8881','/menu/getBaseMenuTree','POST','','',''),
	('p','8881','/menu/addMenuAuthority','POST','','',''),
	('p','8881','/menu/getMenuAuthority','POST','','',''),
	('p','8881','/menu/deleteBaseMenu','POST','','',''),
	('p','8881','/menu/updateBaseMenu','POST','','',''),
	('p','8881','/menu/getBaseMenuById','POST','','',''),
	('p','8881','/user/changePassword','POST','','',''),
	('p','8881','/user/getUserList','POST','','',''),
	('p','8881','/user/setUserAuthority','POST','','',''),
	('p','8881','/casbin/updateCasbin','POST','','',''),
	('p','8881','/casbin/getPolicyPathByAuthorityId','POST','','',''),
	('p','8881','/jwt/jsonInBlacklist','POST','','',''),
	('p','8881','/user/getUserInfo','GET','','',''),
	('p','9528','/base/login','POST','','',''),
	('p','9528','/user/register','POST','','',''),
	('p','9528','/api/createApi','POST','','',''),
	('p','9528','/api/getApiList','POST','','',''),
	('p','9528','/api/getApiById','POST','','',''),
	('p','9528','/api/deleteApi','POST','','',''),
	('p','9528','/api/updateApi','POST','','',''),
	('p','9528','/api/getAllApis','POST','','',''),
	('p','9528','/authority/createAuthority','POST','','',''),
	('p','9528','/authority/deleteAuthority','POST','','',''),
	('p','9528','/authority/getAuthorityList','POST','','',''),
	('p','9528','/authority/setDataAuthority','POST','','',''),
	('p','9528','/menu/getMenu','POST','','',''),
	('p','9528','/menu/getMenuList','POST','','',''),
	('p','9528','/menu/addBaseMenu','POST','','',''),
	('p','9528','/menu/getBaseMenuTree','POST','','',''),
	('p','9528','/menu/addMenuAuthority','POST','','',''),
	('p','9528','/menu/getMenuAuthority','POST','','',''),
	('p','9528','/menu/deleteBaseMenu','POST','','',''),
	('p','9528','/menu/updateBaseMenu','POST','','',''),
	('p','9528','/menu/getBaseMenuById','POST','','',''),
	('p','9528','/user/changePassword','POST','','',''),
	('p','9528','/user/getUserList','POST','','',''),
	('p','9528','/user/setUserAuthority','POST','','',''),
	('p','9528','/casbin/updateCasbin','POST','','',''),
	('p','9528','/casbin/getPolicyPathByAuthorityId','POST','','',''),
	('p','9528','/jwt/jsonInBlacklist','POST','','',''),
	('p','9528','/user/getUserInfo','GET','','',''),
	('p','888','/base/login','POST','','',''),
	('p','888','/jwt/jsonInBlacklist','POST','','',''),
	('p','888','/user/deleteUser','DELETE','','',''),
	('p','888','/user/register','POST','','',''),
	('p','888','/user/getUserList','POST','','',''),
	('p','888','/user/setUserInfo','PUT','','',''),
	('p','888','/user/setSelfInfo','PUT','','',''),
	('p','888','/user/getUserInfo','GET','','',''),
	('p','888','/user/setUserAuthorities','POST','','',''),
	('p','888','/user/changePassword','POST','','',''),
	('p','888','/user/setUserAuthority','POST','','',''),
	('p','888','/user/resetPassword','POST','','',''),
	('p','888','/api/createApi','POST','','',''),
	('p','888','/api/deleteApi','POST','','',''),
	('p','888','/api/updateApi','POST','','',''),
	('p','888','/api/getApiList','POST','','',''),
	('p','888','/api/getAllApis','POST','','',''),
	('p','888','/api/getApiById','POST','','',''),
	('p','888','/api/deleteApisByIds','DELETE','','',''),
	('p','888','/authority/copyAuthority','POST','','',''),
	('p','888','/authority/createAuthority','POST','','',''),
	('p','888','/authority/deleteAuthority','POST','','',''),
	('p','888','/authority/updateAuthority','PUT','','',''),
	('p','888','/authority/getAuthorityList','POST','','',''),
	('p','888','/authority/setDataAuthority','POST','','',''),
	('p','888','/casbin/updateCasbin','POST','','',''),
	('p','888','/casbin/getPolicyPathByAuthorityId','POST','','',''),
	('p','888','/menu/addBaseMenu','POST','','',''),
	('p','888','/menu/getMenu','POST','','',''),
	('p','888','/menu/deleteBaseMenu','POST','','',''),
	('p','888','/menu/updateBaseMenu','POST','','',''),
	('p','888','/menu/getBaseMenuById','POST','','',''),
	('p','888','/menu/getMenuList','POST','','',''),
	('p','888','/menu/getBaseMenuTree','POST','','',''),
	('p','888','/menu/getMenuAuthority','POST','','',''),
	('p','888','/menu/addMenuAuthority','POST','','',''),
	('p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','',''),
	('p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','',''),
	('p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','',''),
	('p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','',''),
	('p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','',''),
	('p','888','/sysDictionary/createSysDictionary','POST','','',''),
	('p','888','/sysDictionary/deleteSysDictionary','DELETE','','',''),
	('p','888','/sysDictionary/updateSysDictionary','PUT','','',''),
	('p','888','/sysDictionary/findSysDictionary','GET','','',''),
	('p','888','/sysDictionary/getSysDictionaryList','GET','','',''),
	('p','888','/sysOperationRecord/createSysOperationRecord','POST','','',''),
	('p','888','/sysOperationRecord/findSysOperationRecord','GET','','',''),
	('p','888','/sysOperationRecord/getSysOperationRecordList','GET','','',''),
	('p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),
	('p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),
	('p','888','/authorityBtn/setAuthorityBtn','POST','','',''),
	('p','888','/authorityBtn/getAuthorityBtn','POST','','',''),
	('p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','',''),
	('p','888','/testcase/createTestCase','POST','','',''),
	('p','888','/testcase/getTestCase','GET','','',''),
	('p','888','/testcase/runTestCase','GET','','',''),
	('p','888','/testcase/getTestCaseList','GET','','',''),
	('p','888','/testcase/updateTestCase','PUT','','',''),
	('p','888','/testcase/deleteTestCaseByIds','DELETE','','',''),
	('p','888','/testcase/deleteTestCase','DELETE','','',''),
	('p','888','/testcase/deleteTestStepByIds','DELETE','','',''),
	('p','888','/testcase/deleteTestStep','DELETE','','',''),
	('p','888','/testcase/debug','GET','','',''),
	('p','888','/config/createConfig','POST','','',''),
	('p','888','/config/getConfigById','GET','','',''),
	('p','888','/config/getConfigList','POST','','',''),
	('p','888','/config/deleteConfig','DELETE','','',''),
	('p','888','/config/deleteConfigByIds','DELETE','','',''),
	('p','888','/config/updateConfig','PUT','','',''),
	('p','888','/config/getAllConfig','GET','','','');

/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `configs`;

CREATE TABLE `configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '配置名称',
  `base_url` varchar(200) DEFAULT NULL COMMENT '全局URL',
  `variables` json DEFAULT NULL COMMENT '全局变量',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_configs_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;

INSERT INTO `configs` (`id`, `name`, `base_url`, `variables`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'demo with complex mechanisms','https://postman-echo.com','{\"a\": \"${sum(10, 2.3)}\", \"b\": 3.45, \"n\": \"${sum_ints(1, 2, 2)}\", \"varFoo1\": \"${gen_random_string($n)}\", \"varFoo2\": \"${max($a, $b)}\"}','2022-03-02 15:43:54.487','2022-03-02 15:43:54.487',NULL),
	(2,'test1','https://postman-echo.com','{\"a\": \"1\", \"b\": 2}','2022-04-01 15:40:38.282','2022-04-01 15:47:43.605',NULL),
	(4,'demo','demo.com','{\"a\": \"1\", \"b\": 2.23, \"c\": \"2\"}','2022-04-01 16:13:45.774','2022-06-18 07:29:54.112',NULL);

/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 jwt_blacklists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jwt_blacklists`;

CREATE TABLE `jwt_blacklists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jwt` text COMMENT 'jwt',
  PRIMARY KEY (`id`),
  KEY `idx_jwt_blacklists_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `jwt_blacklists` WRITE;
/*!40000 ALTER TABLE `jwt_blacklists` DISABLE KEYS */;

INSERT INTO `jwt_blacklists` (`id`, `created_at`, `updated_at`, `deleted_at`, `jwt`)
VALUES
	(6,'2022-04-20 14:23:25.227','2022-04-20 14:23:25.227',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1MTA0MDAzOCwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjUwNDM0MjM4fQ.46VXbXLtEDNknrmsAPHirYkn6uEAbUQ0ouZI3Ix-nI4'),
	(7,'2022-04-26 14:43:05.629','2022-04-26 14:43:05.629',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1MTA0NDkwMiwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjUwNDM5MTAyfQ.ONh2un3A_22rqz8aFCj3HsvcNIw-bttn6jWWckweCJ4'),
	(8,'2022-06-18 07:30:14.749','2022-06-18 07:30:14.749',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1NTczOTEwNiwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjU1MTMzMzA2fQ.6FAxxZnPcpeDf5nO974tqmcpRrwlh99N1JYMm9_BygI'),
	(9,'2022-06-18 07:52:48.299','2022-06-18 07:52:48.299',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1NjExNDc2MiwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjU1NTA4OTYyfQ.RduKNzYRwjNGu8IL3MSgZCaYoYmBXipy7jS9w4XxeaA'),
	(10,'2022-06-19 08:44:53.099','2022-06-19 08:44:53.099',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1NjIwNDE5NiwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjU1NTk4Mzk2fQ.xOq3_S_V7hJ8RTQzdwIoNqeaxBpNASm4tCCqkXPjNXw'),
	(11,'2022-06-19 08:55:05.312','2022-06-19 08:55:05.312',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1NjIwNDMwMywiaXNzIjoicW1QbHVzIiwibmJmIjoxNjU1NTk4NTAzfQ.z-BuIeEW1gFzIzudQ543oGoQ0FBo_YFsfgmnD5tOlPo'),
	(12,'2022-06-19 09:14:49.038','2022-06-19 09:14:49.038',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1NjIwNDkxMywiaXNzIjoicW1QbHVzIiwibmJmIjoxNjU1NTk5MTEzfQ.e3Q_BX9Ry_BPyenl6hMgdp5JQgYszm6OC3vgnxN_AWo'),
	(13,'2022-06-19 09:40:16.090','2022-06-19 09:40:16.090',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1NjIwNjExMSwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjU1NjAwMzExfQ.VC6f2NWqSK6O0RRZNpUXZlFVprvu0UK22jF2dRLBQTY'),
	(14,'2022-06-19 09:51:03.785','2022-06-19 09:51:03.785',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNzQ0NWMxMGItNjg0NC00MTEyLWFjODUtZjFjYmJiYzRmYTNjIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1NjIwNzYyMiwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjU1NjAxODIyfQ.ka9FS3JH_3x6p_24pEytY_Im91d582LbECc9XEhr5zg');

/*!40000 ALTER TABLE `jwt_blacklists` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_apis
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_apis`;

CREATE TABLE `sys_apis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`),
  KEY `idx_sys_apis_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_apis` WRITE;
/*!40000 ALTER TABLE `sys_apis` DISABLE KEYS */;

INSERT INTO `sys_apis` (`id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method`)
VALUES
	(1,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/base/login','用户登录(必选)','base','POST'),
	(2,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/jwt/jsonInBlacklist','jwt加入黑名单(退出，必选)','jwt','POST'),
	(3,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/deleteUser','删除用户','系统用户','DELETE'),
	(4,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/register','用户注册','系统用户','POST'),
	(5,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/getUserList','获取用户列表','系统用户','POST'),
	(6,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/setUserInfo','设置用户信息','系统用户','PUT'),
	(7,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/setSelfInfo','设置自身信息(必选)','系统用户','PUT'),
	(8,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/getUserInfo','获取自身信息(必选)','系统用户','GET'),
	(9,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/setUserAuthorities','设置权限组','系统用户','POST'),
	(10,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/changePassword','修改密码（建议选择)','系统用户','POST'),
	(11,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/setUserAuthority','修改用户角色(必选)','系统用户','POST'),
	(12,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/user/resetPassword','重置用户密码','系统用户','POST'),
	(13,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/api/createApi','创建api','api','POST'),
	(14,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/api/deleteApi','删除Api','api','POST'),
	(15,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/api/updateApi','更新Api','api','POST'),
	(16,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/api/getApiList','获取api列表','api','POST'),
	(17,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/api/getAllApis','获取所有api','api','POST'),
	(18,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/api/getApiById','获取api详细信息','api','POST'),
	(19,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/api/deleteApisByIds','批量删除api','api','DELETE'),
	(20,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authority/copyAuthority','拷贝角色','角色','POST'),
	(21,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authority/createAuthority','创建角色','角色','POST'),
	(22,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authority/deleteAuthority','删除角色','角色','POST'),
	(23,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authority/updateAuthority','更新角色信息','角色','PUT'),
	(24,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authority/getAuthorityList','获取角色列表','角色','POST'),
	(25,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authority/setDataAuthority','设置角色资源权限','角色','POST'),
	(26,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/casbin/updateCasbin','更改角色api权限','casbin','POST'),
	(27,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/casbin/getPolicyPathByAuthorityId','获取权限列表','casbin','POST'),
	(28,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/addBaseMenu','新增菜单','菜单','POST'),
	(29,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/getMenu','获取菜单树(必选)','菜单','POST'),
	(30,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/deleteBaseMenu','删除菜单','菜单','POST'),
	(31,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/updateBaseMenu','更新菜单','菜单','POST'),
	(32,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/getBaseMenuById','根据id获取菜单','菜单','POST'),
	(33,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/getMenuList','分页获取基础menu列表','菜单','POST'),
	(34,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/getBaseMenuTree','获取用户动态路由','菜单','POST'),
	(35,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/getMenuAuthority','获取指定角色menu','菜单','POST'),
	(36,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/menu/addMenuAuthority','增加menu和角色关联关系','菜单','POST'),
	(37,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:07.871','/fileUploadAndDownload/findFile','寻找目标文件（秒传）','分片上传','POST'),
	(38,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:34.434','/fileUploadAndDownload/breakpointContinue','断点续传','分片上传','POST'),
	(39,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:36.948','/fileUploadAndDownload/breakpointContinueFinish','断点续传完成','分片上传','POST'),
	(40,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:32.667','/fileUploadAndDownload/removeChunk','上传完成移除文件','分片上传','POST'),
	(41,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:20.798','/fileUploadAndDownload/upload','文件上传示例','文件上传与下载','POST'),
	(42,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:49:54.638','/fileUploadAndDownload/deleteFile','删除文件','文件上传与下载','POST'),
	(43,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:49:57.079','/fileUploadAndDownload/getFileList','获取上传文件列表','文件上传与下载','POST'),
	(44,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:50:07.854','/system/getServerInfo','获取服务器信息','系统服务','POST'),
	(45,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:50:12.317','/system/getSystemConfig','获取配置文件内容','系统服务','POST'),
	(46,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:50:14.510','/system/setSystemConfig','设置配置文件内容','系统服务','POST'),
	(47,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:45:36.604','/customer/customer','更新客户','客户','PUT'),
	(48,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:45:40.407','/customer/customer','创建客户','客户','POST'),
	(49,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:45:57.057','/customer/customer','删除客户','客户','DELETE'),
	(50,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:46:00.210','/customer/customer','获取单一客户','客户','GET'),
	(51,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:46:02.284','/customer/customerList','获取客户列表','客户','GET'),
	(52,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:46:39.672','/autoCode/getDB','获取所有数据库','代码生成器','GET'),
	(53,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:46:47.315','/autoCode/getTables','获取数据库表','代码生成器','GET'),
	(54,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:46:50.219','/autoCode/createTemp','自动化代码','代码生成器','POST'),
	(55,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:46:52.381','/autoCode/preview','预览自动化代码','代码生成器','POST'),
	(56,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:46:54.395','/autoCode/getColumn','获取所选table的所有字段','代码生成器','GET'),
	(57,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:49:22.880','/autoCode/getMeta','获取meta信息','代码生成器历史','POST'),
	(58,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:47:51.627','/autoCode/rollback','回滚自动生成代码','代码生成器历史','POST'),
	(59,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:49:29.142','/autoCode/getSysHistory','查询回滚记录','代码生成器历史','POST'),
	(60,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:55.557','/autoCode/delSysHistory','删除回滚记录','代码生成器历史','POST'),
	(61,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionaryDetail/updateSysDictionaryDetail','更新字典内容','系统字典详情','PUT'),
	(62,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionaryDetail/createSysDictionaryDetail','新增字典内容','系统字典详情','POST'),
	(63,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionaryDetail/deleteSysDictionaryDetail','删除字典内容','系统字典详情','DELETE'),
	(64,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionaryDetail/findSysDictionaryDetail','根据ID获取字典内容','系统字典详情','GET'),
	(65,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionaryDetail/getSysDictionaryDetailList','获取字典内容列表','系统字典详情','GET'),
	(66,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionary/createSysDictionary','新增字典','系统字典','POST'),
	(67,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionary/deleteSysDictionary','删除字典','系统字典','DELETE'),
	(68,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionary/updateSysDictionary','更新字典','系统字典','PUT'),
	(69,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionary/findSysDictionary','根据ID获取字典','系统字典','GET'),
	(70,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysDictionary/getSysDictionaryList','获取字典列表','系统字典','GET'),
	(71,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysOperationRecord/createSysOperationRecord','新增操作记录','操作记录','POST'),
	(72,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysOperationRecord/findSysOperationRecord','根据ID获取操作记录','操作记录','GET'),
	(73,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysOperationRecord/getSysOperationRecordList','获取操作记录列表','操作记录','GET'),
	(74,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysOperationRecord/deleteSysOperationRecord','删除操作记录','操作记录','DELETE'),
	(75,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/sysOperationRecord/deleteSysOperationRecordByIds','批量删除操作历史','操作记录','DELETE'),
	(76,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:17.867','/simpleUploader/upload','插件版分片上传','断点续传(插件版)','POST'),
	(77,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:23.538','/simpleUploader/checkFileMd5','文件完整度验证','断点续传(插件版)','GET'),
	(78,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:44.755','/simpleUploader/mergeFileMd5','上传完成合并文件','断点续传(插件版)','GET'),
	(79,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:00.620','/email/emailTest','发送测试邮件','email','POST'),
	(80,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:48:03.357','/email/emailSend','发送邮件示例','email','POST'),
	(81,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:47:07.687','/excel/importExcel','导入excel','excel','POST'),
	(82,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:47:09.661','/excel/loadExcel','下载excel','excel','GET'),
	(83,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:47:11.420','/excel/exportExcel','导出excel','excel','POST'),
	(84,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506','2022-04-08 15:47:13.587','/excel/downloadTemplate','下载excel模板','excel','GET'),
	(85,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authorityBtn/setAuthorityBtn','设置按钮权限','按钮权限','POST'),
	(86,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authorityBtn/getAuthorityBtn','获取已有按钮权限','按钮权限','POST'),
	(87,'2022-02-23 17:57:43.506','2022-02-23 17:57:43.506',NULL,'/authorityBtn/canRemoveAuthorityBtn','删除按钮','按钮权限','POST'),
	(88,'2022-01-12 11:23:34.685','2022-01-12 11:23:34.685',NULL,'/testcase/createTestCase','新增测试用例集','testcase','POST'),
	(89,'2022-01-19 09:47:09.952','2022-01-19 09:47:09.952',NULL,'/testcase/getTestCase','获取testcase通过ID','testcase','GET'),
	(90,'2022-01-19 09:48:01.396','2022-01-19 09:48:01.396',NULL,'/config/createConfig','新增配置文件','config','POST'),
	(91,'2022-01-19 09:55:25.074','2022-01-19 09:55:25.074',NULL,'/config/getConfigById','通过ID获取配置文件信息','config','GET'),
	(92,'2022-01-19 14:47:07.359','2022-01-19 14:47:07.359',NULL,'/testcase/runTestCase','运行测试','testcase','GET'),
	(93,'2022-01-29 16:45:32.014','2022-06-18 07:29:35.158',NULL,'/config/getConfigList','获取config列表','config','POST'),
	(94,'2022-02-14 17:31:11.102','2022-02-14 17:31:11.102',NULL,'/testcase/getTestCaseList','获取用例列表','testcase','GET'),
	(95,'2022-02-16 15:16:41.629','2022-02-16 15:16:41.629',NULL,'/testcase/updateTestCase','更新用例','testcase','PUT'),
	(96,'2022-02-17 16:26:26.334','2022-02-17 16:26:26.334',NULL,'/config/deleteConfig','删除config','config','DELETE'),
	(97,'2022-02-17 16:26:59.950','2022-02-17 16:26:59.950',NULL,'/config/deleteConfigByIds','通过ID批量删除','config','DELETE'),
	(98,'2022-02-17 17:20:26.408','2022-02-17 17:20:26.408',NULL,'/testcase/deleteTestCaseByIds','批量删除用例','testcase','DELETE'),
	(99,'2022-02-17 17:21:05.244','2022-02-17 17:21:05.244',NULL,'/testcase/deleteTestCase','删除用例','testcase','DELETE'),
	(100,'2022-02-17 17:21:36.650','2022-02-17 17:21:36.650',NULL,'/testcase/deleteTestStepByIds','批量删除测试步骤','testcase','DELETE'),
	(101,'2022-02-17 17:22:00.420','2022-02-17 17:22:00.420',NULL,'/testcase/deleteTestStep','删除步骤','testcase','DELETE'),
	(102,'2022-02-21 17:12:33.830','2022-02-21 17:12:33.830',NULL,'/config/updateConfig','更新配置信息','config','PUT'),
	(103,'2022-03-09 16:10:29.686','2022-03-09 16:10:29.686',NULL,'/config/getAllConfig','获取所有配置信息','config','GET'),
	(104,'2022-04-11 10:51:29.426','2022-04-11 10:51:29.426',NULL,'/testcase/debug','debug case','testcase','GET');

/*!40000 ALTER TABLE `sys_apis` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_authorities`;

CREATE TABLE `sys_authorities` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `authority_id` varchar(90) NOT NULL COMMENT '角色ID',
  `authority_name` varchar(191) DEFAULT NULL COMMENT '角色名',
  `parent_id` varchar(191) DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `authority_id` (`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_authorities` WRITE;
/*!40000 ALTER TABLE `sys_authorities` DISABLE KEYS */;

INSERT INTO `sys_authorities` (`created_at`, `updated_at`, `deleted_at`, `authority_id`, `authority_name`, `parent_id`, `default_router`)
VALUES
	('2022-02-23 17:57:43.596','2022-04-08 15:39:54.259',NULL,'888','普通用户','0','testcase'),
	('2022-02-23 17:57:43.596','2022-02-23 17:57:43.596',NULL,'8881','普通用户子角色','888','testcase'),
	('2022-02-23 17:57:43.596','2022-02-23 17:57:43.596',NULL,'9528','测试角色','0','testcase');

/*!40000 ALTER TABLE `sys_authorities` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_authority_btns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_authority_btns`;

CREATE TABLE `sys_authority_btns` (
  `authority_id` varchar(191) DEFAULT NULL,
  `sys_menu_id` bigint(20) unsigned DEFAULT NULL,
  `sys_base_menu_btn_id` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 sys_authority_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_authority_menus`;

CREATE TABLE `sys_authority_menus` (
  `sys_base_menu_id` bigint(20) unsigned NOT NULL,
  `sys_authority_authority_id` varchar(90) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_authority_menus` WRITE;
/*!40000 ALTER TABLE `sys_authority_menus` DISABLE KEYS */;

INSERT INTO `sys_authority_menus` (`sys_base_menu_id`, `sys_authority_authority_id`)
VALUES
	(3,'888'),
	(3,'9528'),
	(4,'888'),
	(4,'9528'),
	(5,'888'),
	(5,'9528'),
	(6,'888'),
	(6,'9528'),
	(7,'888'),
	(7,'9528'),
	(18,'888'),
	(19,'888'),
	(20,'888'),
	(26,'888'),
	(27,'888');

/*!40000 ALTER TABLE `sys_authority_menus` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_auto_code_histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_auto_code_histories`;

CREATE TABLE `sys_auto_code_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `table_name` varchar(191) DEFAULT NULL,
  `request_meta` text,
  `auto_code_path` text,
  `injection_meta` text,
  `struct_name` varchar(191) DEFAULT NULL,
  `struct_cn_name` varchar(191) DEFAULT NULL,
  `api_ids` varchar(191) DEFAULT NULL,
  `flag` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_code_histories_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 sys_base_menu_btns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_base_menu_btns`;

CREATE TABLE `sys_base_menu_btns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) DEFAULT NULL,
  `sys_base_menu_id` bigint(20) unsigned DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_btns_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 sys_base_menu_parameters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_base_menu_parameters`;

CREATE TABLE `sys_base_menu_parameters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sys_base_menu_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_parameters_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 sys_base_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_base_menus`;

CREATE TABLE `sys_base_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `menu_level` bigint(20) unsigned DEFAULT NULL,
  `parent_id` varchar(191) DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序标记',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `default_menu` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `title` varchar(191) DEFAULT NULL COMMENT '附加属性',
  `icon` varchar(191) DEFAULT NULL COMMENT '附加属性',
  `close_tab` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menus_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_base_menus` WRITE;
/*!40000 ALTER TABLE `sys_base_menus` DISABLE KEYS */;

INSERT INTO `sys_base_menus` (`id`, `created_at`, `updated_at`, `deleted_at`, `menu_level`, `parent_id`, `path`, `name`, `hidden`, `component`, `sort`, `keep_alive`, `default_menu`, `title`, `icon`, `close_tab`)
VALUES
	(3,'2022-02-23 17:57:43.589','2022-02-23 17:57:43.589',NULL,0,'0','admin','superAdmin',0,'view/superAdmin/index.vue',3,0,0,'超级管理员','user',0),
	(4,'2022-02-23 17:57:43.589','2022-02-23 17:57:43.589',NULL,0,'3','authority','authority',0,'view/superAdmin/authority/authority.vue',1,0,0,'角色管理','avatar',0),
	(5,'2022-02-23 17:57:43.589','2022-02-23 17:57:43.589',NULL,0,'3','menu','menu',0,'view/superAdmin/menu/menu.vue',2,1,0,'菜单管理','tickets',0),
	(6,'2022-02-23 17:57:43.589','2022-02-23 17:57:43.589',NULL,0,'3','api','api',0,'view/superAdmin/api/api.vue',3,1,0,'api管理','platform',0),
	(7,'2022-02-23 17:57:43.589','2022-02-23 17:57:43.589',NULL,0,'3','user','user',0,'view/superAdmin/user/user.vue',4,0,0,'用户管理','coordinate',0),
	(18,'2022-02-23 17:57:43.589','2022-02-23 17:57:43.589',NULL,0,'3','dictionary','dictionary',0,'view/superAdmin/dictionary/sysDictionary.vue',5,0,0,'字典管理','notebook',0),
	(19,'2022-02-23 17:57:43.589','2022-06-19 09:45:59.107',NULL,0,'3','dictionaryDetail/:id','dictionaryDetail',1,'view/superAdmin/dictionary/sysDictionaryDetail.vue',1,0,0,'字典详情','notebook',0),
	(20,'2022-02-23 17:57:43.589','2022-02-23 17:57:43.589',NULL,0,'3','operation','operation',0,'view/superAdmin/operation/sysOperationRecord.vue',6,0,0,'操作历史','pie-chart',0),
	(26,'2022-03-02 15:11:26.697','2022-03-02 15:11:26.697',NULL,0,'0','config','config',0,'view/config/index.vue',25,0,0,'配置管理','setting',0),
	(27,'2022-03-02 15:13:37.322','2022-06-13 22:09:40.290',NULL,0,'0','testcase','testcase',0,'view/testcase/index.vue',26,0,0,'接口管理','grid',1);

/*!40000 ALTER TABLE `sys_base_menus` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_data_authority_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_data_authority_id`;

CREATE TABLE `sys_data_authority_id` (
  `sys_authority_authority_id` varchar(90) NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` varchar(90) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`,`data_authority_id_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_data_authority_id` WRITE;
/*!40000 ALTER TABLE `sys_data_authority_id` DISABLE KEYS */;

INSERT INTO `sys_data_authority_id` (`sys_authority_authority_id`, `data_authority_id_authority_id`)
VALUES
	('888','888'),
	('888','8881'),
	('888','9528'),
	('9528','8881'),
	('9528','9528');

/*!40000 ALTER TABLE `sys_data_authority_id` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_dictionaries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dictionaries`;

CREATE TABLE `sys_dictionaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;

INSERT INTO `sys_dictionaries` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type`, `status`, `desc`)
VALUES
	(1,'2022-02-23 17:57:43.605','2022-02-23 17:57:43.605',NULL,'性别','gender',1,'性别字典'),
	(2,'2022-02-23 17:57:43.605','2022-02-23 17:57:43.605',NULL,'数据库int类型','int',1,'int类型对应的数据库类型'),
	(3,'2022-02-23 17:57:43.605','2022-02-23 17:57:43.605',NULL,'数据库时间日期类型','time.Time',1,'数据库时间日期类型'),
	(4,'2022-02-23 17:57:43.605','2022-02-23 17:57:43.605',NULL,'数据库浮点型','float64',1,'数据库浮点型'),
	(5,'2022-02-23 17:57:43.605','2022-02-23 17:57:43.605',NULL,'数据库字符串','string',1,'数据库字符串'),
	(6,'2022-02-23 17:57:43.605','2022-02-23 17:57:43.605',NULL,'数据库bool类型','bool',1,'数据库bool类型');

/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_dictionary_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dictionary_details`;

CREATE TABLE `sys_dictionary_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(191) DEFAULT NULL COMMENT '展示值',
  `value` bigint(20) DEFAULT NULL COMMENT '字典值',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联标记',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_dictionary_details` WRITE;
/*!40000 ALTER TABLE `sys_dictionary_details` DISABLE KEYS */;

INSERT INTO `sys_dictionary_details` (`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `value`, `status`, `sort`, `sys_dictionary_id`)
VALUES
	(1,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'男',1,1,1,1),
	(2,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'女',2,1,2,1),
	(3,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'smallint',1,1,1,2),
	(4,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'mediumint',2,1,2,2),
	(5,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'int',3,1,3,2),
	(6,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'bigint',4,1,4,2),
	(7,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'date',0,1,0,3),
	(8,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'time',1,1,1,3),
	(9,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'year',2,1,2,3),
	(10,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'datetime',3,1,3,3),
	(11,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'timestamp',5,1,5,3),
	(12,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'float',0,1,0,4),
	(13,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'double',1,1,1,4),
	(14,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'decimal',2,1,2,4),
	(15,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'char',0,1,0,5),
	(16,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'varchar',1,1,1,5),
	(17,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'tinyblob',2,1,2,5),
	(18,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'tinytext',3,1,3,5),
	(19,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'text',4,1,4,5),
	(20,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'blob',5,1,5,5),
	(21,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'mediumblob',6,1,6,5),
	(22,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'mediumtext',7,1,7,5),
	(23,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'longblob',8,1,8,5),
	(24,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'longtext',9,1,9,5),
	(25,'2022-02-23 17:57:43.685','2022-02-23 17:57:43.685',NULL,'tinyint',0,1,0,6);

/*!40000 ALTER TABLE `sys_dictionary_details` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_operation_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_operation_records`;

CREATE TABLE `sys_operation_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `ip` varchar(191) DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) DEFAULT NULL COMMENT '请求路径',
  `status` bigint(20) DEFAULT NULL COMMENT '请求状态',
  `latency` bigint(20) DEFAULT NULL COMMENT '延迟',
  `agent` varchar(191) DEFAULT NULL COMMENT '代理',
  `error_message` varchar(191) DEFAULT NULL COMMENT '错误信息',
  `body` text COMMENT '请求Body',
  `resp` text COMMENT '响应Body',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sys_operation_records_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 sys_user_authority
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_authority`;

CREATE TABLE `sys_user_authority` (
  `sys_user_id` bigint(20) unsigned NOT NULL,
  `sys_authority_authority_id` varchar(90) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_user_authority` WRITE;
/*!40000 ALTER TABLE `sys_user_authority` DISABLE KEYS */;

INSERT INTO `sys_user_authority` (`sys_user_id`, `sys_authority_authority_id`)
VALUES
	(1,'888'),
	(1,'8881'),
	(1,'9528'),
	(2,'888');

/*!40000 ALTER TABLE `sys_user_authority` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_users`;

CREATE TABLE `sys_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uuid` varchar(191) DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) DEFAULT '系统用户' COMMENT '用户昵称',
  `side_mode` varchar(191) DEFAULT 'dark' COMMENT '用户侧边主题',
  `header_img` varchar(191) DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `base_color` varchar(191) DEFAULT '#fff' COMMENT '基础颜色',
  `active_color` varchar(191) DEFAULT '#1890ff' COMMENT '活跃颜色',
  `authority_id` varchar(191) DEFAULT '888' COMMENT '用户角色ID',
  `phone` varchar(191) DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(191) DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`id`),
  KEY `idx_sys_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_users` WRITE;
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;

INSERT INTO `sys_users` (`id`, `created_at`, `updated_at`, `deleted_at`, `uuid`, `username`, `password`, `nick_name`, `side_mode`, `header_img`, `base_color`, `active_color`, `authority_id`, `phone`, `email`)
VALUES
	(1,'2022-02-23 17:57:43.574','2022-04-07 16:52:56.813',NULL,'7445c10b-6844-4112-ac85-f1cbbbc4fa3c','admin','e10adc3949ba59abbe56e057f20f883e','超级管理员','dark','','#fff','#1890ff','888','',''),
	(2,'2022-02-23 17:57:43.574','2022-02-23 17:57:43.574',NULL,'ce404d29-be73-42e3-b7f7-758ee983d84d','lemon','3f24e567591e9cbab2a7d2f1f748a1d4','测试账号','dark','','#fff','#1890ff','9528','','');

/*!40000 ALTER TABLE `sys_users` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 test_case_step
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test_case_step`;

CREATE TABLE `test_case_step` (
  `test_case_id` bigint(20) unsigned NOT NULL,
  `test_step_step_id` bigint(20) unsigned NOT NULL COMMENT '测试步骤ID',
  PRIMARY KEY (`test_case_id`,`test_step_step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `test_case_step` WRITE;
/*!40000 ALTER TABLE `test_case_step` DISABLE KEYS */;

INSERT INTO `test_case_step` (`test_case_id`, `test_step_step_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(2,7);

/*!40000 ALTER TABLE `test_case_step` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 test_cases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test_cases`;

CREATE TABLE `test_cases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL COMMENT '接口名称',
  `project` varchar(120) DEFAULT NULL COMMENT '接口所属项目',
  `server` varchar(220) DEFAULT NULL COMMENT '接口所属服务',
  `config_id` bigint(20) DEFAULT NULL COMMENT '配置ID',
  `result` tinyint(1) DEFAULT NULL COMMENT '接口测试结果',
  `creator` varchar(60) DEFAULT NULL COMMENT '接口创建人',
  PRIMARY KEY (`id`),
  KEY `idx_test_cases_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `test_cases` WRITE;
/*!40000 ALTER TABLE `test_cases` DISABLE KEYS */;

INSERT INTO `test_cases` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `project`, `server`, `config_id`, `result`, `creator`)
VALUES
	(1,'2022-03-21 10:05:09.543','2022-04-27 14:56:26.433',NULL,'demo','demo','demo',1,1,'admin'),
	(2,'2022-04-01 14:48:36.537','2022-04-02 14:37:35.470','2022-04-11 10:42:31.417','demotest','demo','demo',1,1,'');

/*!40000 ALTER TABLE `test_cases` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 test_steps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test_steps`;

CREATE TABLE `test_steps` (
  `step_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '测试步骤ID',
  `index` bigint(20) unsigned DEFAULT NULL COMMENT '步骤索引',
  `name` varchar(120) DEFAULT NULL COMMENT '名称',
  `request` json DEFAULT NULL COMMENT '请求结构',
  `variables` json DEFAULT NULL COMMENT '局部变量',
  `extract` json DEFAULT NULL COMMENT '响应解析',
  `validate` json DEFAULT NULL COMMENT '结果断言',
  `response` json DEFAULT NULL COMMENT '接口响应结果',
  `result` tinyint(1) DEFAULT NULL COMMENT '接口测试结果',
  PRIMARY KEY (`step_id`),
  UNIQUE KEY `step_id` (`step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `test_steps` WRITE;
/*!40000 ALTER TABLE `test_steps` DISABLE KEYS */;

INSERT INTO `test_steps` (`step_id`, `index`, `name`, `request`, `variables`, `extract`, `validate`, `response`, `result`)
VALUES
	(1,1,'get with params','{\"url\": \"/get\", \"method\": \"GET\", \"params\": {\"foo1\": \"$varFoo1\", \"foo2\": \"$varFoo2\"}, \"headers\": {\"User-Agent\": \"HttpRunnerPlus\"}}','{\"b\": 34.5, \"n\": 3, \"name\": \"get with params\", \"varFoo2\": \"${max($a, $b)}\"}','{\"varFoo1\": \"body.args.foo1\"}','[{\"msg\": \"check response status code\", \"check\": \"status_code\", \"assert\": \"equals\", \"expect\": 200}, {\"check\": \"headers.\\\"Content-Type\\\"\", \"assert\": \"startswith\", \"expect\": \"application/json\"}, {\"msg\": \"check args foo1\", \"check\": \"body.args.foo1\", \"assert\": \"length_equals\", \"expect\": 5}, {\"msg\": \"check args foo1\", \"check\": \"$varFoo1\", \"assert\": \"length_equals\", \"expect\": 5}, {\"msg\": \"check args foo2\", \"check\": \"body.args.foo2\", \"assert\": \"equals\", \"expect\": \"34.5\"}]','{\"success\": true, \"req_resps\": {\"request\": {\"url\": \"https://postman-echo.com/get\", \"method\": \"GET\", \"params\": {\"foo1\": \"g5HOd\", \"foo2\": 34.5}, \"headers\": {\"User-Agent\": \"HttpRunnerPlus\"}}, \"response\": {\"body\": \"{\\n    \\\"args\\\": {\\n    \\\"foo1\\\": \\\"g5HOd\\\",\\n    \\\"foo2\\\": \\\"34.5\\\"\\n},\\n    \\\"headers\\\": {\\n    \\\"accept-encoding\\\": \\\"gzip\\\",\\n    \\\"host\\\": \\\"postman-echo.com\\\",\\n    \\\"user-agent\\\": \\\"HttpRunnerPlus\\\",\\n    \\\"x-amzn-trace-id\\\": \\\"Root=1-625396e5-3f7763f7557cd3e759f59644\\\",\\n    \\\"x-forwarded-port\\\": \\\"443\\\",\\n    \\\"x-forwarded-proto\\\": \\\"https\\\"\\n},\\n    \\\"url\\\": \\\"https://postman-echo.com/get?foo1=g5HOd\\\\u0026foo2=34.5\\\"\\n}\", \"cookies\": {\"sails.sid\": \"s%3AdziXVEwdGxMLQPEBAGNKHiVddVmawySx.HuawL2HHWfa0q4cezx5CNEesUAsgwKRh%2B4s0Gosx1GM\"}, \"headers\": {\"Date\": \"Mon, 11 Apr 2022 02:48:05 GMT\", \"Etag\": \"W/\\\"130-WE5lFzzhDgvxg5aCjAwZVNrHbpo\\\"\", \"Vary\": \"Accept-Encoding\", \"Connection\": \"keep-alive\", \"Set-Cookie\": \"sails.sid=s%3AdziXVEwdGxMLQPEBAGNKHiVddVmawySx.HuawL2HHWfa0q4cezx5CNEesUAsgwKRh%2B4s0Gosx1GM; Path=/; HttpOnly\", \"Content-Type\": \"application/json; charset=utf-8\", \"Content-Length\": \"304\"}, \"status_code\": 200}}, \"validators\": [{\"msg\": \"check response status code\", \"check\": \"status_code\", \"assert\": \"equals\", \"expect\": 200, \"check_value\": 200, \"check_result\": \"pass\"}, {\"check\": \"headers.\\\"Content-Type\\\"\", \"assert\": \"startswith\", \"expect\": \"application/json\", \"check_value\": \"application/json; charset=utf-8\", \"check_result\": \"pass\"}, {\"msg\": \"check args foo1\", \"check\": \"body.args.foo1\", \"assert\": \"length_equals\", \"expect\": 5, \"check_value\": \"g5HOd\", \"check_result\": \"pass\"}, {\"msg\": \"check args foo1\", \"check\": \"$varFoo1\", \"assert\": \"length_equals\", \"expect\": 5, \"check_value\": \"g5HOd\", \"check_result\": \"pass\"}, {\"msg\": \"check args foo2\", \"check\": \"body.args.foo2\", \"assert\": \"equals\", \"expect\": \"34.5\", \"check_value\": \"34.5\", \"check_result\": \"pass\"}]}',1),
	(2,2,'post json data','{\"url\": \"/post\", \"body\": {\"foo1\": \"$varFoo1\", \"foo2\": \"${max($a, $b)}\"}, \"method\": \"POST\"}','null','null','[{\"msg\": \"check status code\", \"check\": \"status_code\", \"assert\": \"equals\", \"expect\": 200}, {\"msg\": \"check args foo1\", \"check\": \"body.json.foo1\", \"assert\": \"length_equals\", \"expect\": 5}, {\"msg\": \"check args foo2\", \"check\": \"body.json.foo2\", \"assert\": \"equals\", \"expect\": 12.3}]','{\"success\": true, \"req_resps\": {\"request\": {\"url\": \"https://postman-echo.com/post\", \"body\": {\"foo1\": \"g5HOd\", \"foo2\": 12.3}, \"method\": \"POST\", \"headers\": {\"Content-Type\": \"application/json; charset=utf-8\"}}, \"response\": {\"body\": \"{\\n    \\\"args\\\": {\\n    \\n},\\n    \\\"data\\\": {\\n    \\\"foo1\\\": \\\"g5HOd\\\",\\n    \\\"foo2\\\": 12.3\\n},\\n    \\\"files\\\": {\\n    \\n},\\n    \\\"form\\\": {\\n    \\n},\\n    \\\"headers\\\": {\\n    \\\"accept-encoding\\\": \\\"gzip\\\",\\n    \\\"content-length\\\": \\\"28\\\",\\n    \\\"content-type\\\": \\\"application/json; charset=utf-8\\\",\\n    \\\"host\\\": \\\"postman-echo.com\\\",\\n    \\\"user-agent\\\": \\\"Go-http-client/1.1\\\",\\n    \\\"x-amzn-trace-id\\\": \\\"Root=1-625396e6-7dde59f06dd708796db7eae8\\\",\\n    \\\"x-forwarded-port\\\": \\\"443\\\",\\n    \\\"x-forwarded-proto\\\": \\\"https\\\"\\n},\\n    \\\"json\\\": {\\n    \\\"foo1\\\": \\\"g5HOd\\\",\\n    \\\"foo2\\\": 12.3\\n},\\n    \\\"url\\\": \\\"https://postman-echo.com/post\\\"\\n}\", \"cookies\": {\"sails.sid\": \"s%3A9grbzUuAsy0hnADIzz161xh2yVPI1TrR.M5hdImZ3Ji93%2BBDPLWsaLMP3gjUAhJrJGmNZh5XNCnk\"}, \"headers\": {\"Date\": \"Mon, 11 Apr 2022 02:48:06 GMT\", \"Etag\": \"W/\\\"1a8-wsoJ4KsZ19Sic2TIHZQWnbgA9Qw\\\"\", \"Vary\": \"Accept-Encoding\", \"Connection\": \"keep-alive\", \"Set-Cookie\": \"sails.sid=s%3A9grbzUuAsy0hnADIzz161xh2yVPI1TrR.M5hdImZ3Ji93%2BBDPLWsaLMP3gjUAhJrJGmNZh5XNCnk; Path=/; HttpOnly\", \"Content-Type\": \"application/json; charset=utf-8\", \"Content-Length\": \"424\"}, \"status_code\": 200}}, \"validators\": [{\"msg\": \"check status code\", \"check\": \"status_code\", \"assert\": \"equals\", \"expect\": 200, \"check_value\": 200, \"check_result\": \"pass\"}, {\"msg\": \"check args foo1\", \"check\": \"body.json.foo1\", \"assert\": \"length_equals\", \"expect\": 5, \"check_value\": \"g5HOd\", \"check_result\": \"pass\"}, {\"msg\": \"check args foo2\", \"check\": \"body.json.foo2\", \"assert\": \"equals\", \"expect\": 12.3, \"check_value\": 12.3, \"check_result\": \"pass\"}]}',1),
	(3,3,'post form data','{\"url\": \"/post\", \"body\": {\"foo1\": \"$varFoo1\", \"foo2\": \"${max($a, $b)}\", \"time\": \"${get_timestamp()}\"}, \"method\": \"POST\", \"headers\": {\"Content-Type\": \"application/x-www-form-urlencoded; charset=UTF-8\"}}','null','{\"varTime\": \"body.form.time\"}','[{\"msg\": \"check status code\", \"check\": \"status_code\", \"assert\": \"equals\", \"expect\": 200}, {\"msg\": \"check args foo1\", \"check\": \"body.form.foo1\", \"assert\": \"length_equals\", \"expect\": 5}, {\"msg\": \"check args foo2\", \"check\": \"body.form.foo2\", \"assert\": \"equals\", \"expect\": \"12.3\"}]','{\"success\": true, \"req_resps\": {\"request\": {\"url\": \"https://postman-echo.com/post\", \"body\": {\"foo1\": \"g5HOd\", \"foo2\": 12.3, \"time\": 1649645286223}, \"method\": \"POST\", \"headers\": {\"Content-Type\": \"application/x-www-form-urlencoded; charset=UTF-8\"}}, \"response\": {\"body\": \"{\\n    \\\"args\\\": {\\n    \\n},\\n    \\\"data\\\": \\\"\\\",\\n    \\\"files\\\": {\\n    \\n},\\n    \\\"form\\\": {\\n    \\\"foo1\\\": \\\"g5HOd\\\",\\n    \\\"foo2\\\": \\\"12.3\\\",\\n    \\\"time\\\": \\\"1649645286223\\\"\\n},\\n    \\\"headers\\\": {\\n    \\\"accept-encoding\\\": \\\"gzip\\\",\\n    \\\"content-length\\\": \\\"39\\\",\\n    \\\"content-type\\\": \\\"application/x-www-form-urlencoded; charset=UTF-8\\\",\\n    \\\"host\\\": \\\"postman-echo.com\\\",\\n    \\\"user-agent\\\": \\\"Go-http-client/1.1\\\",\\n    \\\"x-amzn-trace-id\\\": \\\"Root=1-625396e6-37c297120188c5fb1a83f34a\\\",\\n    \\\"x-forwarded-port\\\": \\\"443\\\",\\n    \\\"x-forwarded-proto\\\": \\\"https\\\"\\n},\\n    \\\"json\\\": {\\n    \\\"foo1\\\": \\\"g5HOd\\\",\\n    \\\"foo2\\\": \\\"12.3\\\",\\n    \\\"time\\\": \\\"1649645286223\\\"\\n},\\n    \\\"url\\\": \\\"https://postman-echo.com/post\\\"\\n}\", \"cookies\": {\"sails.sid\": \"s%3AmtmDriNQ2XiTnwtI5_bXoWbmdibxRTlp.udIQ%2FxEt33D0SrMd6erSMzFc5T8cE30wzmb54TmiKNw\"}, \"headers\": {\"Date\": \"Mon, 11 Apr 2022 02:48:06 GMT\", \"Etag\": \"W/\\\"1eb-HAOk1YaZQS64SQWxTZbfxB8+YmQ\\\"\", \"Vary\": \"Accept-Encoding\", \"Connection\": \"keep-alive\", \"Set-Cookie\": \"sails.sid=s%3AmtmDriNQ2XiTnwtI5_bXoWbmdibxRTlp.udIQ%2FxEt33D0SrMd6erSMzFc5T8cE30wzmb54TmiKNw; Path=/; HttpOnly\", \"Content-Type\": \"application/json; charset=utf-8\", \"Content-Length\": \"491\"}, \"status_code\": 200}}, \"validators\": [{\"msg\": \"check status code\", \"check\": \"status_code\", \"assert\": \"equals\", \"expect\": 200, \"check_value\": 200, \"check_result\": \"pass\"}, {\"msg\": \"check args foo1\", \"check\": \"body.form.foo1\", \"assert\": \"length_equals\", \"expect\": 5, \"check_value\": \"g5HOd\", \"check_result\": \"pass\"}, {\"msg\": \"check args foo2\", \"check\": \"body.form.foo2\", \"assert\": \"equals\", \"expect\": \"12.3\", \"check_value\": \"12.3\", \"check_result\": \"pass\"}]}',1),
	(4,4,'get with timestamp','{\"url\": \"/get\", \"method\": \"GET\", \"params\": {\"time\": \"$varTime\"}}','null','null','[{\"msg\": \"check extracted var timestamp\", \"check\": \"body.args.time\", \"assert\": \"length_equals\", \"expect\": 13}]','{\"success\": true, \"req_resps\": {\"request\": {\"url\": \"https://postman-echo.com/get\", \"method\": \"GET\", \"params\": {\"time\": \"1649645286223\"}, \"headers\": {}}, \"response\": {\"body\": \"{\\n    \\\"args\\\": {\\n    \\\"time\\\": \\\"1649645286223\\\"\\n},\\n    \\\"headers\\\": {\\n    \\\"accept-encoding\\\": \\\"gzip\\\",\\n    \\\"host\\\": \\\"postman-echo.com\\\",\\n    \\\"user-agent\\\": \\\"Go-http-client/1.1\\\",\\n    \\\"x-amzn-trace-id\\\": \\\"Root=1-625396e6-2ac39ff56e42b30e27580c6c\\\",\\n    \\\"x-forwarded-port\\\": \\\"443\\\",\\n    \\\"x-forwarded-proto\\\": \\\"https\\\"\\n},\\n    \\\"url\\\": \\\"https://postman-echo.com/get?time=1649645286223\\\"\\n}\", \"cookies\": {\"sails.sid\": \"s%3AWNofYiJDeq5LKcqTZffHtU7RorhLgVN4.JFlgZjR0t1Jhl6Q2QdId%2FfPRLcuyc7Iwd32YFeHYuW0\"}, \"headers\": {\"Date\": \"Mon, 11 Apr 2022 02:48:06 GMT\", \"Etag\": \"W/\\\"12c-SUJZlHvBeTm87xiF69xN67eZrqw\\\"\", \"Vary\": \"Accept-Encoding\", \"Connection\": \"keep-alive\", \"Set-Cookie\": \"sails.sid=s%3AWNofYiJDeq5LKcqTZffHtU7RorhLgVN4.JFlgZjR0t1Jhl6Q2QdId%2FfPRLcuyc7Iwd32YFeHYuW0; Path=/; HttpOnly\", \"Content-Type\": \"application/json; charset=utf-8\", \"Content-Length\": \"300\"}, \"status_code\": 200}}, \"validators\": [{\"msg\": \"check extracted var timestamp\", \"check\": \"body.args.time\", \"assert\": \"length_equals\", \"expect\": 13, \"check_value\": \"1649645286223\", \"check_result\": \"pass\"}]}',1),
	(5,1,'get with params','{\"url\": \"/get\", \"method\": \"GET\", \"params\": {\"foo1\": \"$varFoo1\", \"foo2\": \"$varFoo2\"}, \"headers\": {\"User-Agent\": \"HttpRunnerPlus\"}, \"protocol\": \"http\"}','{\"b\": 34.5, \"n\": 3, \"name\": \"get with params\", \"varFoo2\": \"${max($a, $b)}\"}','{\"varFoo1\": \"body.args.foo1\"}','[{\"check\": \"status_code\", \"index\": 2, \"assert\": \"eq\", \"expect\": 200}]','{\"success\": true, \"req_resps\": {\"request\": {\"url\": \"https://postman-echo.com/get\", \"method\": \"GET\", \"params\": {\"foo1\": \"kumBK\", \"foo2\": 34.5}, \"headers\": {\"User-Agent\": \"HttpRunnerPlus\"}}, \"response\": {\"body\": \"{\\n    \\\"args\\\": {\\n    \\\"foo1\\\": \\\"kumBK\\\",\\n    \\\"foo2\\\": \\\"34.5\\\"\\n},\\n    \\\"headers\\\": {\\n    \\\"accept-encoding\\\": \\\"gzip\\\",\\n    \\\"host\\\": \\\"postman-echo.com\\\",\\n    \\\"user-agent\\\": \\\"HttpRunnerPlus\\\",\\n    \\\"x-amzn-trace-id\\\": \\\"Root=1-6246a18f-5cae048e7be5ff7a47338e7d\\\",\\n    \\\"x-forwarded-port\\\": \\\"443\\\",\\n    \\\"x-forwarded-proto\\\": \\\"https\\\"\\n},\\n    \\\"url\\\": \\\"https://postman-echo.com/get?foo1=kumBK\\\\u0026foo2=34.5\\\"\\n}\", \"cookies\": {\"sails.sid\": \"s%3AoXPcTdwJKvZEQpfFISDzR1kFx0914Jmq.mUFV5CysB9Ti2qiZl%2BD0cslFbYPR9qpckkfgee%2BEMZw\"}, \"headers\": {\"Date\": \"Fri, 01 Apr 2022 06:54:07 GMT\", \"Etag\": \"W/\\\"130-iavH6pqCNpZkuW/kcV6uULEI5MI\\\"\", \"Vary\": \"Accept-Encoding\", \"Connection\": \"keep-alive\", \"Set-Cookie\": \"sails.sid=s%3AoXPcTdwJKvZEQpfFISDzR1kFx0914Jmq.mUFV5CysB9Ti2qiZl%2BD0cslFbYPR9qpckkfgee%2BEMZw; Path=/; HttpOnly\", \"Content-Type\": \"application/json; charset=utf-8\", \"Content-Length\": \"304\"}, \"status_code\": 200}}, \"validators\": [{\"check\": \"status_code\", \"assert\": \"eq\", \"expect\": 200, \"check_value\": 200, \"check_result\": \"pass\"}]}',1),
	(6,1,'test','{\"url\": \"test\", \"method\": \"GET\", \"params\": {\"a\": \"1\", \"b\": 2}, \"headers\": {}, \"protocol\": \"http\"}','{\"x\": \"1\", \"y\": \"2\"}','{}','[{\"type\": \"int\", \"check\": \"ss\", \"index\": 2, \"assert\": \"eq\", \"expect\": \"200\"}, {\"type\": \"float\", \"check\": \"aa\", \"index\": 3, \"assert\": \"eq\", \"expect\": \"1.02\"}]',NULL,0),
	(7,1,'test','{\"url\": \"test\", \"method\": \"GET\", \"params\": {\"a\": \"1\", \"b\": 2}, \"headers\": {}, \"protocol\": \"http\"}','{\"x\": \"1\", \"y\": 2}','{}','[{\"type\": \"int\", \"check\": \"ss\", \"index\": 2, \"assert\": \"eq\", \"expect\": \"200\"}, {\"type\": \"float\", \"check\": \"aa\", \"index\": 3, \"assert\": \"eq\", \"expect\": \"1.02\"}]',NULL,0);

/*!40000 ALTER TABLE `test_steps` ENABLE KEYS */;
UNLOCK TABLES;


# 导出视图 authority_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authority_menu`; DROP VIEW IF EXISTS `authority_menu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `authority_menu`
AS SELECT
   `sys_base_menus`.`id` AS `id`,
   `sys_base_menus`.`path` AS `path`,
   `sys_base_menus`.`icon` AS `icon`,
   `sys_base_menus`.`name` AS `name`,
   `sys_base_menus`.`sort` AS `sort`,
   `sys_base_menus`.`title` AS `title`,
   `sys_base_menus`.`hidden` AS `hidden`,
   `sys_base_menus`.`component` AS `component`,
   `sys_base_menus`.`parent_id` AS `parent_id`,
   `sys_base_menus`.`created_at` AS `created_at`,
   `sys_base_menus`.`updated_at` AS `updated_at`,
   `sys_base_menus`.`deleted_at` AS `deleted_at`,
   `sys_base_menus`.`keep_alive` AS `keep_alive`,
   `sys_base_menus`.`menu_level` AS `menu_level`,
   `sys_base_menus`.`default_menu` AS `default_menu`,
   `sys_base_menus`.`close_tab` AS `close_tab`,
   `sys_authority_menus`.`sys_base_menu_id` AS `menu_id`,
   `sys_authority_menus`.`sys_authority_authority_id` AS `authority_id`
FROM (`sys_authority_menus` join `sys_base_menus` on((`sys_authority_menus`.`sys_base_menu_id` = `sys_base_menus`.`id`)));


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
