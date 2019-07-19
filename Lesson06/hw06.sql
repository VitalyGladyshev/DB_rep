-- ДЗ к уроку 6 Гладышев ВВ 
USE vk;

/*	Запросы по БД vk
	Запросы необходимо строить с использованием JOIN ! 
(SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE messages.from_user_id = users.id)    
-- Задача 1
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользоваетелем.*/

SELECT , COUNT(*)
  FROM messages
  JOIN users
  ON messages.to_user_id = users.id
  GROUP BY messages.to_user_id;

SELECT messages.from_user_id, messages.to_user_id
  FROM messages
  JOIN friendship
  ON messages.to_user_id = friendship.user_id
	GROUP BY messages.from_user_id;
--  ORDER BY messages.from_user_id;

SELECT 
	(SELECT CONCAT(lastname, ' ',  firstname) FROM users WHERE messages.from_user_id = users.id) AS friend_name, 
    COUNT(*) AS message_cnt
  FROM messages
  WHERE to_user_id = 1 
  GROUP BY from_user_id;

-- Задача 2
-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- Задача 3
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- Задача 4
-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

-- services
SELECT * FROM users;
SELECT * FROM messages;
SELECT * FROM friendship;

TRUNCATE friendship;

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