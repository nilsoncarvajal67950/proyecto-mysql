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
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `venta_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `tipo_pago` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`venta_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'2024-01-01',1250.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,2,'2024-01-02',890.50,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,3,'2024-01-02',2100.75,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,4,'2024-01-03',450.25,'Cancelado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,5,'2024-01-03',1875.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,1,'2024-01-04',925.50,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,2,'2024-01-04',1450.75,'Pendiente','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,3,'2024-01-05',675.25,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,4,'2024-01-05',2250.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,5,'2024-01-06',1100.50,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,1,'2024-01-06',1950.75,'Cancelado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,2,'2024-01-07',825.25,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,3,'2024-01-07',2450.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,4,'2024-01-08',1275.50,'Pendiente','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,5,'2024-01-08',1650.75,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,1,'2024-01-09',975.25,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,2,'2024-01-09',2850.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,3,'2024-01-10',1425.50,'Cancelado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,4,'2024-01-10',1750.75,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,5,'2024-01-11',1125.25,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,1,'2024-01-11',3250.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,2,'2024-01-12',1575.50,'Pendiente','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,3,'2024-01-12',1850.75,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,4,'2024-01-13',1275.25,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,5,'2024-01-13',3650.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,1,'2024-01-14',1725.50,'Cancelado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,2,'2024-01-14',1950.75,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,3,'2024-01-15',1425.25,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,4,'2024-01-15',4050.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,5,'2024-01-16',1875.50,'Pendiente','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,1,'2024-01-16',2050.75,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,2,'2024-01-17',1575.25,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,3,'2024-01-17',4450.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,4,'2024-01-18',2025.50,'Cancelado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,5,'2024-01-18',2150.75,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,1,'2024-01-19',1725.25,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,2,'2024-01-19',4850.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,3,'2024-01-20',2175.50,'Pendiente','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,4,'2024-01-20',2250.75,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,5,'2024-01-21',1875.25,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,1,'2024-01-21',5250.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,2,'2024-01-22',2325.50,'Cancelado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,3,'2024-01-22',2350.75,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,4,'2024-01-23',2025.25,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,5,'2024-01-23',5650.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,1,'2024-01-24',2475.50,'Pendiente','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,2,'2024-01-24',2450.75,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,3,'2024-01-25',2175.25,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,4,'2024-01-25',6050.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,5,'2024-01-26',2625.50,'Cancelado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,1,'2024-01-26',2550.75,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,2,'2024-01-27',2325.25,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,3,'2024-01-27',6450.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,4,'2024-01-28',2775.50,'Pendiente','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,5,'2024-01-28',2650.75,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,1,'2024-01-29',2475.25,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(57,2,'2024-01-29',6850.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(58,3,'2024-01-30',2925.50,'Cancelado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(59,4,'2024-01-30',2750.75,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(60,5,'2024-01-31',2625.25,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(61,1,'2024-01-31',7250.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(62,2,'2024-02-01',3075.50,'Pendiente','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(63,3,'2024-02-01',2850.75,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(64,4,'2024-02-02',2775.25,'Completado','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(65,5,'2024-02-02',7650.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(66,1,'2024-02-03',3225.50,'Cancelado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(67,2,'2024-02-03',2950.75,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(68,3,'2024-02-04',2925.25,'Completado','Tarjeta de débito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(69,4,'2024-02-04',8050.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05'),(70,5,'2024-02-05',3375.50,'Pendiente','PayPal','2024-11-28 02:53:05','2024-11-28 02:53:05'),(71,1,'2024-02-05',3050.75,'Completado','Efectivo','2024-11-28 02:53:05','2024-11-28 02:53:05'),(72,2,'2024-02-06',3075.25,'Completado','Transferencia','2024-11-28 02:53:05','2024-11-28 02:53:05'),(73,3,'2024-02-06',8450.00,'Completado','Tarjeta de crédito','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
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
