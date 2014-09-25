CREATE DATABASE  IF NOT EXISTS `instruments` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `instruments`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: instruments
-- ------------------------------------------------------
-- Server version	5.5.9

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
-- Table structure for table `instrument_types`
--

DROP TABLE IF EXISTS `instrument_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrument_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument_types`
--

LOCK TABLES `instrument_types` WRITE;
/*!40000 ALTER TABLE `instrument_types` DISABLE KEYS */;
INSERT INTO `instrument_types` VALUES (1,'Guitar'),(2,'Piano'),(3,'Drums'),(4,'Bass'),(5,'Saxophone');
/*!40000 ALTER TABLE `instrument_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `instrument_type_id` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `make` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `purchase_price` decimal(8,2) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instruments_users_idx` (`user_id`),
  KEY `fk_instruments_instrument_types1_idx` (`instrument_type_id`),
  CONSTRAINT `fk_instruments_instrument_types1` FOREIGN KEY (`instrument_type_id`) REFERENCES `instrument_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_instruments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,1,1,1979,'Charvel','Custom',1278.00,'1979-04-06 00:00:00','2014-09-25 07:31:56',NULL),(2,3,1,1978,'Gibson','Les Paul',2678.95,'1978-11-16 00:00:00','2014-09-25 07:32:50',NULL),(3,2,3,1972,'Tama','Silverstar',875.00,'1973-01-22 00:00:00','2014-09-25 07:37:03',NULL),(4,3,1,1982,'Jackson','Custom',2400.00,'1982-08-13 00:00:00','2014-09-25 07:40:18',NULL),(5,4,2,1997,'Steinway','Model B',47500.00,'1998-02-22 00:00:00','2014-09-25 07:43:43',NULL),(6,4,2,2012,'Yamaha','G3',14000.00,'2012-12-06 00:00:00','2014-09-25 07:46:18',NULL),(7,6,3,1987,'Pearl','DW Collector Series',3785.00,'1988-03-12 00:00:00','2014-09-25 07:49:32',NULL),(8,5,2,2005,'Yamaha','CLP-280',2275.00,'2005-06-06 00:00:00','2014-09-25 07:51:54',NULL),(9,7,5,2001,'Yanagisawa','SE-2 100',2785.00,'2003-09-13 00:00:00','2014-09-25 12:37:45',NULL),(10,8,1,2004,'Ibanez','S470',4295.00,'2004-05-07 00:00:00','2014-09-25 14:25:58',NULL);
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Eddie','Van Halen','eddiv@fastfingers.com','2014-09-25 07:19:58',NULL),(2,'John','Bonham','jbonham@zep.com','2014-09-25 07:20:43',NULL),(3,'Randy','Rhoads','rrhoads@rockergod.com','2014-09-25 07:21:21',NULL),(4,'Tori','Amos','tori@pianoplayer.com','2014-09-25 07:24:08',NULL),(5,'Sara','Bareilles','sarab@mellowjams.com','2014-09-25 07:25:22',NULL),(6,'Tommy','Lee','tommylee@crue.com','2014-09-25 07:28:09',NULL),(7,'Kenny','G','kennyg@sax.com','2014-09-25 12:32:24',NULL),(8,'Steve','Vai','steviev@oldrocker.com','2014-09-25 14:24:44',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-25 14:33:55
