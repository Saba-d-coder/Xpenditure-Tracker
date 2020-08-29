CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `daily_xpense`
--

DROP TABLE IF EXISTS `daily_xpense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_xpense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemName` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_xpense`
--

LOCK TABLES `daily_xpense` WRITE;
/*!40000 ALTER TABLE `daily_xpense` DISABLE KEYS */;
INSERT INTO `daily_xpense` VALUES (22,'Novel',250,'2020-01-17'),(23,'dhjdh',67,'2020-04-17'),(24,'djhdj',56,'2020-04-01'),(25,'dfhjd',76,'2020-04-01'),(26,'jdhd',6,'2020-04-17'),(27,'dhjdh',7,'2020-04-08'),(28,'jjdhfjd',67,'2020-04-01'),(29,'jjdhfjd',67,'2020-04-01'),(30,'dhjd',5,'2020-04-02'),(31,'jdh',67,'2020-04-02'),(32,'dhjhd',7,'2020-04-02'),(33,'dhjhd',7,'2020-04-02'),(34,'dhd',6,'2020-04-01'),(35,'djdd',67,'2020-04-01'),(36,'ddkhd',6,'2020-04-01'),(37,'djhdf',67,'2020-04-16'),(38,'djhf',67,'2020-04-11'),(39,'fhdf',56,'2020-04-11'),(40,'fhdf',56,'2020-04-11'),(41,'fhdf',56,'2020-04-11'),(42,'fhdf',56,'2020-04-11'),(43,'fhdf',56,'2020-04-11'),(44,'fhdf',56,'2020-04-11'),(45,'fhdf',56,'2020-04-11'),(46,'fhdf',56,'2020-04-11'),(47,'djhf',67,'2020-04-11'),(48,'dfjd',78,'2020-04-12'),(49,'dfjd',78,'2020-04-12'),(50,'djfh',67,'2020-04-12'),(51,'djfh',67,'2020-04-12'),(52,'djfh',67,'2020-04-12'),(53,'djfh',67,'2020-04-12'),(54,'djfh',67,'2020-04-12'),(55,'dhfd',8,'2020-04-23'),(56,'dddj',89,'2020-04-23'),(70,'Pen',89.67,'2000-06-18'),(79,'Pen',89.67,'2000-06-19'),(90,'Pen',89.67,'2000-06-20'),(91,'Lunch',120,'2020-04-12'),(92,'Breakfast',48,'2020-04-13'),(93,'A4 sheets',20,'2020-04-14'),(94,'Book',40.74,'2020-04-14'),(95,'Grocery',150,'2020-04-15'),(96,'Dinner',150,'2020-04-15'),(97,'Lunch',90,'2020-04-15'),(98,'Dinner',890,'2020-04-16'),(99,'Grocery',300,'2020-04-16'),(100,'Cake',340.75,'1990-03-08'),(101,'Paper',30,'2020-04-16'),(102,'Paper',30.5,'2020-04-17'),(103,'Ruler',5,'2020-04-17'),(104,'Pencil',100,'2020-04-17'),(105,'Pen',150,'2020-04-17'),(106,'Book',170.05,'2020-04-17'),(133,'Coke',100.75,'1990-03-08'),(180,'Cola',80,'1990-03-08');
/*!40000 ALTER TABLE `daily_xpense` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-03 11:54:51
