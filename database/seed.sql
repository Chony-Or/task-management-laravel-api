-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: task_manager
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"task\":\"Send welcome email\"}',0,NULL,1784913017,1784913017),(2,'default','{\"task\":\"Generate report\"}',0,NULL,1784913017,1784913017),(3,'notifications','{\"task\":\"Push notification to user\"}',1,NULL,1784913017,1784913017);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_07_23_182303_add_role_and_status_to_users_table',2),(5,'2026_07_23_184823_create_personal_access_tokens_table',3),(6,'2026_07_24_163550_create_tasks_table',4),(7,'2026_07_25_150438_add_assigned_to_to_tasks_table',5),(8,'2026_07_24_170544_create_tasks_table',6),(9,'2026_07_25_151851_add_is_complete_to_tasks_table',6),(10,'2026_07_25_153956_create_teams_table',7),(11,'2026_07_25_193739_create_tasks_table',8),(12,'2026_07_25_161739_create_tasks_table',9),(13,'2026_07_25_164256_add_team_id_to_users_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'api','d28562c8a2995bc1c20347134d2e4140317cbb41b638ce333919ef6092376fc4','[\"*\"]',NULL,NULL,'2026-07-24 00:10:02','2026-07-24 00:10:02'),(2,'App\\Models\\User',1,'api','335dd2f43b85d4545f7016663c0b8022b69e82bb4becb7b3a74fd997faf1d7d6','[\"*\"]',NULL,NULL,'2026-07-24 08:20:29','2026-07-24 08:20:29'),(3,'App\\Models\\User',1,'api','f5d3be783f533a30d590ee8a55eb31411ad96d0f1c1e21bfdc2986ed85d723cc','[\"*\"]',NULL,NULL,'2026-07-24 08:20:29','2026-07-24 08:20:29'),(4,'App\\Models\\User',1,'api','8c98bc10636065c9a9e9d1400ae40f3cdfedd8532bf7590fc1ee60fc1ab4e9ab','[\"*\"]',NULL,NULL,'2026-07-24 08:20:30','2026-07-24 08:20:30'),(5,'App\\Models\\User',1,'api','276c85a3a6f1ab373b7572178a3aa01dbd844b968e17f06d6b8a0173255c8b7a','[\"*\"]',NULL,NULL,'2026-07-24 08:20:30','2026-07-24 08:20:30'),(6,'App\\Models\\User',1,'api','407b6c14f6d7cc720e28e062ad2a27736dbddab95866750111cc54e450adf7a4','[\"*\"]',NULL,NULL,'2026-07-24 08:20:30','2026-07-24 08:20:30'),(7,'App\\Models\\User',1,'api','a68e2a75d062642b7a8b2c1460a5d6e5d6b258346fcc7d289ad75d16e33d04d0','[\"*\"]',NULL,NULL,'2026-07-24 08:20:30','2026-07-24 08:20:30'),(8,'App\\Models\\User',1,'api','aecd63ee0bb0d2084a79576a204b271a047c259e548e9b60621d0efdcc1f8ef3','[\"*\"]',NULL,NULL,'2026-07-24 08:20:31','2026-07-24 08:20:31'),(9,'App\\Models\\User',1,'api','193e8cb107b191046f897aa020345a1f03603f9d141021389795d3d8a55e8fd8','[\"*\"]',NULL,NULL,'2026-07-24 08:20:31','2026-07-24 08:20:31'),(10,'App\\Models\\User',1,'api','4aa1d654d2dabf94b9f5f72ad44d1c8f909af3582837e2605a53331ba1edcd08','[\"*\"]',NULL,NULL,'2026-07-24 08:21:16','2026-07-24 08:21:16'),(11,'App\\Models\\User',1,'api','73466fab3c7552bffcae23e79d4d14c67156d65c15d66848a51a2264404551e1','[\"*\"]',NULL,NULL,'2026-07-24 08:23:43','2026-07-24 08:23:43'),(12,'App\\Models\\User',1,'api','10a1e2738f108aa73e9d6080f953458c89d0042c00336687739e8e5806814d14','[\"*\"]','2026-07-24 08:44:32',NULL,'2026-07-24 08:29:43','2026-07-24 08:44:32'),(13,'App\\Models\\User',1,'api','caad22aec543f72bb14d9bb4df69b30146a648637052e1ca6b97ea2bac36c851','[\"*\"]','2026-07-24 08:46:51',NULL,'2026-07-24 08:44:38','2026-07-24 08:46:51'),(14,'App\\Models\\User',1,'api','afc2303b1b2423dcf5afb946061dbc263a61ae2da2f7e0d4d778e37e348ded10','[\"*\"]',NULL,NULL,'2026-07-24 08:51:04','2026-07-24 08:51:04'),(15,'App\\Models\\User',1,'api','63f45e05b631823a057ff08c986bf33d6df4d4f9785e22d5138309ba547ceb85','[\"*\"]','2026-07-24 08:51:06',NULL,'2026-07-24 08:51:05','2026-07-24 08:51:06'),(16,'App\\Models\\User',1,'api','791c7f9a951c8d84913d21be8cd8edd1e6c2c80dfc2729a7122b20962d746544','[\"*\"]','2026-07-25 03:47:03',NULL,'2026-07-24 09:11:09','2026-07-25 03:47:03'),(17,'App\\Models\\User',1,'api','2cfb9733de627119c3a53b65132b44c654d324bd251e28231589c83c93f6ef49','[\"*\"]',NULL,NULL,'2026-07-25 03:47:07','2026-07-25 03:47:07'),(18,'App\\Models\\User',1,'api','121f2d25e0ec864f81e09832317020e3798e955b345f991f4d316bf66a069b6b','[\"*\"]','2026-07-25 03:47:10',NULL,'2026-07-25 03:47:08','2026-07-25 03:47:10'),(19,'App\\Models\\User',3,'api','9470d07cf3197ed2e77f95dd0183746592b4e68c021d3b698e2aa8062b4d876b','[\"*\"]','2026-07-25 04:10:52',NULL,'2026-07-25 03:52:31','2026-07-25 04:10:52'),(20,'App\\Models\\User',1,'api','0e99071b73544e5d21826bbb9382cb29e1b0c523dba47797f26ed961cbdbb7a2','[\"*\"]','2026-07-25 04:11:04',NULL,'2026-07-25 04:11:03','2026-07-25 04:11:04'),(21,'App\\Models\\User',1,'api','9ba59f6515be63301e181bfa86d08bce8c89d83dd89840201e639003c24da8b0','[\"*\"]','2026-07-25 04:13:31',NULL,'2026-07-25 04:13:29','2026-07-25 04:13:31'),(22,'App\\Models\\User',1,'api','f54b744d4392ed22dd324eec4c8af15f60f4bb90cf631d7883501048158005c4','[\"*\"]','2026-07-25 04:50:28',NULL,'2026-07-25 04:16:42','2026-07-25 04:50:28'),(23,'App\\Models\\User',1,'api','625e98b1374e8aec978db17fc192af1f218d4269a1017f36192f39d01c07c2f0','[\"*\"]','2026-07-25 04:50:35',NULL,'2026-07-25 04:50:33','2026-07-25 04:50:35'),(24,'App\\Models\\User',3,'api','fe3725facb2206ecd63563c889c00afdf51f26c5f1980a17c760660193e9f0d0','[\"*\"]','2026-07-25 06:46:14',NULL,'2026-07-25 04:50:52','2026-07-25 06:46:14'),(25,'App\\Models\\User',1,'api','6bb66d571f1d712b6d477cef0778e01b3a5bffc9bfeee67c59fdb00966ba43bd','[\"*\"]','2026-07-25 06:57:59',NULL,'2026-07-25 06:46:19','2026-07-25 06:57:59'),(26,'App\\Models\\User',3,'api','76a57d876402f9e23d2b367a6b00f48411a6eea7add88a9027352d738a8d7b04','[\"*\"]','2026-07-25 07:23:02',NULL,'2026-07-25 06:58:34','2026-07-25 07:23:02'),(27,'App\\Models\\User',1,'api','4563c9aefc6f59abfa875296f1e5006d3cd3b54f46637d3a48ee03d3e6c795b9','[\"*\"]','2026-07-25 07:23:13',NULL,'2026-07-25 07:23:10','2026-07-25 07:23:13'),(28,'App\\Models\\User',1,'api','0736757ec284bb161ef9a80b208c2417845472f6ec5d98b886f900655a073e22','[\"*\"]','2026-07-25 07:28:37',NULL,'2026-07-25 07:25:01','2026-07-25 07:28:37'),(29,'App\\Models\\User',3,'api','46918c9affee150ee3939e7176faa4e293d3d4ead154aa8d7b7f3c5f430aa75f','[\"*\"]','2026-07-25 07:29:16',NULL,'2026-07-25 07:28:47','2026-07-25 07:29:16'),(30,'App\\Models\\User',1,'api','b68b68987d91a0d889d5935ab6cf290418e88a81b6c16c7fdb3406b3c418cca3','[\"*\"]','2026-07-25 07:29:57',NULL,'2026-07-25 07:29:55','2026-07-25 07:29:57'),(31,'App\\Models\\User',2,'api','7e8c8169f2366ab8900396e567aa86d7403231fc68885d8f763b1774f5ea3a19','[\"*\"]','2026-07-25 07:30:04',NULL,'2026-07-25 07:30:02','2026-07-25 07:30:04'),(32,'App\\Models\\User',1,'api','e7e94f238c0c92418ff08413fea77ffede6e4ef019d348690402e7ec67dd72cb','[\"*\"]','2026-07-25 09:09:11',NULL,'2026-07-25 07:54:37','2026-07-25 09:09:11'),(33,'App\\Models\\User',1,'api','fb1b6c1a443320ca9c14f58dbf085490feb0c53fde05d4745f7b9bf1a080a88a','[\"*\"]','2026-07-26 04:44:23',NULL,'2026-07-26 04:44:19','2026-07-26 04:44:23'),(34,'App\\Models\\User',1,'api','9f359c8af6cfd4020de38b4f6a0c716aaf058d9db6f35e27d48fd772366ed0ce','[\"*\"]','2026-07-26 05:47:42',NULL,'2026-07-26 04:44:33','2026-07-26 05:47:42'),(35,'App\\Models\\User',12,'api','63845da5dabd08623d76bf483c7316f182b9dd8378663f4d4e73c1f482334530','[\"*\"]','2026-07-26 05:48:01',NULL,'2026-07-26 05:47:58','2026-07-26 05:48:01'),(36,'App\\Models\\User',1,'api','89572d83c50b9e7242517774573b7d31c41b8e23bafb464044425bd99f11775d','[\"*\"]','2026-07-26 06:12:35',NULL,'2026-07-26 05:48:19','2026-07-26 06:12:35'),(37,'App\\Models\\User',12,'api','8d032fca53a74ceb7d48314935131a43d86111c18f173144f8a4749d0d37d1c1','[\"*\"]','2026-07-26 06:12:53',NULL,'2026-07-26 06:12:50','2026-07-26 06:12:53'),(38,'App\\Models\\User',1,'api','d941bede4d061f90aed95381d59c9b4a239f8528efefe9e4e7935f5da20b4afe','[\"*\"]','2026-07-26 06:25:52',NULL,'2026-07-26 06:13:16','2026-07-26 06:25:52'),(39,'App\\Models\\User',12,'api','98518d893d64cd63aa782f2a935d4e56267f129784e903087802f97942bca56e','[\"*\"]','2026-07-26 06:27:25',NULL,'2026-07-26 06:26:05','2026-07-26 06:27:25'),(40,'App\\Models\\User',1,'api','268faab5d554e9c4849ae3153bcab7129a86881ac52b4c7fd8c9bd4cc031bf40','[\"*\"]','2026-07-26 06:28:14',NULL,'2026-07-26 06:28:09','2026-07-26 06:28:14'),(41,'App\\Models\\User',11,'api','12d50a941e267e654c4678f104e9079d1e9837b6cd197c424187650dc484f4e4','[\"*\"]','2026-07-26 06:28:35',NULL,'2026-07-26 06:28:31','2026-07-26 06:28:35'),(42,'App\\Models\\User',1,'api','3aa51c4b49fb29b61280b51145587b0f2acd0f78e95e83401f54a569e6f52b08','[\"*\"]','2026-07-26 08:28:52',NULL,'2026-07-26 07:09:25','2026-07-26 08:28:52'),(43,'App\\Models\\User',1,'api','2afbbd2a5ec6bee59588588ffd5aa18747489dc15c7991df69352533ff885fd4','[\"*\"]','2026-07-26 08:28:58',NULL,'2026-07-26 08:28:54','2026-07-26 08:28:58'),(44,'App\\Models\\User',3,'api','4af5a1a1ea905fb9e27e77cda75f1ac48450c784920070dbc8e0e751644ed794','[\"*\"]','2026-07-26 08:29:11',NULL,'2026-07-26 08:29:08','2026-07-26 08:29:11'),(45,'App\\Models\\User',3,'api','ddbe855c51a7f6f1ee46376da10c4c3712332de7186e1e78d767890d851a6be9','[\"*\"]','2026-07-26 08:29:24',NULL,'2026-07-26 08:29:20','2026-07-26 08:29:24'),(46,'App\\Models\\User',1,'api','bfdfa0bd100f8ed3e90b549e4cd29b142df0a63eb9f061c063cd64be6f89eb23','[\"*\"]','2026-07-26 08:30:02',NULL,'2026-07-26 08:29:27','2026-07-26 08:30:02'),(47,'App\\Models\\User',3,'api','ceb994f1d38bbd75251e08666d5a30246356bd15ee187f13f3f62a0867c5925f','[\"*\"]','2026-07-26 09:12:52',NULL,'2026-07-26 08:30:08','2026-07-26 09:12:52');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','in_progress','completed','cancelled') NOT NULL DEFAULT 'pending',
  `assigned_to` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `due_date` datetime DEFAULT NULL,
  `team_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_assigned_to_foreign` (`assigned_to`),
  KEY `tasks_created_by_foreign` (`created_by`),
  KEY `tasks_team_id_foreign` (`team_id`),
  CONSTRAINT `tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'task1','testing','pending',12,1,'medium','2026-07-01 00:00:00',1,'2026-07-26 05:46:49','2026-07-26 08:12:21'),(2,'testing','gahahaha','cancelled',7,1,'medium','2026-07-30 00:00:00',1,'2026-07-26 05:55:49','2026-07-26 07:59:52'),(3,'teasta','afadfaf','cancelled',11,1,'medium','2026-07-29 00:00:00',5,'2026-07-26 06:10:35','2026-07-26 08:00:53'),(4,'teasda','sfdasdfa','in_progress',7,1,'medium','2026-07-08 00:00:00',1,'2026-07-26 07:59:24','2026-07-26 08:13:18'),(5,'Task 3','Task 3 description','pending',3,1,'high','2026-07-31 00:00:00',1,'2026-07-26 08:30:02','2026-07-26 08:30:02');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_created_by_foreign` (`created_by`),
  CONSTRAINT `teams_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'team 1',1,'2026-07-25 08:34:54','2026-07-25 08:34:54'),(2,'Team 2',1,'2026-07-25 08:47:02','2026-07-25 08:47:02'),(3,'Team 2',1,'2026-07-25 08:50:35','2026-07-25 08:50:35'),(4,'Team 4',1,'2026-07-25 08:50:44','2026-07-25 08:50:44'),(5,'team 8',1,'2026-07-25 09:02:35','2026-07-25 09:02:35'),(6,'Team 10',1,'2026-07-25 09:08:35','2026-07-25 09:08:35');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'team_member',
  `team_id` bigint(20) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_team_id_foreign` (`team_id`),
  CONSTRAINT `users_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@test.com','admin',NULL,1,NULL,'$2y$12$.pSxoHYrMYX7DytWx2lEDu//7uX5w/VntrXVfvuoJfZFaCymuR./m',NULL,'2026-07-23 10:43:18','2026-07-23 10:43:18'),(2,'Manager User','manager@test.com','manager',NULL,1,NULL,'$2y$12$mfSR47fvk.UYJ8B/FTWqf.DdBiE0X7ghEH9VHsgY7G24lYI0V/7ri',NULL,'2026-07-23 10:43:18','2026-07-23 10:43:18'),(3,'Team Member1','member@test.com','team_member',1,1,NULL,'$2y$12$I5/KdtHmiqmAkIs5vn7v1eBbz5QfdntbPyWBR4vrFxRF9Ao8yPUA.',NULL,'2026-07-23 10:43:19','2026-07-26 08:14:17'),(4,'Team Member2','member2@test.com','team_member',NULL,1,NULL,'$2y$12$frResVJimhiDVCZTKmkyVOlEuBt1t6fJvj739JAIsEVr8Y8ahRSzi',NULL,'2026-07-25 06:49:12','2026-07-25 06:49:12'),(5,'Team Member3','member3@test.com','team_member',NULL,1,NULL,'$2y$12$XVhj4da.L2EYf38CcTO66ulhEJTVoWGWgqpQnDCbZX2oSDCFaVASC',NULL,'2026-07-25 06:57:59','2026-07-25 06:57:59'),(6,'test','test@test.com','team_member',NULL,1,NULL,'$2y$12$83BOiw5/yf9UI9HcBm/9weJjd5FgQvwT8fVYORrprB0IEl3K/1fbe',NULL,'2026-07-25 08:08:31','2026-07-25 08:08:31'),(7,'testing','test1@test.com','team_member',1,1,NULL,'$2y$12$2R8JN/N0zLtBWhWWDDODk.2yNmMqEsgBU2MqhXvjRPj8Wmjw/iT6a',NULL,'2026-07-25 08:47:37','2026-07-25 09:08:27'),(8,'tester','tester@test.com','team_member',3,1,NULL,'$2y$12$w5IIhANYdbzSDDcWv.tB9.XWkz8pVvg3PHuDdwGvB6JeW/157o.Vq',NULL,'2026-07-25 08:51:06','2026-07-25 09:08:18'),(9,'testerrr','testerr@test.com','team_member',4,1,NULL,'$2y$12$wR6kU4/CDXaaQpVNszkSV.UQ1ICtNlGFuBoZp8GtJtQXed31ExlFC',NULL,'2026-07-25 08:57:57','2026-07-25 08:57:57'),(10,'haha','haha@test.com','team_member',3,1,NULL,'$2y$12$PyT/6xG01l4TIiLun/Rft.nyjQf.FBvWZSL7z/euPaxTF3.3nMpNm',NULL,'2026-07-25 09:01:29','2026-07-25 09:01:29'),(11,'testtest','testtest@test.com','team_member',5,1,NULL,'$2y$12$OqTnXCv4Uc1VpDgJVUt6ReOOjPFE4BY4z5ORuUrcBPOJBqSeky.pu',NULL,'2026-07-25 09:05:23','2026-07-25 09:05:23'),(12,'pwede','pwede@test.com','manager',1,1,NULL,'$2y$12$i6bJfiXPLbXZZ8vXXbYNt.hkJ2zaShE6d9LTXXpSk332mfk0ffO32',NULL,'2026-07-25 09:08:57','2026-07-25 09:09:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-27 20:38:27
