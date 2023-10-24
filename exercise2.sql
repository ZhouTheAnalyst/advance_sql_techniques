-- Exercise 2:  Creating a View 
-- For privacy reasons, you have been asked to create a view that enables users to select just the school name and the icon fields from the CHICAGO_PUBLIC_SCHOOLS table. By providing a view, you can ensure that users cannot see the actual scores given to a school, just the icon associated with their score. You should define new names for the view columns to obscure the use of scores and icons in the original table.

-- Question 1:  Write and execute a SQL statement to create a view showing the columns listed in the following table, with new column names as shown in the second column.
USE chicago;

CREATE VIEW school_information AS
SELECT 
		NAME_OF_SCHOOL AS School_name,
        Safety_Icon AS Safety_Rating,
        Family_Involvement_Icon AS Family_Rating,
        Environment_Icon AS Environment_Rating,
        Instruction_Icon AS Instruction_Rating,
        Leaders_Icon AS Leaders_Rating,
        Teachers_Icon AS Teachers_Rating
FROM chicago_public_schools; 

-- Question 2:  Write and execute a SQL statement that returns all of the columns from the view.
SELECT *
FROM school_information;

-- Question 3:  Write and execute a SQL statement that returns just the school name and leaders rating from the view.
SELECT School_name, Leaders_Rating
FROM school_information;