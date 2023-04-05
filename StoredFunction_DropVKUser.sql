USE vk;

DELIMITER //
CREATE FUNCTION DropVKUser(UserId INT)
	RETURNS INT DETERMINISTIC
    BEGIN
    
		SET FOREIGN_KEY_CHECKS = 0;

		DELETE FROM messages
		WHERE from_user_id = UserId AND to_user_id = UserId;

		DELETE FROM likes
		WHERE user_id = UserId;

		DELETE FROM media
		WHERE user_id = UserId;

		DELETE FROM profiles
		WHERE user_id = UserId;

		DELETE FROM users
		WHERE id = UserId;

        SET FOREIGN_KEY_CHECKS = 1;
        
        RETURN UserId;
    
    END //
    
DELIMITER ;