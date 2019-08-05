-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')

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
    ('Jerry', '1995-12-21'),
    ('Mila',  '1998-08-08'),
    ('Tom',   '1995-04-10'),
    ('David', '1980-12-14'),
    ('Stark', '1999-5-18'),
    ('Jon',   '1988-01-20');

SELECT * FROM users;

-- результат
SELECT * FROM users
  WHERE MONTHNAME(birthday) in ('may', 'august');