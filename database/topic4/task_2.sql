-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения

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
    ('Stark', '1999-10-18'),
    ('Jon',   '1988-01-20');

SELECT * FROM users;

-- приводим год рождения к текущему году, вычисляем день недели, делаем локализацию для красоты, группируем по дню недели
SELECT
  CASE DAYNAME(DATE_FORMAT(birthday, CONCAT(YEAR(CURRENT_DATE()), '-%m-%d')))
    WHEN 'Monday' THEN 'Понедельник'
    WHEN 'Tuesday' THEN	'Вторник'
    WHEN 'Wednesday' THEN	'Среда'
    WHEN 'Thursday' THEN 'Четверг'
    WHEN 'Friday' THEN 'Пятница'
    WHEN 'Saturday' THEN 'Суббота'
    WHEN 'Sunday' THEN 'Воскресенье'
  END as dayname,
  COUNT(*)
FROM users
  GROUP BY dayname;