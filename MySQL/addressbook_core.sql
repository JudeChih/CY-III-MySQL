CREATE DATABASE  IF NOT EXISTS `AddressBook` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `AddressBook`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: AddressBook
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `Bill` (
  `tel` varchar(20) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `dd` datetime NOT NULL,
  `hid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tel`,`dd`),
  KEY `fk_hid_idx` (`hid`),
  CONSTRAINT `fk_Bill_hid` FOREIGN KEY (`hid`) REFERENCES `House` (`hid`),
  CONSTRAINT `fk_Bill_tel` FOREIGN KEY (`tel`) REFERENCES `Phone` (`tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
INSERT INTO `Bill` VALUES ('1111',300,'2019-01-01 00:00:00',1),('1111',700,'2019-02-01 00:00:00',1),('1112',700,'2019-01-01 00:00:00',1),('1112',450,'2019-02-01 00:00:00',1),('1112',200,'2019-03-01 00:00:00',1),('2222',150,'2019-01-01 00:00:00',2),('2222',400,'2019-02-01 00:00:00',2),('2222',300,'2019-03-01 00:00:00',2),('3333',500,'2019-04-01 00:00:00',3);
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `House`
--

DROP TABLE IF EXISTS `House`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `House` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `House`
--

LOCK TABLES `House` WRITE;
/*!40000 ALTER TABLE `House` DISABLE KEYS */;
INSERT INTO `House` VALUES (1,'台北市南京東路1號'),(2,'新竹市光復北路1號'),(3,'台中市公益路二段51號'),(4,'高雄市五福路3號');
/*!40000 ALTER TABLE `House` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Live`
--

DROP TABLE IF EXISTS `Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `Live` (
  `uid` varchar(20) NOT NULL,
  `hid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`hid`),
  KEY `fk_hid_idx` (`hid`),
  CONSTRAINT `fk_hid` FOREIGN KEY (`hid`) REFERENCES `House` (`hid`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `UserInfo` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Live`
--

LOCK TABLES `Live` WRITE;
/*!40000 ALTER TABLE `Live` DISABLE KEYS */;
INSERT INTO `Live` VALUES ('A01',1),('A02',1),('A03',1),('A01',3);
/*!40000 ALTER TABLE `Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phone`
--

DROP TABLE IF EXISTS `Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `Phone` (
  `tel` varchar(20) NOT NULL,
  `hid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tel`),
  KEY `fk_Phone_hid_idx` (`hid`),
  CONSTRAINT `fk_Phone_hid` FOREIGN KEY (`hid`) REFERENCES `House` (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phone`
--

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;
INSERT INTO `Phone` VALUES ('1111',1),('1112',1),('2222',2),('3333',3);
/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserInfo`
--

DROP TABLE IF EXISTS `UserInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `UserInfo` (
  `uid` varchar(20) NOT NULL,
  `cname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserInfo`
--

LOCK TABLES `UserInfo` WRITE;
/*!40000 ALTER TABLE `UserInfo` DISABLE KEYS */;
INSERT INTO `UserInfo` VALUES ('A01','王大明'),('A02','李大媽'),('A03','王小毛'),('A04','朱小妹'),('A05',NULL),('A06','');
/*!40000 ALTER TABLE `UserInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_user`
--

DROP TABLE IF EXISTS `vw_user`;
/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_user` AS SELECT 
 1 AS `uid`,
 1 AS `cname`,
 1 AS `address`,
 1 AS `tel`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'AddressBook'
--

--
-- Final view structure for view `vw_user`
--

/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_user` AS select `UserInfo`.`uid` AS `uid`,`UserInfo`.`cname` AS `cname`,`House`.`address` AS `address`,`Phone`.`tel` AS `tel` from (((`UserInfo` left join `Live` on((`UserInfo`.`uid` = `Live`.`uid`))) left join `House` on((`Live`.`hid` = `House`.`hid`))) left join `Phone` on((`House`.`hid` = `Phone`.`hid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-27 13:00:59
