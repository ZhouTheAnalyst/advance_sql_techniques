-- Exercise 1:  Using Joins
-- You have been asked to produce some reports about the communities and crimes in the Chicago area. You will need to use SQL join queries to access the data stored across multiple tables.

-- Question 1:  query to list the school names, community names and average attendance for communities with a hardship index of 98
USE chicago;

SELECT cps.NAME_OF_SCHOOL, csd.COMMUNITY_AREA_NAME
FROM chicago_public_schools AS cps
LEFT JOIN chicago_socioeconomic_data AS csd
	ON cps.COMMUNITY_AREA_NUMBER = csd.COMMUNITY_AREA_NUMBER
WHERE csd.HARDSHIP_INDEX = 98;

-- Question 2:  query to list all crimes that took place at a school. Include case number, crime type and community name.
SELECT cc.CASE_NUMBER, cc.PRIMARY_TYPE, csd.COMMUNITY_AREA_NAME, cc.LOCATION_DESCRIPTION
FROM chicago_crime AS cc
LEFT JOIN chicago_socioeconomic_data AS csd
	ON cc.COMMUNITY_AREA_NUMBER = csd.COMMUNITY_AREA_NUMBER
WHERE cc.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

