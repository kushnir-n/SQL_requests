-- 1. Используя транзакцию, написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
-- Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. Функция должна возвращать номер пользователя.

USE vk;

SELECT * FROM users;

START TRANSACTION;

	select DropVKUser(10);

COMMIT;

SELECT * FROM users;

-- 2. Предыдущую задачу решить с помощью процедуры.

SELECT * FROM users;

CALL DropVKUserProc(11);

SELECT * FROM users;