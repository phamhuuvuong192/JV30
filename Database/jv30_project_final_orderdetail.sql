-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: jv30_project_final
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
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlcynrjxtlp5kft57u85tk7vwi` (`order_id`),
  KEY `FKdubukg3j0fymgci0idnd72k0` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,23,4,'The Witcher 2',50,1),(2,24,5,'Mass Effect Trilogy',650,1),(3,26,NULL,NULL,0,0),(4,26,NULL,NULL,0,0),(5,26,NULL,NULL,0,0),(6,27,3,'BatterField 3',170,1),(7,28,1,'Dragon Age Inquisition',225,1),(8,28,3,'BatterField 3',170,1),(9,29,5,'Mass Effect Trilogy',1300,2),(10,30,4,'The Witcher 2',100,2),(11,31,5,'Mass Effect Trilogy',1300,2),(12,32,5,'Mass Effect Trilogy',1300,2),(13,33,5,'Mass Effect Trilogy',1950,3),(14,34,6,'Call Of Duty Black OPS 3',1275,3),(15,35,5,'Mass Effect Trilogy',1300,2),(16,35,2,'World Of Tank',100,1),(17,36,1,'Dragon Age Inquisition',675,3),(18,37,4,'The Witcher 2',50,1),(19,37,2,'World Of Tank',300,3),(20,38,5,'Mass Effect Trilogy',1300,2),(21,38,1,'Dragon Age Inquisition',225,1),(22,39,4,'The Witcher 2',250,5),(23,40,2,'World Of Tank',100,1),(24,40,4,'The Witcher 2',50,1),(25,41,5,'Mass Effect Trilogy',650,1);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-15 21:38:23
