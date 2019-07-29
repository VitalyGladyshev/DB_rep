-- Курсовая работа Гладышева ВВ
-- Набор данных для БД MOEX

USE moex;

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

