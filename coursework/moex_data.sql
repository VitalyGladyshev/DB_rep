-- Курсовая работа Гладышева ВВ
-- Набор данных для БД MOEX

USE moex;

TRUNCATE clientele;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

-- Таблица клиентов
INSERT INTO `clientele` VALUES 
('1','5291833154390056','5132768160943622','4539865194523313','4539472477867','2016-05-29 20:28:02','2017-12-04 16:20:10'),
('2','5296320147885895','6011174607214955','4024007105846','5405263701791015','2000-08-05 17:08:47','2006-11-30 10:23:30'),
('3','4916250573029264','5152794546900431','346849589866338','5292749199840242','1971-07-19 00:54:45','2017-09-27 18:33:16'),
('4','4716558437137','5452351160126677','345894160655763','6011034091030513','2012-09-10 08:43:51','1986-01-08 05:46:11'),
('5','5554757265746536','5410954211352940','4556122129141042','5486655049859971','1985-12-08 22:42:19','2005-01-06 12:01:37');
/*('6','5452527075994848','4716045742476609','4024007173964','4556992794612200','6011426929714902','6011744797688100','4024007136647','1979-11-18 14:38:37','1999-08-26 03:53:48'),
('7','375782706543877','4947412985650737','5479521355575331','6011111228251566','5215132289116295','5508170461363529','4539315594528','1981-07-11 22:37:45','1996-01-19 17:44:14'),
('8','4539092838778','4024007180006','4539756110199381','4485765622303','4532013509943543','5101933783195570','5443018893746029','1971-10-03 07:28:17','1992-11-20 22:53:17'),
('9','5361359250255741','4385043074318388','6011115367019591','5548023802972586','4485932341679','5292650192585875','4716083174425053','1996-01-01 02:59:15','2004-12-26 14:56:10'),
('10','4929126084901','5272303790906855','4929942480959','5390099439125713','5306410399875883','4916519122044648','5203883764941351','2001-04-05 07:07:49','1995-01-18 22:15:47'),
('11','5452600049593275','5131259798224900','5239064081281141','5297742719877376','5116214170891695','4716856230716','340206546656000','1978-07-09 00:41:57','1997-05-05 20:26:52'),
('12','4532926224524999','4024007151802168','5477171446972314','5268989240218355','5134468932578020','378001445406685','5579683817398552','1993-04-22 14:59:39','2003-04-08 06:14:45'),
('13','341593140105270','6011576751445897','5177773769194398','5596023280653806','5146345320330766','5531905997710596','4556085980746354','1995-07-19 13:37:21','1991-05-31 13:41:34'),
('14','6011961602541879','5503940324059464','4929372378713141','5402007505366005','4556833164988775','4556167585078','349476604853158','1999-08-09 06:24:26','2011-08-05 05:23:03'),
('15','4532095662000','5189345725743814','5173956795936420','5246318951036470','5390747105903694','4024007163248','6011138136355288','1980-04-30 07:23:02','1977-01-31 01:40:08'),
('16','4024007174306','5181673376601772','342778745932484','5372423320252362','4539539064948545','5167722047887747','370930761276381','1971-09-16 09:07:13','1973-03-23 22:18:50'),
('17','4024007146424439','4131710188811635','5165105184483831','5568406531569487','4532396145097906','5222101567275631','4024007195270390','2003-04-09 02:20:06','1989-12-02 05:51:28'),
('18','5222670576399967','4539655937271','5230406893781115','5335387815303394','4716423419736','5130909407683343','4929077512900107','2011-01-08 09:21:23','1998-10-11 08:03:47'),
('19','6011049264575868','4539024212375769','4539225843464','4024007146036','6011984678418580','5582603413923741','372790668310864','1995-07-14 07:09:07','1975-11-12 00:31:37'),
('20','4716652935238793','4929393333830544','4539453104762','346444853637869','6011686087981621','344035285232054','4418050879151700','2010-05-27 19:23:23','1974-01-25 05:54:42'); */
SELECT * FROM clientele;

