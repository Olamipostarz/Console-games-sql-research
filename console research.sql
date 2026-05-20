CREATE DATABASE Console_research;
use Console_research;
select *from `p9-consoledates` limit 10 ;
select *from `p9-consolegames` limit 10 ;

SELECT 
    SUM(NA_Sales) AS Total_NA_Sales, 
    SUM(NA_Sales + EU_Sales + JP_Sales + Other_Sales) AS Total_Global_Sales,
    (SUM(NA_Sales) / SUM(NA_Sales + EU_Sales + JP_Sales + Other_Sales)) * 100 AS NA_Sales_Percentage
FROM `p9-consolegames`;

SELECT Name, Platform, Year
FROM `p9-consolegames`
ORDER BY Platform ASC, Year DESC;

SELECT DISTINCT Publisher, LEFT(Publisher, 4) AS Publisher_Code
FROM `p9-consolegames`;

SELECT Platform, FirstRetailAvailability
FROM `p9-consoledates`
WHERE (MONTH(FirstRetailAvailability) = 11 AND DAY(FirstRetailAvailability) >= 20)
   OR (MONTH(FirstRetailAvailability) = 12 AND DAY(FirstRetailAvailability) <= 24);
   
   SELECT 
    Platform, 
    DATEDIFF(Discontinued, FirstRetailAvailability) AS Days_of_Longevity
FROM `p9-consoledates`
WHERE Discontinued IS NOT NULL
ORDER BY Days_of_Longevity ASC;

SELECT 
    Platform, 
    DATEDIFF(Discontinued, FirstRetailAvailability) AS Days_of_Longevity
FROM `p9-consoledates`
WHERE Discontinued IS NOT NULL 
  AND Discontinued != '' 
  AND Discontinued != '0000-00-00'
ORDER BY Days_of_Longevity ASC;

SELECT 
    SUM(NA_Sales) AS Total_NA_Sales, 
    SUM(NA_Sales + EU_Sales + JP_Sales + Other_Sales) AS Total_Global_Sales,
    (SUM(NA_Sales) / SUM(NA_Sales + EU_Sales + JP_Sales + Other_Sales)) * 100 AS NA_Sales_Percentage
FROM `p9-consolegames`;


SELECT Name, CAST(Year AS CHAR) AS Year_Text
FROM `p9-consolegames`;

SELECT 
    Name, 
    COALESCE(NA_Sales, 0) + COALESCE(EU_Sales, 0) AS Total_Sales
FROM `p9-consolegames`;

-- Using IFNULL (MySQL specific)
SELECT 
    Name, 
    IFNULL(JP_Sales, 0) AS Clean_JP_Sales
FROM `p9-consolegames`;

SELECT 
    Platform, 
    FirstRetailAvailability,

    COALESCE(NULLIF(Discontinued, ''), CURRENT_DATE) AS Discontinued_Cleaned
FROM `p9-consoledates`;

SELECT DISTINCT 
    TRIM(UPPER(Publisher)) AS Standard_Publisher,
    REPLACE(Platform, 'XOne', 'Xbox One') AS Clean_Platform
FROM `p9-consolegames`;