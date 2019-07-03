-- Гладышев ВВ

USE media_storage;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
    type_id INT,
    name_pos VARCHAR(255),
    overview VARCHAR(255),
    path_id INT,
    user_id INT,
    tag_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS type_tab;
CREATE TABLE type_tab (
	type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(30)
);

INSERT IGNORE INTO type_tab VALUES
	(DEFAULT, 'Фильмы'),
    (DEFAULT, 'Музыка'),
    (DEFAULT, 'Фотографии');

SELECT * FROM type_tab;
    
DROP TABLE IF EXISTS path_tab;
CREATE TABLE path_tab (
	path_id SERIAL PRIMARY KEY,
    path_str VARCHAR(255)
);

DROP TABLE IF EXISTS user_tab;
CREATE TABLE user_tab (
	user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255)
); 

DROP TABLE IF EXISTS tag_tab;
CREATE TABLE tag_tab (
	tag_id SERIAL PRIMARY KEY,
    tag_str VARCHAR(30)
);
