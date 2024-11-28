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
-- Table structure for table `produccion_animales`
--

DROP TABLE IF EXISTS `produccion_animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion_animales` (
  `produccion_animal_id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo_produccion` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `unidad_medida` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produccion_animal_id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `produccion_animales_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animales` (`animal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion_animales`
--

LOCK TABLES `produccion_animales` WRITE;
/*!40000 ALTER TABLE `produccion_animales` DISABLE KEYS */;
INSERT INTO `produccion_animales` VALUES (1,1,'2024-01-15','Leche A1',25.50,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,2,'2024-01-16','Leche Premium',22.75,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,3,'2024-01-17','Carne Primera',450.00,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,4,'2024-01-18','Carne Select',480.25,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,5,'2024-01-19','Leche Doble',28.30,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,6,'2024-01-20','Carne Magra',95.50,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,7,'2024-01-21','Carne Premium',98.75,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,8,'2024-01-22','Carne Selecta',92.30,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,9,'2024-01-23','Carne Superior',97.80,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,10,'2024-01-24','Carne Elite',96.40,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,11,'2024-01-25','Lana Fina',4.50,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,12,'2024-01-26','Carne Cordero Premium',35.80,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,13,'2024-01-27','Carne Cordero Select',38.20,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,14,'2024-01-28','Lana Premium',4.80,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,15,'2024-01-29','Carne Cordero Plus',37.90,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,16,'2024-01-30','Leche Cabra Gold',3.80,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,17,'2024-01-31','Carne Cabra Select',42.50,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,18,'2024-02-01','Leche Cabra Premium',3.95,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,19,'2024-02-02','Leche Cabra Plus',3.75,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,20,'2024-02-03','Leche Cabra Elite',3.90,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,21,'2024-02-04','Leche Especial',26.80,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,22,'2024-02-05','Leche Superior',23.90,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,23,'2024-02-06','Carne Prime',465.30,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,24,'2024-02-07','Carne Superior Plus',475.80,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,25,'2024-02-08','Leche Premium Plus',27.50,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,26,'2024-02-09','Carne Selecta Plus',96.80,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,27,'2024-02-10','Carne Suprema',99.20,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,28,'2024-02-11','Carne Elite Plus',94.70,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,29,'2024-02-12','Carne Premium Gold',98.30,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,30,'2024-02-13','Carne Supreme',97.90,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,31,'2024-02-14','Lana Superior',4.70,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,32,'2024-02-15','Carne Cordero Gold',36.90,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,33,'2024-02-16','Carne Cordero Prime',39.30,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,34,'2024-02-17','Lana Select',4.90,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,35,'2024-02-18','Carne Cordero Supreme',38.80,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,36,'2024-02-19','Leche Extra',24.90,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,37,'2024-02-20','Leche Ultra',25.80,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,38,'2024-02-21','Carne Premium Select',470.40,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,39,'2024-02-22','Carne Gold',485.90,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,40,'2024-02-23','Leche Supreme',26.40,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,41,'2024-02-24','Carne Super Premium',97.40,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,42,'2024-02-25','Carne Ultra Premium',98.90,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,43,'2024-02-26','Carne Premium Supreme',95.60,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,44,'2024-02-27','Carne Elite Supreme',99.10,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,45,'2024-02-28','Carne Ultra Supreme',96.70,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,46,'2024-02-29','Leche Cabra Suprema',3.85,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,47,'2024-03-01','Carne Cabra Premium',43.60,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,48,'2024-03-02','Leche Cabra Superior',3.70,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,49,'2024-03-03','Leche Cabra Supreme',3.95,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,50,'2024-03-04','Leche Cabra Ultra',3.80,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,51,'2024-03-05','Leche Premium Supreme',27.30,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,52,'2024-03-06','Leche Ultra Premium',26.90,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,53,'2024-03-07','Carne Ultra Select',468.50,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,54,'2024-03-08','Carne Supreme Select',478.70,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,55,'2024-03-09','Leche Gold Supreme',28.60,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,56,'2024-03-10','Carne Extra Premium',97.60,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(57,57,'2024-03-11','Carne Super Supreme',98.50,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(58,58,'2024-03-12','Carne Ultra Gold',96.90,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(59,59,'2024-03-13','Carne Gold Supreme',99.40,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(60,60,'2024-03-14','Carne Premium Ultra',97.20,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(61,61,'2024-03-15','Lana Ultra Premium',4.85,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(62,62,'2024-03-16','Carne Cordero Supreme Plus',37.40,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(63,63,'2024-03-17','Carne Cordero Ultra',39.80,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(64,64,'2024-03-18','Lana Gold Supreme',4.95,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(65,65,'2024-03-19','Carne Cordero Premium Ultra',38.30,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(66,66,'2024-03-20','Leche Cabra Premium Gold',3.88,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(67,67,'2024-03-21','Carne Cabra Supreme',44.20,'Kilogramos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(68,68,'2024-03-22','Leche Cabra Ultra Premium',3.92,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(69,69,'2024-03-23','Leche Cabra Premium Supreme',3.87,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(70,70,'2024-03-24','Leche Cabra Gold Supreme',3.93,'Litros','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `produccion_animales` ENABLE KEYS */;
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
