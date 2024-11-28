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
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenes` (
  `almacen_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `capacidad` decimal(10,2) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`almacen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenes`
--

LOCK TABLES `almacenes` WRITE;
/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` VALUES (1,'Almacén Central','Vegetales',500.00,'Zona 1','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,'Almacén Norte','Insumos',300.00,'Zona 2','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,'Almacén Sur','Productos',400.00,'Zona 3','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,'Almacén Este','Maquinaria',200.00,'Zona 4','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,'Almacén Oeste','Fertilizantes',100.00,'Zona 5','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,'Almacén Frutas','Frutas',250.00,'Zona 6','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,'Almacén Hortalizas','Vegetales',350.00,'Zona 7','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,'Almacén Plaguicidas','Agroquímicos',150.00,'Zona 8','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,'Almacén Semillas','Semillas',80.00,'Zona 9','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,'Almacén Accesorios','Maquinaria',600.00,'Zona 10','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,'Almacén Especial','Suministros',300.00,'Zona 11','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,'Almacén Proveedores','Insumos',400.00,'Zona 12','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,'Almacén Secundario','Vegetales',350.00,'Zona 13','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,'Almacén Principal','Maquinaria',500.00,'Zona 14','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,'Almacén Temporal','Productos',200.00,'Zona 15','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,'Almacén Principal 2','Semillas',250.00,'Zona 1','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,'Almacén Frutos Secos','Frutos',300.00,'Zona 2','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,'Almacén Fertilizantes','Fertilizantes',400.00,'Zona 3','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,'Almacén Emergente','Otros',350.00,'Zona 4','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,'Almacén Seco','Insumos',200.00,'Zona 5','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,'Almacén Norte 2','Proveedores',150.00,'Zona 6','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,'Almacén de Emergencia','Agroquímicos',300.00,'Zona 7','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,'Almacén para Insumos','Insumos',450.00,'Zona 8','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,'Almacén Vegetal','Vegetales',600.00,'Zona 9','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,'Almacén de Cosechas','Frutas',300.00,'Zona 10','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,'Almacén Especializado','Insumos Especiales',200.00,'Zona 11','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,'Almacén de Cultivo','Maquinaria',500.00,'Zona 12','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,'Almacén Frigorífico','Vegetales',150.00,'Zona 13','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,'Almacén Hidropónico','Semillas',600.00,'Zona 14','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,'Almacén de Fertilizantes Orgánicos','Orgánicos',400.00,'Zona 1','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,'Almacén Sostenible','Productos Ecológicos',300.00,'Zona 2','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,'Almacén de Riego','Equipos de Riego',200.00,'Zona 3','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,'Almacén de Bioinsumos','Seanetis',150.00,'Zona 4','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,'Almacén de Productos Químicos','Agroquímicos',250.00,'Zona 5','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,'Almacén Seco 2','Suministros Secos',400.00,'Zona 6','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,'Almacén de Hortalizas','Vegetales',350.00,'Zona 7','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,'Almacén de Productos Compuestos','Productos Químicos',300.00,'Zona 8','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,'Almacén de Envases','Suministros',300.00,'Zona 9','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,'Almacén de Residuos','Basura',100.00,'Zona 10','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,'Almacén Plástico','Envases Plásticos',200.00,'Zona 11','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,'Almacén Especial de Fitosanitarios','Fitosanitarios',500.00,'Zona 12','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,'Almacén de Pesticidas','Pesticidas',400.00,'Zona 13','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,'Almacén de Herramientas','Herramientas',300.00,'Zona 14','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,'Almacén de Alimentos','Alimentos',600.00,'Zona 15','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,'Almacén Vegetal 2','Vegetales',650.00,'Zona 1','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,'Almacén Ecológico','Biológicos',300.00,'Zona 2','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,'Almacén Norte 3','Insumos',200.00,'Zona 3','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,'Almacén Sur 3','Maquinaria',500.00,'Zona 4','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,'Almacén Sera','Semenes',200.00,'Zona 5','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,'Almacén Temporal 2','Proveedores',100.00,'Zona 6','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,'Almacén Principal 3','Insumos',450.00,'Zona 7','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,'Almacén Semanas','Mejoras',600.00,'Zona 8','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,'Almacén de Preparación','Cosechas',350.00,'Zona 9','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,'Almacén Rápido','Frutos',200.00,'Zona 10','2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,'Almacén de Seguridad','Químicos',500.00,'Zona 11','2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,'Almacén de Higiene','Desinfectantes',300.00,'Zona 12','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;
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
