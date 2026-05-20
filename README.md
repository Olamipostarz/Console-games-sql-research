
# Console Games Market Research Analysis

An end-to-end SQL analytics project focused on conducting market research for a console games company. This project involves setting up a relational database, importing historical data from CSV files, performing data cleansing, and executing targeted SQL queries to extract business insights regarding global game sales, platform longevity, and release timing strategies.

---

## 📊 Dataset Overview
The analysis utilizes a dataset consisting of two core tables:
* *ConsoleGames*: A historical list of all console games released between 1980 and 2015, including regional and global sales metrics.
* *ConsoleDates* (p9-consoledates): A historical list of console platforms (e.g., Wii, PlayStation, Xbox) detailing launch availability, discontinuation dates, and total units sold.

---

## 🛠️ Tech Stack & Environment
* *Database Engine:* MySQL Server
* *Interface:* MySQL Workbench
* *Language:* SQL (Structured Query Language)
* *Data Format:* CSV (Comma-Separated Values)

---

## 🚀 Database Setup & Data Import

### 1. Schema Creation
```sql
CREATE DATABASE Console_Research;
USE Console_Research;
```sql
CREATE DATABASE Console_Research;
USE Console_Research;
```
## 2. Importing CSV Data
Data was imported using the MySQL Workbench Table Data Import Wizard.
* ConsoleGames.csv was mapped to the table ConsoleGames.
* ConsoleDates.csv was mapped to the table p9-consoledates.
Note: Data types for date columns were initially imported as text fields to ensure structural safety and then optimized during the ETL processing phase.
### 🔍 Analytics Tasks & Solutions
# Task 1: North American Market Share
Objective: Calculate what percentage of Global Sales were made in North America.
``` sql
SELECT 
    SUM(NA_Sales) AS Total_NA_Sales, 
    SUM(Global_Sales) AS Total_Global_Sales,
    ROUND((SUM(NA_Sales) / SUM(Global_Sales)) * 100, 2) AS Percentage_NA_Sales
FROM ConsoleGames;
```
# Task 2: Console Titles Ordered by Platform and Year
Objective: Create a clean database view of console game titles ordered by platform name (Ascending) and Year of release (Descending).
```sql
CREATE VIEW Game_Titles_View AS
SELECT GameTitle, Platform, ReleaseYear
FROM ConsoleGames
ORDER BY Platform ASC, ReleaseYear DESC;
```
# Task 3: Publisher Code Extraction
Objective: For each game title, extract the first four letters of the publisher's name.
``` sql
SELECT GameTitle, Publisher, LEFT(Publisher, 4) AS Publisher_Code
FROM ConsoleGames;
```
# Task 4: Seasonal Release Strategy Analysis
Objective: Display all console platforms released either just before Black Friday or just before Christmas (in any year).
``` sql
SELECT Platform, FirstRetailAvailability
FROM p9-consoledates
WHERE (MONTH(FirstRetailAvailability) = 11 AND DAY(FirstRetailAvailability) BETWEEN 15 AND 25)
   OR (MONTH(FirstRetailAvailability) = 12 AND DAY(FirstRetailAvailability) BETWEEN 15 AND 24)
ORDER BY FirstRetailAvailability;
```
# Task 5: Platform Longevity Analysis
Objective: Order the platforms by their longevity in ascending order (i.e., the platform active for the longest time at the bottom).
``` sql
SELECT 
    Platform, 
    FirstRetailAvailability, 
    Discontinued,
    DATEDIFF(Discontinued, FirstRetailAvailability) AS Days_Active
FROM p9-consoledates
WHERE Discontinued IS NOT NULL
ORDER BY Days_Active ASC;
```
# Task 6: Data Type Modernization (Game_Year)
Objective: Demonstrate how to handle and convert the Game_Year / ReleaseYear column data type permanently
``` sql
-- Dynamic conversion for a quick query
SELECT CAST(ReleaseYear AS UNSIGNED) AS Year_As_Int 
FROM ConsoleGames;

-- Permanent schema conversion 
ALTER TABLE ConsoleGames 
MODIFY COLUMN ReleaseYear INT;
```
# 📈 Data Quality & Engineering Recommendations (Task 7)
When cleaning missing data within these historical files, the following professional approaches are recommended:
1.	Handling Missing Numerical Fields (Sales): * Avoid treating missing fields as NULL if they affect mathematical operations. Use COALESCE(Sales, 0) to default missing parameters to 0 or replace them with the median value of the respective console's catalog to prevent skewing sums.
2.	Handling Missing Categorical Strings (Publisher/Genre):
* If a descriptive string field is blank, populate it with a fallback string like 'Unknown' or 'Not Specified' so aggregation clauses (GROUP BY) don't fail or create messy anomalies.
3.	Handling Incomplete Temporal Streams (Dates):
* If game-specific release dates are missing, write a script to look up the console's primary lifespan from p9-consoledates and impute a mid-cycle placeholder year to retain record usability.
4.	Conditional Deletion Strategy:
* Only resort to data deletion (DROP/DELETE) if critical unique identifier pairings (e.g., both GameTitle and Platform) are entirely missing, rendering the entry analytically useless.
