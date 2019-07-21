-- ДЗ к уроку 6 Гладышев ВВ 
USE vk;

/*	Запросы по БД vk
	Запросы необходимо строить с использованием JOIN ! 
(SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE messages.from_user_id = users.id)    
-- Задача 1
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользоваетелем.*/

-- V1
SELECT 
    (SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE mess.from_user_id = users.id) AS sp_friend, 
    COUNT(*) AS cnt
  FROM (SELECT from_user_id FROM messages WHERE to_user_id = 1) mess 
  JOIN (SELECT friend_id FROM friendship WHERE user_id = 1) fr
  ON mess.from_user_id = fr.friend_id
  GROUP BY mess.from_user_id
  ORDER BY cnt DESC
  LIMIT 1;

-- V2
SELECT 
    (SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE messages.from_user_id = users.id) AS sp_friend, 
    COUNT(*) AS cnt
  FROM messages 
  JOIN (SELECT friend_id FROM friendship WHERE user_id = 1) fr
  ON messages.from_user_id = fr.friend_id
  WHERE to_user_id = 1
  GROUP BY from_user_id
  ORDER BY cnt DESC
  LIMIT 1;

-- V3 corr
SELECT 
    (SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE messages.from_user_id = users.id) AS sp_friend, 
    COUNT(*) AS cnt
  FROM messages 
  JOIN friendship
  ON messages.from_user_id = friendship.friend_id AND to_user_id = 1 AND friendship.user_id = 1
  GROUP BY from_user_id
  ORDER BY cnt DESC
  LIMIT 1;

-- Задача 2
-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT 
	SUM(like_cnt.cnt) 
FROM (
	SELECT
		to_subject_id,
		COUNT(*) AS cnt, 
		TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age
	  FROM likes
	  JOIN profiles
	  ON to_subject_id = profiles.user_id
	  GROUP BY to_subject_id
	  ORDER BY age
	  LIMIT 10) AS like_cnt;

-- test
SELECT
	to_subject_id,
    COUNT(*) AS cnt
  FROM likes
  GROUP BY to_subject_id
  ORDER BY cnt DESC;

-- Задача 3
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
	likes_grp.sex_gr AS sex_f,
    SUM(likes_grp.cnt) AS likes_count
FROM (
	SELECT
		from_user_id,
		COUNT(*) AS cnt,
        profiles.sex AS sex_gr
	  FROM likes
	  JOIN profiles
	  ON from_user_id = profiles.user_id
	  GROUP BY from_user_id) AS likes_grp
	GROUP BY likes_grp.sex_gr;

-- Задача 4
-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT 
	(SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE users.id = likes.from_user_id) AS user,  
    COUNT(*) AS cnt
  FROM 	users
  LEFT JOIN likes
  ON users.id = likes.from_user_id
  LEFT JOIN messages
  ON users.id = messages.from_user_id
  LEFT JOIN friendship
  ON users.id = friendship.user_id
  GROUP BY users.id
  ORDER BY cnt
  LIMIT 10;
 
-- tests 
SELECT from_user_id, COUNT(*)
  FROM messages
  GROUP BY from_user_id;
  
SELECT from_user_id, COUNT(*)
  FROM likes
  GROUP BY from_user_id;

SELECT user_id, COUNT(*)
  FROM friendship
  GROUP BY user_id; 

-- services
SELECT * FROM users;
SELECT * FROM messages;
SELECT * FROM friendship;
SELECT * FROM likes;
SELECT * FROM profiles;

TRUNCATE users;
TRUNCATE messages;
TRUNCATE friendship;

SELECT friend_id FROM friendship WHERE user_id = 1;
SELECT from_user_id FROM messages WHERE to_user_id = 1;
SELECT from_user_id, COUNT(*) FROM messages WHERE to_user_id = 1 GROUP BY from_user_id;

INSERT INTO 
	friendship (user_id, friend_id, status) 
VALUES
	(1, 2, 'conf'),
    (2, 1, 'conf'),
    (3, 1, 'conf'),
    (1, 3, 'conf'),
	(2, 3, 'conf'),
    (3, 2, 'conf'),
	(5, 4, 'conf'),
    (6, 5, 'conf'),
	(4, 5, 'conf'),
    (5, 6, 'conf'),
    (7, 4, 'conf');
    
SET @var := 0;
SELECT @var := @var + NULL;
