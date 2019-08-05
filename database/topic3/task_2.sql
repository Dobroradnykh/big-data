-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

-- создаем исходные данные
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at VARCHAR(16),
    update_at VARCHAR(19)
);

INSERT INTO users (name, created_at, update_at) VALUES
    ('Kate','20.10.2007 8:10','20.10.2007 8:10'),
    ('Tom', '2.1.2017 22:10', '20.10.2019 1:50'),
    ('Jon', '1.12.2000 0:00', '20.10.2007 20:00');

SELECT * FROM users;


-- создаем временную таблицу users_1 с верной структурой данных
CREATE TABLE users_1 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at DATETIME,
    update_at DATETIME
);


-- заполняем таблицу users_1 данными users с преобразованием полей created_at, update_at в DATETIME
INSERT INTO users_1
    SELECT
        id,
        name,
        STR_TO_DATE(created_at, '%d.%m.%Y %H:%i') as created_at,
        STR_TO_DATE(update_at, '%d.%m.%Y %H:%i') as updated_at
    FROM users;


-- заменяем таблицу users таблицей users_1
DROP TABLE users;
RENAME TABLE users_1 TO users;

SELECT * FROM users;