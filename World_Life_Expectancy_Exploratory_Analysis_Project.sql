# World Life Expectancy Exploratory Data Analysis 
SELECT *
FROM world_life_expectancy;

# Tracking changes in life expectancy across countries, highlighting how much each has improved over 15 years
SELECT country,
  MIN(`Life Expectancy`), 
  MAX(`Life Expectancy`),
  ROUND(MAX(`Life Expectancy`) -  MIN(`Life Expectancy`),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life Expectancy`) <> 0 
AND  MAX(`Life Expectancy`) <> 0
ORDER BY Life_Increase_15_Years DESC;

# Global average Life Expectancy by year (trend)
SELECT Year, ROUND(AVG(`Life Expectancy`),2)
FROM world_life_expectancy
WHERE `Life Expectancy` <> 0 
AND `Life Expectancy` <> 0
GROUP BY Year
ORDER BY Year;

# Quick re-preview of raw rows (optional)
SELECT *
FROM world_life_expectancy;

# # Country averages: Life Expectancy & GDP (sorted by GDP)
SELECT Country, ROUND(AVG(`Life Expectancy`),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY country 
HAVING Life_exp > 0
AND GDP > 0
ORDER BY GDP DESC;

# Compare Life Expectancy between High vs Low GDP observations (>=1500 vs <=1500)
SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
ROUND(AVG(CASE WHEN GDP >= 1500 THEN `Life Expectancy` ELSE NULL END),2) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
ROUND(AVG(CASE WHEN GDP <= 1500 THEN `Life Expectancy` ELSE NULL END),2) Low_GDP_Life_Expectancy
FROM world_life_expectancy;


# Average Life Expectancy by Status (Developing vs Developed)
SELECT status, ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY status;

# Counting how many countries are classed as 'Developed' and 'Developing' across this table
SELECT status, COUNT(DISTINCT country), ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY status;

# Exploring Life Expectancy vs BMI by country (sorted by BMI)
SELECT Country, ROUND(AVG(`Life Expectancy`),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY country 
HAVING Life_exp > 0
AND BMI > 0
ORDER BY BMI DESC; 


# Rolling sum of Adult Mortality by country (with yearly LE)
SELECT Country,
	Year,
    `Life expectancy`,
    `Adult Mortality`,
     SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy





