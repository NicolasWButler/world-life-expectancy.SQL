#World Life Expectancy Data Cleaning Project
SELECT *
FROM world_life_expectancy;

#Identifying duplicate values in the dataset
SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year))
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1;

# # Flag duplicate rows using ROW_NUMBER() so we can isolate extras for deletion
SELECT *
FROM (
		SELECT Row_id, 
		CONCAT(Country, Year),
        ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
        FROM world_life_expectancy
				) AS Row_Table
		WHERE Row_Num > 1;
        
# Delete the flagged duplicate rows by Row_id (keep the first occurrence per Country+Year)	
DELETE FROM world_life_expectancy
WHERE 
		Row_id IN (
				SELECT Row_id
FROM (
		SELECT Row_id, 
		CONCAT(Country, Year),
        ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
        FROM world_life_expectancy
				) AS Row_Table
		WHERE Row_Num > 1);

# Find rows with missing Status values
SELECT *
FROM world_life_expectancy
WHERE status = '';

# Fill missing Status as 'Developing' using a self-join on the same Country
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2. Country
    SET t1.Status = 'developing'
    WHERE t1.Status = ''
    AND t2.Status <> ''
    AND t2.Status = 'Developing';

# Spot-check a specific country (optional manual inspection)
SELECT *
FROM world_life_expectancy
WHERE country = 'United States of America';

# Add remaining missing 'Status' as 'Developed' using a self-join
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2. Country
    SET t1.Status = 'Developed'
    WHERE t1.Status = ''
    AND t2.Status <> ''
    AND t2.Status = 'Developed';

# Verify 'Status' results after 
SELECT *
FROM world_life_expectancy;

# Finding rows with missing 'Life Expectancy' values
SELECT *
FROM world_life_expectancy
WHERE `Life Expectancy` = '';

# Quick view of Country/Year/Life Expectancy (to spot gaps before filling)
SELECT Country, Year, `Life Expectancy`
FROM world_life_expectancy;

# Calculating average Life expectancy from previous and next year 
SELECT t1.Country, t1.Year, t1.`Life Expectancy`,
							t2.Country, t2.Year, t2.`Life Expectancy`, 
							t3.Country, t3.Year, t3.`Life Expectancy`,
		ROUND((t2.`Life Expectancy` + t3. `Life Expectancy`) /2,1)
FROM world_life_expectancy t1
	JOIN world_life_expectancy t2
ON t1.Country = t2.Country
AND t1.Year = t2.Year -1
	JOIN world_life_expectancy t3
ON t1.Country = t3.Country
AND t1.Year = t3.Year +1
WHERE t1.`Life Expectancy` = ''
;

# Fill missing Life Expectancy from adjacent-year average
UPDATE world_life_expectancy t1
	JOIN world_life_expectancy t2
ON t1.Country = t2.Country
AND t1.Year = t2.Year -1
	JOIN world_life_expectancy t3
ON t1.Country = t3.Country
AND t1.Year = t3.Year +1
SET t1.`Life Expectancy` = ROUND((t2.`Life Expectancy` + t3. `Life Expectancy`) /2,1)
WHERE t1.`Life Expectancy` = ''


        
        
        