-- Таблица профилей клиентов
TRUNCATE profiles;
INSERT INTO `profiles` VALUES 
('1','Josianne','Gerlach','Brakus','adeline.senger@example.org','f','1978-01-21','East Danika'),
('2','Amaya','Mante','Thiel','bboyer@example.net','f','1975-04-22','Kubmouth'),
('3','Grady','Dare','Weimann','smurray@example.net','f','1988-01-09','Stephaniashire'),
('4','Curtis','Simonis','Willms','maybelle35@example.com','m','2002-06-15','Beierview'),
('5','Colleen','Kunde','Lesch','ziemann.cleveland@example.com','m','1971-11-10','New Annaberg');
/*('6','Guiseppe','Dooley','Bernier','nona.powlowski@example.com','f','2004-03-20','Dominiquehaven'),
('7','Consuelo','Dietrich','Pacocha','ana.wiegand@example.org','m','2004-10-02','Port Kathryne'),
('8','Maureen','Paucek','Rolfson','arvilla.feil@example.org','m','1972-07-26','Bergstrommouth'),
('9','Celine','Larkin','Balistreri','leila54@example.net','f','1998-05-23','West Archibaldville'),
('10','Olga','Emmerich','Botsford','eschmeler@example.com','f','1970-09-12','Devanside'),
('11','Andre','Lindgren','Ritchie','malinda.hilll@example.net','m','1991-03-28','West Johnpaulchester'),
('12','Mazie','Rogahn','Rutherford','marisa.goodwin@example.com','m','2011-10-10','O\'Keefeville'),
('13','Sabryna','Treutel','Stiedemann','ebernhard@example.com','f','1975-11-21','Verliefurt'),
('14','Belle','Runte','Borer','waylon19@example.com','f','1982-01-18','Wisokyfort'),
('15','Joan','DuBuque','Ledner','jaylin64@example.org','f','1977-04-01','North Chanel'),
('16','Concepcion','D\'Amore','Lueilwitz','shields.ashlynn@example.com','f','2017-07-24','Lake Earl'),
('17','Demarcus','Treutel','Zemlak','dickinson.kenya@example.org','m','1990-06-11','Torphyside'),
('18','River','Gulgowski','Parker','kschimmel@example.com','m','2003-03-08','McDermottberg'),
('19','Leatha','Jakubowski','Mitchell','hope62@example.org','f','1984-08-08','Sydnistad'),
('20','Emil','Streich','Wisoky','anabel.yundt@example.com','m','2009-03-17','Blandafurt');*/
SELECT * FROM profiles;

-- Таблица брокерских счетов
INSERT INTO `brokerage_accounts` VALUES 
(5291833154390056,FALSE,TRUE,100000,'2017-12-04 16:20:10',TRUE),
(5296320147885895,FALSE,TRUE,200000,'2006-11-30 10:23:30',FALSE),
(4916250573029264,FALSE,TRUE,300000,'2017-09-27 18:33:16',TRUE),
(4716558437137,FALSE,TRUE,400000,'1986-01-08 05:46:11',FALSE),
(5554757265746536,FALSE,TRUE,500000,'2005-01-06 12:01:37',TRUE);
/*(5452527075994848,FALSE,TRUE,600000,'1999-08-26 03:53:48',FALSE),
(375782706543877,FALSE,TRUE,700000,'1996-01-19 17:44:14',TRUE),
(4539092838778,FALSE,TRUE,800000,'1992-11-20 22:53:17',FALSE),
(5361359250255741,FALSE,TRUE,900000,'2004-12-26 14:56:10',TRUE),
(4929126084901,FALSE,TRUE,1000000,'1995-01-18 22:15:47',FALSE),
(4716249593786,TRUE,TRUE,100000,'2017-12-04 16:20:10',TRUE),
(4716842821678222,TRUE,TRUE,200000,'2006-11-30 10:23:30',FALSE),
(6011149827839344,TRUE,TRUE,300000,'2017-09-27 18:33:16',TRUE),
(5135525754756605,TRUE,TRUE,400000,'1986-01-08 05:46:11',FALSE),
(4024007144379,TRUE,TRUE,500000,'2005-01-06 12:01:37',TRUE),
(4556992794612200,TRUE,TRUE,600000,'1999-08-26 03:53:48',FALSE),
(6011111228251566,TRUE,TRUE,700000,'1996-01-19 17:44:14',TRUE),
(4485765622303,TRUE,TRUE,800000,'1992-11-20 22:53:17',TRUE),
(5548023802972586,TRUE,TRUE,900000,'2004-12-26 14:56:10',FALSE),
(5390099439125713,TRUE,TRUE,1000000,'1995-01-18 22:15:47',TRUE);*/
SELECT * FROM brokerage_accounts;

