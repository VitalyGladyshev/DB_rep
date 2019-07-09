CREATE DATABASE sample_03;

USE sample_03;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users(
id SERIAL PRIMARY KEY,
name VARCHAR(45),
created_at DATETIME,
updated_at DATETIME
);

-- TRUNCATE users;
INSERT INTO users (id, name, created_at, updated_at) VALUES (1, 'Витктор', '2017.10.20 8:10', '2018.10.20 9:10');
INSERT INTO users (id, name, created_at, updated_at) VALUES (2, 'Игорь', '2017.10.20 9:10', '2018.10.20 10:10');
INSERT INTO users (id, name, created_at, updated_at) VALUES (3, 'Ниолай', '2018.01.20 10:10', '2018.10.20 11:10');
INSERT INTO users (id, name, created_at, updated_at) VALUES (4, 'Вячеслав', '2018.01.20 11:10', '2018.10.20 12:10');

SELECT id, name, created_at FROM users WHERE MONTHNAME(created_at) = 'October';
SELECT id, name, created_at FROM users WHERE MONTHNAME(created_at) = 'January';
