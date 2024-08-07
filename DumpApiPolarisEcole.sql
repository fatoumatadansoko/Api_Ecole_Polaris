-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: ApiEcolePolaris
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.23.10.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
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
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `etudiants_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (1,'fall','John','123 Main St','A123456gggg','http://example.com/photo.jpg','2000-01-01','jkkdjdhhde@example.com',92345678,'2024-08-06 17:00:07','2024-08-07 11:35:29',NULL),(2,'Diabyddddddddddd','Adama','123 Main St','A123456555','http://example.com/photo.jpg','2000-01-01','adama@example.com',1234567891,'2024-08-06 17:00:07','2024-08-06 19:20:09','2024-08-06 19:20:09'),(3,'Doe','John','123 Main St','A123456ff','http://example.com/photo.jpg','2000-01-01','john@example.com',1234567790,'2024-08-06 17:00:07','2024-08-06 17:00:07',NULL),(4,'Doe','Johnnnnnn','123 Main St','A123456ffffff','http://example.com/photo.jpg','2000-01-01','johnfff@example.com',1234667890,'2024-08-06 17:00:07','2024-08-06 17:00:07',NULL);
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations`
--

DROP TABLE IF EXISTS `evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `valeur` int NOT NULL,
  `etudiant_id` bigint unsigned NOT NULL,
  `matiere_id` bigint unsigned NOT NULL,
  `ue_id` bigint unsigned NOT NULL,
  `note` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluations_etudiant_id_foreign` (`etudiant_id`),
  KEY `evaluations_matiere_id_foreign` (`matiere_id`),
  KEY `evaluations_ue_id_foreign` (`ue_id`),
  CONSTRAINT `evaluations_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `evaluations_matiere_id_foreign` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `evaluations_ue_id_foreign` FOREIGN KEY (`ue_id`) REFERENCES `ues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations`
--

LOCK TABLES `evaluations` WRITE;
/*!40000 ALTER TABLE `evaluations` DISABLE KEYS */;
INSERT INTO `evaluations` VALUES (3,'2024-08-06 12:00:00',45,1,2,3,15.00,'2024-08-06 19:37:45','2024-08-06 19:37:45'),(5,'2024-08-06 12:00:00',85,1,2,3,15.75,'2024-08-06 19:37:45','2024-08-06 19:37:45');
/*!40000 ALTER TABLE `evaluations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matieres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `ue_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matieres_ue_id_foreign` (`ue_id`),
  CONSTRAINT `matieres_ue_id_foreign` FOREIGN KEY (`ue_id`) REFERENCES `ues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matieres`
--

