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
-- Table structure for table `customerinfo`
--

DROP TABLE IF EXISTS `customerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbi7kolyg49ch6ojqiqyyo4qr5` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerinfo`
--

LOCK TABLES `customerinfo` WRITE;
/*!40000 ALTER TABLE `customerinfo` DISABLE KEYS */;
INSERT INTO `customerinfo` VALUES (1,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(2,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(3,'dien ban','phamhuuvuong192@gmail.com','Bich Lien','FEMALE','0933365317',NULL),(4,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(5,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(6,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(7,'Da Nang','bichlien192@gmail.com','Dang Thi Bich Lien','MALE','0901977892',NULL),(8,'Quang Nam','hacthanphongluu@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(9,'Da Nang','bichlien192@gmail.com','Dang Thi Bich Lien','MALE','0901977892',NULL),(10,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(11,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(13,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(14,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(15,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(16,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(17,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(18,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(19,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(20,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(21,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(22,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(23,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(24,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(25,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(26,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(27,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',1),(28,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(29,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(34,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(35,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(36,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',1),(37,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(38,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(39,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(40,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(41,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(42,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(43,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(44,'dien ban','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(45,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',1),(46,'Quang Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',1),(47,'Da Nang','phamhuuvuong192@gmail.com','Nguyen Van A','MALE','123456',NULL),(48,'Viet Nam','phamhuuvuong192@gmail.com','Pham Huu Vuong','MALE','0933365317',NULL),(49,'Da Nang','hacthanphongluu@gmail.com','test lan cuoi','MALE','123456',NULL);
/*!40000 ALTER TABLE `customerinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-15 21:38:25
