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
-- Table structure for table `historial_cambios`
--

DROP TABLE IF EXISTS `historial_cambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_cambios` (
  `historial_id` int NOT NULL AUTO_INCREMENT,
  `tabla` varchar(50) DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha_cambio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`historial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_cambios`
--

LOCK TABLES `historial_cambios` WRITE;
/*!40000 ALTER TABLE `historial_cambios` DISABLE KEYS */;
INSERT INTO `historial_cambios` VALUES (1,'Clientes',1,'INSERT','Juan Perez','2024-11-28 04:07:30'),(2,'Clientes',2,'UPDATE','Ana Gomez','2024-11-28 04:07:30'),(3,'Clientes',3,'DELETE','Carlos Ruiz','2024-11-28 04:07:30'),(4,'Ordenes',1,'INSERT','Maria Lopez','2024-11-28 04:07:30'),(5,'Ordenes',2,'UPDATE','Pedro Martinez','2024-11-28 04:07:30'),(6,'Ordenes',3,'DELETE','Sofia Jimenez','2024-11-28 04:07:30'),(7,'Productos',1,'INSERT','Julio Santos','2024-11-28 04:07:30'),(8,'Productos',2,'UPDATE','Laura Vega','2024-11-28 04:07:30'),(9,'Productos',3,'DELETE','Miguel Torres','2024-11-28 04:07:30'),(10,'Inventario',1,'INSERT','Claudia Rios','2024-11-28 04:07:30'),(11,'Inventario',2,'UPDATE','Luis Alvarado','2024-11-28 04:07:30'),(12,'Inventario',3,'DELETE','Eva Castro','2024-11-28 04:07:30'),(13,'Proveedores',1,'INSERT','Richard Viera','2024-11-28 04:07:30'),(14,'Proveedores',2,'UPDATE','Natalia Pinto','2024-11-28 04:07:30'),(15,'Proveedores',3,'DELETE','Fernando Silva','2024-11-28 04:07:30'),(16,'Clientes',4,'INSERT','Raul Ortega','2024-11-28 04:07:30'),(17,'Clientes',5,'UPDATE','Gabriela Morera','2024-11-28 04:07:30'),(18,'Ordenes',4,'INSERT','Victor Soto','2024-11-28 04:07:30'),(19,'Ordenes',5,'UPDATE','Isabel Cordero','2024-11-28 04:07:30'),(20,'Productos',4,'INSERT','Guillermo Pablo','2024-11-28 04:07:30'),(21,'Productos',5,'UPDATE','Juliana Bravo','2024-11-28 04:07:30'),(22,'Inventario',4,'INSERT','Braulio Reyes','2024-11-28 04:07:30'),(23,'Inventario',5,'UPDATE','Cecilia Guerrero','2024-11-28 04:07:30'),(24,'Proveedores',4,'INSERT','Hugo Ramirez','2024-11-28 04:07:30'),(25,'Proveedores',5,'UPDATE','Veronica Salas','2024-11-28 04:07:30'),(26,'Clientes',6,'INSERT','Jose Martinez','2024-11-28 04:07:30'),(27,'Clientes',7,'DELETE','Lorena Molina','2024-11-28 04:07:30'),(28,'Ordenes',6,'INSERT','Esteban Castro','2024-11-28 04:07:30'),(29,'Ordenes',7,'UPDATE','Raquel Serrano','2024-11-28 04:07:30'),(30,'Productos',6,'INSERT','Barbosa Rivas','2024-11-28 04:07:30'),(31,'Productos',7,'DELETE','Carmen Salinas','2024-11-28 04:07:30'),(32,'Inventario',6,'INSERT','Diego Mendez','2024-11-28 04:07:30'),(33,'Inventario',7,'UPDATE','Alina Ramos','2024-11-28 04:07:30'),(34,'Proveedores',6,'INSERT','Ignacio Suarez','2024-11-28 04:07:30'),(35,'Proveedores',7,'DELETE','Santiago Olivares','2024-11-28 04:07:30'),(36,'Clientes',8,'INSERT','Carla Aguirre','2024-11-28 04:07:30'),(37,'Clientes',9,'UPDATE','Fernando Espinoza','2024-11-28 04:07:30'),(38,'Ordenes',8,'INSERT','Rita Barrera','2024-11-28 04:07:30'),(39,'Ordenes',9,'DELETE','Pablo Quintero','2024-11-28 04:07:30'),(40,'Productos',8,'INSERT','Sandra Pacheco','2024-11-28 04:07:30'),(41,'Productos',9,'UPDATE','Alfredo Jaramillo','2024-11-28 04:07:30'),(42,'Inventario',8,'DELETE','Estefania Aguado','2024-11-28 04:07:30'),(43,'Inventario',9,'INSERT','Omar Medina','2024-11-28 04:07:30'),(44,'Proveedores',8,'UPDATE','Daniela Méndez','2024-11-28 04:07:30'),(45,'Proveedores',9,'DELETE','Javier Carrasco','2024-11-28 04:07:30'),(46,'Clientes',10,'INSERT','Fernando Montoya','2024-11-28 04:07:30'),(47,'Clientes',11,'UPDATE','Nora Quintana','2024-11-28 04:07:30'),(48,'Ordenes',10,'INSERT','Susana Calderón','2024-11-28 04:07:30'),(49,'Ordenes',11,'DELETE','Karl Pizarro','2024-11-28 04:07:30'),(50,'Productos',10,'INSERT','Patricia Cifuentes','2024-11-28 04:07:30'),(51,'Productos',11,'UPDATE','Felipe Romero','2024-11-28 04:07:30'),(52,'Inventario',10,'INSERT','Clara Cruz','2024-11-28 04:07:30'),(53,'Inventario',11,'UPDATE','Susana Villanueva','2024-11-28 04:07:30'),(54,'Proveedores',10,'INSERT','Nicolas Paredes','2024-11-28 04:07:30'),(55,'Proveedores',11,'DELETE','Gloria de La Vega','2024-11-28 04:07:30'),(56,'Clientes',12,'INSERT','Lina Espitia','2024-11-28 04:07:30'),(57,'Clientes',13,'UPDATE','Horacio Archila','2024-11-28 04:07:30'),(58,'Ordenes',12,'DELETE','Francisco Londoño','2024-11-28 04:07:30'),(59,'Ordenes',13,'INSERT','Valeria Vargas','2024-11-28 04:07:30'),(60,'Productos',12,'UPDATE','Yasmin Pavia','2024-11-28 04:07:30'),(61,'Productos',13,'DELETE','Tania Aponte','2024-11-28 04:07:30');
/*!40000 ALTER TABLE `historial_cambios` ENABLE KEYS */;
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