LOCK TABLES `matieres` WRITE;
/*!40000 ALTER TABLE `matieres` DISABLE KEYS */;
INSERT INTO `matieres` VALUES (1,'suscipinnnnnnnnnnnt','2024-06-25 06:54:52','2025-03-06 00:32:22',12,'2024-08-06 16:48:32','2024-08-07 11:50:40'),(2,'suscipit','2024-06-25 06:54:52','2025-03-06 00:32:22',12,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(4,'minus','2024-03-15 09:02:09','2025-06-17 03:58:20',14,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(5,'sunt','2024-01-26 07:10:12','2025-05-04 12:09:41',15,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(6,'dolores','2024-04-25 14:28:04','2025-07-13 17:11:49',16,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(7,'ullam','2024-05-13 05:38:58','2025-05-14 00:01:18',17,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(8,'atque','2024-05-21 14:18:06','2025-01-11 10:42:50',18,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(9,'ab','2023-10-10 15:23:38','2024-10-12 18:14:49',19,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(10,'expedita','2023-11-18 20:42:28','2025-05-14 06:26:15',20,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(11,'deleniti','2023-10-01 00:15:03','2025-08-03 15:13:44',21,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(12,'fuga','2023-08-22 18:47:58','2025-02-06 00:17:09',22,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(13,'recusandae','2024-02-13 12:59:26','2024-10-08 07:05:00',23,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(14,'et','2024-04-18 05:23:32','2024-11-21 21:42:54',24,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(15,'ex','2024-01-24 18:03:42','2025-05-13 23:15:31',25,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(16,'omnis','2024-03-02 23:08:59','2025-02-01 22:57:11',26,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(17,'sed','2023-12-12 21:49:35','2024-10-28 17:47:17',27,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(18,'ut','2024-02-07 02:07:11','2025-04-20 01:56:26',28,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(19,'quidem','2024-02-01 14:53:55','2025-03-31 13:43:25',29,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(20,'vel','2024-07-30 20:15:35','2024-10-30 15:59:20',30,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(21,'suscipit','2024-06-25 06:54:52','2025-03-06 00:32:22',12,'2024-08-06 16:48:32','2024-08-06 16:48:32'),(100,'rerumllllllllllllll','2023-08-12 01:38:42','2024-11-26 08:33:06',11,'2024-08-06 16:48:32','2024-08-06 19:07:58'),(1000,'rerum','2023-08-12 01:38:42','2024-11-26 08:33:06',11,'2024-08-06 16:48:32','2024-08-06 16:48:32');
/*!40000 ALTER TABLE `matieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (25,'0001_01_01_000000_create_users_table',1),(26,'0001_01_01_000001_create_cache_table',1),(27,'0001_01_01_000002_create_jobs_table',1),(28,'2024_08_06_110442_create_personal_access_tokens_table',1),(29,'2024_08_06_124358_create_ues_table',1),(30,'2024_08_06_124447_create_matieres_table',1),(31,'2024_08_06_124509_create_etudiants_table',1),(32,'2024_08_06_124518_create_evaluations_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
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
INSERT INTO `sessions` VALUES ('d7YhyndzMgpDUIgkE7tUATOIcGx6PfY8pxorRLeQ',NULL,'127.0.0.1','insomnia/9.3.3','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNll1RzJIcEFpVHRXV1R3YnFpSXBTdnF6RUVPVmtiaVBLRVlSc1BVcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1723031775),('giliulXWV6mN2HeIRranJE5b9vMHy2xVibPDkUnV',1,'127.0.0.1','insomnia/9.3.3','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREpWTmR4R2p0Z0xPdnRzRXVoUUVQUkdIbVRVRkNtN1Y0b1FkZ01IdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1722970984);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ues`
--

DROP TABLE IF EXISTS `ues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `coef` int NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ues`
--

LOCK TABLES `ues` WRITE;
/*!40000 ALTER TABLE `ues` DISABLE KEYS */;
INSERT INTO `ues` VALUES (1,'2024-06-13 15:32:59','2025-07-20 13:46:18',2,'aperiamjjjjjjjjjjj','2024-08-06 16:48:32','2024-08-07 10:28:56'),(2,'2024-06-13 15:32:59','2025-07-20 13:46:18',2,'aperiam','2024-08-06 16:48:32','2024-08-06 16:48:32'),(3,'2024-04-06 18:21:16','2025-03-20 03:50:41',5,'quos','2024-08-06 16:48:32','2024-08-06 16:48:32'),(4,'2024-03-16 03:45:28','2025-03-03 12:45:12',7,'aperiam','2024-08-06 16:48:32','2024-08-06 16:48:32'),(6,'2024-03-28 07:27:44','2024-12-05 23:22:27',9,'sunt','2024-08-06 16:48:32','2024-08-06 16:48:32'),(7,'2024-01-20 01:27:30','2025-05-12 12:52:20',3,'accusamus','2024-08-06 16:48:32','2024-08-06 16:48:32'),(8,'2024-05-29 10:58:50','2024-12-23 06:06:10',3,'et','2024-08-06 16:48:32','2024-08-06 16:48:32'),(9,'2024-07-24 07:18:50','2025-04-17 18:01:59',1,'mollitia','2024-08-06 16:48:32','2024-08-06 16:48:32'),(10,'2023-12-30 15:14:31','2024-11-11 18:52:20',2,'totam','2024-08-06 16:48:32','2024-08-06 16:48:32'),(11,'2024-05-20 00:17:04','2025-07-01 00:04:01',2,'velit','2024-08-06 16:48:32','2024-08-06 16:48:32'),(12,'2024-04-21 18:56:36','2025-04-27 19:53:02',5,'excepturi','2024-08-06 16:48:32','2024-08-06 16:48:32'),(13,'2023-11-26 20:04:56','2025-01-27 21:26:20',6,'quia','2024-08-06 16:48:32','2024-08-06 16:48:32'),(14,'2024-06-18 13:45:38','2025-02-18 17:33:13',8,'nemo','2024-08-06 16:48:32','2024-08-06 16:48:32'),(15,'2024-02-05 20:16:41','2024-10-26 03:29:29',1,'totam','2024-08-06 16:48:32','2024-08-06 16:48:32'),(16,'2024-02-13 13:13:31','2024-09-15 00:33:12',2,'aut','2024-08-06 16:48:32','2024-08-06 16:48:32'),(17,'2023-12-29 04:07:15','2025-01-16 12:50:58',7,'quae','2024-08-06 16:48:32','2024-08-06 16:48:32'),(18,'2023-08-11 04:56:56','2025-03-16 04:11:09',9,'voluptas','2024-08-06 16:48:32','2024-08-06 16:48:32'),(19,'2024-02-04 02:31:29','2025-03-26 04:55:01',2,'nobis','2024-08-06 16:48:32','2024-08-06 16:48:32'),(20,'2023-09-09 09:55:55','2025-04-30 18:39:04',6,'non','2024-08-06 16:48:32','2024-08-06 16:48:32'),(21,'2024-02-14 22:08:29','2024-09-09 21:52:04',2,'eum','2024-08-06 16:48:32','2024-08-06 16:48:32'),(22,'2024-07-13 02:38:17','2024-11-16 16:46:34',5,'voluptatum','2024-08-06 16:48:32','2024-08-06 16:48:32'),(23,'2024-04-04 08:30:35','2024-10-08 15:51:31',1,'laboriosam','2024-08-06 16:48:32','2024-08-06 16:48:32'),(24,'2024-07-27 12:23:14','2025-01-13 15:37:46',4,'molestiae','2024-08-06 16:48:32','2024-08-06 16:48:32'),(25,'2023-11-07 22:14:38','2024-10-17 15:59:26',2,'molestiae','2024-08-06 16:48:32','2024-08-06 16:48:32'),(26,'2024-05-30 23:30:22','2025-07-08 07:42:01',4,'qui','2024-08-06 16:48:32','2024-08-06 16:48:32'),(27,'2023-10-12 22:44:24','2024-08-14 18:42:51',10,'nostrum','2024-08-06 16:48:32','2024-08-06 16:48:32'),(28,'2023-11-07 02:31:29','2025-07-22 21:47:29',6,'doloremque','2024-08-06 16:48:32','2024-08-06 16:48:32'),(29,'2023-09-22 23:08:16','2025-01-11 13:44:18',3,'dolorem','2024-08-06 16:48:32','2024-08-06 16:48:32'),(30,'2023-09-07 10:58:44','2025-02-01 03:28:14',9,'illum','2024-08-06 16:48:32','2024-08-06 16:48:32'),(1000,'2024-06-13 15:32:59','2025-07-20 13:46:18',2,'aperiam','2024-08-06 16:48:32','2024-08-06 16:48:32');
/*!40000 ALTER TABLE `ues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dansoko','Fatima','fatishma121@gmail.com','2024-08-06 16:48:31','$2y$12$PF03qbuO0ceQfgU.UzHU/OOONBwT0THhA7duUCiMZo/zJRqW3Y3YK','CLIL4liiJ3','2024-08-06 16:48:32','2024-08-06 16:48:32');
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

-- Dump completed on 2024-08-07 12:37:46
