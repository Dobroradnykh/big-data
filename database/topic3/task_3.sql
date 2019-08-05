-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

-- создаем исходные данные
DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

CREATE TABLE storehouses_products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    value SMALLINT UNSIGNED
);

INSERT INTO storehouses_products (name, value) VALUES
    ('i7 8750H', 2),
    ('i5 8300H', 0),
    ('i5 8250U', 5),
    ('Ryzen 7 2700', 0),
    ('Ryzen 5 2600X', 0),
    ('Ryzen 3 3000', 1),
    ('i5 8100', 3),
    ('AMD FX 8350', 2);

SELECT * FROM storehouses_products;

-- первым делом сортируем по признаку = 0. Получаем сначало положительные значения value, потом 0. Далее соритруем value по возрастанию
SELECT * FROM storehouses_products ORDER BY value = 0, value;