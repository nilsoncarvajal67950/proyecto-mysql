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
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `insumo_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `unidad_medida` varchar(20) DEFAULT NULL,
  `stock_minimo` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`insumo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (1,'Semilla de Maíz','Semillas','kilogramos',50.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,'Fertilizante NPK','Fertilizantes','sacos',30.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,'Herbicida Glifosato','Herbicidas','litros',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,'Insecticida Clorpirifos','Insecticidas','litros',5.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,'Fertilizante Orgánico','Fertilizantes','kilogramos',40.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,'Semilla de Trigo','Semillas','kilogramos',60.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,'Plaguicida Biológico','Plaguicidas','litros',8.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,'Malla Agrícola','Equipos','rollos',15.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,'Sistema de Riego','Equipos','unidades',3.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,'Compost Orgánico','Fertilizantes','kilogramos',70.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,'Semilla de Sorgo','Semillas','kilogramos',50.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,'Fertilizante Urea','Fertilizantes','sacos',25.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,'Fungicida de Azufre','Fungicidas','litros',12.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,'Semilla de Cebada','Semillas','kilogramos',55.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,'Regadera de Mano','Herramientas','unidades',20.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,'Fertilizante Fosfato','Fertilizantes','sacos',30.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,'Herbicida Selectivo','Herbicidas','litros',7.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,'Insecticida Imidacloprid','Insecticidas','litros',6.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,'Tractor Compacto','Maquinaria','unidades',1.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,'Semilla de Girasol','Semillas','kilogramos',40.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,'Fertilizante Potásico','Fertilizantes','sacos',20.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,'Herbicida Preemergente','Herbicidas','litros',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,'Manguera para Riego','Equipos','metros',100.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,'Semilla de Soja','Semillas','kilogramos',60.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,'Abono Orgánico','Fertilizantes','kilogramos',80.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,'Fertilizante Complejo','Fertilizantes','sacos',35.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,'Semilla de Arroz','Semillas','kilogramos',50.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,'Fungicida Cúprico','Fungicidas','litros',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,'Pala para Cultivo','Herramientas','unidades',15.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,'Semilla de Avena','Semillas','kilogramos',70.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,'Herbicida Sistémico','Herbicidas','litros',5.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,'Insecticida Biológico','Insecticidas','litros',8.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,'Pulverizador Manual','Herramientas','unidades',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,'Fertilizante Foliar','Fertilizantes','litros',20.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,'Semilla de Frijol','Semillas','kilogramos',40.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,'Carretilla Agrícola','Herramientas','unidades',5.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,'Tractor Agrícola','Maquinaria','unidades',1.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,'Semilla de Papa','Semillas','kilogramos',30.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,'Fertilizante de Calcio','Fertilizantes','kilogramos',50.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,'Herbicida de Contacto','Herbicidas','litros',7.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,'Cortadora de Césped','Equipos','unidades',2.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,'Semilla de Tomate','Semillas','kilogramos',25.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,'Abono Foliar','Fertilizantes','litros',15.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,'Machete','Herramientas','unidades',20.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,'Semilla de Sandía','Semillas','kilogramos',35.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,'Insecticida Orgánico','Insecticidas','litros',6.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,'Semilla de Calabaza','Semillas','kilogramos',30.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,'Fertilizante de Magnesio','Fertilizantes','kilogramos',40.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,'Pulverizador a Motor','Equipos','unidades',4.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,'Semilla de Melón','Semillas','kilogramos',25.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,'Insecticida de Amplio Espectro','Insecticidas','litros',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,'Semilla de Lechuga','Semillas','kilogramos',15.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,'Fertilizante Nitrogenado','Fertilizantes','sacos',20.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,'Semilla de Espinaca','Semillas','kilogramos',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,'Semilla de Pepino','Semillas','kilogramos',15.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,'Fertilizante Soluble','Fertilizantes','kilogramos',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(57,'Herbicida No Selectivo','Herbicidas','litros',12.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(58,'Semilla de Zanahoria','Semillas','kilogramos',15.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(59,'Fertilizante Líquido','Fertilizantes','litros',25.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(60,'Semilla de Rábano','Semillas','kilogramos',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(61,'Fertilizante para Frutales','Fertilizantes','kilogramos',30.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(62,'Semilla de Cebolla','Semillas','kilogramos',20.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(63,'Pulverizador de Presión','Equipos','unidades',6.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(64,'Semilla de Coliflor','Semillas','kilogramos',12.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(65,'Abono Verde','Fertilizantes','kilogramos',50.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(66,'Semilla de Brocoli','Semillas','kilogramos',10.00,'2024-11-28 02:53:05','2024-11-28 02:53:05'),(67,'Semilla de Maíz Dulce','Semillas','kilogramos',30.00,'2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
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
