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
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `customer_info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr4863y370hoyqp81kcu20c27t` (`customer_info_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,'2019-11-08','Waiting',325,1),(2,NULL,'Ordered',220,2),(3,NULL,'Ordered',325,3),(4,NULL,'Ordered',670,4),(5,'2019-11-11','Ordered',100,5),(6,'2019-11-12','Ordered',100,6),(7,'2019-11-12','Ordered',225,7),(8,'2019-11-12','Ordered',225,8),(9,'2019-11-12','Ordered',100,9),(10,'2019-11-13','Ordered',1785,10),(11,'2019-11-13','Ordered',100,11),(12,'2019-11-15','Waiting',100,12),(13,'2019-11-15','Ordered',100,17),(14,'2019-11-15','Ordered',225,18),(15,'2019-11-15','Ordered',50,19),(16,'2019-11-15','Ordered',1525,20),(17,'2019-11-15','Ordered',100,21),(18,'2019-11-15','Ordered',1275,22),(19,'2019-11-15','Waiting',100,23),(20,'2019-11-15','Ordered',100,25),(21,'2019-11-15','Ordered',100,26),(22,'2019-11-15','Ordered',100,27),(23,'2019-11-15','Ordered',50,28),(24,'2019-11-15','Ordered',650,29),(25,'2019-11-15','Waiting',170,NULL),(26,'2019-11-15','Ordered',170,34),(27,'2019-11-15','Ordered',170,35),(28,'2019-11-15','Ordered',395,36),(29,'2019-11-15','Ordered',1300,37),(30,'2019-11-15','Ordered',100,38),(31,'2019-11-15','Ordered',1300,39),(32,'2019-11-15','Ordered',1300,40),(33,'2019-11-15','Ordered',1950,41),(34,'2019-11-15','Ordered',1275,42),(35,'2019-11-15','Ordered',1400,43),(36,'2019-11-15','Ordered',675,44),(37,'2019-11-15','Ordered',350,45),(38,'2019-11-15','Ordered',1525,46),(39,'2019-11-15','Ordered',250,47),(40,'2019-11-15','Ordered',150,48),(41,'2019-11-15','Ordered',650,49);
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
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
