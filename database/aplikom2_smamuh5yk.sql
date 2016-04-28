/*
SQLyog Ultimate v11.5 (64 bit)
MySQL - 5.6.24 : Database - _kampus_db_aplikom2_smamuh5yk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `ommu_core_author_contact` */

CREATE TABLE `ommu_core_author_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `type` tinyint(3) NOT NULL COMMENT '1=Mobile, 2=Blackberry Messenger, 3=Google Talk, 4=Yahoo! Messenger, 5=Windows Live Messenger, 6=Skype, 7=WhatsApp, 8=Telegram, 10=Google Plus 11=Twitter, 12=Facebook',
  `contact` varchar(64) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `modified_date` datetime NOT NULL COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `ommu_core_author_contact_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `ommu_core_authors` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_authors` */

CREATE TABLE `ommu_core_authors` (
  `author_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_languages` */

CREATE TABLE `ommu_core_languages` (
  `language_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `actived` tinyint(1) NOT NULL DEFAULT '0',
  `defaults` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(6) NOT NULL,
  `orders` tinyint(3) NOT NULL,
  `name` varchar(32) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_locale` */

CREATE TABLE `ommu_core_locale` (
  `locale_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `defaults` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(16) NOT NULL,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`locale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_menu` */

CREATE TABLE `ommu_core_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `cat_id` smallint(5) unsigned NOT NULL,
  `dependency` int(11) NOT NULL DEFAULT '0',
  `orders` smallint(5) NOT NULL,
  `name` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `url` varchar(128) NOT NULL,
  `attr` varchar(128) NOT NULL DEFAULT '-',
  `sitetype_access` varchar(32) NOT NULL DEFAULT '0,1',
  `userlevel_access` varchar(32) NOT NULL DEFAULT '1,2',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `ommu_core_menu_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `ommu_core_menu_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_menu_category` */

CREATE TABLE `ommu_core_menu_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `name` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `desc` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_meta` */

