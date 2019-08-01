-- Курсовая работа Гладышева ВВ
/* скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы)
представления (минимум 2)
хранимые процедуры / триггеры*/

USE moex;

-- Представление - операции на фондовом рынке
DROP VIEW stock_market_ex;
CREATE VIEW stock_market_ex AS
SELECT 
    stock_market.stock_acc,
    CONCAT(profiles.lastname, ' ',  profiles.firstname) AS client, 
    stock_market_securities.stock_security_code AS security,
    operation_type(stock_market.buy) AS operation, 
    stock_market.price AS price,			-- CAST(stock_market.price AS DECIMAL(18,4))
    stock_market.income
FROM 
	stock_market 
LEFT JOIN stock_market_securities
ON stock_market.sm_security = stock_market_securities.stock_security_id
LEFT JOIN clientele
ON stock_market.stock_acc = clientele.stock_acc
LEFT JOIN profiles
ON profiles.client_id = clientele.id  
ORDER BY 
	stock_market.income;

SELECT * FROM stock_market_ex;

-- Представление - операции на срочном рынке
DROP VIEW derivatives_market_ex;
CREATE VIEW derivatives_market_ex AS
SELECT 
    derivatives_market.deriv_acc,
    CONCAT(profiles.lastname, ' ',  profiles.firstname) AS client, 
    derivatives_market_securities.deriv_security_code AS security,
    operation_type(derivatives_market.buy) AS operation, 
    derivatives_market.price AS price,
    derivatives_market.income
FROM 
	derivatives_market 
LEFT JOIN derivatives_market_securities
ON derivatives_market.dm_security = derivatives_market_securities.deriv_security_id
LEFT JOIN clientele
ON derivatives_market.deriv_acc = clientele.deriv_acc
LEFT JOIN profiles
ON profiles.client_id = clientele.id  
ORDER BY 
	derivatives_market.income;

SELECT * FROM derivatives_market_ex;

-- Представление - операции на валютном рынке
DROP VIEW currency_market_ex;
CREATE VIEW currency_market_ex AS
SELECT 
    currency_market.curr_acc,
    CONCAT(profiles.lastname, ' ',  profiles.firstname) AS client, 
    currencies.currency_code AS security,
    operation_type(currency_market.buy) AS operation,
    currency_market.price AS price,
    currency_market.income
FROM 
	currency_market 
LEFT JOIN currencies
ON currency_market.currency = currencies.currency_id
LEFT JOIN clientele
ON currency_market.curr_acc = clientele.curr_acc
LEFT JOIN profiles
ON profiles.client_id = clientele.id  
ORDER BY 
	currency_market.income;

SELECT * FROM currency_market_ex;

-- Представление - единая таблица всех операций
DROP VIEW summary_table;
CREATE VIEW summary_table AS
SELECT 
		stock_market.stock_acc,
		CONCAT(profiles.lastname, ' ',  profiles.firstname) AS client, 
		stock_market_securities.stock_security_code AS security,
		operation_type(stock_market.buy) AS operation, 
		stock_market.price AS price,
		stock_market.income AS date
	FROM 
		stock_market 
	LEFT JOIN stock_market_securities
	ON stock_market.sm_security = stock_market_securities.stock_security_id
	LEFT JOIN clientele
	ON stock_market.stock_acc = clientele.stock_acc
	LEFT JOIN profiles
	ON profiles.client_id = clientele.id  
UNION
SELECT 
		derivatives_market.deriv_acc,
		CONCAT(profiles.lastname, ' ',  profiles.firstname) AS client, 
		derivatives_market_securities.deriv_security_code AS security,
		operation_type(derivatives_market.buy) AS operation, 
		derivatives_market.price AS price,
		derivatives_market.income  AS date
	FROM 
		derivatives_market 
	LEFT JOIN derivatives_market_securities
	ON derivatives_market.dm_security = derivatives_market_securities.deriv_security_id
	LEFT JOIN clientele
	ON derivatives_market.deriv_acc = clientele.deriv_acc
	LEFT JOIN profiles
	ON profiles.client_id = clientele.id  
UNION
SELECT 
		currency_market.curr_acc,
		CONCAT(profiles.lastname, ' ',  profiles.firstname) AS client, 
		currencies.currency_code AS security,
		operation_type(currency_market.buy) AS operation, 
		currency_market.price AS price,
		currency_market.income AS date
	FROM 
		currency_market 
	LEFT JOIN currencies
	ON currency_market.currency = currencies.currency_id
	LEFT JOIN clientele
	ON currency_market.curr_acc = clientele.curr_acc
	LEFT JOIN profiles
	ON profiles.client_id = clientele.id  
	ORDER BY 
		date;

SELECT * FROM summary_table;

-- Номер счёта на фондовом рынке совершивший больше всех покупок
SELECT 
		stock_market.stock_acc, 
		COUNT(*) AS cnt
	FROM stock_market 
	JOIN brokerage_accounts
	ON stock_market.stock_acc = brokerage_accounts.stock_acc AND stock_market.buy = TRUE
	GROUP BY stock_market.stock_acc
	ORDER BY cnt DESC
	LIMIT 1;

-- Список клиентов упорядоченный по количеству продаж
SELECT 
		stock_market.stock_acc, 
		CONCAT(profiles.lastname, ' ',  profiles.firstname) AS client,
		COUNT(*) AS cnt
	FROM stock_market 
	JOIN brokerage_accounts
	ON stock_market.stock_acc = brokerage_accounts.stock_acc AND stock_market.buy = FALSE
	LEFT JOIN clientele
	ON stock_market.stock_acc = clientele.stock_acc
	LEFT JOIN profiles
	ON profiles.client_id = clientele.id 
	GROUP BY stock_market.stock_acc
    ORDER BY cnt DESC;

-- Количество операций по бумагам фондового рынка    
SELECT 
		stock_market_securities.stock_security_code AS security, 
		COUNT(*) AS cnt
    FROM 
		stock_market 
	LEFT JOIN stock_market_securities
	ON stock_market.sm_security = stock_market_securities.stock_security_id
    GROUP BY security
    ORDER BY cnt DESC;

-- Операции по бумаге DZRD в хронологическом порядке
SELECT 
		stock_market_securities.stock_security_code AS security,
		operation_type(stock_market.buy) AS operation, 
		stock_market.volume,
        stock_market.income AS date
    FROM 
		stock_market 
	LEFT JOIN stock_market_securities
	ON stock_market.sm_security = stock_market_securities.stock_security_id
    HAVING stock_market_securities.stock_security_code = 'DZRD'
    ORDER BY date;

-- Триггеры автоматически проставляют сумму сделки на основании количества и цены за единицу
DELIMITER //
CREATE TRIGGER stock_market_price_set BEFORE INSERT ON stock_market
FOR EACH ROW
BEGIN
	SET NEW.price = NEW.volume * NEW.unit_price;
END//

CREATE TRIGGER derivatives_market_price_set BEFORE INSERT ON derivatives_market
FOR EACH ROW
BEGIN
	SET NEW.price = NEW.volume * NEW.unit_price;
END//

CREATE TRIGGER currency_market_price_set BEFORE INSERT ON currency_market
FOR EACH ROW
BEGIN
	SET NEW.price = NEW.volume * NEW.unit_price;
END//
DELIMITER ;

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS operation_type;
DELIMITER //
CREATE FUNCTION operation_type(buy BOOL)
    RETURNS VARCHAR(7)
    NOT DETERMINISTIC
	BEGIN
		IF buy THEN
			RETURN "Покупка";
		ELSE
			RETURN "Продажа";
        END IF;        
	END //
DELIMITER ;
