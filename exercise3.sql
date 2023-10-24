-- Exercise 3:  Creating a Stored Procedure
-- The icon fields are calculated based on the value in the corresponding score field. You need to make sure that when a score field is updated, the icon field is updated too. To do this, you will write a stored procedure that receives the school id and a leaders score as input parameters, calculates the icon setting and updates the fields appropriately.

-- Question 1:  Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter as an integer and a in_Leader_Score parameter as an integer.
USE chicago;

DELIMITER $$

CREATE PROCEDURE UPDATE_LEADERS_SCORE(
	IN in_School_ID INT,
    IN in_Leader_Score INT
)
BEGIN 
UPDATE chicago_public_schools
SET Leaders_Score = in_Leader_Score
WHERE School_ID = in_School_ID;
END $$

DELIMITER ;

-- Question 2:  Inside your stored procedure, write a SQL statement to update the Leaders_Score field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID to the value in the in_Leader_Score parameter.
CALL UPDATE_LEADERS_SCORE(610185,85);
SELECT School_ID, Leaders_Score
FROM chicago_public_schools
WHERE School_ID = 610185;

-- Question 3:  Inside your stored procedure, write a SQL IF statement to update the Leaders_Icon field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID using the following information.
DELIMITER $$

CREATE PROCEDURE UPDATE_LEADERS_ICON(
	IN in_School_ID INT,
    IN in_Leader_Score INT
)
BEGIN

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

ELSEIF in_Leader_Score <= 99 THEN
UPDATE chicago_public_schools
SET Leaders_Icon = 'Very Strong'
WHERE School_ID = in_School_ID;

END IF;

END $$

DELIMITER ;