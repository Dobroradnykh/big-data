-- Подсчитайте средний возраст пользователей в таблице users

-- создаем исходные данные
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    birthday DATE
);

INSERT INTO users (name, birthday) VALUES
    ('Kate',  '1990-08-01'),
    ('Tom',   '1995-04-10'),
    ('David', '1980-12-14'),
    ('Stark', '1999-10-18'),
    ('Jon',   '1988-01-20');

SELECT * FROM users;

-- средний возраст пользователей
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) as age FROM users;