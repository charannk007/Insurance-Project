-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: bangaram
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `barcode_setting`
--

use bangaram;
DROP TABLE IF EXISTS `barcode_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) DEFAULT NULL,
  `sub_total` double NOT NULL,
  `sgst_rate` double NOT NULL,
  `cgst_rate` double NOT NULL,
  `sgst_amount` double NOT NULL,
  `cgst_amount` double NOT NULL,
  `total_amount` double NOT NULL,
  `bill_type` varchar(255) DEFAULT NULL,
  `date_generated` timestamp NULL DEFAULT NULL,
  `generated_by_id` bigint DEFAULT NULL,
  `of_customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_generated_by_id` (`generated_by_id`),
  KEY `fk_bill_of_customer_id` (`of_customer_id`),
  CONSTRAINT `fk_bill_generated_by_id` FOREIGN KEY (`generated_by_id`) REFERENCES `jhi_user` (`id`),
  CONSTRAINT `fk_bill_of_customer_id` FOREIGN KEY (`of_customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_item`
--

DROP TABLE IF EXISTS `bill_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `particulars` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `hsn_code` varchar(255) DEFAULT NULL,
  `gross_weight` double NOT NULL,
  `wastage_in_grams` double NOT NULL,
  `net_weight` double NOT NULL,
  `making_charge_amount` double NOT NULL,
  `rate_per_gram` double NOT NULL,
  `amount` double NOT NULL,
  `discount` double DEFAULT NULL,
  `net_amount` double NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `of_bill_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_item_of_bill_id` (`of_bill_id`),
  CONSTRAINT `fk_bill_item_of_bill_id` FOREIGN KEY (`of_bill_id`) REFERENCES `bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `lend_description` varchar(255) DEFAULT NULL,
  `lend_date` timestamp NULL DEFAULT NULL,
  `sold` bit(1) DEFAULT NULL,
  `validated` bit(1) DEFAULT NULL,
  `barcode` longblob,
  `barcode_content_type` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `entered_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `supplied_by_id` bigint DEFAULT NULL,
  `stock_type_id` bigint DEFAULT NULL,
  `lend_to_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `item_type_by_rate_id` bigint DEFAULT NULL,
  `sale_box_id` bigint DEFAULT NULL,
  `sale_box_transaction_id` bigint DEFAULT NULL,
  `huid` varchar(32) DEFAULT NULL,
  `rfid_tag` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_item_entered_by_id` (`entered_by_id`),
  KEY `fk_item_updated_by_id` (`updated_by_id`),
  KEY `fk_item_category_id` (`category_id`),
  KEY `fk_item_supplied_by_id` (`supplied_by_id`),
  KEY `fk_item_stock_type_id` (`stock_type_id`),
  KEY `fk_item_lend_to_id` (`lend_to_id`),
  KEY `fk_item_location_id` (`location_id`),
  KEY `fk_item_item_type_by_rate_id` (`item_type_by_rate_id`),
  KEY `fk_item_sale_box_id` (`sale_box_id`),
  KEY `fk_item_sale_box_transaction_id` (`sale_box_transaction_id`),
  CONSTRAINT `fk_item_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_item_entered_by_id` FOREIGN KEY (`entered_by_id`) REFERENCES `jhi_user` (`id`),
  CONSTRAINT `fk_item_item_type_by_rate_id` FOREIGN KEY (`item_type_by_rate_id`) REFERENCES `rate` (`id`),
  CONSTRAINT `fk_item_lend_to_id` FOREIGN KEY (`lend_to_id`) REFERENCES `supplier` (`id`),
  CONSTRAINT `fk_item_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_item_sale_box_id` FOREIGN KEY (`sale_box_id`) REFERENCES `sale_box` (`id`),
  CONSTRAINT `fk_item_sale_box_transaction_id` FOREIGN KEY (`sale_box_transaction_id`) REFERENCES `sale_box_transaction` (`id`),
  CONSTRAINT `fk_item_stock_type_id` FOREIGN KEY (`stock_type_id`) REFERENCES `stock_type` (`id`),
  CONSTRAINT `fk_item_supplied_by_id` FOREIGN KEY (`supplied_by_id`) REFERENCES `supplier` (`id`),
  CONSTRAINT `fk_item_updated_by_id` FOREIGN KEY (`updated_by_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_archive`
--

DROP TABLE IF EXISTS `item_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_archive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `lend_date` timestamp NULL DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_bkp_feb_1_2021`
--

DROP TABLE IF EXISTS `item_bkp_feb_1_2021`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_bkp_feb_1_2021` (
  `id` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `item_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `lend_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `lend_date` timestamp NULL DEFAULT NULL,
  `sold` bit(1) DEFAULT NULL,
  `validated` bit(1) DEFAULT NULL,
  `barcode` longblob,
  `barcode_content_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `entered_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `supplied_by_id` bigint DEFAULT NULL,
  `stock_type_id` bigint DEFAULT NULL,
  `lend_to_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `item_type_by_rate_id` bigint DEFAULT NULL,
  `sale_box_id` bigint DEFAULT NULL,
  `sale_box_transaction_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_name`
--

DROP TABLE IF EXISTS `item_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_name` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_name_name_IDX` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jhi_authority`
--

DROP TABLE IF EXISTS `jhi_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jhi_persistent_audit_event`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jhi_persistent_audit_evt_data`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jhi_persistent_token`
--

DROP TABLE IF EXISTS `jhi_persistent_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_persistent_token` (
  `series` varchar(20) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `token_value` varchar(20) NOT NULL,
  `token_date` date DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`series`),
  KEY `fk_user_persistent_token` (`user_id`),
  CONSTRAINT `fk_user_persistent_token` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jhi_user`
--

DROP TABLE IF EXISTS `jhi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(6) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `idx_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`),
  UNIQUE KEY `idx_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jhi_user_authority`
