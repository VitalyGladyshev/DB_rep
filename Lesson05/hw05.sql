-- ДЗ к уроку 5 Гладышев ВВ 
USE shop;

-- Тема 5
-- Задача 5.1
SELECT (SELECT name FROM users WHERE orders.user_id = users.id) AS orders_owners FROM orders;

-- Задача 5.2
SELECT name, price, (SELECT name FROM catalogs WHERE products.catalog_id = catalogs.id) FROM products;

-- Задача 5.3
CREATE DATABASE IF NOT EXISTS flights;

USE flights;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
    from_city VARCHAR(45) NOT NULL,
    to_city VARCHAR(45) NOT NULL
);

INSERT INTO flights 
	(id, from_city, to_city)
VALUES
	(1, 'moscow', 'omsk'),
    (2, 'novgorod', 'kazan'),
    (3, 'irkutsk', 'moscow'),
    (4, 'omsk', 'irkutsk'),
    (5, 'moscow', 'kazan');
SELECT * FROM flights;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(45),
    name VARCHAR(45),
	PRIMARY KEY (label, name)
);

INSERT INTO cities 
	(label, name)
VALUES
	('moscow', 'Москва'),
    ('irkutsk', 'Иркутск'),
    ('novgorod', 'Новгород'),
    ('kazan', 'Казань'),
    ('omsk', 'Омск');
SELECT * FROM cities;

SELECT 
	id,
    (SELECT name FROM cities WHERE flights.from_city = cities.label) AS from_city,
	(SELECT name FROM cities WHERE flights.to_city = cities.label) AS to_city
FROM 
	flights
ORDER BY
	id;
    
-- Тема 6
-- Задача 6.1
CREATE DATABASE IF NOT EXISTS sample;

USE sample;

DROP TABLE users;
CREATE TABLE users SELECT * FROM shop.users WHERE shop.users.id = 1;
/*
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели'; */

TRUNCATE users;

START TRANSACTION;
SET @ind := 2;
INSERT INTO users
	(id, name, birthday_at)
VALUES
	((SELECT shop.users.id FROM shop.users WHERE shop.users.id = @ind),
    (SELECT shop.users.name FROM shop.users WHERE shop.users.id = @ind),
    (SELECT shop.users.birthday_at FROM shop.users WHERE shop.users.id = @ind)
    );

SET @ind = @ind + 1;
    
SET 
	@id := (SELECT shop.users.id FROM shop.users WHERE shop.users.id = @ind),
    @name := (SELECT shop.users.name FROM shop.users WHERE shop.users.id = @ind),
	@birthday_at := (SELECT	shop.users.birthday_at FROM shop.users WHERE shop.users.id = @ind);   
INSERT INTO users
	(id, name, birthday_at)
VALUES
	(@id, @name, @birthday_at);    
COMMIT;
SELECT * FROM users;

START TRANSACTION;
INSERT INTO users (id, name, birthday_at)
  SELECT shop.users.id, shop.users.name, shop.users.birthday_at
  FROM shop.users WHERE shop.users.id > 3 AND shop.users.id < 6;
COMMIT;
SELECT * FROM users;

-- Задача 6.2
