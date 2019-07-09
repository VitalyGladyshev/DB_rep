CREATE DATABASE hw03_03;

USE hw03_03;

DROP TABLE IF EXISTS storehouses_products;
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

SET @row_count = NULL;
SELECT @row_count := COUNT(*) FROM storehouses_products;

(SELECT value FROM storehouses_products WHERE value > 0 ORDER BY value LIMIT 999999)
UNION ALL
SELECT value FROM storehouses_products WHERE value = 0;