-- Таблица счетов срочного рынка
INSERT INTO `derivatives_accounts` VALUES 
(5132768160943622,FALSE,TRUE,100000,'2017-12-04 16:20:10',TRUE,TRUE),
(6011174607214955,FALSE,TRUE,200000,'2006-11-30 10:23:30',FALSE,TRUE),
(5152794546900431,FALSE,TRUE,300000,'2017-09-27 18:33:16',TRUE,TRUE),
(5452351160126677,FALSE,TRUE,400000,'1986-01-08 05:46:11',FALSE,FALSE),
(5410954211352940,FALSE,TRUE,500000,'2005-01-06 12:01:37',TRUE,FALSE);
SELECT * FROM derivatives_accounts;

-- Таблица счетов валютного рынка
INSERT INTO `currency_accounts` VALUES 
(4539865194523313,FALSE,TRUE,'2017-12-04 16:20:10',TRUE),
(4024007105846,FALSE,TRUE,'2006-11-30 10:23:30',FALSE),
(346849589866338,FALSE,TRUE,'2017-09-27 18:33:16',TRUE),
(345894160655763,FALSE,TRUE,'1986-01-08 05:46:11',FALSE),
(4556122129141042,FALSE,TRUE,'2005-01-06 12:01:37',TRUE);
SELECT * FROM derivatives_accounts;



-- Таблица ценных бумаг фондового рынка
INSERT INTO stock_market_securities 
	(stock_security_name, stock_security_name_full, stock_security_name_tiny, stock_security_code) 
