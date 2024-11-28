-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: agrofincan
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes` (
  `lote_id` int NOT NULL AUTO_INCREMENT,
  `campo_id` int DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `tipo_riego` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lote_id`),
  KEY `campo_id` (`campo_id`),
  CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`campo_id`) REFERENCES `campos` (`campo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

LOCK TABLES `lotes` WRITE;
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
INSERT INTO `lotes` VALUES (1,1,5.00,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,1,4.00,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,1,6.50,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,2,5.20,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,2,3.00,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,2,8.00,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,3,7.25,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,3,3.15,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,3,4.80,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,4,9.00,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,4,6.45,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,4,5.20,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,5,10.00,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,5,3.50,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,5,7.50,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,6,1.75,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,6,2.40,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,6,8.00,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,7,4.80,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,7,5.50,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,7,3.70,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,8,8.25,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,8,6.15,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,8,7.30,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,9,10.50,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,9,2.90,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,9,5.80,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,10,3.25,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,10,7.10,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,10,4.55,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,11,6.00,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,11,9.50,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,11,3.80,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,12,5.45,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,12,4.70,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,12,8.50,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,13,2.00,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,13,6.25,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,13,7.40,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,14,8.85,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,14,5.95,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,14,9.10,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,15,9.30,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,15,6.45,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,15,5.75,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,16,4.30,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,16,7.85,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,16,3.95,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,17,5.90,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,17,4.60,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,18,8.20,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,18,9.15,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,18,6.05,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,19,3.60,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,19,4.75,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,19,5.80,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(57,20,7.20,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(58,20,8.00,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(59,20,9.30,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(60,21,6.85,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(61,21,5.50,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(62,21,1.90,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(63,22,3.75,'Disponible','Goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(64,22,4.50,'Cultivando','Inundación','2024-11-28 02:53:05','2024-11-28 02:53:05'),(65,22,8.50,'En cosecha','Aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 23:54:25