CREATE TABLE `ommu_core_meta` (
  `id` tinyint(1) NOT NULL,
  `meta_image` varchar(64) NOT NULL,
  `office_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=disable, 1=enable',
  `office_name` varchar(64) NOT NULL,
  `office_location` varchar(32) NOT NULL,
  `office_place` text NOT NULL,
  `office_country` smallint(5) unsigned NOT NULL,
  `office_province` smallint(5) unsigned NOT NULL,
  `office_city` int(11) unsigned NOT NULL,
  `office_district` varchar(32) NOT NULL,
  `office_village` varchar(32) NOT NULL,
  `office_zipcode` varchar(6) NOT NULL,
  `office_hour` text NOT NULL,
  `office_phone` varchar(32) NOT NULL,
  `office_fax` varchar(32) NOT NULL,
  `office_email` varchar(32) NOT NULL,
  `office_hotline` varchar(32) NOT NULL,
  `office_website` varchar(32) NOT NULL,
  `map_icons` varchar(32) NOT NULL,
  `map_icon_width` smallint(2) NOT NULL,
  `map_icon_height` smallint(2) NOT NULL,
  `google_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=disable, 1=enable',
  `twitter_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=disable, 1=enable',
  `twitter_card` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=summary, 2=summary_large_image, 3=photo,4=app',
  `twitter_site` varchar(32) NOT NULL,
  `twitter_creator` varchar(32) NOT NULL,
  `twitter_photo_width` varchar(3) NOT NULL,
  `twitter_photo_height` varchar(3) NOT NULL,
  `twitter_iphone_id` varchar(32) NOT NULL,
  `twitter_iphone_url` varchar(256) NOT NULL,
  `twitter_ipad_name` varchar(32) NOT NULL,
  `twitter_ipad_url` varchar(256) NOT NULL,
  `twitter_googleplay_id` varchar(32) NOT NULL,
  `twitter_googleplay_url` varchar(256) NOT NULL,
  `facebook_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=disable, 1=enable',
  `facebook_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=profile, 2=website',
  `facebook_profile_firstname` varchar(32) NOT NULL,
  `facebook_profile_lastname` varchar(32) NOT NULL,
  `facebook_profile_username` varchar(32) NOT NULL,
  `facebook_sitename` varchar(32) NOT NULL,
  `facebook_see_also` varchar(256) NOT NULL,
  `facebook_admins` varchar(32) NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_pages` */

CREATE TABLE `ommu_core_pages` (
  `page_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `name` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `desc` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `quote` int(11) NOT NULL COMMENT 'trigger[delete]',
  `media` text NOT NULL,
  `media_show` tinyint(1) NOT NULL DEFAULT '0',
  `media_type` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_plugin_phrase` */

CREATE TABLE `ommu_core_plugin_phrase` (
  `phrase_id` int(11) unsigned NOT NULL,
  `plugin_id` smallint(5) unsigned NOT NULL,
  `location` varchar(32) DEFAULT NULL,
  `en_us` text NOT NULL,
  `id` text NOT NULL,
  PRIMARY KEY (`phrase_id`),
  KEY `FK_ommu_core_plugin_phrase` (`plugin_id`),
  CONSTRAINT `FK_ommu_core_plugin_phrase` FOREIGN KEY (`plugin_id`) REFERENCES `ommu_core_plugins` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_plugins` */

CREATE TABLE `ommu_core_plugins` (
  `plugin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `defaults` tinyint(1) NOT NULL DEFAULT '0',
  `install` tinyint(1) NOT NULL DEFAULT '0',
  `actived` tinyint(1) NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '0',
  `orders` tinyint(3) NOT NULL,
  `folder` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_settings` */

CREATE TABLE `ommu_core_settings` (
  `id` tinyint(1) unsigned NOT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done | 0=undercontruction, 1=online',
  `site_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done | 0=company profile, 1=community',
  `site_admin` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done | 0=admin disable, 1=admin enable',
  `site_email` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done | 0=localhot,1=server',
  `site_headline` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `site_url` varchar(32) NOT NULL COMMENT 'done |',
  `site_title` varchar(256) NOT NULL COMMENT 'done |',
  `site_keywords` varchar(256) NOT NULL COMMENT 'done |',
  `site_description` varchar(256) NOT NULL COMMENT 'done |',
  `site_creation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'done |',
  `site_dateformat` varchar(8) NOT NULL,
  `site_timeformat` varchar(8) NOT NULL,
  `construction_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'done |',
  `construction_text` text NOT NULL COMMENT 'done |',
  `event_startdate` date NOT NULL,
  `event_finishdate` date NOT NULL,
  `event_tag` text NOT NULL,
  `signup_username` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_approve` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_verifyemail` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_photo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_welcome` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_random` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_terms` tinyint(1) NOT NULL DEFAULT '1',
  `signup_invitepage` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_inviteonly` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_checkemail` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `signup_numgiven` tinyint(3) NOT NULL DEFAULT '5' COMMENT 'done |',
  `signup_adminemail` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `general_profile` tinyint(1) NOT NULL DEFAULT '1',
  `general_invite` tinyint(1) NOT NULL DEFAULT '1',
  `general_search` tinyint(1) NOT NULL DEFAULT '1',
  `general_portal` tinyint(1) NOT NULL DEFAULT '1',
  `general_include` text COMMENT 'done |',
  `general_commenthtml` varchar(256) NOT NULL,
  `lang_allow` tinyint(1) NOT NULL DEFAULT '1',
  `lang_autodetect` tinyint(1) NOT NULL DEFAULT '1',
  `lang_anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `banned_ips` text,
  `banned_emails` text,
  `banned_usernames` text,
  `banned_words` text,
  `spam_comment` tinyint(1) NOT NULL DEFAULT '1',
  `spam_contact` tinyint(1) NOT NULL DEFAULT '1',
  `spam_invite` tinyint(1) NOT NULL DEFAULT '1',
  `spam_login` tinyint(1) NOT NULL DEFAULT '1',
  `spam_failedcount` tinyint(2) NOT NULL DEFAULT '10',
  `spam_signup` tinyint(1) NOT NULL DEFAULT '1',
  `analytic` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'done |',
  `analytic_id` varchar(32) NOT NULL COMMENT 'done |',
  `license_email` varchar(32) NOT NULL,
  `license_key` varchar(32) NOT NULL COMMENT 'done |',
  `ommu_version` varchar(8) NOT NULL COMMENT 'done |',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_statistic_data` */

CREATE TABLE `ommu_core_statistic_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `content_id` int(11) unsigned NOT NULL,
  `flag` smallint(5) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_statistic_total` */

CREATE TABLE `ommu_core_statistic_total` (
  `statistic_key` varchar(32) NOT NULL,
  `total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'trigger',
  `flag` smallint(5) NOT NULL,
  `note` varchar(64) NOT NULL,
  PRIMARY KEY (`statistic_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_statistics` */

CREATE TABLE `ommu_core_statistics` (
  `date_key` date NOT NULL COMMENT 'trigger',
  PRIMARY KEY (`date_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_system_phrase` */

CREATE TABLE `ommu_core_system_phrase` (
  `phrase_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(32) NOT NULL,
  `en_us` text NOT NULL,
  `id` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1539 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_tags` */

CREATE TABLE `ommu_core_tags` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `body` varchar(32) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_template` */

CREATE TABLE `ommu_core_template` (
  `template_key` varchar(32) NOT NULL,
  `plugin_id` smallint(5) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `template` text NOT NULL,
  `variable` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`template_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_themes` */

CREATE TABLE `ommu_core_themes` (
  `theme_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_page` enum('admin','public','underconstruction','maintenance') NOT NULL,
  `default_theme` tinyint(1) NOT NULL DEFAULT '0',
  `folder` varchar(32) NOT NULL,
  `layout` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `thumbnail` varchar(32) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creation_id` int(11) unsigned NOT NULL COMMENT 'trigger',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_id` int(11) unsigned NOT NULL COMMENT 'trigger',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_timezone` */

CREATE TABLE `ommu_core_timezone` (
  `timezone_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `defaults` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`timezone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_wall_comment` */

CREATE TABLE `ommu_core_wall_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `wall_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `comment` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  PRIMARY KEY (`comment_id`),
  KEY `wall_id` (`wall_id`),
  CONSTRAINT `ommu_core_wall_comment_ibfk_1` FOREIGN KEY (`wall_id`) REFERENCES `ommu_core_walls` (`wall_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_wall_likes` */

CREATE TABLE `ommu_core_wall_likes` (
  `like_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wall_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `likes_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `likes_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `wall_id` (`wall_id`),
  CONSTRAINT `ommu_core_wall_likes_ibfk_1` FOREIGN KEY (`wall_id`) REFERENCES `ommu_core_walls` (`wall_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_wall_user` */

CREATE TABLE `ommu_core_wall_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=unread, 1=read',
  `wall_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `wall_id` (`wall_id`),
  CONSTRAINT `ommu_core_wall_user_ibfk_1` FOREIGN KEY (`wall_id`) REFERENCES `ommu_core_walls` (`wall_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_walls` */

CREATE TABLE `ommu_core_walls` (
  `wall_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) unsigned NOT NULL,
  `wall_media` text NOT NULL,
  `wall_status` text NOT NULL,
  `comments` int(11) unsigned NOT NULL COMMENT 'trigger',
  `likes` int(11) unsigned NOT NULL COMMENT 'trigger',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  PRIMARY KEY (`wall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_zone_city` */

CREATE TABLE `ommu_core_zone_city` (
  `city_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `province_id` smallint(5) unsigned NOT NULL,
  `city` varchar(64) NOT NULL,
  `mfdonline` char(4) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `FK_province` (`province_id`),
  CONSTRAINT `FK_ommu_core_zone_city` FOREIGN KEY (`province_id`) REFERENCES `ommu_core_zone_province` (`province_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_zone_country` */

CREATE TABLE `ommu_core_zone_country` (
  `country_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(64) NOT NULL,
  `code` char(2) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_zone_districts` */

CREATE TABLE `ommu_core_zone_districts` (
  `district_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `city_id` int(11) unsigned NOT NULL,
  `district_name` varchar(64) NOT NULL,
  `mfdonline` char(7) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`district_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `ommu_core_zone_districts_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `ommu_core_zone_city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6880 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_zone_province` */

CREATE TABLE `ommu_core_zone_province` (
  `province_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` smallint(5) unsigned NOT NULL DEFAULT '72',
  `province` varchar(64) NOT NULL,
  `mfdonline` char(2) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`province_id`),
  KEY `FK_ommu_core_zone_province` (`country_id`),
  CONSTRAINT `FK_ommu_core_zone_province` FOREIGN KEY (`country_id`) REFERENCES `ommu_core_zone_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_core_zone_village` */

CREATE TABLE `ommu_core_zone_village` (
  `village_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `district_id` int(11) unsigned NOT NULL,
  `village_name` varchar(64) NOT NULL,
  `zipcode` char(5) NOT NULL,
  `mfdonline` char(10) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`village_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `ommu_core_zone_village_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `ommu_core_zone_districts` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79698 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_psb_courses` */

CREATE TABLE `ommu_psb_courses` (
  `course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `course_name` varchar(32) NOT NULL,
  `course_desc` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf32;

/*Table structure for table `ommu_psb_registers` */

CREATE TABLE `ommu_psb_registers` (
  `register_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=standard,1=checked,2=approve,3=rejected',
  `nisn` varchar(12) NOT NULL,
  `batch_id` int(11) unsigned NOT NULL,
  `register_name` varchar(32) NOT NULL,
  `birth_city` int(11) unsigned NOT NULL,
  `birth_date` date NOT NULL DEFAULT '0000-00-00',
  `gender` enum('male','female') NOT NULL,
  `religion` tinyint(1) unsigned NOT NULL,
  `address` text NOT NULL,
  `register_phone` varchar(15) NOT NULL,
  `parent_phone` varchar(15) NOT NULL,
  `register_request` enum('ipa','ips') NOT NULL,
  `school_id` int(11) unsigned NOT NULL,
  `school_un_rank` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`register_id`),
  KEY `batch_id` (`batch_id`),
  KEY `school_id` (`school_id`),
  KEY `religion` (`religion`),
  CONSTRAINT `ommu_psb_registers_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `ommu_psb_year_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ommu_psb_registers_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `ommu_psb_schools` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ommu_psb_registers_ibfk_4` FOREIGN KEY (`religion`) REFERENCES `ommu_psb_religions` (`religion_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

/*Table structure for table `ommu_psb_religions` */

CREATE TABLE `ommu_psb_religions` (
  `religion_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `religion_name` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`religion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_psb_schools` */

CREATE TABLE `ommu_psb_schools` (
  `school_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `school_name` varchar(64) NOT NULL,
  `school_address` text NOT NULL,
  `school_phone` varchar(15) NOT NULL,
  `school_status` tinyint(1) NOT NULL COMMENT '1=negeri, 0=swasta',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

/*Table structure for table `ommu_psb_year_batch` */

CREATE TABLE `ommu_psb_year_batch` (
  `batch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `year_id` int(11) unsigned NOT NULL,
  `batch_name` varchar(32) NOT NULL,
  `batch_start` date NOT NULL,
  `batch_finish` date NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `year_id` (`year_id`),
  CONSTRAINT `ommu_psb_year_batch_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `ommu_psb_years` (`year_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf32;

/*Table structure for table `ommu_psb_year_course` */

CREATE TABLE `ommu_psb_year_course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `year_id` int(11) unsigned NOT NULL,
  `course_id` int(11) unsigned NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year_id` (`year_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `ommu_psb_year_course_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `ommu_psb_years` (`year_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ommu_psb_year_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `ommu_psb_courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf32;

/*Table structure for table `ommu_psb_years` */

CREATE TABLE `ommu_psb_years` (
  `year_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `years` varchar(9) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32;

/*Table structure for table `ommu_report_category` */

CREATE TABLE `ommu_report_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `dependency` smallint(5) NOT NULL DEFAULT '0',
  `orders` tinyint(3) NOT NULL,
  `name` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `desc` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_report_statistic_data` */

CREATE TABLE `ommu_report_statistic_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `report_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(5) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_report_statistic_total` */

CREATE TABLE `ommu_report_statistic_total` (
  `statistic_key` varchar(32) NOT NULL,
  `total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'trigger',
  `flag` smallint(5) NOT NULL,
  `note` varchar(64) NOT NULL,
  PRIMARY KEY (`statistic_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_report_statistics` */

CREATE TABLE `ommu_report_statistics` (
  `date_key` date NOT NULL COMMENT 'trigger',
  `report_add` int(11) unsigned NOT NULL DEFAULT '0',
  `report_resolved` int(11) unsigned NOT NULL DEFAULT '0',
  `report_delete` int(11) unsigned NOT NULL DEFAULT '0',
  `report_unresolved` int(11) unsigned NOT NULL DEFAULT '0',
  `category_insert` int(11) unsigned NOT NULL DEFAULT '0',
  `category_update` int(11) unsigned NOT NULL DEFAULT '0',
  `category_delete` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_reports` */

CREATE TABLE `ommu_reports` (
  `report_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `report_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `report_ip` varchar(20) NOT NULL,
  `resolved_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `resolved_id` int(11) unsigned NOT NULL,
  `unresolved_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `unresolved_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `FK_ommu_reports` (`cat_id`),
  CONSTRAINT `FK_ommu_reports` FOREIGN KEY (`cat_id`) REFERENCES `ommu_report_category` (`cat_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_contact_category` */

CREATE TABLE `ommu_support_contact_category` (
  `cat_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `orders` tinyint(1) NOT NULL,
  `icons` varchar(32) NOT NULL,
  `name` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_contacts` */

CREATE TABLE `ommu_support_contacts` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `cat_id` tinyint(3) unsigned NOT NULL,
  `value` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ommu_support_contacts` (`cat_id`),
  CONSTRAINT `FK_ommu_support_contacts` FOREIGN KEY (`cat_id`) REFERENCES `ommu_support_contact_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_mail_setting` */

CREATE TABLE `ommu_support_mail_setting` (
  `id` tinyint(1) unsigned NOT NULL,
  `mail_contact` varchar(32) NOT NULL COMMENT 'done |',
  `mail_name` varchar(32) NOT NULL COMMENT 'done |',
  `mail_from` varchar(32) NOT NULL COMMENT 'done |',
  `mail_count` smallint(5) NOT NULL DEFAULT '0',
  `mail_queueing` tinyint(1) NOT NULL DEFAULT '1',
  `mail_smtp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'done |',
  `smtp_address` varchar(32) NOT NULL COMMENT 'done |',
  `smtp_port` varchar(16) NOT NULL DEFAULT '25' COMMENT 'done |',
  `smtp_authentication` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'done |',
  `smtp_username` varchar(32) NOT NULL COMMENT 'done |',
  `smtp_password` varchar(32) NOT NULL COMMENT 'done |',
  `smtp_ssl` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'done |',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_mails` */

CREATE TABLE `ommu_support_mails` (
  `mail_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'trigger[insert]',
  `reply` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(32) NOT NULL,
  `displayname` varchar(32) NOT NULL COMMENT 'trigger[insert]',
  `phone` varchar(15) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `message` text NOT NULL,
  `message_reply` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `reply_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_statistic_data` */

CREATE TABLE `ommu_support_statistic_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `content_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(5) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_statistic_total` */

CREATE TABLE `ommu_support_statistic_total` (
  `statistic_key` varchar(32) NOT NULL,
  `total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'trigger',
  `flag` smallint(5) NOT NULL,
  `note` varchar(64) NOT NULL,
  PRIMARY KEY (`statistic_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_statistics` */

CREATE TABLE `ommu_support_statistics` (
  `date_key` date NOT NULL COMMENT 'trigger',
  `guest_message` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message` int(11) unsigned NOT NULL DEFAULT '0',
  `guest_message_reply` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message_reply` int(11) unsigned NOT NULL DEFAULT '0',
  `contact_category_insert` int(11) unsigned NOT NULL DEFAULT '0',
  `contact_category_update` int(11) unsigned NOT NULL DEFAULT '0',
  `contact_category_delete` int(11) unsigned NOT NULL DEFAULT '0',
  `contacts_insert` int(11) unsigned NOT NULL DEFAULT '0',
  `contacts_update` int(11) unsigned NOT NULL DEFAULT '0',
  `contacts_delete` int(11) unsigned NOT NULL DEFAULT '0',
  `mail_setting_update` int(11) unsigned NOT NULL DEFAULT '0',
  `widget_insert` int(11) unsigned NOT NULL DEFAULT '0',
  `widget_update` int(11) unsigned NOT NULL DEFAULT '0',
  `widget_delete` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_support_widget` */

CREATE TABLE `ommu_support_widget` (
  `widget_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `cat_id` tinyint(3) unsigned NOT NULL,
  `widget_source` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`widget_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `ommu_support_widget_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `ommu_support_contact_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_device` */

CREATE TABLE `ommu_user_device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `android_id` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `generate_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `unpublish_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_forgot` */

CREATE TABLE `ommu_user_forgot` (
  `forgot_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `code` varchar(64) NOT NULL,
  `forgot_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `forgot_ip` varchar(32) NOT NULL,
  `forgot_from` varchar(32) NOT NULL,
  PRIMARY KEY (`forgot_id`),
  KEY `FK_ommu_user_forgot` (`user_id`),
  CONSTRAINT `ommu_user_forgot_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ommu_user_oauth` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_history_forgot` */

CREATE TABLE `ommu_user_history_forgot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `forgot_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `forgot_ip` varchar(32) NOT NULL,
  `forgot_from` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_history_login` */

CREATE TABLE `ommu_user_history_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `user_id` int(11) unsigned NOT NULL,
  `lastlogin_date` datetime NOT NULL,
  `lastlogin_ip` varchar(32) NOT NULL,
  `lastlogin_from` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_history_password` */

CREATE TABLE `ommu_user_history_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `user_id` int(11) unsigned NOT NULL,
  `password` varchar(32) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_from` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_invite_queue` */

CREATE TABLE `ommu_user_invite_queue` (
  `queue_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL DEFAULT '0',
  `reference_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(32) NOT NULL,
  `invite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=user, 1=admin',
  `inviters` int(11) unsigned NOT NULL COMMENT 'trigger',
  PRIMARY KEY (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_invites` */

CREATE TABLE `ommu_user_invites` (
  `invite_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `code` varchar(16) NOT NULL,
  `invite_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `invite_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`invite_id`),
  KEY `queue_id` (`queue_id`),
  CONSTRAINT `ommu_user_invites_ibfk_1` FOREIGN KEY (`queue_id`) REFERENCES `ommu_user_invite_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_newsletter` */

CREATE TABLE `ommu_user_newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'trigger',
  `email` varchar(32) NOT NULL,
  `subscribe` tinyint(1) NOT NULL DEFAULT '1',
  `subscribe_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `unsubscribe_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `unsubscribe_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_newsletter_history` */

CREATE TABLE `ommu_user_newsletter_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `newsletter_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `newsletter_id` (`newsletter_id`),
  CONSTRAINT `ommu_user_newsletter_history_ibfk_1` FOREIGN KEY (`newsletter_id`) REFERENCES `ommu_user_newsletter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_oauth` */

CREATE TABLE `ommu_user_oauth` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` tinyint(2) unsigned NOT NULL,
  `profile_id` tinyint(2) unsigned NOT NULL,
  `language_id` tinyint(3) unsigned NOT NULL COMMENT 'trigger[isert]',
  `salt` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `displayname` varchar(64) NOT NULL COMMENT 'trigger[insert]',
  `photos` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=null, 1=enable, 2=blocked',
  `verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unverified, 1=verified',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_ip` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_id` int(11) unsigned NOT NULL,
  `lastlogin_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogin_ip` varchar(20) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_ip` varchar(20) NOT NULL,
  `locale_id` smallint(6) DEFAULT NULL COMMENT 'trigger[insert]',
  `timezone_id` smallint(6) DEFAULT NULL COMMENT 'trigger[insert]',
  PRIMARY KEY (`user_id`),
  KEY `FK_ommu_user_language` (`language_id`),
  KEY `FK_ommu_user_level` (`level_id`),
  CONSTRAINT `ommu_user_oauth_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `ommu_user_oauth_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_oauth_level` */

CREATE TABLE `ommu_user_oauth_level` (
  `level_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `desc` int(11) unsigned NOT NULL COMMENT 'trigger[delete]',
  `defaults` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `creation_id` int(11) unsigned NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'trigger',
  `modified_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_statistic_data` */

CREATE TABLE `ommu_user_statistic_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'trigger',
  `content_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(5) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_statistic_total` */

CREATE TABLE `ommu_user_statistic_total` (
  `statistic_key` varchar(32) NOT NULL,
  `total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'trigger',
  `flag` smallint(5) NOT NULL,
  `note` varchar(64) NOT NULL,
  PRIMARY KEY (`statistic_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ommu_user_statistics` */

CREATE TABLE `ommu_user_statistics` (
  `date_key` date NOT NULL COMMENT 'trigger',
  `level_insert` int(11) unsigned NOT NULL DEFAULT '0',
  `level_update` int(11) unsigned NOT NULL DEFAULT '0',
  `level_delete` int(11) unsigned NOT NULL DEFAULT '0',
  `signup_success` int(11) unsigned NOT NULL DEFAULT '0',
  `signup_invite_success` int(11) unsigned NOT NULL DEFAULT '0',
  `signup_newsletter_success` int(11) unsigned NOT NULL DEFAULT '0',
  `user_update_info` int(11) unsigned NOT NULL DEFAULT '0',
  `guest_subscribe` int(11) unsigned NOT NULL DEFAULT '0',
  `user_subscribe` int(11) unsigned NOT NULL DEFAULT '0',
  `guest_unsubscribe` int(11) unsigned NOT NULL DEFAULT '0',
  `user_unsubscribe` int(11) unsigned NOT NULL DEFAULT '0',
  `verify_email_request` int(11) unsigned NOT NULL DEFAULT '0',
  `verify_email_success` int(11) unsigned NOT NULL DEFAULT '0',
  `verify_email_expired` int(11) unsigned NOT NULL DEFAULT '0',
  `invite_new_send` int(11) unsigned NOT NULL DEFAULT '0',
  `invite_all_send` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_block_user` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_unblock_user` int(11) unsigned NOT NULL DEFAULT '0',
  `login_admin` int(11) unsigned NOT NULL DEFAULT '0',
  `login_user` int(11) unsigned NOT NULL DEFAULT '0',
  `forgot_password_request` int(11) unsigned NOT NULL DEFAULT '0',
  `forgot_password_success` int(11) unsigned NOT NULL DEFAULT '0',
  `forgot_password_expired` int(11) unsigned NOT NULL DEFAULT '0',
  `signup_from_public` int(11) unsigned NOT NULL DEFAULT '0',
  `signup_from_admin` int(11) unsigned NOT NULL DEFAULT '0',
  `user_update_password` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ommu_user_verify` */

CREATE TABLE `ommu_user_verify` (
  `verify_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `code` varchar(64) NOT NULL,
  `verify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'trigger',
  `verify_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`verify_id`),
  KEY `FK_ommu_user_verify` (`user_id`),
  CONSTRAINT `ommu_user_verify_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ommu_user_oauth` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Trigger structure for table `ommu_core_author_contact` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateAuthorContact` BEFORE UPDATE ON `ommu_core_author_contact` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_authors` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateAuthors` BEFORE UPDATE ON `ommu_core_authors` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_languages` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateLanguage` BEFORE UPDATE ON `ommu_core_languages` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_menu` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateMenu` BEFORE UPDATE ON `ommu_core_menu` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_menu` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterDeleteMenu` AFTER DELETE ON `ommu_core_menu` FOR EACH ROW BEGIN
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.name;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_menu_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateMenuCategory` BEFORE UPDATE ON `ommu_core_menu_category` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_menu_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterDeleteMenuCategory` AFTER DELETE ON `ommu_core_menu_category` FOR EACH ROW BEGIN
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.name;
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.desc;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_meta` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateMeta` BEFORE UPDATE ON `ommu_core_meta` FOR EACH ROW BEGIN
	DECLARE province_id_tr SMALLINT;
	DECLARE country_id_tr SMALLINT;
	
	IF (NEW.office_city <> OLD.office_city) THEN
		CALL getOmmuZoneProvinceId(NEW.office_city, province_id_tr);
		IF (province_id_tr IS NOT NULL) THEN
			SET NEW.office_province = province_id_tr;
		END IF;	
		
		CALL getOmmuZoneCountryId(NEW.office_province, country_id_tr);
		IF (country_id_tr IS NOT NULL) THEN
			SET NEW.office_country = country_id_tr;
		END IF;
	END IF;
	
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_pages` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeInsertPages` BEFORE INSERT ON `ommu_core_pages` FOR EACH ROW BEGIN
	SET NEW.creation_id = NEW.user_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_pages` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdatePages` BEFORE UPDATE ON `ommu_core_pages` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_pages` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterDeletePages` AFTER DELETE ON `ommu_core_pages` FOR EACH ROW BEGIN
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.name;
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.desc;
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.quote;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_plugins` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterInsertPlugins` AFTER INSERT ON `ommu_core_plugins` FOR EACH ROW BEGIN
	/*
	DECLARE phrase_id_tr INT;
	SELECT `phrase_id` INTO phrase_id_tr FROM `ommu_core_plugin_phrase` WHERE `phrase_id`=NEW.code;
	IF (phrase_id_tr IS NULL) THEN
		INSERT `ommu_core_plugin_phrase` (`phrase_id`, `plugin_id`, `en`)
		VALUE (NEW.code, NEW.plugin_id, NEW.name);
	END IF;
	*/
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_plugins` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdatePlugins` BEFORE UPDATE ON `ommu_core_plugins` FOR EACH ROW BEGIN
	/*
	DECLARE phrase_id_tr INT;
	SELECT `phrase_id` INTO phrase_id_tr FROM `ommu_core_plugin_phrase` WHERE `phrase_id`=NEW.code;
	IF (phrase_id_tr IS NULL) THEN
		INSERT `ommu_core_plugin_phrase` (`phrase_id`, `plugin_id`, `en`)
		VALUE (NEW.code, NEW.plugin_id, NEW.name);
	END IF;
	*/
	
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_settings` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateSettings` BEFORE UPDATE ON `ommu_core_settings` FOR EACH ROW BEGIN
	IF ((NEW.site_type <> OLD.site_type) AND (NEW.site_type = 0)) THEN
		SET NEW.signup_username = 0;
		SET NEW.signup_approve = 1;
		SET NEW.signup_photo = 0;
		SET NEW.signup_welcome = 0;
		SET NEW.signup_terms = 0;
		SET NEW.signup_invitepage = 0;
		SET NEW.signup_inviteonly = 0;
		SET NEW.signup_checkemail = 0;
		SET NEW.spam_signup = 0;
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_system_phrase` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateSystemPhrase` BEFORE UPDATE ON `ommu_core_system_phrase` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_tags` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateTags` BEFORE UPDATE ON `ommu_core_tags` FOR EACH ROW BEGIN
	IF (NEW.body <> OLD.body) THEN
		SET NEW.modified_date = NOW();
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_template` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeInsertTemplate` BEFORE INSERT ON `ommu_core_template` FOR EACH ROW BEGIN
	SET NEW.creation_id = NEW.user_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_template` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateTemplate` BEFORE UPDATE ON `ommu_core_template` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_themes` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateThemes` BEFORE UPDATE ON `ommu_core_themes` FOR EACH ROW BEGIN	
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_wall_comment` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterInsertWallComment` AFTER INSERT ON `ommu_core_wall_comment` FOR EACH ROW BEGIN	
	DECLARE user_id_tr INT;
	
	IF (NEW.parent_id = 0) THEN
		UPDATE `ommu_core_walls` SET `comments`=(`comments` + 1) WHERE `wall_id`=NEW.wall_id;
	END IF;
	
	SELECT `user_id` INTO user_id_tr FROM `ommu_core_wall_user` WHERE `wall_id`=NEW.wall_id AND `user_id`=NEW.user_id;
	IF (user_id_tr IS NULL) THEN
		INSERT `ommu_core_wall_user` (`status`, `wall_id`, `user_id`)
		VALUE ('1', NEW.wall_id, NEW.user_id);
	ELSE
		UPDATE `ommu_core_wall_user` SET `status`='1' WHERE `wall_id`=NEW.wall_id AND `user_id`=NEW.user_id;
	END IF;
	UPDATE `ommu_core_wall_user` SET `status`='0' WHERE `wall_id`=NEW.wall_id AND `user_id`<>NEW.user_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_wall_comment` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateWallComment` BEFORE UPDATE ON `ommu_core_wall_comment` FOR EACH ROW BEGIN
	IF (NEW.comment <> OLD.comment) THEN
		SET NEW.modified_date = NOW();
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_wall_comment` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterDeleteWallComment` AFTER DELETE ON `ommu_core_wall_comment` FOR EACH ROW BEGIN	
	IF (OLD.parent_id = 0) THEN
		UPDATE `ommu_core_walls` SET `comments`=(`comments` - 1) WHERE `wall_id`=OLD.wall_id;
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_wall_likes` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterInsertWallLikes` AFTER INSERT ON `ommu_core_wall_likes` FOR EACH ROW BEGIN
	DECLARE user_id_tr INT;
	
	UPDATE `ommu_core_walls` SET `likes`=(`likes` + 1) WHERE `wall_id`=NEW.wall_id;
	
	SELECT `user_id` INTO user_id_tr FROM `ommu_core_wall_user` WHERE `wall_id`=NEW.wall_id AND `user_id`=NEW.user_id;
	IF (user_id_tr IS NULL) THEN
		INSERT `ommu_core_wall_user` (`status`, `wall_id`, `user_id`)
		VALUE ('1', NEW.wall_id, NEW.user_id);
	ELSE
		UPDATE `ommu_core_wall_user` SET `status`='1' WHERE `wall_id`=NEW.wall_id AND `user_id`=NEW.user_id;
	END IF;	
	UPDATE `ommu_core_wall_user` SET `status`='0' WHERE `wall_id`=NEW.wall_id AND `user_id`<>NEW.user_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_wall_likes` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterDeleteWallLikes` AFTER DELETE ON `ommu_core_wall_likes` FOR EACH ROW BEGIN
	UPDATE `ommu_core_walls` SET `likes`=(`likes` - 1) WHERE `wall_id`=OLD.wall_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_walls` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreAfterInsertWalls` AFTER INSERT ON `ommu_core_walls` FOR EACH ROW BEGIN
	INSERT `ommu_core_wall_user` (`wall_id`, `user_id`)
	VALUE (NEW.wall_id, NEW.user_id);
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_walls` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateWalls` BEFORE UPDATE ON `ommu_core_walls` FOR EACH ROW BEGIN
	IF ((NEW.comments = OLD.comments) AND (NEW.likes = OLD.likes)) THEN
		SET NEW.modified_date = NOW();
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_city` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeInsertCity` BEFORE INSERT ON `ommu_core_zone_city` FOR EACH ROW BEGIN
	DECLARE province_id_tr SMALLINT;
	
	IF (NEW.province_id IS NULL) THEN
		/*CALL getOmmuZoneProvinceIdWithCityMfdonline(NEW.mfdonline, province_id_tr);*/
		SELECT `province_id` INTO province_id_tr FROM `ommu_core_zone_province` WHERE `mfdonline`=LEFT(NEW.mfdonline,2);
		IF (province_id_tr IS NOT NULL) THEN
			SET NEW.province_id = province_id_tr;
		END IF;	
	END IF;	
	
	SET NEW.city = TRIM(NEW.city);
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_city` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateCity` BEFORE UPDATE ON `ommu_core_zone_city` FOR EACH ROW BEGIN
	DECLARE province_id_tr SMALLINT;
	
	IF (NEW.mfdonline <> OLD.mfdonline) THEN	
		/*CALL getOmmuZoneProvinceIdWithCityMfdonline(NEW.mfdonline, province_id_tr);*/
		SELECT `province_id` INTO province_id_tr FROM `ommu_core_zone_province` WHERE `mfdonline`=LEFT(NEW.mfdonline,2);
		IF (province_id_tr IS NOT NULL) THEN
			SET NEW.province_id = province_id_tr;
		END IF;
	END IF;
	SET NEW.city = TRIM(NEW.city);
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_country` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeInsertCountry` BEFORE INSERT ON `ommu_core_zone_country` FOR EACH ROW BEGIN
	SET NEW.country = TRIM(NEW.country);
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_country` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateCountry` BEFORE UPDATE ON `ommu_core_zone_country` FOR EACH ROW BEGIN
	SET NEW.country = TRIM(NEW.country);
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_districts` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeInsertDistricts` BEFORE INSERT ON `ommu_core_zone_districts` FOR EACH ROW BEGIN
	DECLARE `city_id_tr` INT;
	
	/*CALL getOmmuZoneCityIdWithDistrictMfdonline(NEW.mfdonline, city_id_tr);*/
	SELECT `city_id` INTO city_id_tr FROM `ommu_core_zone_city` WHERE `mfdonline`=LEFT(NEW.mfdonline,4);
	IF (city_id_tr IS NOT NULL) THEN
		SET NEW.city_id = city_id_tr;
	END IF;	
	
	SET NEW.district_name = TRIM(NEW.district_name);
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_districts` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateDistricts` BEFORE UPDATE ON `ommu_core_zone_districts` FOR EACH ROW BEGIN
	DECLARE `city_id_tr` INT;
	
	IF (NEW.mfdonline <> OLD.mfdonline) THEN	
		/*CALL getOmmuZoneCityIdWithDistrictMfdonline(NEW.mfdonline, city_id_tr);*/
		SELECT `city_id` INTO city_id_tr FROM `ommu_core_zone_city` WHERE `mfdonline`=LEFT(NEW.mfdonline,4);
		IF (city_id_tr IS NOT NULL) THEN
			SET NEW.city_id = city_id_tr;
		END IF;
	END IF;
	SET NEW.district_name = TRIM(NEW.district_name);
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_province` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeInsertProvince` BEFORE INSERT ON `ommu_core_zone_province` FOR EACH ROW BEGIN
	SET NEW.province = TRIM(NEW.province);
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_province` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateProvince` BEFORE UPDATE ON `ommu_core_zone_province` FOR EACH ROW BEGIN
	SET NEW.province = TRIM(NEW.province);
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_village` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeInsertVillage` BEFORE INSERT ON `ommu_core_zone_village` FOR EACH ROW BEGIN
	DECLARE `district_id_tr` INT;
	
	IF (NEW.district_id IS NULL) THEN
		SELECT `district_id` INTO district_id_tr FROM `ommu_core_zone_districts` WHERE `mfdonline`=LEFT(NEW.mfdonline,7);
		IF (district_id_tr IS NOT NULL) THEN
			SET NEW.district_id = district_id_tr;
		END IF;
	END IF;
	
	SET NEW.village_name = TRIM(NEW.village_name);
	SET NEW.zipcode = TRIM(NEW.zipcode);
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_core_zone_village` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `coreBeforeUpdateVillage` BEFORE UPDATE ON `ommu_core_zone_village` FOR EACH ROW BEGIN
    
	DECLARE `district_id_tr` INT;
	
	IF (NEW.mfdonline <> OLD.mfdonline) THEN
		SELECT `district_id` INTO district_id_tr FROM `ommu_core_zone_districts` WHERE `mfdonline`=LEFT(NEW.mfdonline,7);
		IF (district_id_tr IS NOT NULL) THEN
			SET NEW.district_id = district_id_tr;
		END IF;
	END IF;
	
	SET NEW.village_name = TRIM(NEW.village_name);
	SET NEW.zipcode = TRIM(NEW.zipcode);
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_psb_courses` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `psbBeforeUpdateCourses` BEFORE UPDATE ON `ommu_psb_courses` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_psb_religions` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `psbBeforeUpdateReligions` BEFORE UPDATE ON `ommu_psb_religions` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_psb_schools` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `psbBeforeUpdateSchools` BEFORE UPDATE ON `ommu_psb_schools` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_psb_year_batch` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `psbBeforeUpdateYearBatch` BEFORE UPDATE ON `ommu_psb_year_batch` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_psb_years` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `psbBeforeUpdateYears` BEFORE UPDATE ON `ommu_psb_years` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_report_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportAfterInsertCategory` AFTER INSERT ON `ommu_report_category` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getReportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_report_statistic_data` (`report_id`, `user_id`, `flag`)
	VALUE (NEW.cat_id, NEW.creation_id, '5');
	UPDATE `ommu_report_statistics` SET `category_insert`=(category_insert + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_report_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='category_insert';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_report_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportBeforeUpdateCategory` BEFORE UPDATE ON `ommu_report_category` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_report_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportAfterUpdateCategory` AFTER UPDATE ON `ommu_report_category` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getReportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_report_statistic_data` (`report_id`, `user_id`, `flag`)
	VALUE (NEW.cat_id, NEW.modified_id, '6');
	UPDATE `ommu_report_statistics` SET `category_update`=(category_update + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_report_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='category_update';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_report_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportAfterDeleteCategory` AFTER DELETE ON `ommu_report_category` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.name;
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.desc;
	
	CALL getReportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_report_statistic_data` (`report_id`, `flag`)
	VALUE (OLD.cat_id, '7');
	UPDATE `ommu_report_statistics` SET `category_delete`=(category_delete + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_report_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='category_delete';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_reports` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportAfterInsert` AFTER INSERT ON `ommu_reports` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getReportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_report_statistic_data` (`report_id`, `user_id`, `flag`)
	VALUE (NEW.report_id, NEW.user_id, '1');
	UPDATE `ommu_report_statistics` SET `report_add`=(report_add + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_report_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='report_add';	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_reports` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportBeforeUpdate` BEFORE UPDATE ON `ommu_reports` FOR EACH ROW BEGIN	
	IF (NEW.status <> OLD.status) THEN
		IF ((NEW.status = 1) AND (OLD.status = 0)) THEN
			SET NEW.resolved_date = NOW();
		ELSEIF ((NEW.status = 0) AND (OLD.status = 1)) THEN
			SET NEW.unresolved_date = NOW();
		END IF;	
	END IF;	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_reports` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportAfterUpdate` AFTER UPDATE ON `ommu_reports` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getReportStatisticCurrentDate(CURDATE(), date_tr);
	
	IF (NEW.status <> OLD.status) THEN
		IF ((NEW.status = 1) AND (OLD.status = 0)) THEN
			INSERT `ommu_report_statistic_data` (`report_id`, `user_id`, `flag`)
			VALUE (NEW.report_id, NEW.resolved_id, '2');
			UPDATE `ommu_report_statistics` SET `report_resolved`=(report_resolved + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_report_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='report_resolved';
		ELSEIF ((NEW.status = 0) AND (OLD.status = 1)) THEN
			INSERT `ommu_report_statistic_data` (`report_id`, `user_id`, `flag`)
			VALUE (NEW.report_id, NEW.unresolved_id, '4');
			UPDATE `ommu_report_statistics` SET `report_unresolved`=(report_unresolved + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_report_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='report_unresolved';		
		END IF;	
	END IF;	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_reports` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `reportAfterDelete` AFTER DELETE ON `ommu_reports` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getReportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_report_statistic_data` (`report_id`, `flag`)
	VALUE (OLD.report_id, '3');
	UPDATE `ommu_report_statistics` SET `report_delete`=(report_delete + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_report_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='report_delete';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contact_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterInsertContactCategory` AFTER INSERT ON `ommu_support_contact_category` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.cat_id, NEW.creation_id, '5');
	UPDATE `ommu_support_statistics` SET `contact_category_insert`=(contact_category_insert + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='contact_category_insert';	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contact_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportBeforeUpdateContactCategory` BEFORE UPDATE ON `ommu_support_contact_category` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contact_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterUpdateContactCategory` AFTER UPDATE ON `ommu_support_contact_category` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.cat_id, NEW.modified_id, '6');
	UPDATE `ommu_support_statistics` SET `contact_category_update`=(contact_category_update + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='contact_category_update';	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contact_category` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterDeleteContactCategory` AFTER DELETE ON `ommu_support_contact_category` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.name;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `flag`)
	VALUE (OLD.cat_id, '7');
	UPDATE `ommu_support_statistics` SET `contact_category_delete`=(contact_category_delete + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='contact_category_delete';	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contacts` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterInsertContacts` AFTER INSERT ON `ommu_support_contacts` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.cat_id, NEW.creation_id, '8');
	UPDATE `ommu_support_statistics` SET `contacts_insert`=(contacts_insert + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='contacts_insert';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contacts` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportBeforeUpdateContacts` BEFORE UPDATE ON `ommu_support_contacts` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contacts` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterUpdateContacts` AFTER UPDATE ON `ommu_support_contacts` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.cat_id, NEW.modified_id, '9');
	UPDATE `ommu_support_statistics` SET `contacts_update`=(contacts_update + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='contacts_update';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_contacts` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterDeleteContacts` AFTER DELETE ON `ommu_support_contacts` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `flag`)
	VALUE (OLD.cat_id, '10');
	UPDATE `ommu_support_statistics` SET `contacts_delete`=(contacts_delete + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='contacts_delete';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mail_setting` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportBeforeInsertMailSetting` BEFORE INSERT ON `ommu_support_mail_setting` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mail_setting` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterInsertMailSetting` AFTER INSERT ON `ommu_support_mail_setting` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.id, NEW.modified_id, '11');
	UPDATE `ommu_support_statistics` SET `mail_setting_update`=(mail_setting_update + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='mail_setting_update';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mail_setting` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportBeforeUpdateMailSetting` BEFORE UPDATE ON `ommu_support_mail_setting` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mail_setting` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterUpdateMailSetting` AFTER UPDATE ON `ommu_support_mail_setting` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.id, NEW.modified_id, '11');
	UPDATE `ommu_support_statistics` SET `mail_setting_update`=(mail_setting_update + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='mail_setting_update';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mails` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportBeforeInsertMails` BEFORE INSERT ON `ommu_support_mails` FOR EACH ROW BEGIN
	DECLARE user_id_tr INT;
	DECLARE displayname_tr VARCHAR(32);
	
	IF (NEW.user_id = 0) THEN
		SELECT `user_id`, `displayname` INTO user_id_tr, displayname_tr FROM `ommu_users` WHERE `email`=NEW.email;
		IF (user_id_tr IS NOT NULL) THEN
			SET NEW.user_id = user_id_tr;
			SET NEW.displayname = displayname_tr;
		END IF;	
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mails` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterInsertMails` AFTER INSERT ON `ommu_support_mails` FOR EACH ROW BEGIN
	DECLARE site_type_tr TINYINT;
	DECLARE signup_numgiven_tr TINYINT;
	DECLARE date_tr DATE;
	
	CALL getOmmuSetting(site_type_tr, signup_numgiven_tr);
	IF (site_type_tr = 1) THEN	
		CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
		IF (NEW.user_id = 0) THEN
			INSERT `ommu_support_statistic_data` (`content_id`, `flag`)
			VALUE (NEW.mail_id, '1');
			UPDATE `ommu_support_statistics` SET `guest_message`=(guest_message + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='guest_message';
		ELSE
			INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
			VALUE (NEW.mail_id, NEW.user_id, '2');
			UPDATE `ommu_support_statistics` SET `user_message`=(user_message + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='user_message';
		END IF;
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mails` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportBeforeUpdateMails` BEFORE UPDATE ON `ommu_support_mails` FOR EACH ROW BEGIN
	IF ((NEW.message_reply <> OLD.message_reply) AND (OLD.reply = 0)) THEN
		SET NEW.reply_date = NOW();
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_mails` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterUpdateMails` AFTER UPDATE ON `ommu_support_mails` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	IF (NEW.message_reply <> '') THEN
		IF (NEW.user_id = 0) THEN
			INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
			VALUE (NEW.mail_id, NEW.reply, '3');
			UPDATE `ommu_support_statistics` SET `guest_message_reply`=(guest_message_reply + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='guest_message_reply';
		ELSE
			INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
			VALUE (NEW.mail_id, NEW.reply, '4');
			UPDATE `ommu_support_statistics` SET `user_message_reply`=(user_message_reply + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='user_message_reply';
		END IF;
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_widget` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterInsertWidget` AFTER INSERT ON `ommu_support_widget` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.widget_id, NEW.creation_id, '12');
	UPDATE `ommu_support_statistics` SET `widget_insert`=(widget_insert + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='widget_insert';    
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_widget` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportBeforeUpdateWidget` BEFORE UPDATE ON `ommu_support_widget` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_widget` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterUpdateWidget` AFTER UPDATE ON `ommu_support_widget` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.widget_id, NEW.modified_id, '13');
	UPDATE `ommu_support_statistics` SET `widget_update`=(widget_update + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='widget_update';    
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_support_widget` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `supportAfterDeleteWidget` AFTER DELETE ON `ommu_support_widget` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getSupportStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_support_statistic_data` (`content_id`, `flag`)
	VALUE (OLD.widget_id, '14');
	UPDATE `ommu_support_statistics` SET `widget_delete`=(widget_delete + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_support_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='widget_delete';    
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_device` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userBeforeUpdateDevice` BEFORE UPDATE ON `ommu_user_device` FOR EACH ROW BEGIN
	IF ((NEW.user_id <> OLD.user_id) AND (OLD.user_id = 0)) THEN
		SET NEW.generate_date = NOW();
	ELSE
		IF ((NEW.publish <> OLD.publish) AND (NEW.publish = 0)) THEN
			SET NEW.unpublish_date = NOW();
		ELSE
			SET NEW.modified_date = NOW();
		END IF;
	END IF;
	
	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_forgot` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterInsertForgot` AFTER INSERT ON `ommu_user_forgot` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	/* History */
	INSERT `ommu_user_history_forgot` (`user_id`, `forgot_date`, `forgot_ip`, `forgot_from`)
	VALUE (NEW.user_id, NEW.forgot_date, NEW.forgot_ip, NEW.forgot_from);
	
	/* Statistic */
	UPDATE `ommu_user_statistics` SET `forgot_password_request`=(forgot_password_request + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='forgot_password_request';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_forgot` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterDeleteForgot` AFTER DELETE ON `ommu_user_forgot` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	/* Statistic */	
	IF (CURDATE() BETWEEN DATE(OLD.forgot_date) AND DATE_ADD(DATE(OLD.forgot_date), INTERVAL 3 DAY)) THEN
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (OLD.forgot_id, OLD.user_id, '22');
		UPDATE `ommu_user_statistics` SET `forgot_password_success`=(forgot_password_success + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='forgot_password_success';
	ELSE
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (OLD.forgot_id, OLD.user_id, '23');
		UPDATE `ommu_user_statistics` SET `forgot_password_expired`=(forgot_password_expired + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='forgot_password_expired';
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_invite_queue` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterInsertInviteQueue` AFTER INSERT ON `ommu_user_invite_queue` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	/* Statistic */
	IF (NEW.member_id = 0) THEN	
		CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
		
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (NEW.queue_id, NEW.reference_id, '15');
		UPDATE `ommu_user_statistics` SET `invite_new_send`=(invite_new_send + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='invite_new_send';
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_invite_queue` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterUpdateInviteQueue` AFTER UPDATE ON `ommu_user_invite_queue` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	/* Statistic */
	IF ((NEW.member_id <> OLD.member_id) AND OLD.member_id = 0) THEN
		CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
		
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (NEW.queue_id, NEW.member_id, '5');
		UPDATE `ommu_user_statistics` SET `signup_invite_success`=(signup_invite_success + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='signup_invite_success';	
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_invites` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterInsertInvites` AFTER INSERT ON `ommu_user_invites` FOR EACH ROW BEGIN
	DECLARE invite_id_tr INT;
	DECLARE date_tr DATE;
	
	/* Count Inviters */
	SELECT `invite_id` INTO invite_id_tr FROM `ommu_user_invites` WHERE `queue_id`=NEW.queue_id AND `user_id`=NEW.user_id;
	IF (invite_id_tr IS NOT NULL) THEN
		UPDATE `ommu_user_invite_queue` SET `inviters`=(`inviters` + 1) WHERE `queue_id`=NEW.queue_id;		
	END IF;
	
	/* Statistic */
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.queue_id, NEW.user_id, '16');
	UPDATE `ommu_user_statistics` SET `invite_all_send`=(invite_all_send + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='invite_all_send';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_newsletter` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterInsertNewsletter` AFTER INSERT ON `ommu_user_newsletter` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	/* Statistic */
	IF (NEW.user_id = 0) THEN
		INSERT `ommu_user_statistic_data` (`content_id`, `flag`)
		VALUE (NEW.id, '8');
		UPDATE `ommu_user_statistics` SET `guest_subscribe`=(guest_subscribe + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='guest_subscribe';
	ELSE
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (NEW.id, NEW.user_id, '9');
		UPDATE `ommu_user_statistics` SET `user_subscribe`=(user_subscribe + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='user_subscribe';
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_newsletter` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userBeforeUpdateNewsletter` BEFORE UPDATE ON `ommu_user_newsletter` FOR EACH ROW BEGIN
	/* Unsubscribe */
	IF (NEW.subscribe = 0) THEN
		SET NEW.unsubscribe_date = NOW();
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_newsletter` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterUpdateNewsletter` AFTER UPDATE ON `ommu_user_newsletter` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	/* History Subscribe */	
	IF ((NEW.user_id = OLD.user_id) AND (NEW.subscribe <> OLD.subscribe)) THEN
		INSERT `ommu_user_newsletter_history` (`newsletter_id`, `status`)
		VALUE (NEW.id, NEW.subscribe);
		
		IF (NEW.user_id = 0 AND NEW.subscribe = 0) THEN
			INSERT `ommu_user_statistic_data` (`content_id`, `flag`)
			VALUE (NEW.id, '10');
			UPDATE `ommu_user_statistics` SET `guest_unsubscribe`=(guest_unsubscribe + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='guest_unsubscribe';
		END IF;
		IF (NEW.user_id <> 0 AND NEW.subscribe = 0) THEN
			INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
			VALUE (NEW.id, NEW.user_id, '11');
			UPDATE `ommu_user_statistics` SET `user_unsubscribe`=(user_unsubscribe + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='user_unsubscribe';
		END IF;
	END IF;
	
	/* Statistic */
	IF ((NEW.user_id <> OLD.user_id) AND (OLD.user_id = 0)) THEN
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (NEW.id, NEW.user_id, '6');
		UPDATE `ommu_user_statistics` SET `signup_newsletter_success`=(signup_newsletter_success + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='signup_newsletter_success';
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userBeforeInsertOauth` BEFORE INSERT ON `ommu_user_oauth` FOR EACH ROW BEGIN
	DECLARE language_id_tr TINYINT;
	DECLARE locale_id_tr SMALLINT;
	DECLARE timezone_id_tr SMALLINT;
	
	/* Language */	
	CALL getOmmuLanguageDefault(language_id_tr);
	SET NEW.language_id = language_id_tr;
	
	/* Locale */
	CALL getOmmuLocaleDefault(locale_id_tr);
	SET NEW.locale_id = locale_id_tr;
	
	/* Timezone */
	CALL getOmmuTimezoneDefault(timezone_id_tr);
	SET NEW.timezone_id = timezone_id_tr;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterInsertOauth` AFTER INSERT ON `ommu_user_oauth` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	DECLARE newsletter_user_id_tr INT;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	/* Users Newsletter */
	SELECT `id` INTO newsletter_user_id_tr FROM `ommu_user_newsletter` WHERE `email`=NEW.email;
	IF (newsletter_user_id_tr IS NOT NULL) THEN
		UPDATE `ommu_user_newsletter` SET `user_id`=NEW.user_id WHERE `id`=newsletter_user_id_tr;
	ELSE
		INSERT `ommu_user_newsletter` (`user_id`, `email`)
		VALUE (NEW.user_id, NEW.email);
	END IF;
	
	/* History Email and Password */
	INSERT `ommu_user_history_password` (`user_id`, `password`)
	VALUE (NEW.user_id, NEW.password);
	
	/* Statistic */
	INSERT `ommu_user_statistic_data` (`content_id`, `flag`)
	VALUE (NEW.user_id, '4');
	UPDATE `ommu_user_statistics` SET `signup_success`=(signup_success + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='signup_success';
	
	IF (NEW.modified_id = 0) THEN	
		INSERT `ommu_user_statistic_data` (`content_id`, `flag`)
		VALUE (NEW.user_id, '24');
		UPDATE `ommu_user_statistics` SET `signup_from_public`=(signup_from_public + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='signup_from_public';
	ELSE
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (NEW.user_id, NEW.modified_id, '25');
		UPDATE `ommu_user_statistics` SET `signup_from_admin`=(signup_from_admin + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='signup_from_admin';
	END IF;	
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterUpdateOauth` AFTER UPDATE ON `ommu_user_oauth` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	IF (NEW.lastlogin_date <> OLD.lastlogin_date) THEN
		INSERT `ommu_user_history_login` (`user_id`, `lastlogin_date`, `lastlogin_ip`)
		VALUE (NEW.user_id, NEW.lastlogin_date, NEW.lastlogin_ip);
		
		IF ((NEW.level_id = 1) OR (NEW.level_id = 2)) THEN
			UPDATE `ommu_user_statistics` SET `login_admin`=(login_admin + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='login_admin';
		ELSE
			UPDATE `ommu_user_statistics` SET `login_user`=(login_user + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='login_user';
		END IF;
	END IF;
	IF (NEW.password <> OLD.password) THEN
		INSERT `ommu_user_history_password` (`user_id`, `password`)
		VALUE (NEW.user_id, NEW.password);
		
		UPDATE `ommu_user_statistics` SET `user_update_password`=(user_update_password + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='user_update_password';
	END IF;
	
	/* Blocked User */
	IF (NEW.enabled <> OLD.enabled) THEN
		IF (NEW.enabled = 0) THEN
			INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
			VALUE (NEW.user_id, NEW.modified_id, '17');
			UPDATE `ommu_user_statistics` SET `admin_block_user`=(admin_block_user + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='admin_block_user';
		ELSE
			INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
			VALUE (NEW.user_id, NEW.modified_id, '18');
			UPDATE `ommu_user_statistics` SET `admin_unblock_user`=(admin_unblock_user + 1) WHERE `date_key`=date_tr;
			UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='admin_unblock_user';
		END IF;
	END IF;
	
	/* Statistic */
	IF (((NEW.photos <> OLD.photos) AND ((OLD.photos <> '') AND ((NEW.photos <> '') OR (NEW.photos = '')))) OR ((NEW.email = OLD.email) AND (NEW.update_date <> OLD.update_date))) THEN
		INSERT `ommu_user_statistic_data` (`content_id`, `flag`)
		VALUE (NEW.user_id, '7');
		UPDATE `ommu_user_statistics` SET `user_update_info`=(user_update_info + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='user_update_info';
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterDeleteOauth` AFTER DELETE ON `ommu_user_oauth` FOR EACH ROW BEGIN
	/* Clear Newsletter */
	UPDATE `ommu_user_newsletter` SET `user_id`='0', `subscribe`='0', `unsubscribe_date`=NOW() WHERE `user_id`=OLD.user_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth_level` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterInsertOauthLevel` AFTER INSERT ON `ommu_user_oauth_level` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.level_id, NEW.creation_id, '1');
	UPDATE `ommu_user_statistics` SET `level_insert`=(level_insert + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='level_insert';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth_level` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userBeforeUpdateOauthLevel` BEFORE UPDATE ON `ommu_user_oauth_level` FOR EACH ROW BEGIN
	SET NEW.modified_date = NOW();
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth_level` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterUpdateOauthLevel` AFTER UPDATE ON `ommu_user_oauth_level` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.level_id, NEW.modified_id, '2');
	UPDATE `ommu_user_statistics` SET `level_update`=(level_update + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='level_update';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_oauth_level` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterDeleteOauthLevel` AFTER DELETE ON `ommu_user_oauth_level` FOR EACH ROW BEGIN	
	DECLARE date_tr DATE;
	
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.name;
	DELETE FROM `ommu_core_system_phrase` WHERE `phrase_id`=OLD.desc;
	
	/* Statistic */
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	INSERT `ommu_user_statistic_data` (`content_id`, `flag`)
	VALUE (OLD.level_id, '3');
	UPDATE `ommu_user_statistics` SET `level_delete`=(level_delete + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='level_delete';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_verify` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterInsertVerify` AFTER INSERT ON `ommu_user_verify` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	/* Statistic */
	INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
	VALUE (NEW.verify_id, NEW.user_id, '12');
	UPDATE `ommu_user_statistics` SET `verify_email_request`=(verify_email_request + 1) WHERE `date_key`=date_tr;
	UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='verify_email_request';
    END */$$


DELIMITER ;

/* Trigger structure for table `ommu_user_verify` */

DELIMITER $$

/*!50003 CREATE */ /*!50003 TRIGGER `userAfterDeleteVerify` AFTER DELETE ON `ommu_user_verify` FOR EACH ROW BEGIN
	DECLARE date_tr DATE;
	
	CALL getUserStatisticCurrentDate(CURDATE(), date_tr);
	
	/* Statistic */	
	IF (CURDATE() BETWEEN DATE(OLD.verify_date) AND DATE_ADD(DATE(OLD.verify_date), INTERVAL 3 DAY)) THEN
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (OLD.verify_id, OLD.user_id, '13');
		UPDATE `ommu_user_statistics` SET `verify_email_success`=(verify_email_success + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='verify_email_success';
	ELSE
		INSERT `ommu_user_statistic_data` (`content_id`, `user_id`, `flag`)
		VALUE (OLD.verify_id, OLD.user_id, '14');
		UPDATE `ommu_user_statistics` SET `verify_email_expired`=(verify_email_expired + 1) WHERE `date_key`=date_tr;
		UPDATE `ommu_user_statistic_total` SET `total`=(total + 1) WHERE `statistic_key`='verify_email_expired';
	END IF;	
    END */$$


DELIMITER ;

/* Procedure structure for procedure `getOmmuLanguageDefault` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuLanguageDefault`(OUT `language_id_sp` TINYINT)
BEGIN
	SELECT `language_id` INTO language_id_sp FROM `ommu_core_languages` WHERE `actived`=1 AND `defaults`=1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getOmmuLocaleDefault` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuLocaleDefault`(OUT `locale_id_sp` SMALLINT)
BEGIN
	SELECT `locale_id` INTO locale_id_sp FROM `ommu_core_locale` WHERE `defaults`=1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getOmmuSetting` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuSetting`(OUT `site_type_sp` TINYINT, OUT `signup_numgiven_sp` TINYINT)
BEGIN
	/**
	 * userAfterInsert
	 * supportAfterInsertMails
	 */
	SELECT `site_type`, `signup_numgiven` INTO site_type_sp, signup_numgiven_sp FROM `ommu_core_settings` WHERE `id`=1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getOmmuTimezoneDefault` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuTimezoneDefault`(OUT `timezone_id_sp` SMALLINT)
BEGIN
	SELECT `timezone_id` INTO timezone_id_sp FROM `ommu_core_timezone` WHERE `defaults`=1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getOmmuZoneCityIdWithDistrictMfdonline` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuZoneCityIdWithDistrictMfdonline`(IN `mfdonline_sp` CHAR, OUT `city_id_sp` INT)
BEGIN
	SELECT `city_id` INTO city_id_sp FROM `ommu_core_zone_city` WHERE `mfdonline`=LEFT(mfdonline_sp,4);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getOmmuZoneCountryId` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuZoneCountryId`(IN `province_id_sp` SMALLINT, OUT `country_id_sp` SMALLINT)
BEGIN
	SELECT `country_id` INTO country_id_sp FROM `ommu_core_zone_province` WHERE `province_id`=province_id_sp;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getOmmuZoneProvinceId` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuZoneProvinceId`(in `city_id_sp` INT, OUT `province_id_sp` SMALLINT)
BEGIN
	SELECT `province_id` INTO province_id_sp FROM `ommu_core_zone_city` WHERE `city_id`=city_id_sp;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getOmmuZoneProvinceIdWithCityMfdonline` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getOmmuZoneProvinceIdWithCityMfdonline`(IN `mfdonline_sp` CHAR, OUT `province_id_sp` SMALLINT)
BEGIN
	SELECT `province_id` INTO province_id_sp FROM `ommu_core_zone_province` WHERE `mfdonline`=LEFT(mfdonline_sp,2);
	/*
	CALL getOmmuZoneProvinceIdWithCityMfdonline(NEW.mfdonline, province_id_tr);
	SELECT `province_id` INTO province_id_tr FROM `ommu_core_zone_province` WHERE `mfdonline`=LEFT(NEW.mfdonline,2);*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getPsbYearIdFromBatch` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getPsbYearIdFromBatch`(IN `batch_id_sp` INT, OUT `year_id_sp` INT)
BEGIN
	SELECT `year_id` INTO year_id_sp FROM `ommu_psb_year_batch` WHERE `batch_id`=batch_id_sp;	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getReportStatisticCurrentDate` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getReportStatisticCurrentDate`(IN `date_in_sp` DATE, OUT `date_out_tr` DATE)
BEGIN
	DECLARE date_condition_sp DATE;
	SELECT `date_key` INTO date_condition_sp FROM `ommu_report_statistics` WHERE `date_key`=date_in_sp;
	IF (date_condition_sp IS NULL) THEN
		INSERT `ommu_report_statistics` (`date_key`)
		VALUE (date_in_sp);
	END IF;
	SET date_out_tr = date_in_sp;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getSupportStatisticCurrentDate` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getSupportStatisticCurrentDate`(IN `date_in_sp` DATE, OUT `date_out_tr` DATE)
BEGIN
	DECLARE date_condition_sp DATE;
	SELECT `date_key` INTO date_condition_sp FROM `ommu_support_statistics` WHERE `date_key`=date_in_sp;
	IF (date_condition_sp IS NULL) THEN
		INSERT `ommu_support_statistics` (`date_key`)
		VALUE (date_in_sp);
	END IF;
	SET date_out_tr = date_in_sp;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getUserOauthLevelId` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getUserOauthLevelId`(IN `user_id_sp` INT, OUT `level_id_sp` TINYINT)
BEGIN
	SELECT `level_id` INTO level_id_sp FROM `ommu_user_oauth` WHERE `user_id`=user_id_sp;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getUserStatisticCurrentDate` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `getUserStatisticCurrentDate`(IN `date_in_sp` DATE, OUT `date_out_tr` DATE)
BEGIN
	DECLARE date_condition_sp DATE;
	
	SELECT `date_key` INTO date_condition_sp FROM `ommu_user_statistics` WHERE `date_key`=date_in_sp;
	IF (date_condition_sp IS NULL) THEN
		INSERT `ommu_user_statistics` (`date_key`)
		VALUE (date_in_sp);
	END IF;
	SET date_out_tr = date_in_sp;
    END */$$
DELIMITER ;

/*Table structure for table `_view_core_menu` */

DROP TABLE IF EXISTS `_view_core_menu`;

/*!50001 CREATE TABLE  `_view_core_menu`(
 `menu_id` int(11) unsigned ,
 `title` text 
)*/;

/*Table structure for table `_view_core_menu_category` */

DROP TABLE IF EXISTS `_view_core_menu_category`;

/*!50001 CREATE TABLE  `_view_core_menu_category`(
 `cat_id` smallint(5) unsigned ,
 `title` text ,
 `description` text ,
 `menus` bigint(21) 
)*/;

/*Table structure for table `_view_core_meta` */

DROP TABLE IF EXISTS `_view_core_meta`;

/*!50001 CREATE TABLE  `_view_core_meta`(
 `id` tinyint(1) ,
 `city` varchar(64) ,
 `province` varchar(64) ,
 `country` varchar(64) 
)*/;

/*Table structure for table `_view_core_pages` */

DROP TABLE IF EXISTS `_view_core_pages`;

/*!50001 CREATE TABLE  `_view_core_pages`(
 `page_id` smallint(5) unsigned ,
 `title` text ,
 `description` text 
)*/;

/*Table structure for table `_view_core_zone_city` */

DROP TABLE IF EXISTS `_view_core_zone_city`;

/*!50001 CREATE TABLE  `_view_core_zone_city`(
 `city_id` int(11) unsigned ,
 `city` varchar(64) ,
 `province` varchar(64) 
)*/;

/*Table structure for table `_view_core_zone_districts` */

DROP TABLE IF EXISTS `_view_core_zone_districts`;

/*!50001 CREATE TABLE  `_view_core_zone_districts`(
 `district_id` int(11) unsigned ,
 `district_name` varchar(64) ,
 `city` varchar(64) ,
 `province` varchar(64) 
)*/;

/*Table structure for table `_view_core_zone_village` */

DROP TABLE IF EXISTS `_view_core_zone_village`;

/*!50001 CREATE TABLE  `_view_core_zone_village`(
 `village_id` int(11) unsigned ,
 `village_name` varchar(64) ,
 `district_name` varchar(64) ,
 `city` varchar(64) ,
 `province` varchar(64) 
)*/;

/*Table structure for table `_view_psb_courses` */

DROP TABLE IF EXISTS `_view_psb_courses`;

/*!50001 CREATE TABLE  `_view_psb_courses`(
 `course_id` int(11) unsigned ,
 `years` bigint(21) 
)*/;

/*Table structure for table `_view_psb_religions` */

DROP TABLE IF EXISTS `_view_psb_religions`;

/*!50001 CREATE TABLE  `_view_psb_religions`(
 `religion_id` tinyint(1) unsigned ,
 `religion_name` text ,
 `registers` bigint(21) 
)*/;

/*Table structure for table `_view_psb_schools` */

DROP TABLE IF EXISTS `_view_psb_schools`;

/*!50001 CREATE TABLE  `_view_psb_schools`(
 `school_id` int(11) unsigned ,
 `registers` bigint(21) 
)*/;

/*Table structure for table `_view_psb_year_batch` */

DROP TABLE IF EXISTS `_view_psb_year_batch`;

/*!50001 CREATE TABLE  `_view_psb_year_batch`(
 `batch_id` int(11) unsigned ,
 `year_id` int(11) unsigned ,
 `registers` bigint(21) 
)*/;

/*Table structure for table `_view_psb_years` */

DROP TABLE IF EXISTS `_view_psb_years`;

/*!50001 CREATE TABLE  `_view_psb_years`(
 `year_id` int(11) unsigned ,
 `batchs` bigint(21) ,
 `courses` bigint(21) ,
 `registers` decimal(42,0) 
)*/;

/*Table structure for table `_view_report_category` */

DROP TABLE IF EXISTS `_view_report_category`;

/*!50001 CREATE TABLE  `_view_report_category`(
 `cat_id` smallint(5) unsigned ,
 `category_name` text ,
 `category_desc` text ,
 `report_resolved` bigint(21) ,
 `report_unresolved` bigint(21) ,
 `reports` bigint(21) 
)*/;

/*Table structure for table `_view_support_contact_category` */

DROP TABLE IF EXISTS `_view_support_contact_category`;

/*!50001 CREATE TABLE  `_view_support_contact_category`(
 `cat_id` tinyint(3) unsigned ,
 `category_name` text 
)*/;

/*Table structure for table `_view_user_oauth` */

DROP TABLE IF EXISTS `_view_user_oauth`;

/*!50001 CREATE TABLE  `_view_user_oauth`(
 `user_id` int(11) unsigned ,
 `level_name` text ,
 `token_key` varchar(32) ,
 `token_password` varchar(32) ,
 `token_oauth` varchar(32) 
)*/;

/*Table structure for table `_view_user_oauth_level` */

DROP TABLE IF EXISTS `_view_user_oauth_level`;

/*!50001 CREATE TABLE  `_view_user_oauth_level`(
 `level_id` tinyint(2) unsigned ,
 `level_name` text ,
 `level_desc` text ,
 `oauths` bigint(21) 
)*/;

/*View structure for view _view_core_menu */

/*!50001 DROP TABLE IF EXISTS `_view_core_menu` */;
/*!50001 CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `_view_core_menu` AS select `a`.`id` AS `menu_id`,`b`.`en_us` AS `title` from (`ommu_core_menu` `a` left join `ommu_core_system_phrase` `b` on((`a`.`name` = `b`.`phrase_id`))) */;

/*View structure for view _view_core_menu_category */

/*!50001 DROP TABLE IF EXISTS `_view_core_menu_category` */;
/*!50001 CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `_view_core_menu_category` AS select `a`.`cat_id` AS `cat_id`,`b`.`en_us` AS `title`,`c`.`en_us` AS `description`,(select count(0) from `ommu_core_menu` `b` where (`a`.`cat_id` = `b`.`cat_id`)) AS `menus` from ((`ommu_core_menu_category` `a` left join `ommu_core_system_phrase` `b` on((`a`.`name` = `b`.`phrase_id`))) left join `ommu_core_system_phrase` `c` on((`a`.`desc` = `c`.`phrase_id`))) */;

/*View structure for view _view_core_meta */

/*!50001 DROP TABLE IF EXISTS `_view_core_meta` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_core_meta` AS select `a`.`id` AS `id`,`b`.`city` AS `city`,`c`.`province` AS `province`,`d`.`country` AS `country` from (((`ommu_core_meta` `a` left join `ommu_core_zone_city` `b` on((`a`.`office_city` = `b`.`city_id`))) left join `ommu_core_zone_province` `c` on((`a`.`office_province` = `c`.`province_id`))) left join `ommu_core_zone_country` `d` on((`a`.`office_country` = `d`.`country_id`))) */;

/*View structure for view _view_core_pages */

/*!50001 DROP TABLE IF EXISTS `_view_core_pages` */;
/*!50001 CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `_view_core_pages` AS select `a`.`page_id` AS `page_id`,`b`.`en_us` AS `title`,`c`.`en_us` AS `description` from ((`ommu_core_pages` `a` left join `ommu_core_system_phrase` `b` on((`a`.`name` = `b`.`phrase_id`))) left join `ommu_core_system_phrase` `c` on((`a`.`desc` = `c`.`phrase_id`))) */;

/*View structure for view _view_core_zone_city */

/*!50001 DROP TABLE IF EXISTS `_view_core_zone_city` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_core_zone_city` AS select `a`.`city_id` AS `city_id`,`a`.`city` AS `city`,`b`.`province` AS `province` from (`ommu_core_zone_city` `a` left join `ommu_core_zone_province` `b` on((`a`.`province_id` = `b`.`province_id`))) */;

/*View structure for view _view_core_zone_districts */

/*!50001 DROP TABLE IF EXISTS `_view_core_zone_districts` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_core_zone_districts` AS select `a`.`district_id` AS `district_id`,`a`.`district_name` AS `district_name`,`b`.`city` AS `city`,`b`.`province` AS `province` from (`ommu_core_zone_districts` `a` left join `_view_core_zone_city` `b` on((`a`.`city_id` = `b`.`city_id`))) */;

/*View structure for view _view_core_zone_village */

/*!50001 DROP TABLE IF EXISTS `_view_core_zone_village` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_core_zone_village` AS select `a`.`village_id` AS `village_id`,`a`.`village_name` AS `village_name`,`b`.`district_name` AS `district_name`,`b`.`city` AS `city`,`b`.`province` AS `province` from (`ommu_core_zone_village` `a` left join `_view_core_zone_districts` `b` on((`a`.`district_id` = `b`.`district_id`))) */;

/*View structure for view _view_psb_courses */

/*!50001 DROP TABLE IF EXISTS `_view_psb_courses` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_psb_courses` AS select `a`.`course_id` AS `course_id`,(select count(0) from `ommu_psb_year_course` `b` where (`b`.`course_id` = `a`.`course_id`)) AS `years` from `ommu_psb_courses` `a` */;

/*View structure for view _view_psb_religions */

/*!50001 DROP TABLE IF EXISTS `_view_psb_religions` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_psb_religions` AS select `a`.`religion_id` AS `religion_id`,`b`.`en_us` AS `religion_name`,(select count(0) from `ommu_psb_registers` `b` where (`b`.`religion` = `a`.`religion_id`)) AS `registers` from (`ommu_psb_religions` `a` left join `ommu_core_system_phrase` `b` on((`a`.`religion_name` = `b`.`phrase_id`))) */;

/*View structure for view _view_psb_schools */

/*!50001 DROP TABLE IF EXISTS `_view_psb_schools` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_psb_schools` AS select `a`.`school_id` AS `school_id`,(select count(0) from `ommu_psb_registers` `b` where (`b`.`school_id` = `a`.`school_id`)) AS `registers` from `ommu_psb_schools` `a` */;

/*View structure for view _view_psb_year_batch */

/*!50001 DROP TABLE IF EXISTS `_view_psb_year_batch` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_psb_year_batch` AS select `a`.`batch_id` AS `batch_id`,`a`.`year_id` AS `year_id`,(select count(0) from `ommu_psb_registers` `b` where (`b`.`batch_id` = `a`.`batch_id`)) AS `registers` from `ommu_psb_year_batch` `a` */;

/*View structure for view _view_psb_years */

/*!50001 DROP TABLE IF EXISTS `_view_psb_years` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_psb_years` AS select `a`.`year_id` AS `year_id`,(select count(0) from `ommu_psb_year_batch` `b` where (`b`.`year_id` = `a`.`year_id`)) AS `batchs`,(select count(0) from `ommu_psb_year_course` `b` where (`b`.`year_id` = `a`.`year_id`)) AS `courses`,(select sum(`b`.`registers`) from `_view_psb_year_batch` `b` where (`b`.`year_id` = `a`.`year_id`)) AS `registers` from `ommu_psb_years` `a` */;

/*View structure for view _view_report_category */

/*!50001 DROP TABLE IF EXISTS `_view_report_category` */;
/*!50001 CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `_view_report_category` AS select `a`.`cat_id` AS `cat_id`,`b`.`en_us` AS `category_name`,`c`.`en_us` AS `category_desc`,(select count(0) from `ommu_reports` `d` where ((`d`.`cat_id` = `a`.`cat_id`) and (`d`.`status` = 1))) AS `report_resolved`,(select count(0) from `ommu_reports` `d` where ((`d`.`cat_id` = `a`.`cat_id`) and (`d`.`status` = 0))) AS `report_unresolved`,(select count(0) from `ommu_reports` `d` where (`d`.`cat_id` = `a`.`cat_id`)) AS `reports` from ((`ommu_report_category` `a` left join `ommu_core_system_phrase` `b` on((`a`.`name` = `b`.`phrase_id`))) left join `ommu_core_system_phrase` `c` on((`a`.`desc` = `c`.`phrase_id`))) */;

/*View structure for view _view_support_contact_category */

/*!50001 DROP TABLE IF EXISTS `_view_support_contact_category` */;
/*!50001 CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `_view_support_contact_category` AS select `a`.`cat_id` AS `cat_id`,`b`.`en_us` AS `category_name` from (`ommu_support_contact_category` `a` left join `ommu_core_system_phrase` `b` on((`a`.`name` = `b`.`phrase_id`))) */;

/*View structure for view _view_user_oauth */

/*!50001 DROP TABLE IF EXISTS `_view_user_oauth` */;
/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `_view_user_oauth` AS select `a`.`user_id` AS `user_id`,`b`.`level_name` AS `level_name`,md5(concat(`a`.`salt`,`a`.`creation_date`)) AS `token_key`,md5(concat(`a`.`salt`,`a`.`password`)) AS `token_password`,md5(concat(md5(concat(`a`.`salt`,`a`.`password`)),`a`.`lastlogin_date`)) AS `token_oauth` from (`ommu_user_oauth` `a` left join `_view_user_oauth_level` `b` on((`a`.`level_id` = `b`.`level_id`))) */;

/*View structure for view _view_user_oauth_level */

/*!50001 DROP TABLE IF EXISTS `_view_user_oauth_level` */;
/*!50001 CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `_view_user_oauth_level` AS select `a`.`level_id` AS `level_id`,`b`.`en_us` AS `level_name`,`c`.`en_us` AS `level_desc`,(select count(0) from `ommu_user_oauth` `d` where (`d`.`level_id` = `a`.`level_id`)) AS `oauths` from ((`ommu_user_oauth_level` `a` left join `ommu_core_system_phrase` `b` on((`a`.`name` = `b`.`phrase_id`))) left join `ommu_core_system_phrase` `c` on((`a`.`desc` = `c`.`phrase_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
