-- MySQL dump 10.13  Distrib 5.5.21, for Win64 (x86)
--
-- Host: localhost    Database: prs
-- ------------------------------------------------------
-- Server version	5.5.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `prs`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `prs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `prs`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
INSERT INTO `auth_message` VALUES (1,4,'Your score was created'),(2,4,'Your score was created');
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add activity',8,'add_activity'),(23,'Can change activity',8,'change_activity'),(24,'Can delete activity',8,'delete_activity'),(25,'Can add score',9,'add_score'),(26,'Can change score',9,'change_score'),(27,'Can delete score',9,'delete_score'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry'),(31,'Can add migration history',11,'add_migrationhistory'),(32,'Can change migration history',11,'change_migrationhistory'),(33,'Can delete migration history',11,'delete_migrationhistory'),(34,'Can add tag',12,'add_tag'),(35,'Can change tag',12,'change_tag'),(36,'Can delete tag',12,'delete_tag');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'gigi','Gigi','Sayfan','gigi-s@bigfoot.com','sha1$76984$d4671c171ce8f112a8ce9f1df6d0e0bbc79e899c',1,1,1,'2012-02-27 00:34:28','2011-04-28 01:03:09'),(2,'bloblblobl','Saar','Sayfan','bloblblobl@gmail.com','sha1$f2cbf$8bad8dee6687404c2b6435883073f8ba2a9a6aa3',0,1,0,'2011-11-14 10:49:38','2011-11-14 10:49:38'),(3,'liat','','','','sha1$a2cd1$6f44fad8e9f82dec557e916a2b3ad295309e9ef6',0,1,0,'2012-01-22 10:39:57','2012-01-21 22:22:34'),(4,'ophir','Ophir','Sayfan','','sha1$9d5fb$c908ffedff41b4433e524f578bb19d1ca016dc9e',0,1,0,'2012-02-04 22:03:26','2012-02-01 22:01:52');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` text,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-05-01 14:05:15',1,8,'2','name: Press',1,''),(2,'2011-05-01 14:05:33',1,8,'2','name: Press',2,'Changed reps.'),(3,'2011-05-01 14:35:30',1,9,'1','weight: LB 255',1,''),(4,'2011-05-01 14:38:29',1,8,'3','name: Filthy Fifty',1,''),(5,'2011-05-01 14:39:28',1,9,'2','Time: 00:25:36',1,''),(6,'2011-05-01 21:49:20',1,8,'1','name: Back Squat',1,''),(7,'2011-05-01 21:50:18',1,8,'2','name: Press',1,''),(8,'2011-05-01 21:51:06',1,8,'3','name: Deadlift',1,''),(9,'2011-05-01 21:57:51',1,8,'1','name: Back Squat',2,'No fields changed.'),(10,'2011-05-01 22:00:10',1,9,'1','Back Squat - 255 LB',1,''),(11,'2011-05-01 22:20:33',1,9,'1','Back Squat - 255 LB',2,'Changed rx.'),(12,'2011-05-01 22:21:15',1,9,'2','Press - 150 LB',1,''),(13,'2011-05-04 23:51:20',1,8,'1','Back Squat 1RM',2,'Changed name and reps.'),(14,'2011-05-04 23:51:57',1,8,'4','Back Squat 3RM',1,''),(15,'2011-05-04 23:52:38',1,8,'4','Back Squat 3RM',2,'Changed description.'),(16,'2011-05-04 23:53:09',1,8,'5','Back Squat 5RM',1,''),(17,'2011-05-04 23:53:26',1,8,'3','Deadlift 1RM',2,'Changed name and reps.'),(18,'2011-05-04 23:53:38',1,8,'2','Press 1RM',2,'Changed name.'),(19,'2011-05-04 23:58:00',1,9,'2','Press 1RM - 150 LB',2,'Changed reps.'),(20,'2011-05-04 23:58:17',1,9,'1','Back Squat 1RM - 255 LB',2,'Changed reps.'),(21,'2011-05-09 02:23:09',1,9,'3','Deadlift 1RM - 385 LB',1,''),(22,'2011-05-09 02:25:02',1,9,'4','Back Squat 5RM - 235 LB',1,''),(23,'2011-05-09 02:26:15',1,8,'6','Deadlift 3RM',1,''),(24,'2011-05-09 02:26:46',1,8,'7','Deadlift 5RM',1,''),(25,'2011-05-09 02:27:48',1,8,'8','Press 3RM',1,''),(26,'2011-05-09 02:28:03',1,8,'8','Press 3RM',2,'Changed unit.'),(27,'2011-05-09 02:28:40',1,8,'9','Press 5RM',1,''),(28,'2011-05-09 02:30:23',1,9,'5','Deadlift 5RM - 125 LB',1,''),(29,'2011-05-09 02:30:47',1,9,'5','Deadlift 5RM - 345 LB',2,'Changed weight.'),(30,'2011-05-09 02:31:23',1,9,'6','Deadlift 3RM - 375 LB',1,''),(31,'2011-05-09 02:37:12',1,9,'7','Press 5RM - 125 LB',1,''),(32,'2011-05-09 02:37:26',1,9,'2','Press 1RM - 150 LB',2,'Changed when.'),(33,'2011-06-18 08:18:21',1,8,'10','Max pull ups',1,''),(34,'2011-06-19 10:12:54',1,9,'8','Max Max pull ups - 37',1,''),(35,'2011-06-19 13:44:20',1,8,'10','Pull ups',2,'Changed name.'),(36,'2011-07-16 12:48:20',1,8,'11','Max reps 1.5 pood Kettlebell Swings',1,''),(37,'2011-07-16 12:48:57',1,8,'11','Kettlebell Swings - 1.5 pood',2,'Changed name.'),(38,'2011-09-04 01:04:14',1,9,'9','Back Squat 5RM - 245 LB',1,''),(39,'2011-11-13 15:50:33',1,8,'12','Kettlebell Swings 2pood',1,''),(40,'2011-11-13 15:50:53',1,8,'12','Kettlebell Swings 2 pood',2,'Changed name.'),(41,'2011-11-13 15:51:03',1,8,'12','Kettlebell Swings - 2 pood',2,'Changed name.'),(42,'2011-11-13 15:51:11',1,8,'11','Kettlebell Swings - 1.5 pood',2,'Changed description.'),(43,'2011-11-14 10:48:59',1,3,'1','gigi',2,'Changed first_name and last_name.'),(44,'2011-11-14 10:49:38',1,3,'2','bloblblobl',1,''),(45,'2011-11-14 10:50:33',1,3,'2','bloblblobl',2,'Changed first_name, last_name and email.'),(46,'2011-11-28 00:10:17',1,8,'15','Ring Dips',3,''),(47,'2011-11-28 00:10:24',1,8,'14','Ring Dips',3,''),(48,'2011-11-28 16:20:29',1,8,'14','Nasty Girls',1,''),(49,'2011-11-28 16:21:39',1,9,'10','Nasty Girls - 11:02:00',1,''),(50,'2011-11-28 16:22:13',1,9,'11','Nasty Girls - 11:35:00',1,''),(51,'2011-11-28 16:22:15',1,9,'11','Nasty Girls - 11:35:00',2,'No fields changed.'),(52,'2011-11-28 16:34:44',1,9,'11','Nasty Girls - 00:11:35',2,'Changed time.'),(53,'2011-11-28 16:34:54',1,9,'10','Nasty Girls - 00:11:02',2,'Changed time.'),(54,'2012-01-21 22:22:34',1,3,'3','liat',1,''),(55,'2012-01-21 22:24:44',1,9,'12','Back Squat 1RM - 205 LB',1,''),(56,'2012-02-04 12:27:30',1,3,'4','ophir',2,'Changed username.'),(57,'2012-02-04 12:28:08',1,3,'4','ophir',2,'Changed first_name and last_name.'),(58,'2012-02-04 12:31:42',1,8,'16','Power Clean',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'activity','prs','activity'),(9,'score','prs','score'),(10,'log entry','admin','logentry'),(11,'migration history','south','migrationhistory'),(12,'tag','prs','tag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` text NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('044955cd4e64926cfceb2f8e308ce7e3','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2011-07-30 12:45:15'),('17d97f2c2c677018a52f286b5bb39562','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2012-02-21 23:46:22'),('18f768a0d85426b1ff41c640a7b956bc','MWU2ZDhhYmE3NjZlMzQ1NjVmYjFkNDdlZmQ0MTBkZjFjZDIzMzBmNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-03-12 00:34:28'),('230deb224a9cea2404c50e417bf95a52','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2011-05-18 22:24:44'),('255fa8a577f1c32a06e1133f951220d0','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2011-09-18 01:03:29'),('43b8354ee30ba9ff702ae121b129efa6','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2012-02-21 02:02:42'),('4a82b236c49778454df97a6304c7e261','ODZmYjU1Mjc4YTEzYTM0YTZjNGUzYTdhOGIzN2IzYTA1MjE5Mjk3MTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-15 13:31:41'),('4c8e26edf12fd6bc93cf080b444b4445','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2012-02-05 10:44:52'),('6e33d3edc9efafff76afa2bcb905893b','ODZmYjU1Mjc4YTEzYTM0YTZjNGUzYTdhOGIzN2IzYTA1MjE5Mjk3MTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-01-29 13:41:28'),('81c669539d9e92baa74f25ded0aacffe','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2011-12-12 00:09:48'),('a81af162e2ddac54b8705b8bfcec1398','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2011-07-02 08:14:34'),('b00d63454ac9ddea1e13bab22494938d','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2011-05-15 13:59:10'),('b897c93e03200052cf040808cb3b4441','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2011-11-27 15:48:38'),('c83271b364a6dce6bf970a340cb895f8','MDhlMTA1NWRhYTg5MjM2ZWU4MDFiZGYyN2M3MmUyYTZkMzRkZjk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2012-01-29 13:11:35');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prs_activity`
--

