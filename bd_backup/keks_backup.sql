-- MySQL dump 10.13  Distrib 5.7.24, for Win32 (AMD64)
--
-- Host: localhost    Database: keksobooking
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'img/avatars/user01.png'),(2,'img/avatars/user02.png'),(3,'img/avatars/user03.png'),(4,'img/avatars/user04.png'),(5,'img/avatars/user05.png'),(6,'img/avatars/default.png'),(7,'img/avatars/user06.png'),(8,'img/avatars/user07.png'),(9,'img/avatars/user08.png'),(86,'img/avatars/92f770b4d212969978a753fe5a62d875.jpg'),(87,'img/avatars/95db2dacc67ae859aa3732c6551794e9.jpg'),(88,'img/avatars/8750858775bf7d127809b9b2510db916.jpg');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_list`
--

DROP TABLE IF EXISTS `features_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features_list` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `feature` varchar(20) NOT NULL,
  UNIQUE KEY `feature_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_list`
--

LOCK TABLES `features_list` WRITE;
/*!40000 ALTER TABLE `features_list` DISABLE KEYS */;
INSERT INTO `features_list` VALUES (1,'wifi'),(2,'dishwasher'),(3,'parking'),(4,'washer'),(5,'elevator'),(6,'conditioner');
/*!40000 ALTER TABLE `features_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guests` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `guests_num` int(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,1),(2,2),(3,3),(5,0),(6,6),(7,93),(8,5);
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_list`
--

