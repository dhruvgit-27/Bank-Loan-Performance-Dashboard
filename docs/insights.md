# 💡 Business Insights — Bank Loan Performance Dashboard

> Key findings and actionable insights derived from the Bank Loan dataset
> covering 38,576 loan applications from January to December 2021.
> All charts below were created during Python EDA in Google Colab.

---

## 📋 Table of Contents

1. [Portfolio Overview](#1-portfolio-overview)
2. [Loan Quality — Good vs Bad](#2-loan-quality--good-vs-bad)
3. [Monthly Growth Trend](#3-monthly-growth-trend)
4. [Loan Purpose & Grade Analysis](#4-loan-purpose--grade-analysis)
5. [Financial Distribution Analysis](#5-financial-distribution-analysis)
6. [Debt Burden & Default Risk](#6-debt-burden--default-risk)
7. [Geographic Insights](#7-geographic-insights)
8. [Summary Recommendations](#8-summary-recommendations)

---

## 1. Portfolio Overview

| Metric | Value |
|---|---|
| Total Applications | 38,576 |
| Total Funded Amount | $435,757,075 |
| Total Amount Received | $473,070,933 |
| Net Recovery Above Funded | $37,313,858 |
| Average Interest Rate | 12.05% |
| Average DTI | 13.33% |
| Average Loan Amount | $11,296 |

**Key Finding:**
The bank funded $435M and received back $473M — a net recovery of $37.3M above the funded amount. This confirms the portfolio is overall profitable despite a 13.8% bad loan rate. The excess recovered over funded represents interest income collected primarily from the 86.2% of performing loans.

---

## 2. Loan Quality — Good vs Bad

![Good vs Bad Loan Analysis](../screenshots/eda/good_vs_bad_loan.png)

**What this chart shows:**
The left panel is a pie chart showing the split between Good Loans (86.2%) and Bad Loans (13.8%) across all 38,576 applications. The right panel is a bar chart showing the total funded amount by category — Bad Loans received $65.5M in funding while Good Loans received $370.2M.

**Key Findings:**

| Category | Count | Percentage | Funded Amount |
|---|---|---|---|
| Good Loan (Fully Paid + Current) | 33,243 | 86.2% | $370.2M |
| Bad Loan (Charged Off) | 5,333 | 13.8% | $65.5M |

The pie chart confirms the portfolio leans heavily toward good loans — 86.2% is a healthy performing rate. However the bar chart tells a more serious story — $65.5M was funded to borrowers who eventually defaulted (Charged Off). When combined with the total payment data, bad loans only recovered $37.28M of that $65.5M — meaning the bank lost approximately **$28.25M** on defaulted loans alone.

**Loan Status Breakdown:**
- Fully Paid: 32,145 (83.33%) — complete repayment received
- Charged Off: 5,333 (13.82%) — total default, written off as loss
- Current: 1,098 (2.85%) — active loans with payments on track

---

## 3. Monthly Growth Trend

![Monthly Loan Trends 2021](../screenshots/eda/monthly_trend.png)

**What this chart shows:**
The top panel is an area line chart showing the number of loan applications each month from January to December 2021 with exact data labels. The bottom panel is a grouped bar chart comparing Total Funded Amount (red bars) vs Total Amount Received (green bars) for each month — both in millions of dollars.

**Monthly Application Numbers:**

| Month | Applications |
|---|---|
| January | 2,332 |
| February | 2,279 |
| March | 2,627 |
| April | 2,755 |
| May | 2,911 |
| June | 3,184 |
| July | 3,366 |
| August | 3,441 |
| September | 3,536 |
| October | 3,796 |
| November | 4,035 |
| December | 4,314 |

**Key Findings:**
The area line chart shows a clear and consistent upward trend in applications throughout 2021. February was the lowest month at 2,279 and December was the highest at 4,314 — an 89% increase from lowest to highest. The only month that dipped from the previous was February which suggests a mild seasonal slowdown in January-February.

The grouped bar chart shows something equally important — the green bars (received) are consistently taller than the red bars (funded) in every single month of the year. This means the bank was profitable every month — not just overall. December shows the largest gap between funded ($54M) and received ($58M) confirming strong portfolio performance at year end.

---

## 4. Loan Purpose & Grade Analysis

![Loan Purpose and Grade Analysis](../screenshots/eda/purpose_grade_analysis.png)

**What this chart shows:**
This is a two-panel chart. The top panel is a horizontal bar chart showing the number of loan applications by purpose — sorted ascending so the largest bar (Debt Consolidation) appears at the top. The bottom panel is a combo chart with blue bars showing total applications per grade (A through G) on the left Y-axis and a red line showing Bad Loan % per grade on the right Y-axis.

**Applications by Purpose (top panel):**

| Purpose | Applications |
|---|---|
| Debt Consolidation | 18,214 |
| Credit Card | 4,998 |
| Other | 3,824 |
| Home Improvement | 2,876 |
| Major Purchase | 2,110 |
| Small Business | 1,776 |
| Car | 1,497 |
| Wedding | 928 |
| Medical | 667 |
| Moving | 559 |
| House | 366 |
| Vacation | 352 |
| Educational | 315 |
| Renewable Energy | 94 |

Debt Consolidation dominates at 18,214 applications — highlighted in red in the chart — making up 47.2% of all loans. This single purpose drives the entire portfolio. Credit Card is a distant second at 4,998.

**Grade Volume vs Bad Loan % (bottom panel):**

| Grade | Approx Applications | Bad Loan % (from chart) |
|---|---|---|
| A | 9,769 | ~5% |
| B | 11,640 | ~11% |
| C | 7,981 | ~15% |
| D | 5,284 | ~21% |
| E | 2,840 | ~25% |
| F | 1,059 | ~32% |
| G | 233 | ~35% |

The combo chart makes the risk gradient immediately visible — Grade B has the highest application volume (blue bar tallest) while the red line rises steeply from left to right confirming that as grade worsens, bad loan rate climbs sharply. Grade G carries nearly 7x the default risk of Grade A. The steepest climb in the red line occurs between grades D and E — identifying this as the risk threshold where borrowers become significantly more likely to default.

---

## 5. Financial Distribution Analysis

![Financial Distribution Analysis](../screenshots/eda/financial_distribution.png)

**What this chart shows:**
This is a 4-panel chart created in Python. Top left: histogram of interest rate distribution across all loans. Top right: histogram of loan amount distribution. Bottom left: bar chart of average interest rate by grade. Bottom right: bar chart of average loan amount for the top 5 loan purposes.

**Interest Rate Distribution (top left):**
The histogram shows interest rates ranging from approximately 5% to 25% with the distribution peaking around 11-13%. The red dashed line marks the mean at **12.0%**. The distribution is slightly right-skewed — most loans cluster between 7% and 16% with a long tail of high-rate loans above 18% which represent the riskiest Grade E, F, G borrowers.

**Loan Amount Distribution (top right):**
The histogram shows loan amounts ranging from near $0 to $35,000. The distribution peaks sharply at the $5,000 range and the red dashed line marks the mean at **$11,296**. The distribution is right-skewed — most borrowers take smaller loans ($5,000 to $15,000) with very few taking loans above $25,000.

**Avg Interest Rate by Grade (bottom left):**
This bar chart confirms the perfect progression of interest rates from Grade A to Grade G:
- A: 7.4%
- B: 11.0%
- C: 13.5%
- D: 15.7%
- E: 17.7%
- F: 19.7%
- G: 21.4%

The bank systematically charges higher interest to compensate for higher risk — a sound risk-adjusted pricing strategy. However the bad loan data shows that even higher rates do not fully offset the losses from Grade G defaults.

**Avg Loan Amount by Top 5 Purposes (bottom right):**
- Small Business: $13,583 (highest)
- House: $13,183
- Debt Consolidation: $12,763
- Credit Card: $11,782
- Home Improvement: $11,596

Small Business loans not only have the highest bad loan rate (25.62% from SQL analysis) but also the highest average loan amount ($13,583) — making them the highest risk exposure segment in the portfolio by both frequency of default and severity of loss per loan.

---

## 6. Debt Burden & Default Risk

**Source: SQL Query Results from MySQL Workbench**

This insight is derived from the SQL exploration queries — not from the Python EDA charts. The DTI (Debt-to-Income ratio) analysis was performed using SQL Query 9 (Loan Status Breakdown) cross-referenced with Query 6 (Average DTI).

| Loan Status | Avg DTI |
|---|---|
| Fully Paid | 13.17% |
| Charged Off | 14.00% |
| Current | 14.72% |

**Key Finding:**
Charged Off loans have a higher average DTI (14.00%) than Fully Paid loans (13.17%). This confirms that borrowers carrying a higher existing debt burden relative to their income are more likely to default. While the absolute difference appears small, it is statistically meaningful at portfolio scale — translating to thousands of additional bad loans when applied across 38,576 records.

The DTI metric should be treated as a critical risk screening factor in credit decisions. Borrowers with DTI above 14% should trigger additional review before loan approval.

---

## 7. Geographic Insights

**Source: SQL Query 11 — Loans by State**

| State | Applications |
|---|---|
| California (CA) | ~6,900 |
| New York (NY) | ~3,700 |
| Florida (FL) | ~2,800 |
| Texas (TX) | ~2,700 |
| New Jersey (NJ) | ~1,800 |

**Key Finding:**
California dominates with nearly double the applications of second-placed New York. The top 5 states together account for approximately 45% of all loan applications. This geographic concentration is visible in the Tree Map visual on the Borrower Profile dashboard page — California's box is significantly larger than all other states combined in the top portion of the tree map.

---

## 8. Summary Recommendations

| Insight | Recommendation |
|---|---|
| Small business loans have 25.62% bad loan rate and highest avg loan amount $13,583 | Tighten credit criteria and require stronger documentation for small business applicants |
| Grade G loans carry ~35% bad loan rate | Consider capping Grade G lending volume or requiring additional collateral |
| 60-month loans have 22.34% bad loan rate vs 10.71% for 36-month (SQL Query 18) | Favour shorter term loans for higher-risk grade borrowers |
| Charged Off borrowers have higher avg DTI at 14.00% vs 13.17% Fully Paid | Set DTI threshold at 14% as automatic risk flag for additional review |
| California represents ~18% of all applications | Monitor California portfolio health separately given concentration risk |
| Debt Consolidation at 47.2% of portfolio is extremely concentrated in one purpose | Diversify lending portfolio to reduce single-purpose concentration risk |

---

*All Python EDA charts were generated in Google Colab using pandas, matplotlib and seaborn*
*SQL insights were derived from 20 queries run in MySQL Workbench on the bank_loan_db database*
*Dataset: 38,576 loan records | January 2021 to December 2021*
*Author: Dhruv Singh*