--

DROP TABLE IF EXISTS `jhi_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user_authority` (
  `user_id` bigint NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `weight` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_setting`
--

DROP TABLE IF EXISTS `page_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bill_type` varchar(255) DEFAULT NULL,
  `page_width` int DEFAULT NULL,
  `page_height` int DEFAULT NULL,
  `margin_top` int DEFAULT NULL,
  `margin_right` int DEFAULT NULL,
  `margin_bottom` int DEFAULT NULL,
  `margin_left` int DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `include_tax` bit(1) DEFAULT NULL,
  `font_size` int DEFAULT NULL,
  `auto_print` bit(1) DEFAULT NULL,
  `orientation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jhi_type` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `of_bill_id` bigint DEFAULT NULL,
  `sale_entry_id` bigint DEFAULT NULL,
  `paid_date` timestamp NULL DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_of_bill_id` (`of_bill_id`),
  KEY `fk_payment_sale_entry_id_idx` (`sale_entry_id`),
  CONSTRAINT `fk_payment_of_bill_id` FOREIGN KEY (`of_bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_payment_sale_entry_id` FOREIGN KEY (`sale_entry_id`) REFERENCES `sale_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) DEFAULT NULL,
  `rate_per_gram` double NOT NULL,
  `wastage_percentage` double NOT NULL,
  `making_charges_per_gram` double NOT NULL,
  `jhi_date` timestamp NULL DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `hsn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_box`
--

DROP TABLE IF EXISTS `sale_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_box` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `begin_of_day` float DEFAULT NULL,
  `current_value` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_box_transaction`
--

DROP TABLE IF EXISTS `sale_box_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_box_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jhi_add` float NOT NULL,
  `remove` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `jhi_date` timestamp NULL DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `sale_box_id` bigint DEFAULT NULL,
  `sale_entry_id` bigint DEFAULT NULL,
  `rate_id` bigint DEFAULT NULL,
  `wastage` float DEFAULT '0',
  `making_charges` float DEFAULT '0',
  `total` float DEFAULT '0',
  `huid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_box_transaction_user_id` (`user_id`),
  KEY `fk_sale_box_transaction_sale_box_id` (`sale_box_id`),
  KEY `fk_sale_box_transaction_sale_entry_id` (`sale_entry_id`),
  KEY `fk_sale_box_transaction_rate_id` (`rate_id`),
  CONSTRAINT `fk_sale_box_transaction_rate_id` FOREIGN KEY (`rate_id`) REFERENCES `rate` (`id`),
  CONSTRAINT `fk_sale_box_transaction_sale_box_id` FOREIGN KEY (`sale_box_id`) REFERENCES `sale_box` (`id`),
  CONSTRAINT `fk_sale_box_transaction_sale_entry_id` FOREIGN KEY (`sale_entry_id`) REFERENCES `sale_entry` (`id`),
  CONSTRAINT `fk_sale_box_transaction_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_entry`
--

DROP TABLE IF EXISTS `sale_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jhi_value` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `freezed` bit(1) DEFAULT NULL,
  `sale_date` timestamp NULL DEFAULT NULL,
  `name_id` bigint DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `gold` double DEFAULT NULL,
  `old_gold` double DEFAULT NULL,
  `old_silver` double DEFAULT NULL,
  `silver` double DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `discount` float DEFAULT '0',
  `sgst_amount` float DEFAULT '0',
  `cgst_amount` float DEFAULT '0',
  `gst_percentage` float DEFAULT '0',
  `net_amount` float DEFAULT '0',
  `invoice_id` bigint DEFAULT NULL,
  `bill_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_entry_name_id` (`name_id`),
  KEY `fk_sale_entry_customer_id_idx` (`customer_id`),
  CONSTRAINT `fk_sale_entry_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_sale_entry_name_id` FOREIGN KEY (`name_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gstin` varchar(15) NOT NULL,
  `pan_number` varchar(10) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` int DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_type`
--

DROP TABLE IF EXISTS `stock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `remove` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_information`
--

DROP TABLE IF EXISTS `tax_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_information` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sgst_rate` double NOT NULL,
  `cgst_rate` double NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `jhi_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 15:00:39