VALUES 
	("MSNG [TQBR]","МосЭнерго акции обыкн.","+МосЭнерго","MSNG"), 
	("AGRO [TQBR]","ГДР ROS AGRO PLC ORD SHS","AGRO-гдр","AGRO"), 
	("ENPL [TQBR]","ГДР МКПАО ЭН+ ГРУП ORD SHS","ENPL-гдр","ENPL"), 
	("FIVE [TQBR]","ГДР X5 RetailGroup N.V.ORD SHS","FIVE-гдр","FIVE"), 
	("POLY [TQBR]","Polymetal International plc","Polymetal","POLY"), 
	("RUAL [TQBR]","United Company RUSAL Plc","RUSAL plc","RUAL"), 
	("RAVN [TQBR]","Raven Property Group Limited","Raven","RAVN"), 
	("YNDX [TQBR]","PLLC Yandex N.V. class A shs","Yandex clA","YNDX"), 
	("QIWI [TQBR]","QIWI PLC","iQIWI","QIWI"), 
	("UNAC [TQBR]","Об.авиастр.корп. ПАО ао","iАвиастКао","UNAC"), 
	("DZRD [TQBR]","Донской завод радиодеталей ао","iДонскЗР","DZRD"), 
	("DZRDP [TQBR]","Донской завод радиодеталей ап","iДонскЗР п","DZRDP"), 
	("ISKJ [TQBR]","ПАО ИСКЧ","iИСКЧ ао","ISKJ"), 
	("LVHK [TQBR]","Левенгук ОАО ао","iЛевенгук","LVHK"), 
	("NAUK [TQBR]","НПО Наука ао","iНПОНаука","NAUK"), 
	("LIFE [TQBR]","Фармсинтез ПАО ао","iФармсинтз","LIFE"), 
	("ALRS [TQBR]","АЛРОСА ПАО ао","АЛРОСА ао","ALRS"), 
	("ALNU [TQBR]","АЛРОСА-Нюрба ПАО ао","АЛРОСА-Нюр","ALNU"), 
	("ABRD [TQBR]","Абрау-Дюрсо ПАО ао","АбрауДюрсо","ABRD"), 
	("AVAN [TQBR]","АКБ АВАНГАРД ПАО ао","Авангрд-ао","AVAN"), 
	("AKRN [TQBR]","Акрон ПАО ао","Акрон","AKRN"), 
	("APTK [TQBR]","ПАО Аптечная сеть 36,6 ао","Аптеки36и6","APTK"), 
	("ARSA [TQBR]","УК Арсагера ПАО-ао","Арсагера","ARSA"), 
	("ASSB [TQBR]","Астраханская ЭСК ПАО","АстрЭнСб","ASSB"), 
	("AMEZ [TQBR]","Ашинский метзавод ПАО ао","АшинскийМЗ","AMEZ"), 
	("AFLT [TQBR]","Аэрофлот-росс.авиалин(ПАО)ао","Аэрофлот","AFLT"), 
	("BSPB [TQBR]","ПАО Банк Санкт-Петербург ао","БСП ао","BSPB"), 

	("FTRE [TQBR]","Финансовая группа БУДУЩЕЕ ао","БУДУЩЕЕ ао","FTRE"), 
	("BISV [TQBR]","Башинформсвязь(ПАО) ао","БашИнСв ао","BISV"), 
	("BISVP [TQBR]","Башинформсвязь(ПАО) ап","БашИнСв ап","BISVP"), 
	("TORS [TQBR]","ао Томская распределит.комп.","ТРК ао","TORS"), 
	("TORSP [TQBR]","ап Томская распределит.комп.","ТРК ап","TORSP"), 
	("TASB [TQBR]","аоТамбов.энергсбыт.комп.ПАО","ТамбЭнСб","TASB"), 
	("TASBP [TQBR]","апТамбов.энергсбыт.комп.ПАО","ТамбЭнСб-п","TASBP"), 
	("TATN [TQBR]","ПАО Татнефть ао","Татнфт 3ао","TATN"), 
	("TATNP [TQBR]","ПАО Татнефть ап 3 вып.","Татнфт 3ап","TATNP"), 

	("CHKZ [TQBR]","ЧКПЗ ПАО ао","ЧКПЗ ао","CHKZ"), 
	("CHMK [TQBR]","ЧМК ПАО ао","ЧМК ао","CHMK"), 
	("CHEP [TQBR]","ЧТПЗ ПАО ао","ЧТПЗ ао","CHEP"), 
	("GCHE [TQBR]","Группа Черкизово ПАО-ао","ЧеркизГ-ао","GCHE"), 
	("ELTZ [TQBR]","Электроцинк ПАО ао","Электрцинк","ELTZ"), 
	("ENRU [TQBR]","Энел Россия ПАО","ЭнелРос ао","ENRU"), 
	("RKKE [TQBR]","РКК Энергия им.С.П.Королева ао","ЭнергияРКК","RKKE"), 
	("UTAR [TQBR]","Авиакомания ЮТэйр (ПАО) ао","ЮТэйр ао","UTAR"), 
	("UNKL [TQBR]","Южно-Уральский никел. комб. ао","ЮУНК ао","UNKL"), 
	("UKUZ [TQBR]","Южный Кузбасс ПАО ао","ЮжКузб. ао","UKUZ"), 
	("UPRO [TQBR]","Юнипро ПАО ао","Юнипро ао","UPRO"), 
	("YAKG [TQBR]","Якутская топл.-энерг. комп. ао","ЯТЭК ао","YAKG"), 
	("YKENP [TQBR]","АК Якутскэнерго (ПАО) ап","Якутскэн-п","YKENP"), 
	("YKEN [TQBR]","АК Якутскэнерго (ПАО) ао","Якутскэнрг","YKEN");
SELECT * FROM stock_market_securities;

-- Таблица ценных бумаг срочного рынка
INSERT INTO derivatives_market_securities 
	(deriv_security_name, deriv_security_name_full, deriv_security_name_tiny, deriv_security_code) 
