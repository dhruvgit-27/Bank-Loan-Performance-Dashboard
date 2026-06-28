# 💡 Business Insights — Bank Loan Performance Dashboard

> Key findings and actionable insights derived from the Bank Loan dataset
> covering 38,576 loan applications from January to December 2021.

---

## 📋 Table of Contents

1. [Portfolio Overview](#1-portfolio-overview)
2. [Loan Quality — Good vs Bad](#2-loan-quality)
3. [Monthly Growth Trend](#3-monthly-growth-trend)
4. [Risk by Grade](#4-risk-by-grade)
5. [Risk by Purpose](#5-risk-by-purpose)
6. [Debt Burden & Default Risk](#6-debt-burden--default-risk)
7. [Geographic Insights](#7-geographic-insights)
8. [Borrower Behaviour](#8-borrower-behaviour)

---

## 1. Portfolio Overview

![Monthly Trend](../screenshots/eda/monthly_trend.png)

| Metric | Value |
|---|---|
| Total Applications | 38,576 |
| Total Funded Amount | $435,757,075 |
| Total Amount Received | $473,070,933 |
| Net Profit | $37,313,858 |
| Average Interest Rate | 12.05% |
| Average DTI | 13.33% |
| Average Loan Amount | $11,296 |

**Key Finding:**
The bank funded $435M and received back $473M — a net recovery of $37.3M above the funded amount. This confirms the portfolio is **overall profitable** despite the 13.8% bad loan rate. The excess received over funded represents interest income collected from the 86.2% of good loans.

---

## 2. Loan Quality

![Good vs Bad Loan](../screenshots/eda/good_vs_bad_loan.png)

| Category | Count | % | Funded Amount | Received Amount |
|---|---|---|---|---|
| Good Loan (Fully Paid + Current) | 33,243 | 86.2% | $370.22M | $435.79M |
| Bad Loan (Charged Off) | 5,333 | 13.8% | $65.53M | $37.28M |

**Key Finding:**
Bad loans funded $65.53M but only recovered $37.28M — a **loss of $28.25M** on defaulted loans alone. This means the bank's $37.3M profit on good loans is partially offset by $28.25M losses on bad loans. The net real profit is approximately $9M. This makes bad loan identification and risk management critically important.

**Loan Status Breakdown:**
- Fully Paid: 32,145 (83.33%) — complete repayment
- Charged Off: 5,333 (13.82%) — total default
- Current: 1,098 (2.85%) — active and paying

---

## 3. Monthly Growth Trend

![Monthly Trend](../screenshots/eda/monthly_trend.png)

| Month | Applications | Funded ($M) | Received ($M) |
|---|---|---|---|
| January | 2,332 | $25M | $28M |
| February | 2,279 | $24M | $28M |
| March | 2,627 | $29M | $32M |
| April | 2,755 | $30M | $32M |
| May | 2,911 | $31M | $34M |
| June | 3,184 | $34M | $36M |
| July | 3,366 | $36M | $39M |
| August | 3,441 | $38M | $43M |
| September | 3,536 | $41M | $44M |
| October | 3,796 | $45M | $49M |
| November | 4,035 | $48M | $50M |
| December | 4,314 | $54M | $58M |

**Key Finding:**
Loan applications grew **consistently every month** throughout 2021 — from 2,279 in February (lowest) to 4,314 in December (highest). This represents an **89% increase** from the lowest to highest month. The green bars (received) are always taller than the red bars (funded) in every single month — confirming the bank maintained profitability throughout the year. February shows a slight dip from January suggesting seasonal demand patterns.

---

## 4. Risk by Grade

![Purpose Grade Analysis](../screenshots/eda/purpose_grade_analysis.png)

| Grade | Applications | Bad Loan % | Avg Interest Rate |
|---|---|---|---|
| A | 9,769 | ~5% | 7.4% |
| B | 11,640 | ~10% | 11.0% |
| C | 7,981 | ~15% | 13.5% |
| D | 5,284 | ~21% | 15.7% |
| E | 2,840 | ~25% | 17.7% |
| F | 1,059 | ~32% | 19.7% |
| G | 233 | ~35% | 21.4% |

**Key Finding:**
There is a **perfect positive correlation** between grade and both interest rate and bad loan % — as the grade worsens from A to G, the bank charges higher interest to compensate for higher risk, but the bad loan rate also rises sharply. Grade G loans carry nearly 7x the default risk of Grade A loans. Grades A and B account for the majority of applications (21,409 out of 38,576 = 55.5%) which is a positive sign for portfolio health. The sub-grade heatmap in the dashboard (A1 to G5) shows this risk gradient at the most granular level.

---

## 5. Risk by Purpose

![Purpose Grade Analysis](../screenshots/eda/purpose_grade_analysis.png)

| Purpose | Applications | Bad Loan % |
|---|---|---|
| Small Business | 1,776 | 25.62% |
| Renewable Energy | 94 | 18.09% |
| Educational | 315 | 15.87% |
| House | 366 | 15.57% |
| Other | 3,824 | 15.35% |
| Debt Consolidation | 18,214 | Moderate |
| Car | 1,497 | Lowest |

**Key Finding:**
**Small Business loans** have the highest bad loan rate at **25.62%** — nearly double the portfolio average of 13.8%. Despite only representing 1,776 applications (4.6% of total), small business loans represent a disproportionately high risk segment. **Debt Consolidation** is the most common purpose at 18,214 applications (47.2% of all loans) and has a moderate bad loan rate — this category alone drives the portfolio. Loan purpose is a strong predictor of default risk and should be weighted heavily in credit decisions.

---

## 6. Debt Burden & Default Risk

![Financial Distribution](../screenshots/eda/financial_distribution.png)

| Loan Status | Avg DTI |
|---|---|
| Fully Paid | 13.17% |
| Current | 14.72% |
| Charged Off | 14.00% |

**Key Finding:**
**Charged Off loans have a higher avg DTI (14.00%) than Fully Paid loans (13.17%)** — confirming that borrowers carrying a higher existing debt burden relative to income are more likely to default. While the difference appears small in absolute terms, at portfolio scale this translates to thousands of bad loans. The DTI metric should be treated as a critical risk screening factor. Borrowers with DTI above 15% should be subject to stricter lending criteria.

**Interest Rate Distribution (from Python EDA):**
- Mean interest rate: 12.05%
- Distribution is right-skewed — most loans clustered between 7% and 16%
- Higher interest rates (18%+) are concentrated in Grade E, F, G loans

**Loan Amount Distribution:**
- Mean loan amount: $11,296
- Most common loan size: $5,000 to $15,000
- Large loans ($25,000+) are significantly less common

---

## 7. Geographic Insights

**Top 5 States by Applications:**

| State | Applications |
|---|---|
| California (CA) | 6,900 |
| New York (NY) | 3,700 |
| Florida (FL) | 2,800 |
| Texas (TX) | 2,700 |
| New Jersey (NJ) | 1,800 |

**Key Finding:**
**California dominates** with nearly double the applications of the second highest state (New York). The top 5 states together account for approximately 45% of all loan applications. This geographic concentration presents both an opportunity (high demand) and a risk (portfolio concentration in specific regional economies). State-wise analysis in the Borrower Profile dashboard page allows risk teams to monitor regional performance and identify states with deteriorating bad loan rates.

---

## 8. Borrower Behaviour

**Home Ownership:**

| Type | % of Borrowers |
|---|---|
| RENT | 47.8% |
| MORTGAGE | 44.58% |
| OWN | 7.36% |

**Key Finding:**
Nearly half of all borrowers (47.8%) are renters — suggesting the bank's primary customer base consists of borrowers without significant property assets as collateral. Renters combined with mortgage holders (92.38%) vastly outnumber outright home owners (7.36%). This means most loans are unsecured or semi-secured which elevates portfolio risk.

**Employment Length:**
Borrowers with **10+ years of employment** make the most loan applications (8,900) — suggesting that experienced, stable employees are the bank's largest borrower segment. This is a positive indicator as longer employment duration generally correlates with income stability and lower default risk.

**Top Job Titles:**
| Job Title | Applications |
|---|---|
| Unknown | 1,438 |
| US Army | 211 |
| Bank of America | 138 |
| AT&T | 83 |
| Walmart | 82 |

The high 'Unknown' count (1,438) represents the missing emp_title values filled during data cleaning. Government and large corporate employees (US Army, Bank of America, AT&T) represent stable, reliable borrower segments.

**Average Loan Amount by Top Purposes:**
- Small Business: $13,583 (highest)
- House: $13,183
- Debt Consolidation: $12,763
- Credit Card: $11,782
- Home Improvement: $11,596

Small business loans not only have the highest bad loan rate but also the highest average loan amount — making them the highest risk exposure segment in the portfolio by both frequency and severity.

---

## 📊 Summary of Actionable Recommendations

| Finding | Recommendation |
|---|---|
| Small business loans have 25.62% bad loan rate | Tighten credit criteria for small business applicants |
| Grade G loans have ~35% bad loan rate | Consider capping Grade G lending or requiring collateral |
| 60-month loans have 22.34% bad loan rate vs 10.71% for 36-month | Favour shorter term loans for higher-risk borrowers |
| Verified loans have highest bad loan rate (15.70%) | Review verification process quality |
| Charged Off borrowers have higher DTI | Set DTI threshold at 15% for automatic risk flag |
| California represents ~18% of applications | Monitor CA portfolio health separately |

---

*Analysis based on 38,576 loan records from January to December 2021*
*Tools used: MySQL Workbench (SQL), Python/Google Colab (EDA), Power BI (Dashboard)*
