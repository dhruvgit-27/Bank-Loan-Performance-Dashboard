# 🏦 Bank Loan Performance Dashboard

> An industry-level end-to-end Data Analytics project demonstrating the complete
> analyst workflow — from raw SQL exploration to an interactive Power BI dashboard.

---

## 🛠️ Tech Stack

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-F2C811?style=flat&logo=powerbi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power%20Query-217346?style=flat&logo=microsoft&logoColor=white)

---

## 📌 Project Goal

Built this project to demonstrate a complete Data Analyst workflow on a real-world
financial dataset. Every tool has a specific purpose — SQL for exploration, Python
for EDA and feature engineering, Power Query for shaping, DAX for KPI logic,
and Power BI for business storytelling.

---

## 🏗️ Project Architecture

![Architecture](screenshots/architecture.png)

This project follows a complete end-to-end Data Analytics pipeline —
starting from raw data exploration in SQL, moving through Python EDA
and feature engineering, then data shaping in Power Query, KPI logic
in DAX, and finally business storytelling through a 4-page Power BI
dashboard delivering actionable insights to different business teams.

---

## 📸 Dashboard Preview

---

### 📊 Page 1 — Summary Overview

![Summary Overview](screenshots/page1_summary.png)

**Audience:** C-suite / Senior Management

**Purpose:**
Provides executives with a high-level view of the entire lending portfolio
through key performance indicators, monthly trends, loan status distribution,
and regional performance — all in one place.

**Highlights:**
- Total Applications, Funded Amount, Amount Received
- Average Interest Rate and Average DTI
- MTD values with MoM % change indicators
- Monthly Loan Applications trend (Jan to Dec 2021)
- Loan Status Distribution donut chart
- Top 5 States by Applications

---

### 🛡️ Page 2 — Loan Quality Analysis

![Loan Quality Analysis](screenshots/page2_quality.png)

**Audience:** Risk Team

**Purpose:**
Designed for risk analysts to identify good and bad loans, evaluate portfolio
health, and understand which customer segments and loan types contribute most
to defaults and charge-offs.

**Highlights:**
- Good Loan KPIs — Count, %, Funded Amount, Received Amount (green theme)
- Bad Loan KPIs — Count, %, Funded Amount, Received Amount (red theme)
- Good vs Bad Loan distribution donut
- Bad Loan % by Grade, Purpose, Term, and Verification Status
- Interactive Bookmarks — toggle between Good Loan view and Bad Loan view

---

### 👤 Page 3 — Borrower Profile

![Borrower Profile](screenshots/page3_borrower.png)

**Audience:** Lending / Marketing Team

**Purpose:**
Analyzes borrower demographics and behavioral patterns to help lending and
marketing teams understand who is borrowing, from where, and for what purpose.

**Highlights:**
- State-wise Applications Tree Map (map visual replaced — blocked by org network)
- Home Ownership Distribution
- Employment Length Analysis
- Annual Income vs Loan Amount Scatter Plot by Loan Category
- Applications by Purpose
- Top 10 Job Titles by Application Count

---

### 📉 Page 4 — Risk & Trends

![Risk and Trends](screenshots/page4_risk.png)

**Audience:** Analytics Team

**Purpose:**
Focuses on portfolio risk by analyzing sub-grade performance, debt burden,
interest rate movement, and monthly application growth trends.

**Highlights:**
- Monthly Trend — Applications, Funded, and Received (combo chart)
- Month over Month Application Growth (Waterfall Chart)
- Sub-Grade Bad Loan % Heatmap — A1 to G5 (Matrix with conditional formatting)
- Average Interest Rate Trend by Month
- DTI Distribution by Loan Status
- Grade vs Average Interest Rate Combo Chart

---

## 💡 Key Business Insights

1. Total loan portfolio of **$435M funded** with **$473M received** — bank is profitable overall
2. **86.2% Good Loan rate** (33,243 loans) vs **13.8% Bad Loan rate** (5,333 charged off)
3. Loan applications grew consistently from **2,279 in February to 4,314 in December 2021**
4. **Grade G loans** carry the highest bad loan % — highest risk segment in the portfolio
5. **Small Business loans** have the highest bad loan % by purpose at 25.62%
6. **Charged Off loans** have avg DTI of 14.9% vs 13.1% for Fully Paid — debt burden predicts default
7. **California, New York and Texas** are the top 3 states by loan applications
8. **Debt Consolidation** is the most common loan purpose at 18,214 applications out of 38,576

---

## 📁 Repository Structure
Bank-Loan-Dashboard/

│

├── README.md

│

├── data/

│   ├── data_raw/

│   │   ├── financial_loan.xlsx          ← original dataset, never modified

│   │   └── financial_loan.csv           ← raw working file

│   └── data_clean/

│       └── financial_loan_clean.csv     ← cleaned file used by Power BI

│

├── sql_queries/

│   └── exploration.sql                  ← 20 industry-level SQL queries

│

├── python/

│   └── convert.py                       ← xlsx to UTF-8 CSV converter

│

├── powerbi/

│   └── bank_loan_dashboard.pbix         ← complete 4-page dashboard

│

└── screenshots/

├── architecture.png                 ← project architecture diagram

├── page1_summary.png

├── page2_quality.png

├── page3_borrower.png

└── page4_risk.png

---

## 🗃️ Dataset Information

- **Source:** Kaggle — search "Bank Loan Report"
- **Rows:** 38,576
- **Original Columns:** 24
- **Added in Python:** 4 (loan_category, issue_month, issue_year, issue_month_name)
- **Final Columns:** 28
- **Time Period:** January 2021 to December 2021

---

## 🎯 Skills Demonstrated

- SQL Data Exploration and Aggregation
- Window Functions (LAG for MoM Growth)
- Python Data Cleaning and EDA
- Feature Engineering
- Power Query M Language Transformations
- DAX Measure Writing (MTD, PMTD, MoM, Time Intelligence)
- Data Modelling in Power BI
- Dashboard Design and Layout
- Business Intelligence Storytelling
- Risk Analytics
- Conditional Formatting and Heatmaps
- Bookmark and Navigation Implementation

---

## ▶️ How to Run the Project

### 📊 View the Dashboard
1. Download `powerbi/bank_loan_dashboard.pbix`
2. Open with **Power BI Desktop** — free download from microsoft.com/power-bi
3. All 4 pages load with full navigation and slicers

### 🗄️ Run the SQL Queries
1. Open **MySQL Workbench**
2. Create database:
```sql
CREATE DATABASE bank_loan_db;
```
3. Import `data/data_raw/financial_loan.csv` using LOAD DATA INFILE
4. Open `sql_queries/exploration.sql` and run all 20 queries

### 🐍 Run the Python Script
1. Open terminal in the project root folder
2. Install dependency:
```bash
pip install openpyxl
```
3. Run:
```bash
python python/convert.py
```
4. This converts the original xlsx to a clean UTF-8 encoded CSV

---

---

## ⭐ If you found this project interesting

If you found this project useful or interesting, consider giving it a ⭐ on GitHub. Feedback and suggestions are always welcome!

---

## 👨‍💻 Author

**Dhruv Singh**

Data Analyst | SQL | Python | Power BI | DAX

[![GitHub](https://img.shields.io/badge/GitHub-dhruvgit--27-181717?style=flat&logo=github&logoColor=white)](https://github.com/dhruvgit-27)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Dhruv%20Pratap-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/dhruv-pratap-716403303/)
