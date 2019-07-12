CREATE DATABASE sample_04;

USE sample_04;

CREATE TABLE IF NOT EXISTS users(
id SERIAL PRIMARY KEY,
name VARCHAR(45),
birth_date DATE
);

-- TRUNCATE users;
INSERT INTO 
	users(name, birth_date)
VALUES
	('Алексей', '1993-10-15'),
	('Николай', '1979-11-03'),
    ('Константин', '1989-05-12'),
    ('Фёдор', '1998-12-05');
    
SELECT AVG((TO_DAYS(NOW()) - TO_DAYS(birth_date)) / 365.25) AS avg_age FROM users;
