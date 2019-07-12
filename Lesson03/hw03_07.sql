CREATE DATABASE sample_06;

USE sample_06;

CREATE TABLE IF NOT EXISTS numbers(
-- id SERIAL PRIMARY KEY,
value INT
);

INSERT INTO 
	numbers(value)
VALUES
	(2),
	(3),
    (5),
    (-1);
    
SELECT EXP(SUM(LN(value))) FROM numbers;    
    