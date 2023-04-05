USE vk;

DELIMITER //

CREATE PROCEDURE DropVKUserProc(UserId INT)
    BEGIN

		SET FOREIGN_KEY_CHECKS = 0;

		START TRANSACTION;

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
            
		COMMIT;
        
        SELECT UserId;

        SET FOREIGN_KEY_CHECKS = 1;

    END //
    
DELIMITER ;