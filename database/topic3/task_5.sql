-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN

-- создаем исходные данные
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE catalogs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO catalogs (name) VALUES
    ('Процессоры'),
    ('Видеокарты'),
    ('Кулеры'),
    ('Оперативная память'),
    ('Мониторы'),
    ('Блоки питания'),
    ('Материнские платы');

SELECT * FROM catalogs;

-- результат
SELECT * FROM catalogs
  WHERE id IN (5, 1, 2)
  ORDER BY FIELD(id, 5, 1, 2)