DROP TABLE IF EXISTS `housing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housing_list` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `housing_type` varchar(20) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_list`
--

LOCK TABLES `housing_list` WRITE;
/*!40000 ALTER TABLE `housing_list` DISABLE KEYS */;
INSERT INTO `housing_list` VALUES (1,'palace'),(2,'flat'),(3,'house'),(4,'bungalo');
/*!40000 ALTER TABLE `housing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(7) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `price` int(7) unsigned NOT NULL,
  `type_id` int(2) unsigned NOT NULL,
  `rooms_id` int(3) unsigned NOT NULL,
  `guests_id` int(2) unsigned NOT NULL,
  `checkin` varchar(5) NOT NULL,
  `checkout` varchar(5) NOT NULL,
  `description` varchar(150) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,1,'Уютное гнездышко для молодоженов!!!','Чкалова 18, кв 38,341-05481-35',42000,3,3,6,'14:00','10:00','Великолепный таун-хауз в центре Токио. Подходит как туристам, так и бизнесменам. Дом полностью укомплектован и имеет свежий ремонт.'),(2,2,'Маленькая квартирка рядом с парком','102-0075 Tōkyō-to, Chiyoda-ku, Sanbanchō',30000,2,1,1,'9:00','7:00','Маленькая чистая квратира на краю парка. Без интернета, регистрации и СМС.'),(3,3,'Небольшая лавочка в парке','Chiyoda-ku, Tōkyō-to 102-0091',100,4,5,5,'0:00','0:00','Великолепная лавочка прямо в центре парка. Подходит для всех кто любит спать на свежем воздухе.'),(4,4,'Императорский дворец в центре Токио','1-1 Chiyoda, Chiyoda-ku, Tōkyō-to 100-8111',6000000,3,6,7,'21:00','20:00','Замечательный дворец в старинном центре города. Только для тех кто может себе позволить дворец. Лакеев и прочих жокеев просим не беспокоить.'),(5,5,'Милейший чердачок','102-0094 Tōkyō-to, Chiyoda-ku, Kioichō, 3',10000,4,1,2,'11:00','10:00','Маленькая квартирка на чердаке. Для самых не требовательных.'),(6,6,'Наркоманский притон','102-0094 Tōkyō-to, Chiyoda-ku, Kioichō, 3',5000,4,3,6,'11:00','10:00','У нас есть всё! Шприцы, интернет, кофе. Для всех кто знает толк в отдыхе. Полицию просим не беспокоить.'),(7,7,'Чёткая хата','102-0081 Tōkyō-to, Chiyoda-ku, Yonbanchō, 5−6',9000,2,2,3,'17:00','16:00','У нас тут все ништяк. Ларек за углом. Шава 24 часа. Приезжайте! Интернетов нет!'),(8,8,'Стандартная квартира в центре','Chiyoda-ku, Tōkyō-to 102-0082',60000,2,3,8,'17:00','16:00','Тут красиво, светло и уютно. Есть где разместиться компании из 5 человек. Кофе и печеньки бесплатно.'),(9,9,'Тихая квартирка недалеко от метро','102-0082 Tōkyō-to, Chiyoda-ku, Ichibanchō, 17−4',50000,2,1,3,'23:00','05:00','Квартира на первом этаже. Соседи тихие. Для всех, кто терпеть не может шума и суеты.'),(10,6,'Милое гнездышко для фанатов Анимэ','105-0003 Tōkyō-to, Minato-ku, Nishishinbashi, 2 Chome−3',90000,3,1,2,'23:00','05:00','Азиатов просьба не беспокоить.'),(63,86,'Отличная хатка на краю вселенной','839, 395',56000,2,1,3,'12:00','12:00','Очень много буков и слов о том, какое крутое жилье'),(64,87,'Отличная хатка на краю вселенной','647, 333',56000,2,1,3,'12:00','12:00','Очень много буков и слов о том, какое крутое жилье'),(65,88,'Отличная хатка на краю вселенной','647, 333',56000,2,1,3,'12:00','12:00','Очень много буков и слов о том, какое крутое жилье');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_features`
--

DROP TABLE IF EXISTS `offers_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_features` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(5) unsigned NOT NULL,
  `feature_id` int(2) unsigned NOT NULL,
  UNIQUE KEY `unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_features`
--

LOCK TABLES `offers_features` WRITE;
/*!40000 ALTER TABLE `offers_features` DISABLE KEYS */;
INSERT INTO `offers_features` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,2,5),(8,2,6),(9,4,1),(10,4,2),(11,4,3),(12,4,4),(13,4,5),(14,4,6),(15,5,1),(16,5,4),(17,5,5),(18,6,1),(19,6,2),(20,6,3),(21,6,4),(22,6,5),(23,6,6),(24,7,2),(25,7,3),(26,7,4),(27,7,5),(28,7,6),(29,8,1),(30,8,2),(31,8,4),(32,8,6),(33,9,1),(34,9,2),(35,9,4),(36,10,1),(37,10,2),(38,10,3),(39,10,4),(40,10,5),(41,10,6),(97,63,1),(98,63,2),(99,64,1),(100,64,2),(101,64,3),(102,65,1),(103,65,2),(104,65,3);
/*!40000 ALTER TABLE `offers_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_locations`
--

DROP TABLE IF EXISTS `offers_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_locations` (
  `offer_id` int(7) unsigned NOT NULL,
  `coord_x` int(4) unsigned NOT NULL,
  `coord_y` int(3) unsigned NOT NULL,
  UNIQUE KEY `offer_id` (`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_locations`
--

LOCK TABLES `offers_locations` WRITE;
/*!40000 ALTER TABLE `offers_locations` DISABLE KEYS */;
INSERT INTO `offers_locations` VALUES (1,428,493),(2,471,534),(3,526,597),(4,361,517),(5,1165,423),(6,594,464),(7,452,382),(8,976,505),(9,744,534),(10,535,418),(63,839,395),(64,647,333),(65,647,333);
/*!40000 ALTER TABLE `offers_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_photos`
--

DROP TABLE IF EXISTS `offers_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_photos` (
  `id` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(5) unsigned NOT NULL,
  `photo` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_photos`
--

