CREATE DATABASE hw03_03;

USE hw03_03;

DROP TABLE storehouses_products;
CREATE TABLE IF NOT EXISTS storehouses_products (
	id SERIAL PRIMARY KEY,
    value INT UNSIGNED NOT NULL DEFAULT 0
);

INSERT INTO
	storehouses_products (value) 
VALUES 
	(0),
	(2500),
	(0),
	(30),
	(500),
	(1);

SELECT value FROM storehouses_products WHERE value > 0 ORDER BY value;
SELECT COUNT(value) FROM storehouses_products;
(SELECT value FROM storehouses_products WHERE value > 0 ORDER BY value LIMIT (SELECT COUNT(value) FROM storehouses_products))
UNION ALL
SELECT value FROM storehouses_products WHERE value = 0;

