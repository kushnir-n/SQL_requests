-- 1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]

CREATE VIEW view1 AS
SELECT firstname, phone
FROM users;

-- 2. Выведите данные, используя написанное представление [SELECT]

SELECT * FROM view1;

-- 3. Удалите представление [DROP VIEW]

DROP VIEW view1;