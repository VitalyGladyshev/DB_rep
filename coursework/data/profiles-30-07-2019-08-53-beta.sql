-- Generation time: Tue, 30 Jul 2019 08:53:43 +0000
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

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `client_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `patronymic` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `sex` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` VALUES ('1','Josianne','Gerlach','Brakus','adeline.senger@example.org','t','1978-01-21','East Danika'),
('2','Amaya','Mante','Thiel','bboyer@example.net','r','1975-04-22','Kubmouth'),
('3','Grady','Dare','Weimann','smurray@example.net','z','1988-01-09','Stephaniashire'),
('4','Curtis','Simonis','Willms','maybelle35@example.com','c','2002-06-15','Beierview'),
('5','Colleen','Kunde','Lesch','ziemann.cleveland@example.com','l','1971-11-10','New Annaberg'),
('6','Guiseppe','Dooley','Bernier','nona.powlowski@example.com','j','2004-03-20','Dominiquehaven'),
('7','Consuelo','Dietrich','Pacocha','ana.wiegand@example.org','a','2004-10-02','Port Kathryne'),
('8','Maureen','Paucek','Rolfson','arvilla.feil@example.org','m','1972-07-26','Bergstrommouth'),
('9','Celine','Larkin','Balistreri','leila54@example.net','j','1998-05-23','West Archibaldville'),
('10','Olga','Emmerich','Botsford','eschmeler@example.com','y','1970-09-12','Devanside'),
('11','Andre','Lindgren','Ritchie','malinda.hilll@example.net','o','1991-03-28','West Johnpaulchester'),
('12','Mazie','Rogahn','Rutherford','marisa.goodwin@example.com','d','2011-10-10','O\'Keefeville'),
('13','Sabryna','Treutel','Stiedemann','ebernhard@example.com','o','1975-11-21','Verliefurt'),
('14','Belle','Runte','Borer','waylon19@example.com','c','1982-01-18','Wisokyfort'),
('15','Joan','DuBuque','Ledner','jaylin64@example.org','w','1977-04-01','North Chanel'),
('16','Concepcion','D\'Amore','Lueilwitz','shields.ashlynn@example.com','g','2017-07-24','Lake Earl'),
('17','Demarcus','Treutel','Zemlak','dickinson.kenya@example.org','r','1990-06-11','Torphyside'),
('18','River','Gulgowski','Parker','kschimmel@example.com','a','2003-03-08','McDermottberg'),
('19','Leatha','Jakubowski','Mitchell','hope62@example.org','z','1984-08-08','Sydnistad'),
('20','Emil','Streich','Wisoky','anabel.yundt@example.com','n','2009-03-17','Blandafurt'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

