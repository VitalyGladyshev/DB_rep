-- Задача 1
/*1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от
текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с
12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый
вечер", с 00:00 до 6:00 — "Доброй ночи". */

DROP FUNCTION IF EXISTS hello;
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //
CREATE FUNCTION hello()
    RETURNS VARCHAR(11)
    NOT DETERMINISTIC
	BEGIN
		DECLARE hour_now INT;
		SET hour_now = HOUR(NOW());
		IF hour_now BETWEEN 6 AND 11 THEN
			RETURN "Доброе утро";
		ELSEIF hour_now BETWEEN 12 AND 17 THEN
			RETURN "Добрый день";
		ELSEIF hour_now BETWEEN 18 AND 23 THEN
			RETURN "Добрый вечер";
		ELSEIF hour_now BETWEEN 0 AND 5 THEN
			RETURN "Доброй ночи";
		ELSE
			RETURN "Ошибка";
		END IF;
	END //

DELIMITER ;
SELECT hello();

-- Задача 2
/*2. В таблице products есть два текстовых поля: name с названием товара и description с его
описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля
принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь
того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям
NULL-значение необходимо отменить операцию.*/

USE shop;

DELIMITER //
CREATE TRIGGER name_description_insert_control BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled. name or description mast be not NULL';
	END IF;
END//

CREATE TRIGGER name_description_update_control BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    SET NEW.name = COALESCE(NEW.name, OLD.name);
    SET NEW.description = COALESCE(NEW.description, OLD.description);
END//
DELIMITER ;

SHOW TRIGGERS;
DROP TRIGGER IF EXISTS name_description_insert_control;
DROP TRIGGER IF EXISTS name_description_update_control;

DESCRIBE products;
SELECT id, name, description, price, catalog_id FROM products;

INSERT INTO products
  (id, name, description, price, catalog_id)
VALUES
  (8, "AsRock FX5-3220", "Материнская плата AsRock FX5-3220", 4800.00, 2);

INSERT INTO products
  (id, name, description, price, catalog_id)
VALUES
  (9, "AsRock FX7-5220", NULL, 4900.00, 2);

INSERT INTO products
  (id, name, description, price, catalog_id)
VALUES
  (9, "AsRock FX7-5220", "Материнская плата AsRock FX75-5220", 4900.00, 2);

-- Задача 3
/*3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
Числами Фибоначчи называется последовательность в которой число равно сумме двух
предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.*/

DROP FUNCTION IF EXISTS fibonacci;
DELIMITER //
CREATE FUNCTION fibonacci(iter INT)
    RETURNS BIGINT UNSIGNED
    NOT DETERMINISTIC
	BEGIN
        DECLARE op1 BIGINT DEFAULT 0;
        DECLARE op2 BIGINT DEFAULT 1;
		IF iter NOT BETWEEN 0 AND 92 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid input value. Must be between 0 and 92 inclusive';
		END IF;
		IF iter <=> 0 THEN
			RETURN op1;
		END IF;
		REPEAT
 			SET op1 = op1 + op2;
			SET iter = iter - 1;            
			IF iter <= 1 THEN
				RETURN op1;
			END IF;            
            SET op2 = op1 + op2;
			SET iter = iter - 1;            
        UNTIL iter <= 1
        END REPEAT;
        RETURN op2;
	END //
DELIMITER ;

/* с предвыравниванием
		REPEAT
 			SET op1 = op1 + op2;
            SET op2 = op1 + op2;
			SET iter = iter - 2;
        UNTIL iter <= 1
        END REPEAT;
        RETURN op2;
	END //	*/

SELECT fibonacci(11);

-- Задача 4
/*1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
catalogs и products в таблицу logs помещается время и дата создания записи, название
таблицы, идентификатор первичного ключа и содержимое поля name.*/

DROP TABLE IF EXISTS logs;
CREATE TABLE IF NOT EXISTS logs(
id SERIAL,
table_type VARCHAR(45),
entry_id BIGINT UNSIGNED,
entry_name VARCHAR(45),
created_at DATETIME
) ENGINE=ARCHIVE;

DELIMITER //
CREATE TRIGGER users_insert_to_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO 
		logs (table_type, entry_id, entry_name, created_at)
	VALUES
		('users', NEW.id, NEW.name, NEW.created_at);
END//

CREATE TRIGGER catalogs_insert_to_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO 
		logs (table_type, entry_id, entry_name, created_at)
	VALUES
		('catalogs', NEW.id, NEW.name, NOW());
END//

CREATE TRIGGER products_insert_to_log AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO 
		logs (table_type, entry_id, entry_name, created_at)
	VALUES
		('products', NEW.id, NEW.name, NEW.created_at);
END//
DELIMITER ;

INSERT INTO users (name, birthday_at) VALUES
  ('Игорь', '1995-11-05');

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-9100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 9890.00, 1);
  
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM logs;


-- Задача 5
/*2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/

DROP PROCEDURE IF EXISTS add_user;
DELIMITER //
CREATE PROCEDURE add_user(IN cnt INT)
	BEGIN
		INSERT INTO users (name, birthday_at) VALUES
			(CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW());
		SET cnt = cnt - 1;
        IF cnt > 0 THEN
			CALL add_user(cnt);
        END IF;
END // 
DELIMITER ;

SET max_sp_recursion_depth = 100;
CALL add_user(10);

DROP PROCEDURE IF EXISTS add_user_100;
DELIMITER //
CREATE PROCEDURE add_user_100(IN cnt INT)
	BEGIN
		WHILE cnt >= 1 DO
			INSERT INTO users (name, birthday_at) VALUES
				(CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
				(CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
				(CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
				(CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW()),
                (CONCAT('user_', DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')), NOW());
			SET cnt = cnt - 1;
        END WHILE;
END // 
DELIMITER ;

CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);
CALL add_user_100(1000);

TRUNCATE users;
SELECT * FROM users;
SELECT COUNT(*) FROM users;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  -- id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения'
  -- created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  -- updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP PROCEDURE IF EXISTS add_user_100_e;
DELIMITER //
CREATE PROCEDURE add_user_100_e(IN cnt INT)
    BEGIN
		WHILE cnt >= 1 DO
			INSERT INTO users (name, birthday_at) VALUES
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
				('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05'),
                ('user', '1990-10-05');
			SET cnt = cnt - 1;
        END WHILE;
END // 
DELIMITER ;

CALL add_user_100_e(2000);
CALL add_user_100_e(2000);
CALL add_user_100_e(2000);
CALL add_user_100_e(2000);
CALL add_user_100_e(2000);