DROP TABLE IF EXISTS `prs_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prs_activity` (
  `description` varchar(4096) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `image` text,
  `reps` int(11) DEFAULT NULL,
  `scoreType` varchar(8) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(4) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prs_activity`
--

LOCK TABLES `prs_activity` WRITE;
/*!40000 ALTER TABLE `prs_activity` DISABLE KEYS */;
INSERT INTO `prs_activity` VALUES ('Put the barbell on your shoulders, sit down and stand up',NULL,NULL,1,'Weight',NULL,1,NULL,'Back Squat 1RM'),('Rack the barbell on your chest, press up until your elbows are locked. Don\'t bend your knees.',NULL,NULL,NULL,'Weight',NULL,2,NULL,'Press 1RM'),('Pull the barbell from the floor and stand up',NULL,NULL,1,'Weight',NULL,3,NULL,'Deadlift 1RM'),('Put the barbell on your shoulders, sit down and stand up',NULL,NULL,3,'Weight',NULL,4,NULL,'Back Squat 3RM'),('Put the barbell on your shoulders, sit down and stand up',NULL,NULL,5,'Weight',NULL,5,NULL,'Back Squat 5RM'),('Pull the barbell from the floor and stand up',NULL,NULL,3,'Weight',NULL,6,NULL,'Deadlift 3RM'),('Pull the barbell from the floor and stand up',NULL,NULL,5,'Weight',NULL,7,NULL,'Deadlift 5RM'),('Rack the barbell on your chest, press up until your elbows are locked. Don\'t bend your knees.',NULL,NULL,3,'Time',NULL,8,NULL,'Press 3RM'),('Rack the barbell on your chest, press up until your elbows are locked. Don\'t bend your knees.',NULL,NULL,5,'Weight',NULL,9,NULL,'Press 5RM'),('Perform as many pull ups as possible without dropping off the bar. Use any style: kipping, strict etc. The only requiremnt is full ROM: chin over bar at the top and arms stretched at the bottom.',NULL,NULL,NULL,'Reps',NULL,10,NULL,'Pull ups'),('Swing the kettlebell between your legs and over your head.',NULL,'',NULL,'Reps',NULL,11,NULL,'Kettlebell Swings - 1.5 pood'),('Swing the kettlebell between your legs and over your head.',NULL,'',NULL,'Reps',NULL,12,NULL,'Kettlebell Swings - 2 pood'),('Jump on the rings and lock your elbows with your arms by your side. That\'s your start position. Lower yourself by bending your elbows until your biceps touch the rings. Press up to the start position. Rinse and repeat.',NULL,'',NULL,'Reps',NULL,13,NULL,'Ring Dips'),('3 rounds for time\n\n50 air squats\n\n7 muscle ups\n\n10 hang power cleans 135#',NULL,'',NULL,'Time',NULL,14,NULL,'Nasty Girls'),('Skip the rope spinning the rope twice for each skip.',NULL,'',NULL,'Reps',NULL,15,NULL,'Double Unders'),('Lift the bar from the floor in an explosive motion and rack it on your shoulders. You may bend your knees to catch the bar, but the catch position must not be in a full squat position (heaps at or above knee level) ',NULL,'',NULL,'Weight',NULL,16,NULL,'Power Clean');
/*!40000 ALTER TABLE `prs_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prs_score`
--

DROP TABLE IF EXISTS `prs_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prs_score` (
  `activity_id` int(11) DEFAULT NULL,
  `rx` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `when` date DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prs_score_user_id` (`user_id`),
  KEY `prs_score_403f60f` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prs_score`
--

LOCK TABLES `prs_score` WRITE;
/*!40000 ALTER TABLE `prs_score` DISABLE KEYS */;
INSERT INTO `prs_score` VALUES (1,1,1,255,'2011-05-01',NULL,'',NULL,1,'LB'),(2,1,1,150,'2011-03-14',NULL,'',NULL,2,'LB'),(3,1,1,385,'2011-05-09',NULL,'',NULL,3,'LB'),(5,1,1,235,'2011-05-09',NULL,'',NULL,4,'LB'),(7,1,1,345,'2011-05-09',NULL,'',NULL,5,'LB'),(6,1,1,375,'2011-05-09',NULL,'',NULL,6,'LB'),(9,1,1,125,'2011-03-14',NULL,'',NULL,7,'LB'),(10,1,1,NULL,'2011-06-17',37,'',NULL,8,NULL),(5,1,1,245,'2011-09-04',NULL,'',NULL,9,'LB'),(14,1,1,NULL,'2011-11-25',NULL,'','00:11:02',10,'LB'),(14,1,1,NULL,'2011-08-28',NULL,'','00:11:35',11,'LB'),(1,1,3,205,'2012-01-21',1,'',NULL,12,'LB'),(1,1,1,285,'2012-01-14',1,'With belt',NULL,13,'LB'),(15,1,1,NULL,'2012-01-21',70,'',NULL,14,NULL),(16,1,4,35,'2012-02-03',NULL,'',NULL,15,'LB'),(16,1,4,45,'2012-02-04',NULL,'',NULL,16,'LB'),(15,1,1,NULL,'2012-01-27',75,'',NULL,17,'LB');
/*!40000 ALTER TABLE `prs_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prs_score_tags`
--

DROP TABLE IF EXISTS `prs_score_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prs_score_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prs_score_tags_77122edb` (`score_id`),
  KEY `prs_score_tags_3747b463` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prs_score_tags`
--

LOCK TABLES `prs_score_tags` WRITE;
/*!40000 ALTER TABLE `prs_score_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `prs_score_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prs_tag`
--

DROP TABLE IF EXISTS `prs_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prs_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prs_tag_403f60f` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prs_tag`
--

LOCK TABLES `prs_tag` WRITE;
/*!40000 ALTER TABLE `prs_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `prs_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'prs','0001_0001','2011-11-13 23:42:30'),(2,'prs','0002_0002','2011-11-13 23:43:30'),(3,'prs','0003_schemamigration','2012-02-01 23:06:01');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-03 17:07:57
