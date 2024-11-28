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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `unidad_medida` varchar(20) DEFAULT NULL,
  `precio_referencia` decimal(10,2) DEFAULT NULL,
  `temporada` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Tractor Compacto','Maquinaria','Unidad',25000.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(2,'Arado Reversible','Maquinaria','Unidad',1500.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(3,'Rastrillo de Dientes','Herramientas','Unidad',200.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(4,'Sembradora Manual','Herramientas','Unidad',300.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(5,'Abono Orgánico','Insumos','Saco',20.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(6,'Pala de Mano','Herramientas','Unidad',15.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(7,'Motobomba de Riego','Riego','Unidad',500.00,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(8,'Manguera de Alta Presión','Riego','Metro',2.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(9,'Fertilizante Líquido','Insumos','Litro',10.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(10,'Herbicida Selectivo','Insumos','Litro',12.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(11,'Insecticida de Contacto','Insumos','Litro',15.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(12,'Sistema de Riego por Goteo','Riego','Unidad',200.00,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(13,'Aspersor de Jardín','Riego','Unidad',25.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(14,'Carreta de Carga','Accesorios','Unidad',350.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(15,'Cosechadora de Granos','Maquinaria','Unidad',60000.00,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(16,'Desgranadora de Maíz','Maquinaria','Unidad',1500.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(17,'Cortadora de Pasto','Maquinaria','Unidad',1200.00,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(18,'Fumigadora Manual','Herramientas','Unidad',50.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(19,'Fumigadora Motorizada','Maquinaria','Unidad',450.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(20,'Rastrillo de Jardín','Herramientas','Unidad',18.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(21,'Carretilla de Metal','Herramientas','Unidad',80.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(22,'Malla Sombra','Accesorios','Metro',2.50,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(23,'Cinta de Riego','Riego','Metro',0.50,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(24,'Fertilizante de Liberación Lenta','Insumos','Kilo',5.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(25,'Invernadero Portátil','Accesorios','Unidad',800.00,'Invierno','2024-11-28 02:53:05','2024-11-28 02:53:05'),(26,'Macetas de Plástico','Accesorios','Unidad',3.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(27,'Polvo Corrector de pH','Insumos','Kilo',8.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(28,'Medidor de pH para Suelos','Accesorios','Unidad',25.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(29,'Cinta Métrica para Cultivos','Accesorios','Unidad',5.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(30,'Guantes de Protección','Accesorios','Par',8.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(31,'Machete Curvo','Herramientas','Unidad',25.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(32,'Horquilla de Jardín','Herramientas','Unidad',22.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(33,'Tijera de Podar','Herramientas','Unidad',15.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(34,'Podadora de Altura','Herramientas','Unidad',85.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(35,'Cal para Suelos','Insumos','Saco',10.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(36,'Regadera de Metal','Accesorios','Unidad',20.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(37,'Canasta de Recolección','Accesorios','Unidad',12.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(38,'Trampa para Ios','Accesorios','Rollo',5.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(39,'Cinta Adhesiva para Injertos','Accesorios','Rollo',3.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(40,'Kit de Injertos','Accesorios','Unidad',25.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(41,'Malla Antipájaros','Accesorios','Metro',1.50,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(42,'Cepillo para Animales','Ganadería','Unidad',10.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(43,'Comedero de Animales','Ganadería','Unidad',40.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(44,'Bebedero de Agua Automático','Ganadería','Unidad',60.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(45,'Semillas de Alfalfa','Insumos','Kilo',7.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(46,'Semillas de Trigo','Insumos','Kilo',5.50,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(47,'Semillas de Maíz','Insumos','Kilo',6.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(48,'Semillas de Girasol','Insumos','Kilo',6.50,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(49,'Semillas de Sorgo','Insumos','Kilo',5.00,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(50,'Abono de Lombrices','Insumos','Saco',12.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(51,'Riego Automático Programable','Riego','Unidad',300.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(52,'Kit de Reparación de Riego','Riego','Unidad',25.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(53,'Tractor de Cultivo Mediano','Maquinaria','Unidad',40000.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(54,'Arado de Discos','Maquinaria','Unidad',2500.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(55,'Cortadora de Heno','Maquinaria','Unidad',7000.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(56,'Rastrillo Hilerador','Maquinaria','Unidad',4500.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(57,'Pala Frontal para Tractor','Maquinaria','Unidad',5000.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(58,'Sistema de Riego Pivotante','Riego','Unidad',15000.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(59,'Balde de Leche de Acero','Ganadería','Unidad',30.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(60,'Cercas Eléctricas','Ganadería','Metro',3.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(61,'Postes de Madera','Ganadería','Unidad',12.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(62,'Tina de Agua para Animales','Ganadería','Unidad',50.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(63,'Esparcidor de Fertilizante','Maquinaria','Unidad',3500.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(64,'Plástico para Mulching','Insumos','Metro',0.75,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(65,'Termómetro de Suelos','Accesorios','Unidad',15.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(66,'Silo de Grano Portátil','Accesorios','Unidad',500.00,'Otoño','2024-11-28 02:53:05','2024-11-28 02:53:05'),(67,'Lona para Protección de Cultivos','Accesorios','Metro',1.50,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(68,'Cinta de Marcaje','Accesorios','Rollo',2.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(69,'Lampara UV para Cultivos','Accesorios','Unidad',40.00,'Invierno','2024-11-28 02:53:05','2024-11-28 02:53:05'),(70,'Ventilador para Invernaderos','Accesorios','Unidad',250.00,'Verano','2024-11-28 02:53:05','2024-11-28 02:53:05'),(71,'Tractor Compacto para Viñedos','Maquinaria','Unidad',28000.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(72,'Cubeta de Recolección de Frutas','Accesorios','Unidad',15.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(73,'Rodillo Nivelador de Suelos','Maquinaria','Unidad',4000.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(74,'Detector de Humedad','Accesorios','Unidad',60.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(75,'Aspersor de Mano','Riego','Unidad',15.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05'),(76,'Motosierra de Mano','Herramientas','Unidad',300.00,'Invierno','2024-11-28 02:53:05','2024-11-28 02:53:05'),(77,'Cortasetos','Herramientas','Unidad',150.00,'Primavera','2024-11-28 02:53:05','2024-11-28 02:53:05'),(78,'Bolsa de Rafia para Recolección','Accesorios','Unidad',10.00,'Todo el Año','2024-11-28 02:53:05','2024-11-28 02:53:05');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