VALUES 
	("AFU9 [SPBFUT]","AFLT-9.19","AFU9","AFU9"),
	("AFZ9 [SPBFUT]","AFLT-12.19","AFZ9","AFZ9"),
	("ALU9 [SPBFUT]","ALRS-9.19","ALU9","ALU9"),
	("ALZ9 [SPBFUT]","ALRS-12.19","ALZ9","ALZ9"),
	("AMQ9 [SPBFUT]","ALMN-8.19","AMQ9","AMQ9"),
	("AMU9 [SPBFUT]","ALMN-9.19","AMU9","AMU9"),
	("AMV9 [SPBFUT]","ALMN-10.19","AMV9","AMV9"),
	("AUU9 [SPBFUT]","AUDU-9.19","AUU9","AUU9"),
	("AUZ9 [SPBFUT]","AUDU-12.19","AUZ9","AUZ9"),
	("BRF0 [SPBFUT]","BR-1.20","BRF0","BRF0"),
	("BRG0 [SPBFUT]","BR-2.20","BRG0","BRG0"),
	("BRH0 [SPBFUT]","BR-3.20","BRH0","BRH0"),
	("BRJ0 [SPBFUT]","BR-4.20","BRJ0","BRJ0"),
	("BRK0 [SPBFUT]","BR-5.20","BRK0","BRK0"),
	("BRM0 [SPBFUT]","BR-6.20","BRM0","BRM0"),
	("BRN0 [SPBFUT]","BR-7.20","BRN0","BRN0"),
	("BRQ0 [SPBFUT]","BR-8.20","BRQ0","BRQ0"),
	("BRQ9 [SPBFUT]","BR-8.19","BRQ9","BRQ9"),
	("BRU9 [SPBFUT]","BR-9.19","BRU9","BRU9"),
	("BRV9 [SPBFUT]","BR-10.19","BRV9","BRV9"),
	("BRX0 [SPBFUT]","BR-11.20","BRX0","BRX0"),
	("BRX9 [SPBFUT]","BR-11.19","BRX9","BRX9"),
	("BRZ9 [SPBFUT]","BR-12.19","BRZ9","BRZ9"),
	("BWU9 [SPBFUT]","GBMW-9.19","BWU9","BWU9"),
	("CAU9 [SPBFUT]","UCAD-9.19","CAU9","CAU9"),
	("CAZ9 [SPBFUT]","UCAD-12.19","CAZ9","CAZ9"),
	("CFU9 [SPBFUT]","UCHF-9.19","CFU9","CFU9"),
	("CFZ9 [SPBFUT]","UCHF-12.19","CFZ9","CFZ9"),
	("CHU9 [SPBFUT]","CHMF-9.19","CHU9","CHU9"),
	("CHZ9 [SPBFUT]","CHMF-12.19","CHZ9","CHZ9");
SELECT * FROM derivatives_market_securities;    

-- Таблица валюта
INSERT INTO currencies 
	(currency_name, currency_name_full, currency_name_tiny, currency_code) 
VALUES 
	("EUR_RUB__TOD [CETS]","EURRUB_TOD - EUR/РУБ","EURRUB_TOD","EUR_RUB__TOD"),
	("EUR_RUB__TOM [CETS]","EURRUB_TOM - EUR/РУБ","EURRUB_TOM","EUR_RUB__TOM"),
	("EURUSDTODTOM [CETS]","EUR/USD_TODTOM - СВОП EUR/USD","EURUSDTDTM","EURUSDTODTOM"),
	("EUR000TODTOM [CETS]","EUR_TODTOM - СВОП EUR/РУБ","EUR_TODTOM","EUR000TODTOM"),
	("USD000000TOD [CETS]","USDRUB_TOD - USD/РУБ","USDRUB_TOD","USD000000TOD"),
	("USD000UTSTOM [CETS]","USDRUB_TOM - USD/РУБ","USDRUB_TOM","USD000UTSTOM"),
	("USD000TODTOM [CETS]","USD_TODTOM - СВОП USD/РУБ","USD_TODTOM","USD000TODTOM");
SELECT * FROM currencies;
