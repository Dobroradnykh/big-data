-- (по желанию) Подсчитайте произведение чисел в столбце таблицы

-- создаем исходные данные
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE test (
    value INT
);

INSERT INTO test VALUES
    (1),
    (2),
    (3),
    (4),
    (5);

SELECT * FROM test;

-- данный пример нашел на просторах интернета,чистая математика.. Но как по мне,это не очен
SELECT CEILING(EXP(SUM(LOG(value)))) from test;