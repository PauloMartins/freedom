# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.10)
# Database: freedom
# Generation Time: 2013-08-19 02:05:06 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table album
# ------------------------------------------------------------

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_album_user1_idx` (`user_id`),
  CONSTRAINT `fk_album_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table album_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `album_item`;

CREATE TABLE `album_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(125) DEFAULT NULL,
  `type` varchar(125) DEFAULT NULL,
  `album_id` int(11) NOT NULL,
  `register` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_album1_idx` (`album_id`),
  KEY `fk_items_user1_idx` (`user_id`),
  CONSTRAINT `fk_items_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table alert
# ------------------------------------------------------------

DROP TABLE IF EXISTS `alert`;

CREATE TABLE `alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(555) NOT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alert_user1_idx` (`user_id`),
  CONSTRAINT `fk_alert_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table common_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `common_area`;

CREATE TABLE `common_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table discussion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `discussion`;

CREATE TABLE `discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `owner` int(11) NOT NULL,
  `discussion_type_id` int(11) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discussion_user1_idx` (`owner`),
  KEY `fk_discussion_discussion_type1_idx` (`discussion_type_id`),
  CONSTRAINT `fk_discussion_user1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_discussion_discussion_type1` FOREIGN KEY (`discussion_type_id`) REFERENCES `discussion_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table discussion_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `discussion_type`;

CREATE TABLE `discussion_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table discussion_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `discussion_user`;

CREATE TABLE `discussion_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discussion_user_user1_idx` (`user_id`),
  KEY `fk_discussion_user_discussion1_idx` (`discussion_id`),
  CONSTRAINT `fk_discussion_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_discussion_user_discussion1` FOREIGN KEY (`discussion_id`) REFERENCES `discussion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `file` varchar(125) DEFAULT NULL,
  `residential_id` int(11) NOT NULL,
  `content` text,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-New/1-Old',
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_residential1_idx` (`residential_id`),
  CONSTRAINT `fk_document_residential1` FOREIGN KEY (`residential_id`) REFERENCES `residential` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `date` datetime NOT NULL,
  `owner` int(11) NOT NULL,
  `register` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_user1_idx` (`owner`),
  CONSTRAINT `fk_event_user1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `register` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feedback_user1_idx` (`user_id`),
  CONSTRAINT `fk_feedback_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table guest_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guest_list`;

CREATE TABLE `guest_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_guest_list_reservation1_idx` (`reservation_id`),
  CONSTRAINT `fk_guest_list_reservation1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_user1_idx` (`user_id`),
  CONSTRAINT `fk_login_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `user_id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_user1_idx` (`user_id`),
  KEY `fk_message_discussion1_idx` (`discussion_id`),
  CONSTRAINT `fk_message_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_discussion1` FOREIGN KEY (`discussion_id`) REFERENCES `discussion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(125) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `delivered_at` datetime DEFAULT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_unit1_idx` (`unit_id`),
  CONSTRAINT `fk_order_unit1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table out
# ------------------------------------------------------------

DROP TABLE IF EXISTS `out`;

CREATE TABLE `out` (
  `unit_id` int(11) NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `register` datetime NOT NULL,
  UNIQUE KEY `unit_id_UNIQUE` (`unit_id`),
  KEY `fk_out_unit1_idx` (`unit_id`),
  CONSTRAINT `fk_out_unit1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table reservation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `common_area_id` int(11) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservation_common_area1_idx` (`common_area_id`),
  KEY `fk_reservation_user1_idx` (`user_id`),
  CONSTRAINT `fk_reservation_common_area1` FOREIGN KEY (`common_area_id`) REFERENCES `common_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table residential
# ------------------------------------------------------------

DROP TABLE IF EXISTS `residential`;

CREATE TABLE `residential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `address` varchar(125) NOT NULL,
  `city` varchar(125) NOT NULL,
  `state` varchar(2) NOT NULL,
  `country` varchar(125) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `residential` WRITE;
/*!40000 ALTER TABLE `residential` DISABLE KEYS */;

INSERT INTO `residential` (`id`, `name`, `address`, `city`, `state`, `country`, `register`)
VALUES
	(1,'Residencial Araruama','Rua Gabriel dos Santos, 60','São Paulo','SP','Brasil','2013-08-16 00:00:00');

/*!40000 ALTER TABLE `residential` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table unit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identification` varchar(125) NOT NULL,
  `presentation` varchar(125) NOT NULL,
  `residential_id` int(11) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_unit_residential1_idx` (`residential_id`),
  CONSTRAINT `fk_unit_residential1` FOREIGN KEY (`residential_id`) REFERENCES `residential` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;

INSERT INTO `unit` (`id`, `identification`, `presentation`, `residential_id`, `register`)
VALUES
	(1,'132','Apartamento',1,'2013-08-16 00:00:00');

/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(125) NOT NULL,
  `name` varchar(125) NOT NULL,
  `photo` varchar(125) DEFAULT NULL,
  `user_type_id` int(11) NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_unit_idx` (`unit_id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_user_unit` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `unit_id`, `username`, `password`, `name`, `photo`, `user_type_id`, `register`)
VALUES
	(1,1,'paulo.martins','$1$Jufqvm1e$U/tVw2PeV310t2inHp/MT0','Paulo Martins',NULL,1,'2013-08-16 00:00:00');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;

INSERT INTO `user_type` (`id`, `name`, `description`)
VALUES
	(1,'Morador',''),
	(2,'Síndico',''),
	(3,'Conselheiro',''),
	(4,'Zelador','');

/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
