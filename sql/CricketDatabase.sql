CREATE DATABASE  IF NOT EXISTS `cricket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `cricket`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: cricket
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add player history',7,'add_playerhistory'),(20,'Can change player history',7,'change_playerhistory'),(21,'Can delete player history',7,'delete_playerhistory'),(22,'Can add country',8,'add_country'),(23,'Can change country',8,'change_country'),(24,'Can delete country',8,'delete_country'),(25,'Can add player',9,'add_player'),(26,'Can change player',9,'change_player'),(27,'Can delete player',9,'delete_player'),(28,'Can add team',10,'add_team'),(29,'Can change team',10,'change_team'),(30,'Can delete team',10,'delete_team'),(31,'Can add matches',11,'add_matches'),(32,'Can change matches',11,'change_matches'),(33,'Can delete matches',11,'delete_matches');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$UmFLJzOtntgZ$uwg0SXN+BbkvLBRAJTOmdhBD8bFE8csVDVycMvKhQ0I=','2020-07-15 05:32:13.823000',1,'root','','','root@cogni.com',1,1,'2020-07-15 03:45:30.738000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `code` varchar(3) NOT NULL,
  `name` varchar(60) NOT NULL,
  `continent` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('IND','India','Asia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-07-15 05:40:05.603000','IND','India',1,'[{\"added\": {}}]',8,1),(2,'2020-07-15 05:46:46.476000','5','https://stephengrider.github.io/JSPlaygrounds/',1,'[{\"added\": {}}]',9,1),(3,'2020-07-15 05:48:53.387000','6','Virat',1,'[{\"added\": {}}]',9,1),(4,'2020-07-15 06:27:50.337000','1','Team object',1,'[{\"added\": {}}]',10,1),(5,'2020-07-15 06:56:26.810000','2','Team object',1,'[{\"added\": {}}]',10,1),(6,'2020-07-16 05:15:47.321000','2','Team object',2,'[{\"changed\": {\"fields\": [\"logoURL\"]}}]',10,1),(7,'2020-07-16 05:15:54.323000','1','Team object',2,'[{\"changed\": {\"fields\": [\"logoURL\"]}}]',10,1),(8,'2020-07-16 05:16:14.066000','3','Team object',1,'[{\"added\": {}}]',10,1),(9,'2020-07-16 05:17:55.886000','3','Team object',2,'[{\"changed\": {\"fields\": [\"logoURL\"]}}]',10,1),(10,'2020-07-16 05:18:02.115000','2','Team object',2,'[{\"changed\": {\"fields\": [\"logoURL\"]}}]',10,1),(11,'2020-07-16 05:18:09.286000','1','Team object',2,'[{\"changed\": {\"fields\": [\"logoURL\"]}}]',10,1),(12,'2020-07-16 06:10:56.353000','6','Virat',2,'[{\"changed\": {\"fields\": [\"imageURL\"]}}]',9,1),(13,'2020-07-16 06:11:06.652000','5','MS',2,'[{\"changed\": {\"fields\": [\"imageURL\"]}}]',9,1),(14,'2020-07-16 06:20:35.855000','7','Rohit',1,'[{\"added\": {}}]',9,1),(15,'2020-07-16 06:21:06.547000','8','Rahul',1,'[{\"added\": {}}]',9,1),(16,'2020-07-16 09:01:08.247000','4','Bangladesh',1,'[{\"added\": {}}]',10,1),(17,'2020-07-16 10:55:39.933000','1','India National Team',1,'[{\"added\": {}}]',10,1),(18,'2020-07-16 10:55:51.662000','2','ENGLAND TEAM',1,'[{\"added\": {}}]',10,1),(19,'2020-07-16 10:56:12.711000','3','Australia Cricket Team',1,'[{\"added\": {}}]',10,1),(20,'2020-07-16 10:56:24.620000','4','Bangladesh',1,'[{\"added\": {}}]',10,1),(21,'2020-07-16 11:12:03.259000','2','2',1,'[{\"added\": {}}]',11,1),(22,'2020-07-16 11:12:26.912000','3','3',1,'[{\"added\": {}}]',11,1),(23,'2020-07-16 11:12:39.764000','4','4',1,'[{\"added\": {}}]',11,1),(24,'2020-07-16 11:13:02.465000','5','5',1,'[{\"added\": {}}]',11,1),(25,'2020-07-16 11:16:42.058000','5','5',2,'[{\"changed\": {\"fields\": [\"matchDate\"]}}]',11,1),(26,'2020-07-16 11:16:56.755000','3','3',2,'[{\"changed\": {\"fields\": [\"matchDate\"]}}]',11,1),(27,'2020-07-16 11:17:04.144000','2','2',2,'[{\"changed\": {\"fields\": [\"matchDate\"]}}]',11,1),(28,'2020-07-16 14:09:40.768000','6','6',1,'[{\"added\": {}}]',11,1),(29,'2020-07-16 14:10:22.908000','5','Srilanka',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'cricket','country'),(11,'cricket','matches'),(9,'cricket','player'),(7,'cricket','playerhistory'),(10,'cricket','team'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-07-15 03:27:01.404000'),(2,'auth','0001_initial','2020-07-15 03:27:02.956000'),(3,'admin','0001_initial','2020-07-15 03:27:04.036000'),(4,'admin','0002_logentry_remove_auto_add','2020-07-15 03:27:04.060000'),(5,'contenttypes','0002_remove_content_type_name','2020-07-15 03:27:04.356000'),(6,'auth','0002_alter_permission_name_max_length','2020-07-15 03:27:04.507000'),(7,'auth','0003_alter_user_email_max_length','2020-07-15 03:27:04.562000'),(8,'auth','0004_alter_user_username_opts','2020-07-15 03:27:04.584000'),(9,'auth','0005_alter_user_last_login_null','2020-07-15 03:27:04.870000'),(10,'auth','0006_require_contenttypes_0002','2020-07-15 03:27:04.887000'),(11,'auth','0007_alter_validators_add_error_messages','2020-07-15 03:27:04.942000'),(12,'auth','0008_alter_user_username_max_length','2020-07-15 03:27:05.081000'),(13,'sessions','0001_initial','2020-07-15 03:27:05.160000'),(14,'cricket','0001_initial','2020-07-15 04:48:06.686000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('i2z19biz15w94xaicxwluwphkjrmb18g','YjkwYzU4NzBiYjEwODBmZmZjN2RiMDA0OWQ1Y2VjNTBlYTRlMzdiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2YjQzNzhiM2Q0ZTIxNTVhNDA2MTg3YjhiNzc3ZWFmYjEyYTMzZjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2020-07-29 03:45:53.104000'),('xq0fpxgpr10pkmhpgkzd3ytc7ydezjbz','YjkwYzU4NzBiYjEwODBmZmZjN2RiMDA0OWQ1Y2VjNTBlYTRlMzdiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2YjQzNzhiM2Q0ZTIxNTVhNDA2MTg3YjhiNzc3ZWFmYjEyYTMzZjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2020-07-29 05:32:13.832000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matches` (
  `matchId` int(11) NOT NULL AUTO_INCREMENT,
  `team1_id` int(11) DEFAULT NULL,
  `team2_id` int(11) DEFAULT NULL,
  `winerTeam_id` int(11) DEFAULT NULL,
  `matchDate` datetime DEFAULT NULL,
  KEY `team1Id_idx` (`matchId`),
  KEY `team1_key_idx` (`team1_id`),
  KEY `team2_key_idx` (`team2_id`),
  KEY `winerTeam_key_idx` (`winerTeam_id`),
  CONSTRAINT `team1_key` FOREIGN KEY (`team1_id`) REFERENCES `team` (`teamid`),
  CONSTRAINT `team2_key` FOREIGN KEY (`team2_id`) REFERENCES `team` (`teamid`),
  CONSTRAINT `winerTeam_key` FOREIGN KEY (`winerTeam_id`) REFERENCES `team` (`teamid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (2,1,2,1,'2020-07-15 00:00:00'),(3,3,1,1,'2020-09-17 00:00:00'),(4,3,4,3,NULL),(5,2,4,2,'2020-09-17 00:00:00'),(6,1,4,1,'2020-07-25 00:00:00');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player` (
  `playerId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `imageURL` varchar(500) NOT NULL,
  `jerse_number` int(11) NOT NULL,
  `countryId_id` varchar(3) NOT NULL,
  `teamId_id` int(11) NOT NULL,
  PRIMARY KEY (`playerId`),
  KEY `player_countryId_id_a66a768a_fk_country_code` (`countryId_id`),
  CONSTRAINT `player_countryId_id_a66a768a_fk_country_code` FOREIGN KEY (`countryId_id`) REFERENCES `country` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (5,'MS','Dhoni','https://picsum.photos/20/20',7,'IND',1),(6,'Virat','K','https://picsum.photos/20/20',18,'IND',1),(7,'Rohit','Sharma','https://picsum.photos/20/20',99,'IND',1),(8,'Rahul','Dravid','https://picsum.photos/20/20',5,'IND',1);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_history`
--

DROP TABLE IF EXISTS `player_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player_history` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `matches` int(11) NOT NULL,
  `run` int(11) NOT NULL,
  `highest_score` int(11) NOT NULL,
  `fifties` int(11) NOT NULL,
  `hundreds` int(11) NOT NULL,
  `playerId_id` int(11) NOT NULL,
  PRIMARY KEY (`historyId`),
  KEY `player_history_playerId_id_72124d10_fk_player_playerId` (`playerId_id`),
  CONSTRAINT `player_history_playerId_id_72124d10_fk_player_playerId` FOREIGN KEY (`playerId_id`) REFERENCES `player` (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_history`
--

LOCK TABLES `player_history` WRITE;
/*!40000 ALTER TABLE `player_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `teamId` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(45) DEFAULT NULL,
  `logoURL` varchar(45) DEFAULT NULL,
  `clubState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'India National Team','https://picsum.photos/20/20','WB'),(2,'ENGLAND TEAM','https://picsum.photos/20/20','OXFORD'),(3,'Australia Cricket Team','https://picsum.photos/20/20','Sydney'),(4,'Bangladesh','https://picsum.photos/20/20','Dhaka'),(5,'Srilanka','https://picsum.photos/20/20','Colombo');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 16:20:53
