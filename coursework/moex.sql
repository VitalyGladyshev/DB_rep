-- Курсовая работа Гладышева ВВ
/* База данных MOEX
Воспроизведена структура клиетской части ММВБ
Таблица clientele содержит список счетов клиента для сделок на разных рынках. Предусмотрен возможность использовать ИИС
Таблица profiles содержит личные данные клиентов
Таблицы brokerage_accounts, derivatives_accounts, currency_accounts содержат данные о счетах клиентов в т.ч. ИИС на фондовом, срочном и валютном рынках
Таблицы stock_market, derivatives_market, currency_market содержат данные о сделках клиентов на фондовом, срочном и валютном рынках
Таблицы stock_market_securities, derivatives_market_securities, currencies содержат данные об инструментах фондового, срочного и валютного рынков
*/

CREATE DATABASE IF NOT EXISTS moex;

USE moex;

-- Таблица клиентов
CREATE TABLE IF NOT EXISTS clientele(
	id SERIAL PRIMARY KEY,
	stock_acc BIGINT UNSIGNED UNIQUE,		-- brokerage account for stock market
    deriv_acc BIGINT UNSIGNED UNIQUE,			-- derivatives market
    curr_acc BIGINT UNSIGNED UNIQUE,			-- currency market
    -- ii_stock_acc BIGINT UNSIGNED UNIQUE,	-- individual investment account - ИИС
    -- ii_deriv_acc BIGINT UNSIGNED UNIQUE,		-- ИИС derivatives market
    -- ii_curr_acc BIGINT UNSIGNED UNIQUE,			-- ИИС currency market
    bank_account BIGINT UNSIGNED UNIQUE,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);

-- Таблица профилей клиентов
CREATE TABLE IF NOT EXISTS profiles(
	client_id SERIAL PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	patronymic VARCHAR(50) NOT NULL,	
    email VARCHAR(120) NOT NULL UNIQUE,  
	sex CHAR(1) NOT NULL,
	birthday DATE,
	hometown VARCHAR(100) DEFAULT 'Москва',
	CONSTRAINT profiles_client_id_fk FOREIGN KEY (client_id) REFERENCES clientele(id)
);

-- Таблица брокерских счетов
CREATE TABLE IF NOT EXISTS brokerage_accounts(
	stock_acc SERIAL PRIMARY KEY,
    ind_inv BOOL,
    active_stat BOOL,
    cash BIGINT,
    updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
    leverage BOOL,
    CONSTRAINT brokerage_accounts_stock_acc_fk FOREIGN KEY (stock_acc) REFERENCES clientele(stock_acc)
);

-- Таблица счетов срочного рынка
CREATE TABLE IF NOT EXISTS derivatives_accounts(
	deriv_acc SERIAL PRIMARY KEY,
    ind_inv BOOL,
    active_stat BOOL,
    cash BIGINT,
    updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
    leverage BOOL,
    coverage INT,
    CONSTRAINT derivatives_accounts_deriv_acc_fk FOREIGN KEY (deriv_acc) REFERENCES clientele(deriv_acc)
);

-- Таблица счетов валютного рынка
CREATE TABLE IF NOT EXISTS currency_accounts(
	curr_acc SERIAL PRIMARY KEY,
    ind_inv BOOL,
    active_stat BOOL,
    updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
    leverage BOOL,
    CONSTRAINT currency_accounts_curr_acc_fk FOREIGN KEY (curr_acc) REFERENCES clientele(curr_acc)
);

-- Таблица сделок фондового рынка
DROP TABLE stock_market;
CREATE TABLE IF NOT EXISTS stock_market(
	stock_acc BIGINT UNSIGNED,
    sm_security INT UNSIGNED NOT NULL,
    volume INT NOT NULL,	-- отрицательный volume это продажа
    income DATETIME,
    unit_price INT NOT NULL,
    PRIMARY KEY (stock_acc, sm_security, income),
    CONSTRAINT stock_market_stock_acc_fk FOREIGN KEY (stock_acc) REFERENCES brokerage_accounts(stock_acc),
    CONSTRAINT stock_market_sm_security_fk FOREIGN KEY (sm_security) REFERENCES stock_market_securities(stock_security_id)
);

-- Таблица сделок срочного рынка
DROP TABLE derivatives_market;
CREATE TABLE IF NOT EXISTS derivatives_market(
	deriv_acc BIGINT UNSIGNED,
    dm_security INT UNSIGNED NOT NULL,
    volume INT NOT NULL,	-- отрицательный volume это продажа
    income DATETIME,
    unit_price INT NOT NULL,
    PRIMARY KEY (deriv_acc, dm_security, income),
    CONSTRAINT derivatives_market_deriv_acc_fk FOREIGN KEY (deriv_acc) REFERENCES derivatives_accounts(deriv_acc),
    CONSTRAINT derivatives_market_dm_security_fk FOREIGN KEY (dm_security) REFERENCES derivatives_market_securities(deriv_security_id)
);

-- Таблица сделок валютного рынка
DROP TABLE currency_market;
CREATE TABLE IF NOT EXISTS currency_market(
	curr_acc BIGINT UNSIGNED,
    currency INT UNSIGNED NOT NULL,
    volume INT NOT NULL,	-- отрицательный volume это продажа
    income DATETIME,
    unit_price INT NOT NULL,
    PRIMARY KEY (curr_acc, currency, income),
    CONSTRAINT currency_market_curr_acc_fk FOREIGN KEY (curr_acc) REFERENCES currency_accounts(curr_acc),
    CONSTRAINT currency_market_currency_fk FOREIGN KEY (currency) REFERENCES currencies(currency_id)
);

-- Таблица ценных бумаг фондового рынка
DROP TABLE stock_market_securities;
CREATE TABLE IF NOT EXISTS stock_market_securities(
	stock_security_id INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
	stock_security_name VARCHAR(50),
    stock_security_name_full VARCHAR(50),
    stock_security_name_tiny VARCHAR(15),
    stock_security_code VARCHAR(8)
);

-- Таблица ценных бумаг срочного рынка
DROP TABLE derivatives_market_securities;
CREATE TABLE IF NOT EXISTS derivatives_market_securities(
	deriv_security_id INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    deriv_security_name VARCHAR(50),
    deriv_security_name_full VARCHAR(50),
    deriv_security_name_tiny VARCHAR(15),
    deriv_security_code VARCHAR(8)
);

-- Таблица валюта
DROP TABLE currencies;
CREATE TABLE IF NOT EXISTS currencies(
	currency_id INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_name_full VARCHAR(50),
    currency_name_tiny VARCHAR(15),
    currency_code VARCHAR(15)
);
