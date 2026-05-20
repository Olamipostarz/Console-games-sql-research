
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
