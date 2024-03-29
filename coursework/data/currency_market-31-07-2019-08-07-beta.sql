-- Generation time: Wed, 31 Jul 2019 08:07:55 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_24
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `currency_market`;
CREATE TABLE `currency_market` (
  `curr_acc` bigint(20) unsigned DEFAULT NULL,
  `currency` int(10) unsigned NOT NULL,
  `volume` int(10) unsigned NOT NULL,
  `buy` tinyint(1) DEFAULT NULL,
  `income` datetime DEFAULT NULL,
  `unit_price` float NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `currency_market` VALUES ('4024007105846','2','91449','1','1978-03-25 00:42:11','34.9994','0'),
('4556122129141042','5','88816','1','1981-06-23 04:06:55','41.89','0'),
('4539865194523313','4','27212','0','1988-04-05 12:13:40','20.0846','0'),
('346849589866338','2','3641','1','2018-06-23 15:42:26','38.623','0'),
('346849589866338','4','26256','0','2011-11-13 04:40:02','74.6312','0'),
('345894160655763','4','74280','1','1988-10-23 02:44:59','14.2063','0'),
('4556122129141042','5','26712','0','1992-04-14 11:00:25','37.8352','0'),
('4024007105846','3','97588','1','2015-01-13 08:34:40','88','0'),
('4024007105846','4','75116','1','1989-10-31 08:29:28','14.9323','0'),
('345894160655763','4','35582','0','1997-07-13 02:28:07','40','0'),
('4539865194523313','4','40025','1','1995-05-21 20:52:50','49.1907','0'),
('345894160655763','4','24773','1','1994-08-12 05:39:24','67.97','0'),
('4539865194523313','4','81922','1','2003-08-29 19:30:33','95.6365','0'),
('345894160655763','4','57403','0','1974-12-15 04:22:52','65.0331','0'),
('4024007105846','5','23838','0','1979-01-10 03:10:54','92.961','0'),
('345894160655763','1','48352','1','1992-07-29 23:33:29','80','0'),
('4539865194523313','6','81779','1','2011-01-08 10:43:54','63.648','0'),
('345894160655763','7','18114','1','2011-06-20 01:37:34','78.0668','0'),
('346849589866338','3','11330','0','1996-11-24 05:19:21','70.3191','0'),
('346849589866338','5','64239','0','1978-05-15 00:07:03','73.9','0'),
('4024007105846','7','65171','0','2017-05-22 19:32:38','24.936','0'),
('346849589866338','6','81638','0','1972-10-06 10:24:28','95.197','0'),
('345894160655763','7','49345','0','1975-02-11 05:28:18','21.4','0'),
('4556122129141042','7','62762','1','2008-02-15 22:53:52','77.405','0'),
('4556122129141042','4','58024','0','1978-11-01 08:33:57','21.516','0'),
('345894160655763','4','54308','1','1998-01-29 07:40:10','16.4','0'),
('4539865194523313','3','80398','0','1978-01-21 11:47:49','24','0'),
('345894160655763','2','27726','0','1998-12-10 22:07:45','69.449','0'),
('4539865194523313','1','84873','1','1971-04-09 13:28:25','99.9736','0'),
('4539865194523313','3','61200','0','2016-04-03 05:29:04','77.6171','0'),
('346849589866338','7','11905','0','1975-02-20 11:52:58','96.1','0'),
('345894160655763','6','25004','1','2001-10-30 04:15:24','61.1882','0'),
('345894160655763','6','29580','1','2000-03-31 13:14:05','96.96','0'),
('346849589866338','4','10414','0','2009-05-05 09:50:22','31','0'),
('346849589866338','4','73023','0','1985-07-24 12:35:58','46.42','0'),
('346849589866338','5','93683','1','2001-03-16 05:15:23','34.22','0'),
('4539865194523313','5','81192','1','2016-06-03 23:57:37','39.6645','0'),
('345894160655763','5','70916','0','2015-10-05 22:16:20','77.4112','0'),
('345894160655763','1','32700','1','1990-11-29 11:30:56','95.3634','0'),
('346849589866338','1','38107','1','1977-02-20 04:26:05','38.6622','0'),
('4539865194523313','5','65171','1','2004-08-10 03:34:07','55.0445','0'),
('4556122129141042','3','58662','1','1997-11-16 18:20:18','92.143','0'),
('4556122129141042','3','23242','1','1974-08-25 12:44:50','27.4848','0'),
('4024007105846','6','5617','0','1995-12-09 11:22:27','42.1297','0'),
('4556122129141042','4','95613','0','2012-08-20 04:33:12','95.5311','0'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

