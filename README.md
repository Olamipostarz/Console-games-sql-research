
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
# 🔍 Analytics Tasks & Solutions
Task 1: North American Market Share
Objective: Calculate what percentage of Global Sales were made in North America.
``` sql
SELECT 
    SUM(NA_Sales) AS Total_NA_Sales, 
    SUM(Global_Sales) AS Total_Global_Sales,
    ROUND((SUM(NA_Sales) / SUM(Global_Sales)) * 100, 2) AS Percentage_NA_Sales
FROM ConsoleGames;
```
# Task 2:
Console Titles Ordered by Platform and Year
Objective: Create a clean database view of console game titles ordered by platform name (Ascending) and Year of release (Descending).
```
CREATE VIEW Game_Titles_View AS
SELECT GameTitle, Platform, ReleaseYear
FROM ConsoleGames
ORDER BY Platform ASC, ReleaseYear DESC
```
