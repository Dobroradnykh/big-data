-- Сложные запросы
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

-- создаем исходные данные
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO users (name) VALUES
    ('Kate'),
    ('Jerry'),
    ('Mila'),
    ('Tom'),
    ('David'),
    ('Stark'),
    ('Jon');

SELECT * FROM users;


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    cost FLOAT(2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (user_id, cost) VALUES
    (1, 1000),
    (5, 2000),
    (4, 3000),
    (1, 200),
    (2, 800),
    (3, 2500),
    (2, 1200);

SELECT * FROM orders;

-- результат
SELECT users.* FROM users 
  WHERE (SELECT COUNT(orders.id) FROM orders WHERE users.id = orders.user_id) > 0;