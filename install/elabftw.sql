-- MySQL dump 10.15  Distrib 10.0.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: elabftw2
-- ------------------------------------------------------
-- Server version	10.0.12-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40101 SET character_set_client = utf8 */;

--
-- Table structure for table `banned_users`
--

DROP TABLE IF EXISTS `banned_users`;
CREATE TABLE `banned_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ieuieuie` int(11) NOT NULL,
  `user_infos` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `conf_name` varchar(255) NOT NULL,
  `conf_value` text,
  PRIMARY KEY (`conf_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `experiments`
--

DROP TABLE IF EXISTS `experiments`;
CREATE TABLE `experiments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `body` text,
  `status` varchar(255) NOT NULL,
  `links` varchar(255) DEFAULT NULL,
  `userid` int(10) unsigned NOT NULL,
  `elabid` varchar(255) NOT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lockedby` int(10) unsigned DEFAULT NULL,
  `lockedwhen` timestamp NULL DEFAULT NULL,
  `timestamped` tinyint(1) NOT NULL DEFAULT '0',
  `timestampedby` int(11) DEFAULT NULL,
  `timestamptoken` text,
  `timestampedwhen` timestamp NULL,
  `visibility` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `experiments_comments`
--

DROP TABLE IF EXISTS `experiments_comments`;
CREATE TABLE `experiments_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `exp_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `experiments_links`
--

DROP TABLE IF EXISTS `experiments_links`;
CREATE TABLE `experiments_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `link_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `experiments_revisions`
--

DROP TABLE IF EXISTS `experiments_revisions`;
CREATE TABLE `experiments_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exp_id` int(10) unsigned NOT NULL,
  `body` text NOT NULL,
  `savedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `items_revisions`
--

DROP TABLE IF EXISTS `items_revisions`;
CREATE TABLE `items_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `body` text NOT NULL,
  `savedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `experiments_tags`
--

DROP TABLE IF EXISTS `experiments_tags`;
CREATE TABLE `experiments_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `experiments_templates`
--

DROP TABLE IF EXISTS `experiments_templates`;
CREATE TABLE `experiments_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team` int(10) unsigned DEFAULT NULL,
  `body` text,
  `name` varchar(255) NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` text NOT NULL,
  `is_sysadmin` tinyint(1) NOT NULL,
  `is_admin` text NOT NULL,
  `can_lock` text NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` int(10) unsigned NOT NULL,
  `body` text,
  `rating` tinyint(10) DEFAULT '0',
  `type` int(10) unsigned NOT NULL,
  `locked` tinyint(3) unsigned DEFAULT NULL,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `items_tags`
--

DROP TABLE IF EXISTS `items_tags`;
CREATE TABLE `items_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `items_types`
--

DROP TABLE IF EXISTS `items_types`;
CREATE TABLE `items_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team` int(10) unsigned NOT NULL,
  `name` text NOT NULL,
  `bgcolor` varchar(6) DEFAULT '000000',
  `template` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team` int(10) unsigned NOT NULL,
  `name` text NOT NULL,
  `color` varchar(6) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_name` text NOT NULL,
  `deletable_xp` tinyint(1) NOT NULL,
  `link_name` text NOT NULL,
  `link_href` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stamplogin` text,
  `stamppass` text,
  `stampprovider` text,
  `stampcert` text,
  `stamphash` varchar(45),
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `real_name` text NOT NULL,
  `long_name` text NOT NULL,
  `comment` text NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `userid` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md5` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `team` int(10) unsigned NOT NULL,
  `usergroup` int(10) unsigned NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(127) DEFAULT NULL,
  `cellphone` varchar(127) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `can_lock` int(1) NOT NULL DEFAULT '0',
  `register_date` bigint(20) unsigned NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `display` varchar(10) NOT NULL DEFAULT 'default',
  `order_by` varchar(255) NOT NULL DEFAULT 'date',
  `sort_by` varchar(4) NOT NULL DEFAULT 'desc',
  `limit_nb` tinyint(255) NOT NULL DEFAULT '15',
  `sc_create` varchar(1) NOT NULL DEFAULT 'c',
  `sc_edit` varchar(1) NOT NULL DEFAULT 'e',
  `sc_submit` varchar(1) NOT NULL DEFAULT 's',
  `sc_todo` varchar(1) NOT NULL DEFAULT 't',
  `close_warning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT 'en_GB',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ELABFTW
/* the default item_types */
INSERT INTO `items_types` (`team`, `id`, `name`, `bgcolor`, `template`) VALUES
(1, 1, 'Antibody', '31a700', '<p><strong>Host :</strong></p>\r\n<p><strong>Target :</strong></p>\r\n<p><strong>Dilution to use :</strong></p>\r\n<p>Don''t forget to add the datasheet !</p>'),
(1, 2, 'Plasmid', '29AEB9', '<p><strong>Concentration : </strong></p>\r\n<p><strong>Resistances : </strong></p>\r\n<p><strong>Backbone :</strong></p>\r\n<p><strong><br /></strong></p>'),
(1, 3, 'siRNA', '0064ff', '<p><strong>Sequence :</strong></p>\r\n<p><strong>Target :</strong></p>\r\n<p><strong>Concentration :</strong></p>\r\n<p><strong>Buffer :</strong></p>'),
(1, 4, 'Drugs', 'fd00fe', '<p><strong>Action :</strong> &nbsp;<strong> </strong></p>\r\n<p><strong>Concentration :</strong>&nbsp;</p>\r\n<p><strong>Use at :</strong>&nbsp;</p>\r\n<p><strong>Buffer :</strong> </p>'),
(1, 5, 'Crystal', '84ff00', '<p>Edit me</p>');

/* the default status */
INSERT INTO `status` (`team`, `id`, `name`, `color`, `is_default`) VALUES
(1, 1, 'Running', '0096ff', 1),
(1, 2, 'Success', '00ac00', 0),
(1, 3, 'Need to be redone', 'c0c0c0', 0),
(1, 4, 'Fail', 'ff0000', 0);

/* the default experiment template */
INSERT INTO `experiments_templates` (`team`, `body`, `name`, `userid`) VALUES
('1', '<p><span style=\"font-size: 14pt;\"><strong>Goal :</strong></span></p>
<p>&nbsp;</p>
<p><span style=\"font-size: 14pt;\"><strong>Procedure :</strong></span></p>
<p>&nbsp;</p>
<p><span style=\"font-size: 14pt;\"><strong>Results :</strong></span></p><p>&nbsp;</p>', 'default', 0);
/* the default team */
INSERT INTO `teams` (`team_id`, `team_name`, `deletable_xp`, `link_name`, `link_href`) VALUES
(1, 'Editme', 1, 'Wiki', 'https://github.com/elabftw/elabftw/wiki');
/* the groups */
INSERT INTO `groups` (`group_id`, `group_name`, `is_sysadmin`, `is_admin`, `can_lock`) VALUES
(1, 'Sysadmins', 1, 1, 0),
(2, 'Admins', 0, 1, 0),
(3, 'Chiefs', 0, 1, 1),
(4, 'Users', 0, 0, 0);
/* the config */
INSERT INTO `config` (`conf_name`, `conf_value`) VALUES
('admin_validate', '1'),
('ban_time', '60'),
('debug', '0'),
('lang', 'en_GB'),
('login_tries', '3'),
('proxy', ''),
('smtp_address', 'smtp.mandrillapp.com'),
('smtp_encryption', 'tls'),
('smtp_password', ''),
('smtp_port', '587'),
('smtp_username', ''),
('stamplogin', ''),
('stamppass', ''),
('stampshare', '1'),
('stampprovider', ''),
('stampcert', ''),
('stamphash', 'sha256');
