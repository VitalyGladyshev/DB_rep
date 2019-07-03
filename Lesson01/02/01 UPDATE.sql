-- Гладышев ВВ

USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
    name_pos VARCHAR(255)
);

TRUNCATE catalogs;

INSERT IGNORE INTO catalogs VALUES
	(DEFAULT, 'Процессоры'),
    (DEFAULT, 'Мат. платы'),
    (DEFAULT, ''),
    (DEFAULT, NULL),
    (DEFAULT, 'Видеокарты');

SET SQL_SAFE_UPDATES = 0;

UPDATE 
	catalogs
SET 
	name_pos = 'empty' 
WHERE
	name_pos IS NULL OR name_pos = '';

SELECT * FROM catalogs;
