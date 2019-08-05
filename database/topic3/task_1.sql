-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

-- создаем исходные данные
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at DATETIME,
    update_at DATETIME
);

INSERT INTO users (name) VALUES
    ('Kate'),
    ('Tom'),
    ('Jon');

SELECT * FROM users;


-- заполним пустые поля created_at, update_at текущей датой
UPDATE users SET created_at = NOW(), update_at = NOW();

SELECT * FROM users;