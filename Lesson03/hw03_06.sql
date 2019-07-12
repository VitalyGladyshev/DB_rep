CREATE DATABASE sample_05;

USE sample_05;

CREATE TABLE IF NOT EXISTS users(
id SERIAL PRIMARY KEY,
name VARCHAR(45),
birth_date DATE
);

-- TRUNCATE users;
INSERT INTO 
	users(name, birth_date)
VALUES
	('Алексей',		'1993-10-15'),
	('Николай',		'1979-11-03'),
    ('Константин',	'1989-05-12'),
    ('Фёдор',		'1998-12-05'),
	('Алексей',		'1994-07-18'),
	('Николай',		'1977-11-04'),
    ('Константин',	'1987-04-13'),
    ('Фёдор',		'1996-10-08'),
	('Алексей',		'2001-10-21'),
	('Николай',		'1974-11-23'),
    ('Константин',	'2003-05-09'),
    ('Фёдор',		'1995-12-19');

SELECT WEEKDAY(CONCAT(YEAR(NOW()), SUBSTRING(birth_date, 5))) AS current_weekday, COUNT(*) AS birth_day_number FROM users GROUP BY current_weekday ORDER BY current_weekday;

SELECT
	(WEEKDAY(CONCAT(YEAR(NOW()), SUBSTRING(birth_date, 5))) + 1) AS day_ind,
    CASE WEEKDAY(CONCAT(YEAR(NOW()), SUBSTRING(birth_date, 5)))
		WHEN 0 THEN 'Понедельник'
        WHEN 1 THEN 'Вторник'
        WHEN 2 THEN 'Среда'
        WHEN 3 THEN 'Четверг'
        WHEN 4 THEN 'Пятница'
        WHEN 5 THEN 'Суббота'
        WHEN 6 THEN 'Воскресенье'
    END AS current_weekday,
    COUNT(*) AS birth_day_number 
FROM 
	users 
GROUP BY 
	current_weekday 
ORDER BY 
	day_ind;