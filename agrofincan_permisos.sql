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
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `permiso_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permiso_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'crear_venta','Permite crear ventas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(2,'leer_venta','Permite leer ventas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(3,'actualizar_venta','Permite actualizar ventas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(4,'eliminar_venta','Permite eliminar ventas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(5,'acceso_inventario','Acceso a inventario','2024-11-28 04:29:08','2024-11-28 04:29:08'),(6,'crear_cliente','Permite crear clientes','2024-11-28 04:29:08','2024-11-28 04:29:08'),(7,'leer_cliente','Permite leer clientes','2024-11-28 04:29:08','2024-11-28 04:29:08'),(8,'actualizar_cliente','Permite actualizar clientes','2024-11-28 04:29:08','2024-11-28 04:29:08'),(9,'eliminar_cliente','Permite eliminar clientes','2024-11-28 04:29:08','2024-11-28 04:29:08'),(10,'consultar_reportes','Permite consultar reportes','2024-11-28 04:29:08','2024-11-28 04:29:08'),(11,'crear_actividad','Permite crear actividades agrícolas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(12,'actualizar_actividad','Permite actualizar actividades agrícolas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(13,'eliminar_actividad','Permite eliminar actividades agrícolas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(14,'consultar_inventario','Permite consultar inventario','2024-11-28 04:29:08','2024-11-28 04:29:08'),(15,'crear_producto','Permite crear nuevos productos','2024-11-28 04:29:08','2024-11-28 04:29:08'),(16,'actualizar_producto','Permite actualizar productos existentes','2024-11-28 04:29:08','2024-11-28 04:29:08'),(17,'eliminar_producto','Permite eliminar productos','2024-11-28 04:29:08','2024-11-28 04:29:08'),(18,'consultar_proveedores','Permite consultar proveedores','2024-11-28 04:29:08','2024-11-28 04:29:08'),(19,'crear_proveedor','Permite crear nuevos proveedores','2024-11-28 04:29:08','2024-11-28 04:29:08'),(20,'actualizar_proveedor','Permite actualizar información de proveedores','2024-11-28 04:29:08','2024-11-28 04:29:08'),(21,'eliminar_proveedor','Permite eliminar proveedores','2024-11-28 04:29:08','2024-11-28 04:29:08'),(22,'acceso_plagas','Acceso a gestión de plagas','2024-11-28 04:29:08','2024-11-28 04:29:08'),(23,'crear_insumo','Permite crear insumos','2024-11-28 04:29:08','2024-11-28 04:29:08'),(24,'actualizar_insumo','Permite actualizar insumos','2024-11-28 04:29:08','2024-11-28 04:29:08'),(25,'eliminar_insumo','Permite eliminar insumos','2024-11-28 04:29:08','2024-11-28 04:29:08'),(26,'consultar_insumos','Permite consultar insumos','2024-11-28 04:29:08','2024-11-28 04:29:08'),(27,'crear_compra','Permite registrar compras de insumos','2024-11-28 04:29:08','2024-11-28 04:29:08'),(28,'consultar_compra','Permite consultar compras','2024-11-28 04:29:08','2024-11-28 04:29:08');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
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
