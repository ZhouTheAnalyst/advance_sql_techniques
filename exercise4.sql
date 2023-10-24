-- Exercise 4:  Using Transactions
-- You realise that if someone calls your code with a score outside of the allowed range (0-99), then the score will be updated with the invalid data and the icon will remain at its previous value. There are various ways to avoid this problem, one of which is using a transaction.

-- Question:  Update your stored procedure definition. 
-- Add a generic ELSE clause to the IF statement that rolls back the current work if the score did not fit any of the preceding categories.
-- Add a statement to commit the current unit of work at the end of the procedure.

USE chicago;

DELIMITER $$

CREATE PROCEDURE UPDATE_LEADERS_SCORE(
	IN in_School_ID INT,
    IN in_Leader_Score INT
)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        RESIGNAL;
	END;
    
	IF in_Leader_Score >= 0 AND in_Leader_Score <= 19 THEN
		UPDATE chicago_public_schools
		SET Leaders_Icon = 'Very Weak'
		WHERE School_ID = in_School_ID;

	ELSEIF in_Leader_Score <= 39 THEN
		UPDATE chicago_public_schools
		SET Leaders_Icon = 'Weak'
		WHERE School_ID = in_School_ID;

	ELSEIF in_Leader_Score <= 59 THEN
		UPDATE chicago_public_schools
		SET Leaders_Icon = 'Average'
		WHERE School_ID = in_School_ID;

	ELSEIF in_Leader_Score <= 79 THEN
		UPDATE chicago_public_schools
		SET Leaders_Icon = 'Strong'
		WHERE School_ID = in_School_ID;

	ELSEIF in_Leader_Score < 100 THEN
		UPDATE chicago_public_schools
		SET Leaders_Icon = 'Very Strong'
		WHERE School_ID = in_School_ID;

	ELSE
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid value for in_leader_Score.  Value must be between 0 and 99.';
	END IF;
	COMMIT;
	END $$

	DELIMITER ;


