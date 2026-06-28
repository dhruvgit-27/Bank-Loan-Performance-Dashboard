# 📖 Data Dictionary — Bank Loan Performance Dashboard

> Complete column-level reference for the dataset used in this project.
> Source file: `financial_loan_clean.csv` — 38,576 rows | 28 columns

---

## 📋 Table of Contents

- [Original Dataset Columns (24)](#original-dataset-columns)
- [Engineered Columns Added in Python (4)](#engineered-columns)
- [Column Value Reference](#column-value-reference)

---

## Original Dataset Columns

These 24 columns came directly from the raw Kaggle dataset.

---

### 🔑 Identifier Columns

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `id` | Loan ID | Integer | Unique identifier for each loan application — acts as the primary key | 1077430 |
| `member_id` | — (removed) | Integer | Unique ID of the borrower — removed during Power Query as not needed for analysis | 1314167 |

---

### 📍 Borrower Location

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `address_state` | State | Text | US state where the borrower resides — 2-letter state code | GA, CA, TX, NY |

---

### 💼 Borrower Employment

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `emp_title` | Job Title | Text | Job title or employer name of the borrower — had 1,438 missing values (3.73%) filled with 'Unknown' during Python EDA | Teacher, US Army, Bank of America |
| `emp_length` | Employment Length | Text | Number of years the borrower has been employed at their current company | < 1 year, 1 year, 2 years, 10+ years |

---

### 🏠 Borrower Home

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `home_ownership` | Home Ownership | Text | Type of home ownership status of the borrower | RENT, MORTGAGE, OWN, OTHER, NONE |

---

### 💰 Borrower Financials

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `annual_income` | Annual Income | Decimal | Borrower's self-reported annual income in USD | 30000.0, 48000.0, 83000.0 |
| `dti` | DTI | Decimal | Debt-to-Income ratio — total monthly debt payments divided by gross monthly income. Lower is better. Formula: DTI = Total Monthly Debts / Gross Income | 0.01, 0.0535, 0.2088 |

---

### 🏦 Loan Details

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `loan_amount` | Loan Amount | Integer | Principal amount of the loan requested by the borrower in USD | 2500, 3000, 12000 |
| `term` | Term | Text | Duration of the loan — either 36 months (3 years) or 60 months (5 years) | 36 months, 60 months |
| `int_rate` | Interest Rate | Decimal | Annual interest rate charged on the loan in percentage format — converted from decimal to % during Python EDA | 15.27, 18.64, 10.65 |
| `installment` | Installment | Decimal | Fixed monthly EMI payment amount the borrower pays in USD | 59.83, 109.43, 421.65 |
| `purpose` | Purpose | Text | Reason the borrower stated for taking the loan | car, debt_consolidation, credit_card, home_improvement, small_business |
| `application_type` | Application Type | Text | Type of loan application — individual or joint | INDIVIDUAL |

---

### 📊 Loan Risk Classification

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `grade` | Grade | Text | Risk grade assigned by the bank based on borrower credit profile — A is lowest risk, G is highest risk | A, B, C, D, E, F, G |
| `sub_grade` | Sub Grade | Text | More granular risk sub-classification within each grade — from A1 (lowest risk) to G5 (highest risk) | A1, A2, B3, C4, G5 |
| `verification_status` | Verification Status | Text | Whether the borrower's income and documents were verified by the bank | Verified, Source Verified, Not Verified |

---

### 📅 Date Columns

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `issue_date` | Issue Date | Date | Date when the loan was issued and disbursed to the borrower | 2021-02-11, 2021-01-01 |
| `last_payment_date` | Last Payment Date | Date | Date when the borrower made their most recent EMI payment | 2021-04-13, 2021-12-14 |
| `last_credit_pull_date` | Last Credit Pull Date | Date | Most recent date when the bank checked the borrower's credit history | 2021-09-13, 2021-12-12 |
| `next_payment_date` | Next Payment Date | Date | Due date of the borrower's next upcoming EMI payment | 2021-05-13, 2021-02-15 |

---

### 🎯 Loan Outcome

| Column | Renamed To | Data Type | Description | Example |
|---|---|---|---|---|
| `loan_status` | Loan Status | Text | Current status of the loan — the most important column in the dataset | Fully Paid, Charged Off, Current |
| `total_acc` | Total Accounts | Integer | Total number of credit accounts the borrower holds across all lenders | 4, 11, 28 |
| `total_payment` | Total Payment | Integer | Total amount received back from the borrower including principal and interest in USD | 1009, 3939, 4911 |

---

## Engineered Columns

These 4 columns were added during Python EDA in Google Colab to enable time-based analysis in Power BI.

| Column | Renamed To | Data Type | How Created | Description | Example |
|---|---|---|---|---|---|
| `loan_category` | Loan Category | Text | `df['loan_status'].apply(lambda x: 'Good Loan' if x in ['Fully Paid', 'Current'] else 'Bad Loan')` | Binary classification of each loan — Good Loan means bank recovered money, Bad Loan means bank lost money (Charged Off) | Good Loan, Bad Loan |
| `issue_month` | Issue Month | Integer | `df['issue_date'].dt.month` | Numeric month extracted from issue_date — used for correct Jan to Dec sorting in Power BI | 1, 2, 3 ... 12 |
| `issue_year` | Issue Year | Integer | `df['issue_date'].dt.year` | Year extracted from issue_date — all records are from 2021 | 2021 |
| `issue_month_name` | Month Name | Text | `df['issue_date'].dt.strftime('%B')` | Full month name extracted from issue_date — used as display label in all time-based visuals | January, February ... December |

---

## Column Value Reference

### Loan Status Values

| Value | Category | Count | Meaning |
|---|---|---|---|
| Fully Paid | Good Loan | 32,145 | Borrower repaid the entire loan — bank recovered all money |
| Current | Good Loan | 1,098 | Loan is active and borrower is making payments on time |
| Charged Off | Bad Loan | 5,333 | Borrower defaulted — bank wrote off the loan as a loss |

---

### Grade vs Risk vs Interest Rate

| Grade | Risk Level | Avg Interest Rate | Typical Bad Loan % |
|---|---|---|---|
| A | Lowest | 7.4% | ~5% |
| B | Low | 11.0% | ~10% |
| C | Medium | 13.5% | ~15% |
| D | Medium-High | 15.7% | ~20% |
| E | High | 17.7% | ~25% |
| F | Very High | 19.7% | ~32% |
| G | Highest | 21.4% | ~35% |

---

### Loan Purpose Distribution

| Purpose | Applications | Notes |
|---|---|---|
| Debt Consolidation | 18,214 | Most common — borrowers paying off existing debts |
| Credit Card | 4,998 | Second most common |
| Other | 3,824 | Unspecified purposes |
| Home Improvement | 2,876 | Home renovation loans |
| Major Purchase | 2,110 | Large consumer purchases |
| Small Business | 1,776 | Highest bad loan % at 25.62% |
| Car | 1,497 | Vehicle purchases |
| Wedding | 928 | Wedding expenses |
| Medical | 667 | Medical bills |
| Moving | 559 | Relocation expenses |
| House | 366 | House purchase |
| Vacation | 352 | Travel loans |
| Educational | 315 | Education expenses |
| Renewable Energy | 94 | Least common purpose |

---

### Home Ownership Distribution

| Value | Meaning | % of Borrowers |
|---|---|---|
| RENT | Borrower rents their home | 47.8% |
| MORTGAGE | Borrower has a home mortgage | 44.58% |
| OWN | Borrower owns their home outright | 7.36% |
| OTHER | Other arrangement | Minimal |
| NONE | No home ownership info | Minimal |

---

### Verification Status

| Value | Meaning | Bad Loan % |
|---|---|---|
| Verified | Bank fully verified income and documents | 15.70% |
| Source Verified | Bank verified the income source only | 14.14% |
| Not Verified | No verification done | 12.24% |

---

### Term Distribution

| Value | Meaning | Bad Loan % |
|---|---|---|
| 36 months | 3-year loan duration | 10.71% |
| 60 months | 5-year loan duration | 22.34% |

---

*Data source: Kaggle — Bank Loan Report dataset*
*Cleaned and engineered using Python (Google Colab) — January 2021 to December 2021*
