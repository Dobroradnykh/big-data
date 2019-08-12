-- Транзакции, переменные, представления
-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

-- создаем бд и таблицы
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;

CREATE TABLE shop.users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO shop.users (name) VALUES
    ('Kate'),
    ('Jerry'),
    ('Mila'),
    ('Tom'),
    ('David'),
    ('Stark'),
    ('Jon');


DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;

CREATE TABLE sample.users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);


SELECT * FROM shop.users;
SELECT * FROM sample.users;


-- начинаем транзакцию по переносу данных
START TRANSACTION;

INSERT INTO sample.users  
    SELECT * FROM shop.users WHERE id = 1; 

DELETE FROM shop.users WHERE id = 1;

COMMIT;


SELECT * FROM shop.users;
SELECT * FROM sample.users;
