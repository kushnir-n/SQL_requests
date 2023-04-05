-- 1. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]

USE vk;
SELECT distinct firstname
FROM users
ORDER BY firstname;

-- 2. Выведите количество мужчин старше 35 лет [COUNT].

USE vk;
SELECT COUNT(*)
FROM profiles
WHERE gender = 'm'
and birthday <= '1987-02-17';	-- today

-- 3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]

USE vk;
SELECT status, COUNT(*) AS requested_at
FROM friend_requests
GROUP BY status;

-- 4. Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].

USE vk;
SELECT initiator_user_id, COUNT(*) AS requested_at
FROM friend_requests
WHERE status = "requested"
GROUP BY initiator_user_id
order by requested_at desc
LIMIT 1;
