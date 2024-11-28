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
-- Table structure for table `actividades_agricolas`
--

DROP TABLE IF EXISTS `actividades_agricolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades_agricolas` (
  `actividad_id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int DEFAULT NULL,
  `tipo_trabajo_id` int DEFAULT NULL,
  `lote_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `horas_trabajadas` decimal(5,2) DEFAULT NULL,
  `observaciones` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actividad_id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `tipo_trabajo_id` (`tipo_trabajo_id`),
  KEY `lote_id` (`lote_id`),
  CONSTRAINT `actividades_agricolas_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `actividades_agricolas_ibfk_2` FOREIGN KEY (`tipo_trabajo_id`) REFERENCES `tipo_trabajo` (`tipo_trabajo_id`),
  CONSTRAINT `actividades_agricolas_ibfk_3` FOREIGN KEY (`lote_id`) REFERENCES `lotes` (`lote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades_agricolas`
--

LOCK TABLES `actividades_agricolas` WRITE;
/*!40000 ALTER TABLE `actividades_agricolas` DISABLE KEYS */;
INSERT INTO `actividades_agricolas` VALUES (1,1,1,1,'2024-01-01',8.00,'Siembra de maíz completada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,2,2,2,'2024-01-02',7.50,'Riego por aspersión realizado','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,3,3,1,'2024-01-03',6.75,'Fertilización orgánica aplicada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,4,1,3,'2024-01-04',8.25,'Preparación de terreno','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,5,2,2,'2024-01-05',7.00,'Mantenimiento de sistema de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,1,3,4,'2024-01-06',6.50,'Control de plagas efectuado','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,2,1,5,'2024-01-07',8.50,'Siembra de frijol realizada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,3,2,3,'2024-01-08',7.25,'Riego manual completado','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,4,3,2,'2024-01-09',6.00,'Aplicación de pesticidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,5,1,1,'2024-01-10',8.75,'Limpieza de maleza','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,1,2,4,'2024-01-11',7.75,'Sistema de riego revisado','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,2,3,5,'2024-01-12',6.25,'Fertilización completada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,3,1,3,'2024-01-13',8.50,'Siembra de hortalizas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,4,2,2,'2024-01-14',7.00,'Mantenimiento de cultivos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,5,3,1,'2024-01-15',6.75,'Control de maleza realizado','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,1,1,5,'2024-01-16',8.25,'Preparación de suelo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,2,2,4,'2024-01-17',7.50,'Riego programado completado','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,3,3,3,'2024-01-18',6.00,'Aplicación de abono','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,4,1,2,'2024-01-19',8.75,'Siembra de tomates','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,5,2,1,'2024-01-20',7.25,'Mantenimiento general','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,1,3,5,'2024-01-21',6.50,'Control de plagas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,2,1,4,'2024-01-22',8.00,'Preparación de parcelas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,3,2,3,'2024-01-23',7.75,'Riego por goteo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,4,3,2,'2024-01-24',6.25,'Fertilización realizada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,5,1,1,'2024-01-25',8.50,'Siembra de papas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,1,2,5,'2024-01-26',7.00,'Sistema de riego mantenido','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,2,3,4,'2024-01-27',6.75,'Aplicación de fungicidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,3,1,3,'2024-01-28',8.25,'Preparación de tierra','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,4,2,2,'2024-01-29',7.50,'Riego completado','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,5,3,1,'2024-01-30',6.00,'Control de maleza','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,1,1,5,'2024-01-31',8.75,'Siembra de zanahorias','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,2,2,4,'2024-02-01',7.25,'Mantenimiento de cultivos','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,3,3,3,'2024-02-02',6.50,'Fumigación realizada','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,4,1,2,'2024-02-03',8.00,'Preparación de semilleros','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,5,2,1,'2024-02-04',7.75,'Riego manual','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,1,3,5,'2024-02-05',6.25,'Fertilización foliar','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,2,1,4,'2024-02-06',8.50,'Siembra de lechugas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,3,2,3,'2024-02-07',7.00,'Mantenimiento de equipo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,4,3,2,'2024-02-08',6.75,'Control de plagas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,5,1,1,'2024-02-09',8.25,'Preparación de camas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,1,2,5,'2024-02-10',7.50,'Sistema de riego','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,2,3,4,'2024-02-11',6.00,'Aplicación de herbicidas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,3,1,3,'2024-02-12',8.75,'Siembra de cebollas','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,4,2,2,'2024-02-13',7.25,'Riego por aspersión','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,5,3,1,'2024-02-14',6.50,'Control de maleza','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,1,1,5,'2024-02-15',8.00,'Preparación de suelo','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `actividades_agricolas` ENABLE KEYS */;
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
