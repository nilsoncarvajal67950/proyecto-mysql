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
-- Table structure for table `cultivos`
--

DROP TABLE IF EXISTS `cultivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cultivos` (
  `cultivo_id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `variedad` varchar(100) DEFAULT NULL,
  `dias_maduracion` int DEFAULT NULL,
  `temporada_siembra` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cultivo_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `cultivos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivos`
--

LOCK TABLES `cultivos` WRITE;
/*!40000 ALTER TABLE `cultivos` DISABLE KEYS */;
INSERT INTO `cultivos` VALUES (1,1,'Maíz Amarillo',90,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,2,'Frijol Negro',80,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,3,'Tomate Roma',70,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,4,'Zanahoria Nantes',75,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,5,'Lechuga Iceberg',30,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,6,'Fresa Aromática',60,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,7,'Naranja Valencia',120,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,8,'Plátano Dominico',240,'Todo el año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,9,'Cebolla Blanca',100,'Todo el año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,10,'Cilantro Curado',40,'Todo el año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,1,'Maíz Dulce',80,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,2,'Frijol Pinto',85,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,3,'Tomate Cherry',75,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,4,'Zanahoria Morada',80,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,5,'Lechuga Romana',40,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,6,'Fresa Albión',90,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,7,'Naranja Navel',130,'Invierno','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,8,'Plátano Lady Finger',220,'Todo el año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,9,'Cebolla Amarilla',95,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,10,'Cilantro Fresco',40,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,1,'Maíz Híbrido',85,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,2,'Frijol de Soya',100,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,3,'Tomate de Árbol',85,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,4,'Zanahoria Baby',60,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,5,'Lechuga Batavia',35,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,6,'Fresa de Bosque',65,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,7,'Naranja Valencia',110,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,8,'Plátano de Cocción',230,'Todo el año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,9,'Cebolla Dulce',90,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,10,'Cilantro Huasteco',45,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,1,'Maíz Pisingallo',75,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,2,'Frijol Lima',95,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,3,'Tomate Verde',60,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,4,'Zanahoria de Granada',70,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,5,'Lechuga de Hoja Suelta',30,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,6,'Fresa Medinaceli',75,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,7,'Naranja de Sangre',120,'Invierno','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,8,'Plátano Manzano',240,'Todo el año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,9,'Cebolla de Verdeo',45,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,10,'Cilantro Perjuanero',60,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,1,'Maíz Criollo',100,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,2,'Frijol Garrofón',90,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,3,'Tomate Salado',70,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,4,'Zanahoria en Ternero',75,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,5,'Lechuga de Mantequilla',40,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,6,'Fresa de Mesa',80,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,7,'Naranja Mandarin',130,'Invierno','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,8,'Plátano Gros Michel',230,'Todo el año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,9,'Cebolla Roja',85,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,10,'Cilantro de Tres Barbas',50,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,1,'Maíz Albino',90,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,2,'Frijol Verde',80,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,3,'Tomate Rosado',70,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,4,'Zanahoria de Palma',80,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `cultivos` ENABLE KEYS */;
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
