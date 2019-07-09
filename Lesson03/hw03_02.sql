CREATE DATABASE sample_02;

USE sample_02;

CREATE TABLE IF NOT EXISTS users(
id SERIAL PRIMARY KEY,
name VARCHAR(45),
created_at VARCHAR(50),
updated_at VARCHAR(50)
);

INSERT INTO users (id, name, created_at, updated_at) VALUES (1, 'Витктор', '20.10.2017 8:10', '20.10.2018 9:10');
INSERT INTO users (id, name, created_at, updated_at) VALUES (2, 'Игорь', '20.11.2017 9:10', '20.10.2018 10:10');
INSERT INTO users (id, name, created_at, updated_at) VALUES (3, 'Ниолай', '20.12.2017 10:10', '20.10.2018 11:10');
INSERT INTO users (id, name, created_at, updated_at) VALUES (4, 'Вячеслав', '20.01.2018 11:10', '20.10.2018 12:10');

SELECT * FROM users;
