USE vk;

INSERT INTO users (id, firstname, lastname, email) VALUES (1, 'Витктор', 'Иванов', 'vi@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (2, 'Игорь', 'Петров', 'ip@mail.ru');
INSERT INTO users (id, firstname, lastname, email) VALUES (3, 'Николай', 'Сидоров', 'ns@mail.ru');

INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (1, 2, 'mess_text', TRUE, TRUE, '2018.10.20 9:10');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:11');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (3, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:12');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:13');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:14');
INSERT INTO messages (from_user_id, to_user_id, body, important, delivered, created_at) VALUES (2, 1, 'mess_text', TRUE, TRUE, '2018.10.20 9:15');

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