LOCK TABLES `offers_photos` WRITE;
/*!40000 ALTER TABLE `offers_photos` DISABLE KEYS */;
INSERT INTO `offers_photos` VALUES (1,1,'https://cdn.ostrovok.ru/t/x500/mec/hotels/11000000/10360000/10357700/10357605/10357605_25_b.jpg'),(2,1,'https://cdn.ostrovok.ru/t/x500/mec/hotels/11000000/10360000/10357700/10357605/10357605_27_b.jpg'),(3,1,'https://cdn.ostrovok.ru/t/x500/mec/hotels/11000000/10360000/10357700/10357605/10357605_17_b.jpg'),(4,1,'https://cdn.ostrovok.ru/t/x500/mec/hotels/11000000/10360000/10357700/10357605/10357605_30_b.jpg'),(5,1,'https://cdn.ostrovok.ru/t/x500/mec/hotels/10000000/9160000/9151200/9151174/9151174_1_b.jpg'),(6,1,'https://cdn.ostrovok.ru/t/x500/mec/hotels/10000000/9160000/9151200/9151174/9151174_12_b.jpg'),(7,1,'https://cdn.ostrovok.ru/t/x500/mec/hotels/10000000/9160000/9151200/9151174/9151174_5_b.jpg'),(8,2,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/01488611-c1f9-4854-ad67-9f0ad3e857e6.jpeg'),(9,2,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/d976dd4b-2a7e-415a-a2a2-afc51caf8006.jpeg'),(10,4,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/5a29d708-9396-40bf-b002-92c5fdeb5c90.jpeg'),(11,4,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/23e332cb-1379-4582-85ac-901d6c441635.jpeg'),(12,4,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/1c859bbf-61d6-4295-b463-c1d0cbf62592.jpeg'),(13,5,'https://cdn.ostrovok.ru/t/x500/mec/hotels/5000000/4500000/4493700/4493658/4493658_17_b.jpg'),(14,5,'https://cdn.ostrovok.ru/t/x500/mec/b4/c6/b4c674087f12b74bc71fe073923ec744dfe1ed8f.jpeg'),(15,6,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/42624d02-3198-4979-b521-194024454eb7.jpeg'),(16,7,'https://cdn.ostrovok.ru/t/x500/mec/a4/bb/a4bbfa3d98c0ddf60e95e610509dbede8160e40e.jpeg'),(17,7,'https://cdn.ostrovok.ru/t/x500/mec/hotels/1000000/480000/470500/470466/470466_12_b.jpg'),(18,8,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/987935fb-633a-46b8-9b76-76af9f35c5e3.jpeg'),(19,8,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/434b2eda-5af9-4b93-b97d-4e7514621ff1.jpeg'),(20,8,'https://cdn.ostrovok.ru/t/x500/carsolize/images/hotels/fa9c3bba-a64a-4019-ab50-102bf6e5d691.jpeg'),(21,9,'https://cdn.ostrovok.ru/t/x500/mec/9b/6c/9b6cacd832ce9f3db3f17b3a2f368958710ce518.jpeg'),(22,9,'https://cdn.ostrovok.ru/t/x500/mec/9c/5d/9c5dc5a6daf5353bb44b5696df1c1186c55173b9.jpeg'),(23,10,'https://cdn.ostrovok.ru/t/x500/second2/1389653673/9237e4e2ff53d3d1beb69e49412df972.jpg'),(24,10,'https://cdn.ostrovok.ru/t/x500/second/1389604422/ff530e241de007ce3af7bdd23719ae0a.jpg'),(25,10,'https://cdn.ostrovok.ru/t/x500/mec/hotels/2000000/1480000/1479400/1479346/1479346_34_b.jpg'),(26,10,'https://cdn.ostrovok.ru/t/x500/mec/hotels/2000000/1480000/1479400/1479346/1479346_40_b.jpg'),(40,63,'img/photos/0b0f85b72dbddbb012bb828f2930afe6.jpg'),(41,63,'img/photos/0fab366bb2c05343a51e640789fbae02.jpg'),(42,63,'img/photos/fbbd3438717afd8de069e933efd8f9d8.jpg'),(43,63,'img/photos/46cee99c3cb3bdc3759993c56298ac74.jpg'),(44,64,'img/photos/a6441668777db781be421ec276332e68.jpg'),(45,64,'img/photos/b267028a1b272f07de144802280bd6a5.jpg'),(46,64,'img/photos/37dfc8dec550bf5e817b0c799009647f.jpg'),(47,65,'img/photos/cddebf4789182d76de333df9cbef393f.jpg'),(48,65,'img/photos/5d6501473bd9f5242d9bedef56fb88dc.jpg'),(49,65,'img/photos/aca1a77211a2a4939640b4727b40f490.jpg');
/*!40000 ALTER TABLE `offers_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms_list`
--

DROP TABLE IF EXISTS `rooms_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms_list` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `rooms` int(3) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms_list`
--

LOCK TABLES `rooms_list` WRITE;
/*!40000 ALTER TABLE `rooms_list` DISABLE KEYS */;
INSERT INTO `rooms_list` VALUES (1,1),(2,2),(3,3),(4,100),(5,0),(6,35);
/*!40000 ALTER TABLE `rooms_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-13 13:08:15
