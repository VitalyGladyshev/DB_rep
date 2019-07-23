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
  SET NEW.total = NEW.processor + NEW.mother + NEW.memory;
END//

CREATE TRIGGER name_description_insert_control BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
  SET NEW.total = NEW.processor + NEW.mother + NEW.memory;
END//

DELIMITER ;

INSERT INTO products
  (processor, mother, memory)
VALUES
  (7890.00, 5060.00, 4800.00);

-- Задача 3
/*3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
Числами Фибоначчи называется последовательность в которой число равно сумме двух
предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.*/