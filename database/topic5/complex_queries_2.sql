-- Сложные запросы
-- Выведите список товаров products и разделов catalogs, который соответствует товару

-- создаем исходные данные
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;


CREATE TABLE catalogs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO catalogs (name) VALUES
    ('Процессоры'),
    ('Видеокарты'),
    ('Материнские платы');

SELECT * FROM catalogs;


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    catalogs_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255)
);


INSERT INTO products (name, catalogs_id) VALUES
    ('i7 8750H', 1),
    ('NVIDIA GTX 1050 TI', 2),
    ('i5 8300H', 1),
    ('ASUS MAXIMUS VIII HERO', 3),
    ('NVIDIA GTX 1060', 2),
    ('i5 8250U', 1),
    ('NVIDIA GTX 1050', 2),
    ('ASUS M5A78L-M', 3);

SELECT * FROM products;


-- результат
SELECT products.*, catalogs.name FROM products
    JOIN catalogs ON catalogs.id = products.catalogs_id;