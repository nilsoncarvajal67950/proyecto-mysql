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
-- Table structure for table `historial_salarios`
--

DROP TABLE IF EXISTS `historial_salarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_salarios` (
  `historial_salario_id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int DEFAULT NULL,
  `salario_anterior` decimal(10,2) DEFAULT NULL,
  `salario_nuevo` decimal(10,2) DEFAULT NULL,
  `fecha_cambio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`historial_salario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_salarios`
--

LOCK TABLES `historial_salarios` WRITE;
/*!40000 ALTER TABLE `historial_salarios` DISABLE KEYS */;
INSERT INTO `historial_salarios` VALUES (1,1,1500.00,1600.00,'2024-11-28 04:07:30','Juan Perez'),(2,2,1800.00,1900.00,'2024-11-28 04:07:30','Ana Gomez'),(3,3,2000.00,2100.00,'2024-11-28 04:07:30','Carlos Ruiz'),(4,4,2200.00,2300.00,'2024-11-28 04:07:30','Maria Lopez'),(5,5,2500.00,2600.00,'2024-11-28 04:07:30','Pedro Martinez'),(6,6,1700.00,1750.00,'2024-11-28 04:07:30','Sofia Jimenez'),(7,7,2300.00,2400.00,'2024-11-28 04:07:30','Julio Santos'),(8,8,1400.00,1450.00,'2024-11-28 04:07:30','Laura Vega'),(9,9,1600.00,1650.00,'2024-11-28 04:07:30','Miguel Torres'),(10,10,2100.00,2200.00,'2024-11-28 04:07:30','Claudia Rios'),(11,11,1900.00,1950.00,'2024-11-28 04:07:30','Luis Alvarado'),(12,12,2400.00,2500.00,'2024-11-28 04:07:30','Eva Castro'),(13,13,1300.00,1350.00,'2024-11-28 04:07:30','Richard Viera'),(14,14,1600.00,1700.00,'2024-11-28 04:07:30','Natalia Pinto'),(15,15,2000.00,2050.00,'2024-11-28 04:07:30','Fernando Silva'),(16,16,1800.00,1850.00,'2024-11-28 04:07:30','Raul Ortega'),(17,17,2100.00,2200.00,'2024-11-28 04:07:30','Gabriela Morera'),(18,18,1750.00,1800.00,'2024-11-28 04:07:30','Victor Soto'),(19,19,1550.00,1580.00,'2024-11-28 04:07:30','Isabel Cordero'),(20,20,2400.00,2500.00,'2024-11-28 04:07:30','Guillermo Pablo'),(21,21,1450.00,1500.00,'2024-11-28 04:07:30','Juliana Bravo'),(22,22,1650.00,1700.00,'2024-11-28 04:07:30','Braulio Reyes'),(23,23,1550.00,1600.00,'2024-11-28 04:07:30','Cecilia Guerrero'),(24,24,1300.00,1350.00,'2024-11-28 04:07:30','Hugo Ramirez'),(25,25,1750.00,1800.00,'2024-11-28 04:07:30','Veronica Salas'),(26,26,1800.00,1850.00,'2024-11-28 04:07:30','Jose Martinez'),(27,27,1900.00,1950.00,'2024-11-28 04:07:30','Lorena Molina'),(28,28,2200.00,2300.00,'2024-11-28 04:07:30','Esteban Castro'),(29,29,2000.00,2050.00,'2024-11-28 04:07:30','Raquel Serrano'),(30,30,2400.00,2450.00,'2024-11-28 04:07:30','Barbosa Rivas'),(31,31,1500.00,1550.00,'2024-11-28 04:07:30','Carmen Salinas'),(32,32,1700.00,1750.00,'2024-11-28 04:07:30','Diego Mendez'),(33,33,2250.00,2300.00,'2024-11-28 04:07:30','Alina Ramos'),(34,34,1850.00,1900.00,'2024-11-28 04:07:30','Ignacio Suarez'),(35,35,1700.00,1750.00,'2024-11-28 04:07:30','Santiago Olivares'),(36,36,1500.00,1550.00,'2024-11-28 04:07:30','Carla Aguirre'),(37,37,1600.00,1650.00,'2024-11-28 04:07:30','Fernando Espinoza'),(38,38,2200.00,2250.00,'2024-11-28 04:07:30','Rita Barrera'),(39,39,2300.00,2350.00,'2024-11-28 04:07:30','Pablo Quintero'),(40,40,2500.00,2550.00,'2024-11-28 04:07:30','Sandra Pacheco'),(41,41,1700.00,1750.00,'2024-11-28 04:07:30','Alfredo Jaramillo'),(42,42,1400.00,1450.00,'2024-11-28 04:07:30','Estefania Aguado'),(43,43,1800.00,1900.00,'2024-11-28 04:07:30','Omar Medina'),(44,44,1650.00,1700.00,'2024-11-28 04:07:30','Daniela Méndez'),(45,45,2000.00,2050.00,'2024-11-28 04:07:30','Javier Carrasco'),(46,46,1750.00,1800.00,'2024-11-28 04:07:30','Lina Espitia'),(47,47,2100.00,2150.00,'2024-11-28 04:07:30','Horacio Archila'),(48,48,1850.00,1900.00,'2024-11-28 04:07:30','Francisco Londoño'),(49,49,2250.00,2300.00,'2024-11-28 04:07:30','Valeria Vargas'),(50,50,2400.00,2450.00,'2024-11-28 04:07:30','Yasmin Pavia'),(51,51,1500.00,1550.00,'2024-11-28 04:07:30','Tania Aponte'),(52,52,1600.00,1650.00,'2024-11-28 04:07:30','Fernando Montoya'),(53,53,1700.00,1800.00,'2024-11-28 04:07:30','Nora Quintana'),(54,54,1750.00,1800.00,'2024-11-28 04:07:30','Susana Calderón'),(55,55,1850.00,1900.00,'2024-11-28 04:07:30','Karl Pizarro'),(56,56,1900.00,1950.00,'2024-11-28 04:07:30','Patricia Cifuentes'),(57,57,2000.00,2050.00,'2024-11-28 04:07:30','Felipe Romero'),(58,58,2100.00,2150.00,'2024-11-28 04:07:30','Clara Cruz'),(59,59,2200.00,2250.00,'2024-11-28 04:07:30','Susana Villanueva'),(60,60,2500.00,2600.00,'2024-11-28 04:07:30','Nicolas Paredes'),(61,61,2300.00,2400.00,'2024-11-28 04:07:30','Gloria de La Vega'),(62,62,1800.00,1850.00,'2024-11-28 04:07:30','Lina Espitia'),(63,63,1900.00,1950.00,'2024-11-28 04:07:30','Horacio Archila'),(64,64,2000.00,2050.00,'2024-11-28 04:07:30','Francisco Londoño'),(65,65,2200.00,2250.00,'2024-11-28 04:07:30','Valeria Vargas'),(66,66,2400.00,2500.00,'2024-11-28 04:07:30','Yasmin Pavia'),(67,67,1500.00,1550.00,'2024-11-28 04:07:30','Tania Aponte'),(68,68,1600.00,1650.00,'2024-11-28 04:07:30','Fernando Montoya'),(69,69,1700.00,1750.00,'2024-11-28 04:07:30','Nora Quintana'),(70,70,1800.00,1850.00,'2024-11-28 04:07:30','Susana Calderón');
/*!40000 ALTER TABLE `historial_salarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 23:54:26
