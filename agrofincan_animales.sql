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
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `especie` varchar(50) NOT NULL,
  `raza` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `proposito` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`animal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,'Bovino','Holstein-001','2022-01-15','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,'Bovino','Jersey-001','2022-02-20','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,'Bovino','Angus-001','2022-03-10','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,'Bovino','Brahman-001','2022-04-05','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,'Bovino','Simmental-001','2022-05-12','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,'Porcino','Yorkshire-001','2023-01-15','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,'Porcino','Duroc-001','2023-02-18','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,'Porcino','Landrace-001','2023-03-22','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,'Porcino','Hampshire-001','2023-04-25','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,'Porcino','Pietrain-001','2023-05-30','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,'Ovino','Merino-001','2023-01-10','Activo','Lana','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,'Ovino','Suffolk-001','2023-02-15','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,'Ovino','Dorper-001','2023-03-20','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,'Ovino','Romney-001','2023-04-25','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,'Ovino','Texel-001','2023-05-30','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,'Caprino','Saanen-001','2023-01-05','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,'Caprino','Boer-001','2023-02-10','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,'Caprino','Alpina-001','2023-03-15','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,'Caprino','Nubian-001','2023-04-20','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,'Caprino','LaMancha-001','2023-05-25','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,'Bovino','Holstein-002','2022-06-15','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,'Bovino','Jersey-002','2022-07-20','Enfermo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,'Bovino','Angus-002','2022-08-25','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,'Bovino','Brahman-002','2022-09-30','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,'Bovino','Simmental-002','2022-10-05','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,'Porcino','Yorkshire-002','2023-06-15','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,'Porcino','Duroc-002','2023-07-20','Enfermo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,'Porcino','Landrace-002','2023-08-25','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,'Porcino','Hampshire-002','2023-09-30','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,'Porcino','Pietrain-002','2023-10-05','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,'Ovino','Merino-002','2023-06-10','Activo','Lana','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,'Ovino','Suffolk-002','2023-07-15','Enfermo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,'Ovino','Dorper-002','2023-08-20','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,'Ovino','Romney-002','2023-09-25','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,'Ovino','Texel-002','2023-10-30','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,'Bovino','Holstein-003','2022-11-15','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,'Bovino','Jersey-003','2022-12-20','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,'Bovino','Angus-003','2023-01-25','Inactivo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,'Bovino','Brahman-003','2023-02-28','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,'Bovino','Simmental-003','2023-03-05','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,'Porcino','Yorkshire-003','2023-11-15','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,'Porcino','Duroc-003','2023-12-20','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,'Porcino','Landrace-003','2024-01-25','Inactivo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,'Porcino','Hampshire-003','2024-02-29','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,'Porcino','Pietrain-003','2024-03-05','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,'Caprino','Saanen-002','2023-06-05','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,'Caprino','Boer-002','2023-07-10','Enfermo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,'Caprino','Alpina-002','2023-08-15','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,'Caprino','Nubian-002','2023-09-20','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,'Caprino','LaMancha-002','2023-10-25','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,'Bovino','Holstein-004','2023-04-15','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,'Bovino','Jersey-004','2023-05-20','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,'Bovino','Angus-004','2023-06-25','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,'Bovino','Brahman-004','2023-07-30','Inactivo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,'Bovino','Simmental-004','2023-08-05','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,'Porcino','Yorkshire-004','2024-04-15','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(57,'Porcino','Duroc-004','2024-05-20','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(58,'Porcino','Landrace-004','2024-06-25','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(59,'Porcino','Hampshire-004','2024-07-30','Inactivo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(60,'Porcino','Pietrain-004','2024-08-05','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(61,'Ovino','Merino-003','2023-11-10','Activo','Lana','2024-11-28 02:53:05','2024-11-28 02:53:05'),(62,'Ovino','Suffolk-003','2023-12-15','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(63,'Ovino','Dorper-003','2024-01-20','Enfermo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(64,'Ovino','Romney-003','2024-02-25','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(65,'Ovino','Texel-003','2024-03-30','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(66,'Caprino','Saanen-003','2023-11-05','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(67,'Caprino','Boer-003','2023-12-10','Activo','Carne','2024-11-28 02:53:05','2024-11-28 02:53:05'),(68,'Caprino','Alpina-003','2024-01-15','Enfermo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05'),(69,'Caprino','Nubian-003','2024-02-20','Activo','Doble Propósito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(70,'Caprino','LaMancha-003','2024-03-25','Activo','Leche','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 23:54:24
