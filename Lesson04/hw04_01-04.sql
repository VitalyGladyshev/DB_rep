-- ДЗ к уроку 4 Гладышев ВВ 
USE vk;

-- Задача 1
SELECT 
	(SELECT 
		CONCAT(lastname, ' ',  firstname) 
	 FROM 
		users 
     WHERE 
		messages.from_user_id = users.id) AS name, 
    COUNT(from_user_id) AS messages_count
FROM 
	messages 
WHERE
	to_user_id = 1
GROUP BY 
	from_user_id LIMIT 1;

-- Задача 2
SELECT 	
	(SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE likes.to_subject_id = users.id) AS name, 
	COUNT(*) AS like_number,
    (SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) FROM profiles WHERE profiles.user_id = likes.to_subject_id) AS age    
FROM 
	likes 
GROUP BY 
	to_subject_id
ORDER BY
	age
LIMIT 10;

-- Задача 3
-- 3.1
SELECT
    IF((SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'm', 'Мужчины', 'Женщины') AS sex,
	COUNT(*) AS like_number	
FROM 
	likes
GROUP BY 
	sex;

-- 3.2    
SELECT
	IF( 
		(SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'f') > 
        (SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'm'), 'Женщины поставили лайков больше', 'Женщины не поставили лайков больше') AS res
FROM likes GROUP BY res
UNION
SELECT
	IF( 
		(SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'f') < 
        (SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'm'), 'Мужчины поставили лайков больше', 'Мужчины не поставили лайков больше') AS res
FROM likes GROUP BY res
UNION
SELECT
	IF( 
		(SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'f') = 
        (SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'm'), 'Лайков поровну', 'Лайков не поровну') AS res
FROM likes GROUP BY res;

SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'f';
SELECT COUNT(*) FROM likes WHERE (SELECT sex FROM profiles WHERE profiles.user_id = likes.from_user_id) = 'm';

-- Задача 4
SELECT 	
	(SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE likes.from_user_id = users.id) AS name,
	COUNT(*) AS like_number   
FROM 
	likes
GROUP BY 
	name
ORDER BY
	like_number
LIMIT 10;

-- data samples
INSERT INTO users (id, firstname, lastname, email) VALUES (1, 'Виктор', 'Иванов', 'vim@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (2, 'Игорь', 'Петров', 'ipm@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (3, 'Николай', 'Сидоров', 'nsm@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (4, 'Пётр', 'Иванов', 'pim@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (5, 'Константин', 'Петров', 'kpm@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (6, 'Вячеслав', 'Сидоров', 'vsm@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (7, 'Иван', 'Иванов', 'iim@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (8, 'Станислав', 'Петров', 'spm@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (9, 'Алексей', 'Сидоров', 'asm@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (10, 'Екатерина', 'Иванова', 'vif@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (11, 'Виктория', 'Петрова', 'ipf@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (12, 'Мария', 'Сидорова', 'nsf@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (13, 'Анна', 'Иванова', 'pif@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (14, 'Альбина', 'Петрова', 'kpf@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (15, 'Дарья', 'Сидорова', 'vsf@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (16, 'Татьяна', 'Иванова', 'iif@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (17, 'Вероника', 'Петрова', 'spf@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (18, 'Елизавета', 'Сидорова', 'asf@mail.ru');
SELECT * FROM users;

TRUNCATE messages;
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (1, 2, 'mess_text', TRUE, TRUE, '2018.10.20 9:10');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:11');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (3, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:12');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:13');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:14');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:15');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (1, 2, 'mess_text', TRUE, TRUE, '2018.10.20 9:16');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 3, 'mess_text', TRUE, TRUE, '2018.10.20 9:17');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (3, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:18');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (4, 5, 'mess_text', TRUE, TRUE, '2018.10.20 9:19');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (5, 6, 'mess_text', TRUE, TRUE, '2018.10.20 9:20');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (6, 7, 'mess_text', TRUE, TRUE, '2018.10.20 9:21');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (7, 4, 'mess_text', TRUE, TRUE, '2018.10.20 9:22');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (8, 2, 'mess_text', TRUE, TRUE, '2018.10.20 9:23');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (9, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:24');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (1, 5, 'mess_text', TRUE, TRUE, '2018.10.20 9:25');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 4, 'mess_text', TRUE, TRUE, '2018.10.20 9:26');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (3, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:27');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (4, 5, 'mess_text', TRUE, TRUE, '2018.10.20 9:28');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (5, 6, 'mess_text', TRUE, TRUE, '2018.10.20 9:29');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (6, 7, 'mess_text', TRUE, TRUE, '2018.10.20 9:30');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (7, 8, 'mess_text', TRUE, TRUE, '2018.10.20 9:31');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 3, 'mess_text', TRUE, TRUE, '2018.10.20 9:32');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:33');

INSERT INTO profiles (user_id, sex, birthday) VALUES (1, 'm', '1986.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (2, 'm', '1988.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (3, 'm', '1990.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (4, 'm', '1992.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (5, 'm', '1994.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (6, 'm', '1996.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (7, 'm', '1998.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (8, 'm', '2000.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (9, 'm', '2002.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (10, 'f', '1987.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (11, 'f', '1989.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (12, 'f', '1991.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (13, 'f', '1993.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (14, 'f', '1995.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (15, 'f', '1997.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (16, 'f', '1999.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (17, 'f', '2001.10.20');
INSERT INTO profiles (user_id, sex, birthday) VALUES (18, 'f', '2003.10.20');
SELECT * FROM profiles;
DESCRIBE profiles;

SELECT 
	CONCAT(lastname, ' ', firstname) AS name, 
    email, 
    (SELECT birthday FROM profiles WHERE profiles.user_id = users.id) AS birthday 
FROM 
	users;

-- TRUNCATE subject_types;
INSERT INTO subject_types (name) VALUES ('Котики');
INSERT INTO subject_types (name) VALUES ('Пользователь');
SELECT * FROM subject_types;

-- TRUNCATE likes;
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (1, 10, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (2, 11, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (3, 12, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (4, 13, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (5, 14, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (6, 15, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (7, 16, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (8, 17, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (9, 18, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (10, 1, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (11, 2, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (12, 3, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (13, 4, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (14, 5, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (15, 6, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (16, 7, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (17, 8, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (18, 9, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (1, 16, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (2, 15, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (3, 14, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (4, 13, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (5, 17, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (6, 18, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (7, 16, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (8, 17, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (9, 18, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (10, 5, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (11, 6, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (12, 7, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (13, 8, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (14, 9, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (15, 6, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (16, 7, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (17, 8, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (18, 9, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (1, 16, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (2, 15, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (3, 14, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (4, 13, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (5, 17, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (6, 18, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (7, 16, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (8, 17, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (9, 18, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (10, 5, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (11, 6, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (12, 7, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (13, 8, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (14, 9, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (15, 6, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (16, 7, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (17, 8, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (18, 9, 2);
INSERT INTO likes (from_user_id, to_subject_id, subject_type_id) VALUES (1, 16, 2);
SELECT * FROM likes;
DESCRIBE likes;