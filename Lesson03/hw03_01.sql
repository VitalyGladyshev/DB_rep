CREATE DATABASE sample_01;

USE sample_01;

CREATE TABLE IF NOT EXISTS users(
id SERIAL PRIMARY KEY,
name VARCHAR(45),
created_at DATETIME,
updated_at DATETIME
);

INSERT INTO users (id, name) VALUES (1, 'Витктор');
INSERT INTO users (id, name) VALUES (2, 'Игорь');

SET SQL_SAFE_UPDATES = 0;

SELECT created_at FROM users WHERE created_at IS NULL;
UPDATE users SET created_at = NOW() WHERE created_at IS NULL;

SELECT updated_at FROM users WHERE updated_at IS NULL;
UPDATE users SET updated_at = NOW() WHERE updated_at IS NULL;

SELECT * FROM users;
