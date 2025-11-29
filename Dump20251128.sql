-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: abalagloria
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `alerta_stock`
--

DROP TABLE IF EXISTS `alerta_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta_stock` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `fecha_alerta` datetime DEFAULT CURRENT_TIMESTAMP,
  `mensaje` varchar(255) DEFAULT NULL,
  `atendida` tinyint DEFAULT '0',
  PRIMARY KEY (`id_alerta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `alerta_stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta_stock`
--

LOCK TABLES `alerta_stock` WRITE;
/*!40000 ALTER TABLE `alerta_stock` DISABLE KEYS */;
INSERT INTO `alerta_stock` VALUES (1,2,'2025-11-16 22:23:19','Stock crítico producto 2',0),(2,2,'2025-11-16 22:57:34','El producto \'Yogurt Natural Lala 200g\' tiene stock bajo (5 unidades).',0),(3,2,'2025-11-18 11:56:36','El producto \'Yogurt Natural Lala 200g\' (ID 2) tiene stock insuficiente (5 unidades).',0),(4,2,'2025-11-18 17:08:21','El producto \'Yogurt Natural Lala 200g\' tiene stock bajo (5 unidades).',0),(5,2,'2025-11-18 17:08:28','Stock crítico producto 2',0);
/*!40000 ALTER TABLE `alerta_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `id_direccion` int DEFAULT NULL,
  `estatus` tinyint DEFAULT '1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `id_direccion` (`id_direccion`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','9991002001',1,1),(2,'Ana López','9991002002',1,1),(3,'Luis Ramírez','9991002003',1,1),(4,'Sofía Hernández','9991002004',1,1),(5,'Carlos García','9991002005',1,1),(6,'María Santos','9991002006',1,1),(7,'Pedro Luna','9991002007',1,1),(8,'Lucía Vega','9991002008',1,1),(9,'Miguel Ortiz','9991002009',1,1),(10,'Elena Reyes','9991002010',1,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `estatus` tinyint DEFAULT '1',
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,1,'2025-11-14 12:27:47',1250.00,2,1),(2,2,1,'2025-11-14 12:27:47',980.00,1,1),(3,3,1,'2025-11-14 12:27:47',760.00,3,1),(4,5,1,'2025-11-14 12:27:47',1850.00,1,1),(5,6,1,'2025-11-14 12:27:47',1450.00,1,1),(6,9,1,'2025-11-14 12:27:47',1120.00,2,1),(7,10,1,'2025-11-14 12:27:47',1950.00,2,1),(8,12,1,'2025-11-14 12:27:47',1320.00,1,1),(9,19,1,'2025-11-14 12:27:47',890.00,3,1),(10,22,1,'2025-11-14 12:27:47',1450.00,3,1),(12,10,1,'2025-11-14 00:00:00',535.00,1,1),(13,15,1,'2025-11-18 00:00:00',1640.00,1,1),(14,10,1,'2025-11-24 00:00:00',1605.00,2,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` (`id_detalle_compra`, `id_compra`, `id_producto`, `cantidad`, `precio_unitario`) VALUES (1,1,1,30,23.50),(2,1,2,40,12.00),(3,1,22,20,28.00),(4,2,3,20,35.00),(5,2,4,15,38.50),(6,2,57,25,35.00),(7,3,5,40,15.00),(8,3,6,50,14.50),(9,3,47,30,14.50),(10,4,9,60,38.00),(11,4,10,80,22.50),(12,4,72,50,28.00),(13,5,11,40,32.00),(14,5,12,35,25.00),(15,5,33,30,60.00),(16,6,15,50,28.00),(17,6,16,45,28.00),(18,6,90,40,30.00),(19,7,17,100,18.50),(20,7,39,80,35.00),(21,7,89,90,32.00),(22,8,19,70,22.00),(23,8,20,65,22.50),(24,8,95,60,23.00),(25,9,29,50,28.00),(26,9,30,60,25.00),(27,10,63,30,55.00),(28,10,64,50,42.00),(29,10,78,30,78.00),(30,12,39,10,35.00),(31,12,17,10,18.50),(32,13,23,20,20.00),(33,13,24,20,22.00),(34,13,61,20,18.00),(35,13,24,20,22.00),(36,14,39,30,35.00),(37,14,17,30,18.50);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE,
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,10,0.00,235.00),(2,1,7,9,0.00,252.00),(3,1,6,1,0.00,13.00),(4,2,4,10,0.00,385.00),(5,2,8,15,0.00,675.00),(6,2,5,3,0.00,140.00),(7,3,3,10,0.00,350.00),(8,3,2,20,0.00,240.00),(9,3,12,16,0.00,160.00),(10,4,1,15,0.00,352.50),(11,4,8,13,0.00,585.00),(12,4,2,3,0.00,42.50),(13,5,7,15,0.00,420.00),(14,5,5,2,0.00,30.00),(15,6,4,10,0.00,385.00),(16,6,2,10,0.00,240.00),(17,6,5,1,0.00,25.00),(18,7,3,5,0.00,175.00),(19,7,2,10,0.00,120.00),(20,7,5,1,0.00,5.00),(21,8,4,15,0.00,577.50),(22,8,8,14,0.00,630.00),(23,8,1,1,0.00,12.50),(24,9,3,20,0.00,700.00),(25,9,4,15,0.00,577.50),(26,9,5,2,0.00,222.50),(27,10,2,10,0.00,120.00),(28,10,5,5,0.00,80.00),(29,11,1,15,0.00,352.50),(30,11,7,18,0.00,504.00),(31,12,8,20,0.00,900.00),(32,12,2,5,0.00,200.00),(33,13,3,10,0.00,350.00),(34,13,5,10,0.00,350.00),(35,14,7,14,0.00,392.00),(36,14,2,1,0.00,8.00),(37,15,4,10,0.00,385.00),(38,15,8,12,0.00,540.00),(39,15,2,1,0.00,25.00),(40,16,3,5,0.00,175.00),(41,16,2,10,0.00,120.00),(42,16,5,1,0.00,5.00),(43,17,1,10,0.00,235.00),(44,17,7,13,0.00,364.00),(45,17,5,1,0.00,1.00),(46,18,4,10,0.00,385.00),(47,18,8,13,0.00,585.00),(48,18,2,0,0.00,-220.00),(49,19,3,15,0.00,525.00),(50,19,4,15,0.00,577.50),(51,19,5,2,0.00,-2.50),(52,20,1,10,0.00,235.00),(53,20,7,9,0.00,212.00),(54,20,6,1,0.00,3.00),(55,21,2,10,0.00,240.00),(56,21,5,10,0.00,140.00),(57,22,4,15,0.00,577.50),(58,22,8,15,0.00,675.00),(59,23,3,10,0.00,350.00),(60,23,2,20,0.00,240.00),(61,23,12,16,0.00,400.00),(62,24,1,10,0.00,235.00),(63,24,7,15,0.00,420.00),(64,24,5,1,0.00,15.00),(65,25,3,10,0.00,350.00),(66,25,5,10,0.00,170.00),(67,26,2,10,0.00,240.00),(68,26,5,1,0.00,60.00),(69,27,4,10,0.00,385.00),(70,27,8,10,0.00,495.00),(71,28,3,15,0.00,525.00),(72,28,4,12,0.00,540.00),(73,28,5,1,0.00,35.00),(74,29,1,10,0.00,235.00),(75,29,7,8,0.00,192.00),(76,29,6,1,0.00,3.00),(77,30,4,10,0.00,385.00),(78,30,8,12,0.00,540.00),(79,30,2,1,0.00,25.00),(80,36,7,2,28.00,56.00),(81,36,2,2,12.00,24.00),(82,36,13,1,12.50,12.50),(83,37,6,2,14.50,29.00),(84,38,3,1,35.00,35.00),(85,38,6,2,14.50,29.00),(86,38,97,3,52.00,156.00),(87,39,4,2,38.50,77.00),(88,39,1,8,23.50,188.00),(89,39,66,2,42.00,84.00),(90,39,69,2,35.00,70.00),(91,39,98,1,30.00,30.00),(92,39,92,1,30.00,30.00),(93,40,28,2,40.00,80.00),(94,40,34,1,45.00,45.00),(95,40,22,1,28.00,28.00),(96,40,26,1,25.00,25.00),(97,41,5,2,15.00,30.00),(98,41,9,2,38.00,76.00),(99,42,2,26,12.00,312.00),(100,43,5,2,15.00,30.00),(101,43,1,2,23.50,47.00),(102,44,1,2,23.50,47.00),(103,44,5,1,15.00,15.00),(104,45,9,1,38.00,38.00),(105,45,11,1,32.00,32.00),(106,45,18,1,18.00,18.00),(107,46,9,2,38.00,76.00),(108,47,9,2,38.00,76.00),(109,47,13,2,12.50,25.00),(110,48,2,3,12.00,36.00),(111,49,8,2,45.00,90.00),(112,49,96,2,23.00,46.00),(113,49,104,1,20.00,20.00),(114,50,6,3,14.50,43.50),(115,50,40,2,28.00,56.00),(116,51,5,2,15.00,30.00),(117,51,9,2,38.00,76.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `colonia` varchar(70) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `cpostal` varchar(10) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Av. Benito Juárez','120','Centro','Oaxaca de Juárez','68000','Oaxaca','México'),(2,'Calle de los Cedros','45B','San Felipe del Agua','Oaxaca de Juárez','68020','Oaxaca','México'),(3,'Privada Hidalgo','23','Reforma','Santa Lucía del Camino','71240','Oaxaca','México'),(4,'Av. Universidad','300','Ex-Hacienda Candiani','Oaxaca de Juárez','68130','Oaxaca','México'),(5,'21 de Marzo','202','Santa Maria','Oaxaca de Juárez','68034','Oaxaca','México'),(6,'Calle Reforma','150','Juárez','Oaxaca de Juárez','68010','Oaxaca','México'),(7,'Calle 5 de Mayo','45','San Benito','Oaxaca de Juárez','68020','Oaxaca','México'),(8,'Calle Hidalgo','56','Reforma','Oaxaca de Juárez','68050','Oaxaca','México'),(9,'Camino Real','34','Mexicapam','Oaxaca de Juárez','71245','Oaxaca','México'),(10,'Av. Ferrocarril','501','Tutla','Oaxaca de Juárez','71246','Oaxaca','México'),(11,'Callejón del Rosario','7','Jalatlaco','Oaxaca de Juárez','68080','Oaxaca','México'),(12,'Calle Iturbide','25','Centro','Etla','68200','Oaxaca','México'),(13,'Prolongación Independencia','115','Reforma Agraria','Oaxaca de Juárez','68140','Oaxaca','México'),(14,'Calle Emiliano Zapata','233','La Noria','Oaxaca de Juárez','68090','Oaxaca','México'),(15,'Av. Universidad','620','Cinco Señores','Oaxaca de Juárez','68120','Oaxaca','México'),(16,'Calle Benito Juárez','48','Centro','Zaachila','71310','Oaxaca','México'),(17,'Callejón del Niño Perdido','9','Candiani','Oaxaca de Juárez','68130','Oaxaca','México'),(18,'Calle de los Pinos','17','Chapultepec','Oaxaca de Juárez','71240','Oaxaca','México'),(19,'Calle Independencia','78','Centro','Mitla','70430','Oaxaca','México'),(20,'Privada del Bosque','14','Montoya','Oaxaca de Juárez','68120','Oaxaca','México'),(21,'Calle Flores Magón','32','Centro','Huajuapan de León','69000','Oaxaca','México'),(22,'Calle 2 de Abril','66','La Soledad','Tuxtepec','68370','Oaxaca','México'),(23,'Av. Símbolos Patrios','1450','Xoxo','Santa Cruz Xoxocotlán','71230','Oaxaca','México'),(24,'Calle 16 de Septiembre','220','Centro','Santa Lucía del Camino','71240','Oaxaca','México'),(25,'Calle del Bosque','41','Volcanes','Oaxaca de Juárez','68090','Oaxaca','México'),(26,'Calle Morelos','89','Centro','Tlacolula de Matamoros','70400','Oaxaca','México'),(27,'Calle Las Rosas','15','San Felipe','Oaxaca de Juárez','68020','Oaxaca','México'),(28,'Callejón del Carmen','8','Centro','Zaachila','71310','Oaxaca','México'),(29,'Av. Oaxaca','777','Reforma','Oaxaca de Juárez','68050','Oaxaca','México'),(30,'Privada Juárez','5','La Paz','Huajuapan de León','69000','Oaxaca','México'),(31,'Av. Universidad','25','Cinco Señores','Oaxaca de Juárez','68120','Oaxaca','México'),(32,'Calle Vicente Guerrero','45','Centro','Etla','68200','Oaxaca','México'),(33,'Calle Galeana','130','Candiani','Oaxaca de Juárez','68130','Oaxaca','México'),(34,'Av. Independencia','98','Centro','Oaxaca de Juárez','68000','Oaxaca','México'),(35,'Calle 20 de Noviembre','77','San Martín','Oaxaca de Juárez','71245','Oaxaca','México'),(36,'Callejón Hidalgo','12','Centro','Tuxtepec','68370','Oaxaca','México'),(37,'Calle Matamoros','24','Reforma','Oaxaca de Juárez','68050','Oaxaca','México'),(38,'Av. Ferrocarril','455','Tutla','Oaxaca de Juárez','71246','Oaxaca','México'),(39,'Calle Juárez','18','Centro','Mitla','70430','Oaxaca','México'),(40,'Calle Zaragoza','67','Centro','Etla','68200','Oaxaca','México'),(41,'Calle Independencia ','254','Centro','Oaxaca de Juárez ','680000','Oaxaca ','Mexico'),(44,'21 de marzo','202','santa maria','oaxaca de juarez','68034','oaxaca','méxico'),(45,'Calle Reforma','-150','Juárez','Oaxaca de Juárez','68010','Oaxaca','México');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `nombre_metodo` varchar(50) NOT NULL,
  `descripcion` text,
  `estatus` tinyint DEFAULT '1',
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Efectivo',NULL,1),(2,'Tarjeta',NULL,1),(3,'Transferencia',NULL,1);
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `marca` varchar(50) DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock_minimo` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `id_tipo_producto` int DEFAULT NULL,
  `estatus` tinyint DEFAULT '1',
  `stock_existencia` int DEFAULT '200',
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id_producto` (`id_proveedor`),
  KEY `id_tipo_producto` (`id_tipo_producto`),
  CONSTRAINT `id_producto` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `id_tipo_producto` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto` (`id_tipo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Leche Entera Lala 1L','Leche pasteurizada entera Lala','Lala',1,23.50,10,38,1,0,200),(2,'Yogurt Natural Lala 200g','Yogurt natural Lala sin azúcar','Lala',1,12.00,5,2,1,1,197),(3,'Pan Bimbo Blanco 680g','Pan de caja Bimbo blanco','Bimbo',2,35.00,10,39,7,1,200),(4,'Pan Integral Bimbo 680g','Pan de caja integral Bimbo','Bimbo',2,38.50,10,23,7,1,200),(5,'Galletas Emperador Chocolate 120g','Galletas rellenas de chocolate','Gamesa',3,15.00,5,43,17,1,200),(6,'Galletas Marías Gamesa 120g','Galletas tradicionales Marías','Gamesa',3,14.50,5,53,17,1,200),(7,'Avena Quaker Instantánea 500g','Avena instantánea Quaker','Quaker',4,28.00,5,38,4,1,200),(8,'Cereal Corn Flakes 500g','Cereal de maíz Kellogg´s','Kellogg´s',7,45.00,5,33,4,1,200),(9,'Frijol Negro 1kg','Frijol negro limpio y seco','Gallo',5,38.00,10,51,5,1,200),(10,'Arroz Extra 1kg','Arroz de grano largo','Gallo',5,22.50,10,80,5,1,200),(11,'Aceite Nutrioli 1L','Aceite vegetal para cocina','Herdez',6,32.00,5,39,9,1,200),(12,'Manteca Primavera 500g','Manteca vegetal para repostería','Herdez',6,25.00,5,35,9,1,200),(13,'Sopa de Pasta Knorr 65g','Sopa instantánea de pasta','Knorr',8,12.50,5,57,8,1,200),(14,'Sopa de Pollo Knorr 65g','Sopa instantánea sabor pollo','Knorr',8,12.50,5,55,8,1,200),(15,'Jugo de Naranja Jumex 1L','Jugo de naranja natural','Jumex',9,28.00,5,50,13,1,200),(16,'Néctar de Durazno Jumex 1L','Néctar de durazno','Jumex',9,28.00,5,45,13,1,200),(17,'Refresco Coca-Cola 600ml','Refresco de cola','Coca-Cola',10,18.50,5,140,12,1,200),(18,'Refresco Fanta 600ml','Refresco de naranja','Pepsi',11,18.00,5,89,12,1,200),(19,'Botanas Sabritas Cheetos 140g','Botana de maíz sabor queso','Sabritas',12,22.00,5,70,15,1,200),(20,'Botanas Sabritas Ruffles 140g','Botana de papa ondulada','Sabritas',12,22.50,5,65,15,1,200),(21,'Queso Panela Santa Clara 250g','Queso fresco tipo panela','Santa Clara',3,45.00,5,40,1,1,200),(22,'Crema Ácida Lala 200g','Crema ácida pasteurizada','Lala',1,28.00,5,54,1,1,200),(23,'Atún La Costeña 140g','Atún en agua','La Costeña',15,20.00,5,70,3,1,200),(24,'Chiles Enlatados La Costeña 210g','Chiles jalapeños enlatados','La Costeña',15,22.00,5,85,3,1,200),(25,'Cereal Zucaritas 500g','Cereal de maíz azucarado','Kellogg´s',7,50.00,5,40,4,1,200),(26,'Avena Quaker Tradicional 400g','Avena natural','Quaker',4,25.00,5,49,4,1,200),(27,'Arroz Selecto Gallo 2kg','Arroz de grano largo','Gallo',5,42.00,10,60,5,1,200),(28,'Frijol Pinto Gallo 1kg','Frijol pinto limpio y seco','Gallo',5,40.00,10,53,5,1,200),(29,'Harina de Trigo Maseca 1kg','Harina de trigo para repostería y pan','Maseca',19,28.00,5,50,7,1,200),(30,'Harina de Maíz Maseca 1kg','Harina de maíz para tortillas','Maseca',19,25.00,5,60,7,1,200),(31,'Espagueti La Moderna 500g','Pasta de trigo tradicional','La Moderna',6,20.00,5,70,8,1,200),(32,'Sopa de Letras Knorr 65g','Sopa instantánea sabor letras','Knorr',8,12.50,5,60,8,1,200),(33,'Aceite Nutrioli 2L','Aceite vegetal refinado','Herdez',6,60.00,5,35,9,1,200),(34,'Manteca Primavera 1kg','Manteca vegetal para cocina','Herdez',6,45.00,5,39,9,1,200),(35,'Azúcar Refinada 1kg','Azúcar blanca granulada','La Costeña',15,22.00,5,80,10,1,200),(36,'Miel Cabaña 500g','Miel natural de abeja','Cabaña',16,50.00,5,30,10,1,200),(37,'Café Legal 250g','Café molido tradicional','Café Legal',16,40.00,5,50,11,1,200),(38,'Té Lipton 25 bolsas','Té negro en bolsas','Lipton',17,30.00,5,40,11,1,200),(39,'Refresco Coca-Cola 2L','Refresco de cola','Coca-Cola',10,35.00,5,140,12,1,200),(40,'Jugo Jumex Manzana 1L','Jugo de manzana natural','Jumex',9,28.00,5,48,13,1,200),(41,'Agua Purificada Bonafont 1.5L','Agua purificada en botella','Bonafont',14,15.00,10,100,14,1,200),(42,'Agua Ciel 600ml','Agua purificada embotellada','Ciel',14,10.00,10,80,14,1,200),(43,'Papas Sabritas Clásicas 180g','Papas fritas tradicionales','Sabritas',12,22.00,5,60,15,1,200),(44,'Cacahuates Japoneses 150g','Cacahuates recubiertos de soya','Sabritas',12,25.00,5,50,15,1,200),(45,'Chocolate Abuelita 200g','Chocolate para preparar bebida caliente','Nestlé',21,28.00,5,40,16,1,200),(46,'Dulces Vero Mango 50g','Dulces enchilados de mango','Vero',21,12.00,5,60,16,1,200),(47,'Galletas Marías Gamesa 150g','Galletas tradicionales Marías','Gamesa',3,14.50,5,70,17,1,200),(48,'Pastelito Marinela Gansito 50g','Pastelito relleno con crema y chocolate','Marinela',5,15.00,5,50,17,1,200),(49,'Limpiador Pinol 500ml','Limpiador multiusos concentrado','Pinol',28,32.00,5,30,18,1,200),(50,'Cloro Cloralex 1L','Cloro líquido para limpieza','Cloralex',28,18.00,5,40,18,1,200),(51,'Detergente Ace 1kg','Detergente en polvo para ropa','Ace',29,40.00,5,50,19,1,200),(52,'Suavizante Ensueño 750ml','Suavizante para ropa con aroma','Ensueño',29,35.00,5,45,19,1,200),(53,'Shampoo Sedal 400ml','Shampoo nutritivo para cabello','Sedal',30,45.00,5,40,20,1,200),(54,'Jabón Dove 135g','Jabón en barra para piel sensible','Dove',30,22.00,5,60,20,1,200),(55,'Servilletas Elite 100pz','Servilletas de papel','Elite',27,25.00,5,80,21,1,200),(56,'Papel Higiénico Regio 4pz','Papel higiénico doble hoja','Regio',27,30.00,5,70,21,1,200),(57,'Insecticida Raid 360ml','Insecticida para uso doméstico','Raid',26,40.00,5,50,22,1,200),(58,'Aromatizante Glade 300ml','Aromatizante ambiente','Glade',26,38.00,5,40,22,1,200),(59,'Pan Dulce Bimbo 500g','Pan dulce variado','Bimbo',2,35.00,5,60,23,1,200),(60,'Tortillas Maseca 1kg','Tortillas de maíz','Maseca',19,25.00,10,80,23,1,200),(61,'Sal Fina La Fina 1kg','Sal de mesa refinada','La Fina',15,18.00,5,100,24,1,200),(62,'Pimienta Goya 50g','Pimienta negra molida','Goya',15,22.00,5,60,24,1,200),(63,'Salsa Catsup Heinz 500g','Ketchup tradicional','Heinz',16,28.00,5,50,25,1,200),(64,'Mayonesa McCormick 400g','Mayonesa ligera','McCormick',16,32.00,5,40,25,1,200),(65,'Jamón Bafar 250g','Jamón de pierna','Bafar',22,55.00,5,30,26,1,200),(66,'Salchicha San Rafael 400g','Salchicha de res y cerdo','San Rafael',22,42.00,5,48,26,1,200),(67,'Comida para Perro Pedigree 3kg','Alimento seco para perros adultos','Pedigree',27,250.00,5,20,27,1,200),(68,'Comida para Gato Whiskas 1.5kg','Alimento seco para gatos','Whiskas',27,180.00,5,25,27,1,200),(69,'Manzana Roja 1kg','Manzana fresca de temporada','Local',23,35.00,5,48,28,1,200),(70,'Plátano Cavendish 1kg','Plátano fresco','Local',23,22.00,5,60,28,1,200),(71,'Brócoli Fresco 500g','Brócoli fresco de campo','Local',23,30.00,5,40,28,1,200),(72,'Espinaca Fresca 250g','Espinaca fresca limpia','Local',23,18.00,5,35,28,1,200),(73,'Helado Nestlé 500ml','Helado de vainilla','Nestlé',21,55.00,5,40,29,1,200),(74,'Pizza Congelada Bafar 400g','Pizza lista para hornear','Bafar',22,78.00,5,30,29,1,200),(75,'Pañales Huggies Etapa 3 28pz','Pañales para bebés de 5-9kg','Huggies',26,250.00,5,40,30,1,200),(76,'Leche Infantil Enfamil 400g','Leche en polvo para bebé','Enfamil',26,320.00,5,25,30,1,200),(77,'Leche Deslactosada Lala 1L','Leche deslactosada pasteurizada','Lala',1,26.00,10,40,1,1,200),(78,'Yogurt Fresa Lala 150g','Yogurt sabor fresa','Lala',1,14.00,5,35,1,1,200),(79,'Pan Integral Bimbo 680g — Variante','Pan integral con fibra','Bimbo',2,37.00,10,30,7,1,200),(80,'Pan de Caja Familiar Bimbo 680g','Pan blanco familiar','Bimbo',2,36.00,10,45,7,1,200),(81,'Galletas Chokis 120g','Galletas rellenas de chocolate','Gamesa',3,16.00,5,50,17,1,200),(82,'Galletas Marinela 120g','Galletas rellenas de vainilla','Marinela',5,15.50,5,55,17,1,200),(83,'Cereal Corn Flakes Choco 500g','Cereal de maíz con chocolate','Kellogg´s',7,48.00,5,40,4,1,200),(84,'Avena Integral Quaker 400g','Avena en hojuelas','Quaker',4,26.00,5,45,4,1,200),(85,'Arroz Integral Gallo 1kg','Arroz integral de grano largo','Gallo',5,28.00,10,60,5,1,200),(86,'Frijol Bayos 1kg','Frijol bayos limpio y seco','Gallo',5,39.00,10,50,5,1,200),(87,'Aceite de Oliva Nutrioli 500ml','Aceite de oliva extra virgen','Herdez',6,75.00,5,30,9,1,200),(88,'Manteca Larga Vida 500g','Manteca vegetal para cocina','Herdez',6,27.00,5,35,9,1,200),(89,'Sopa de Pollo Maruchan 70g','Sopa instantánea sabor pollo','Maruchan',8,13.00,5,55,8,1,200),(90,'Sopa de Verduras Maruchan 70g','Sopa instantánea sabor verduras','Maruchan',8,13.00,5,50,8,1,200),(91,'Jugo de Mango Jumex 1L','Jugo natural de mango','Jumex',9,30.00,5,45,13,1,200),(92,'Néctar de Guayaba Jumex 1L','Néctar natural de guayaba','Jumex',9,30.00,5,39,13,1,200),(93,'Refresco Sprite 2L','Refresco de limón-lima','Pepsi',11,32.00,5,90,12,1,200),(94,'Refresco Fanta Uva 2L','Refresco sabor uva','Pepsi',11,32.00,5,85,12,1,200),(95,'Botanas Doritos Nacho 150g','Botana de maíz sabor nacho','Sabritas',12,24.00,5,60,15,1,200),(96,'Botanas Sabritas Rieles 150g','Botana de papa ondulada','Sabritas',12,23.00,5,53,15,1,200),(97,'Queso Oaxaca Santa Clara 200g','Queso fresco tipo Oaxaca','Santa Clara',3,52.00,5,37,1,1,200),(98,'Crema Batida Lala 200ml','Crema batida para repostería','Lala',1,30.00,5,29,1,1,200),(99,'Atún En Aceite La Costeña 140g','Atún en aceite','La Costeña',15,22.50,5,50,3,1,200),(100,'Chiles Jalapeños La Costeña 210g','Chiles jalapeños en escabeche','La Costeña',15,23.00,5,45,3,1,200),(101,'Galleta de avena','Galleta de avena sabor chocolate','Quaker',4,20.00,10,40,17,1,200),(102,'Caldo de Pollo en Cubo','Cubos de caldo de pollo Knorr de 10 g cada uno.\nIdeal para vsopas y guisados.','Knorr',8,5.00,20,100,24,1,200),(103,'Papas Sabritas Original 46 g','Bolsa individual de papas fritas sabor original, presentación de 46 gramos.','Sabritas',12,20.00,20,40,15,1,200),(104,'Papas Sabritas Original 46 g — Variante','Bolsa individual de papas fritas sabor original, presentación de 46 gramos.','Sabritas',12,20.00,20,39,15,1,200),(105,'Coca','Coca Cola de 600ml','Coca Cola',10,-12.00,-12,5,1,1,200);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) NOT NULL,
  `nombre_comercial` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL,
  `clabe` varchar(18) DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `estatus` tinyint DEFAULT '1',
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `rfc` (`rfc`),
  KEY `id_direccionP` (`id_direccion`),
  CONSTRAINT `id_direccionP` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'PLAC900101AAA','Lala','9511234501','contacto@lala.com','Banorte','072180000123456781',4,1),(2,'PABR920202BBB','Bimbo','9512345602','ventas@bimbo.com','BBVA','012345678901234562',5,1),(3,'PGAM930303CCC','Gamesa','9513456703','info@gamesa.com','Santander','014567890123456763',6,1),(4,'PMOR940404DDD','Quaker','9514567804','contacto@quaker.com','HSBC','012345678901234764',7,1),(5,'PGRN950505EEE','Gallo','9515678905','ventas@gallo.com','Citibanamex','012345678901234765',8,1),(6,'PHOR960606FFF','Herdez','9516789016','contacto@herdez.com','Banorte','072180000123456766',9,1),(7,'PMOD970707GGG','La Moderna','9517890127','info@lamoderna.com','BBVA','012345678901234767',10,1),(8,'PCAR980808HHH','Knorr','9518901238','ventas@knorr.com','Santander','014567890123456768',11,1),(9,'PJAL990909III','Jumex','9519012349','contacto@jumex.com','HSBC','012345678901234769',12,1),(10,'PCOC000101JJJ','Coca-Cola','9510123450','info@cocacola.com','Citibanamex','012345678901234770',13,1),(11,'PPEP010202KKK','Pepsi','9511234561','ventas@pepsi.com','Banorte','072180000123456771',14,1),(12,'PSAB020303LLL','Sabritas','9512345672','contacto@sabritas.com','BBVA','012345678901234772',15,1),(13,'PMEX030404MMM','Mexicola','9513456783','info@mexicola.com','Santander','014567890123456773',16,1),(14,'PTOT040505NNN','Totis','9514567894','ventas@totis.com','HSBC','012345678901234774',17,1),(15,'PCHC050606OOO','Choco Krispis','9515678905','contacto@chocokrispis.com','Citibanamex','012345678901234775',18,1),(16,'PCAL060707PPP','Café Legal','9516789016','info@cafelegal.com','Banorte','072180000123456776',19,1),(17,'PMAY070808QQQ','Mayonesa McCormick','9517890127','ventas@mccormick.com','BBVA','012345678901234777',20,1),(18,'PGAL080909RRR','Galbani','9518901238','contacto@galbani.com','Santander','014567890123456778',21,1),(19,'PBAC090101SSS','Bachoco','9519012349','info@bachoco.com','HSBC','012345678901234779',22,1),(20,'PSAN100202TTT','Santa Clara','9510123450','ventas@santaclara.com','Citibanamex','012345678901234780',23,1),(21,'PNEC110303UUU','Nestlé','9511234561','contacto@nestle.com','Banorte','072180000123456781',24,1),(22,'PMAS120404VVV','Maseca','9512345672','info@maseca.com','BBVA','012345678901234782',25,1),(23,'PPAC130505WWW','Papillas Gerber','9513456783','ventas@gerber.com','Santander','014567890123456783',26,1),(24,'PGLU140606XXX','Gloria','9514567894','contacto@gloria.com','HSBC','012345678901234784',27,1),(25,'PLIM150707YYY','Limpiol','9515678905','info@limpiol.com','Citibanamex','012345678901234785',28,1),(26,'PJAB160808ZZZ','Jabón Palmolive','9516789016','ventas@palmolive.com','Banorte','072180000123456786',29,1),(27,'PVEL170909AAA','Velmex','9517890127','contacto@velmex.com','BBVA','012345678901234787',30,1),(28,'PPAP180101BBB','Papelera Nacional','9518901238','info@papelera.com','Santander','014567890123456788',31,1),(29,'PINH190202CCC','Insecticidas Raid','9519012349','ventas@raid.com','HSBC','012345678901234789',32,1),(30,'PHEM200303DDD','Hemo','9510123450','contacto@hemo.com','Citibanamex','012345678901234790',33,1),(31,'VERD940615PZ1','Dulces Vero','9514273890','ventas@vero-oaxaca.com','BBVA','012700001234567891',41,1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador'),(2,'gerente'),(3,'cajero'),(4,'almacenista');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `id_tipo_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(100) NOT NULL,
  `descripcion` text,
  `estatus` tinyint DEFAULT '1',
  PRIMARY KEY (`id_tipo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Lácteos','Productos derivados de la leche como yogurt, queso, crema y mantequilla.',1),(2,'Abarrotes en general','Productos básicos de despensa para uso diario.',1),(3,'Enlatados y conservas','Verduras, frutas y carnes enlatadas o en frascos.',1),(4,'Cereales','Cereales para desayuno y avenas.',1),(5,'Granos y semillas','Frijol, arroz, lentejas, garbanzos, maíz y otros granos.',1),(6,'Legumbres','Hortalizas frescas como ejotes, chícharos y habas.',1),(7,'Harinas y panificados','Harinas de trigo, maíz y productos derivados como pan o galletas.',1),(8,'Pastas y sopas','Sopas instantáneas, pastas secas y fideos.',1),(9,'Aceites y grasas','Aceite vegetal, manteca y otros productos grasos.',1),(10,'Azúcar y endulzantes','Azúcar, miel, piloncillo y sustitutos.',1),(11,'Café, té y bebidas calientes','Café molido, instantáneo, té y chocolate en polvo.',1),(12,'Refrescos y bebidas embotelladas','Refrescos, bebidas saborizadas y energéticas.',1),(13,'Jugos y néctares','Jugos naturales y néctares de frutas.',1),(14,'Agua purificada','Agua natural en botellas o garrafones.',1),(15,'Botanas y frituras','Papas, cacahuates, chicharrones y otros snacks.',1),(16,'Dulces y confitería','Caramelos, chocolates y chicles.',1),(17,'Galletas y pastelillos','Galletas dulces, saladas y pastelillos.',1),(18,'Productos de limpieza','Limpiadores, desinfectantes y multiusos.',1),(19,'Detergentes y lavandería','Detergentes, suavizantes y jabón para ropa.',1),(20,'Artículos de higiene personal','Shampoo, jabón, pasta dental, desodorante.',1),(21,'Papel y desechables','Servilletas, papel higiénico, vasos y platos desechables.',1),(22,'Cuidado del hogar','Insecticidas, aromatizantes, velas, focos.',1),(23,'Productos de panadería','Pan dulce, bolillo, pan de caja y tortillas.',1),(24,'Especias y condimentos','Sal, pimienta, comino, ajo en polvo, sazonadores.',1),(25,'Salsas y aderezos','Salsas picantes, cátsup, mayonesa y aderezos.',1),(26,'Carnes frías y embutidos','Jamón, salchicha, chorizo y tocino.',1),(27,'Alimento para mascotas','Comida seca y húmeda para perro y gato.',1),(28,'Frutas y verduras','Productos frescos del campo.',1),(29,'Productos congelados','Verduras, carnes, helados y comidas listas.',1),(30,'Productos para bebé','Pañales, leche infantil, papillas y toallitas.',1);
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `curp` char(18) NOT NULL,
  `genero` enum('Femenino','Masculino','Binario','Prefiero no responder') NOT NULL,
  `id_direccion` int DEFAULT NULL,
  `num_celular` varchar(10) DEFAULT NULL,
  `contraseña` varchar(255) NOT NULL,
  `estado` tinyint DEFAULT '1',
  `pin` varchar(10) DEFAULT '4567',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `curp` (`curp`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `id_rol` (`id_rol`),
  KEY `id_direccion` (`id_direccion`),
  CONSTRAINT `id_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'ittayOlmos','Ittay Ayelen','Olmos','Reyes','OORI050101MOCLYT09','Femenino',1,'9512345678','2098db57f081cc20d70008254c495b94097befdafc08116e35a72d2d819fbfe6',1,'4567'),(2,1,'andreaCruz','Andrea Joselin','Cruz','Martínez','CUMA010215MOCRRN06','Femenino',2,'9518765432','ac0759160e45de1ddddf4a29272bb42c15c4c7b39e0c18bb6bc3c3e984fe4b73',1,'4567'),(3,1,'florRios','Flor Estephany','Bustamante','Ríos','BUFE000312MOCRLS05','Femenino',3,'9519988776','9810444d5c790920b6911124744bdadb9498c869b0ac05dcbe0b673a91197534',1,'4567'),(4,1,'fernandoJimenez','Fernando Arath','Jiménez','López','JILF000918HOCRRN08','Masculino',4,'9516655443','867f6cf25ddd8fa937295c7558fa70cc5a3a36e6a023b1f4c324e4ed2f31f296',1,'4567'),(5,3,'estephanyBustamante','Flor Estephany','Bustamante','Rios','PEMA020507HOCMRN02','Masculino',5,'9511122334','4e8e77278f2a143d5a699d8f10e5a1b3b98bfc342d3fdca6fa2df51024ce360a',1,'4567'),(6,3,'ayelenReyes','Ittay Ayelen','Olmos','Reyes','MALS030606HOCMLS$1','Masculino',45,'9512233445','1f4257c50bf670c663bf927c0ec18309b767386070944884259718bdb48964d4',1,'4567'),(7,3,'joselinMartinez','Andrea Joselin','Cruz','Martinez','GOSA040707MOCRNS03','Femenino',7,'9513344556','dbf2a7154f7d35bbe3cc301e3426149398958ea07be49590d891cec5d390a688',1,'4567'),(8,3,'arathLopez','Fernando Arath','Jiménez','López','LOJE050808HOCMLR04','Masculino',8,'9514455667','d6e6de8e953eaab58cce24c1193e8c01306af88261cb822a5d7330d6792e385b',1,'4567'),(9,4,'andrea','Andrea Joselin','Cruz','Martinez','RUMF060909MOCRVG05','Femenino',9,'9515566778','f42b5a1c9cb6b413ea717e7d869a6326febc1691995c251bdcf418d6b8598356',1,'4567'),(10,2,'arath','Fernando Arath','Jimenez','López','SATR071010HOCRET06','Masculino',10,'9516677889','612a045b2907e77aff9060729943afda2940d5a4b971b3f55182882e9867d536',1,'4567'),(11,4,'ayelen','ittay Ayelen','Olmos','Reyes','DILB080111MOCLMD07','Femenino',11,'9517788990','80049942498a8ea10af17123e9b622c70e7f0c0024076e0f41d8f103294af83d',1,'4567'),(12,4,'flor','Flor Estephany','Bustamante','Rios','MEPJ090212HOCMCS08','Masculino',12,'9518899001','335234cbecdeca4fb2ed74b6b90b43a8718a84df728227748b28854e7f3a3b5c',1,'4567'),(13,4,'Fernando','Fernando Arath','Jimenez','López','TOSA100313MOCRRM09','Femenino',13,'9519900112','c8eb2921c3e40a433dd1078b4b5b906397e51d6586f61860682ca38bcd36c535',1,'4567'),(14,2,'itta','Ittay Ayelen','Olmos','Reyes','VECA110414HOCELN10','Masculino',14,'9511011223','dae06a5e2f2bd93397388f99cf271fae18ae0ff429aa78e5b6d774342569cc9e',1,'4567'),(15,2,'joss','Andre Joselin','Cruz','Martinez','MOVA120515MOCRLZ11','Femenino',15,'9511122334','fc41cf12306ef71e55868c79f707bcf88920f3f0baf3bab34dd354d2f90402cf',1,'4567'),(16,2,'fanny','Flor Estephany','Bustamante','Rios','FLRI130616HOCFRD12','Masculino',16,'9512233445','93cca633dbd3b43f6c4f7ceccca633e0bc6adf849997f14a1ee823aa8b1cb0ba',1,'4567'),(17,1,'jack','Jacob','Espinosa','Perez','OORI030330MOCLYTA8','Masculino',44,NULL,'4ad322ecca510f8c6662cbe1fb532f8a1ab0763741c1e201ae339c61592965e6',1,'4567');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_metodo_pago` int NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `estatus` tinyint DEFAULT '1',
  PRIMARY KEY (`id_venta`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,5,1,1,'2025-11-12 14:50:39',500.00,1),(2,6,2,2,'2025-11-12 14:50:39',1200.00,1),(3,7,3,3,'2025-11-12 14:50:39',750.00,1),(4,8,4,1,'2025-11-12 14:50:39',980.00,1),(5,5,NULL,1,'2025-11-12 14:50:39',450.00,1),(6,6,5,2,'2025-11-12 14:50:39',650.00,1),(7,7,NULL,3,'2025-11-12 14:50:39',300.00,1),(8,8,6,1,'2025-11-12 14:50:39',1200.00,1),(9,5,7,2,'2025-11-12 14:50:39',1500.00,1),(10,6,NULL,1,'2025-11-12 14:50:39',200.00,1),(11,7,8,3,'2025-11-12 14:50:39',850.00,1),(12,8,9,1,'2025-11-12 14:50:39',1100.00,1),(13,5,10,2,'2025-11-12 14:50:39',700.00,1),(14,6,NULL,1,'2025-11-12 14:50:39',400.00,1),(15,7,1,3,'2025-11-12 14:50:39',950.00,1),(16,8,2,2,'2025-11-12 14:50:39',300.00,1),(17,5,3,1,'2025-11-12 14:50:39',600.00,1),(18,6,4,2,'2025-11-12 14:50:39',750.00,1),(19,7,5,3,'2025-11-12 14:50:39',880.00,1),(20,8,6,1,'2025-11-12 14:50:39',450.00,1),(21,5,NULL,2,'2025-11-12 14:50:39',380.00,1),(22,6,7,3,'2025-11-12 14:50:39',1250.00,1),(23,7,8,1,'2025-11-12 14:50:39',990.00,1),(24,8,NULL,2,'2025-11-12 14:50:39',670.00,1),(25,5,9,3,'2025-11-12 14:50:39',520.00,1),(26,6,10,1,'2025-11-12 14:50:39',300.00,1),(27,7,NULL,2,'2025-11-12 14:50:39',880.00,1),(28,8,1,3,'2025-11-12 14:50:39',1100.00,1),(29,5,2,1,'2025-11-12 14:50:39',430.00,1),(30,6,NULL,2,'2025-11-12 14:50:39',950.00,1),(36,1,NULL,1,'2025-11-14 00:00:00',92.50,1),(37,1,NULL,1,'2025-11-14 00:00:00',29.00,1),(38,1,NULL,1,'2025-11-14 00:00:00',220.00,1),(39,1,NULL,1,'2025-11-16 00:00:00',479.00,1),(40,1,NULL,2,'2025-11-16 00:00:00',178.00,1),(41,1,NULL,3,'2025-11-16 00:00:00',106.00,1),(42,1,NULL,1,'2025-11-16 00:00:00',312.00,1),(43,1,NULL,1,'2025-11-16 00:00:00',77.00,1),(44,1,NULL,2,'2025-11-16 00:00:00',62.00,1),(45,1,NULL,1,'2025-11-18 00:00:00',88.00,1),(46,1,NULL,1,'2025-11-18 00:00:00',76.00,1),(47,1,NULL,2,'2025-11-18 00:00:00',101.00,1),(48,1,NULL,1,'2025-11-18 00:00:00',36.00,1),(49,1,NULL,1,'2025-11-24 00:00:00',156.00,1),(50,6,NULL,1,'2025-11-25 00:00:00',99.50,1),(51,6,NULL,1,'2025-11-25 00:00:00',106.00,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-28 20:33:14
