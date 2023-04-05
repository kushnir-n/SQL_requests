-- 1. Подсчитать количество групп, в которые вступил каждый пользователь.

USE vk;
SELECT
	u.id,
	u.firstname,
    COUNT(uc.community_id) AS count_of_usergroup
FROM users AS u
LEFT JOIN users_communities AS uc ON uc.user_id = u.id
GROUP BY u.id, u.firstname;

-- 2. Подсчитать количество пользователей в каждом сообществе

USE vk;
SELECT * FROM users_communities;
SELECT
	c.id,
    c.name,
    COUNT(uc.community_id) AS count_of_users
FROM users_communities AS uc
INNER JOIN communities AS c ON c.id = uc.community_id
GROUP BY c.id, c.name
ORDER BY c.id ASC;

-- 3. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

USE vk;
SELECT
	m.from_user_id,
    count(m.id) AS count_messages,
    ufrom.firstname AS top_sender,
    uto.firstname AS target
FROM messages AS m
INNER JOIN users AS ufrom ON m.from_user_id = ufrom.id
INNER JOIN users AS uto ON m.to_user_id = uto.id
WHERE m.to_user_id = 1
GROUP BY m.from_user_id, ufrom.firstname, uto.firstname
ORDER BY count_messages DESC
LIMIT 1;


