USE bank_loan_db;

SELECT COUNT(*) FROM loan_data;

SELECT COUNT(id) AS total_applications
FROM loan_data;

SELECT COUNT(id) AS mtd_applications
FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s')) = 12
AND YEAR(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s')) = 2021;


SELECT SUM(loan_amount) AS total_funded_amount
FROM loan_data;

SELECT SUM(total_payment) AS total_amount_received
FROM loan_data;

SELECT ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM loan_data;

SELECT ROUND(AVG(dti) * 100, 2) AS avg_dti
FROM loan_data;

SELECT
    COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) AS good_loan_count,
    ROUND(COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0 / COUNT(id), 2) AS good_loan_percentage
FROM loan_data;

SELECT
    COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) AS bad_loan_count,
    ROUND(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0 / COUNT(id), 2) AS bad_loan_percentage
FROM loan_data;

SELECT
    loan_status,
    COUNT(id)                     AS total_applications,
    SUM(loan_amount)              AS total_funded,
    SUM(total_payment)            AS total_received,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate,
    ROUND(AVG(dti) * 100, 2)      AS avg_dti
FROM loan_data
GROUP BY loan_status;

SELECT
    MONTH(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s'))     AS month_number,
    MONTHNAME(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s')) AS month_name,
    COUNT(id)          AS total_applications,
    SUM(loan_amount)   AS total_funded,
    SUM(total_payment) AS total_received
FROM loan_data
GROUP BY month_number, month_name
ORDER BY month_number;

SELECT
    address_state,
    COUNT(id)          AS total_applications,
    SUM(loan_amount)   AS total_funded,
    SUM(total_payment) AS total_received
FROM loan_data
GROUP BY address_state
ORDER BY total_applications DESC;

SELECT
    purpose,
    COUNT(id)          AS total_applications,
    SUM(loan_amount)   AS total_funded,
    SUM(total_payment) AS total_received
FROM loan_data
GROUP BY purpose
ORDER BY total_applications DESC;

SELECT
    grade,
    COUNT(id)                     AS total_applications,
    SUM(loan_amount)              AS total_funded,
    SUM(total_payment)            AS total_received,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM loan_data
GROUP BY grade
ORDER BY grade;

SELECT COUNT(id) AS pmtd_applications
FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s')) = 11
AND YEAR(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s')) = 2021;

SELECT
    month_name,
    total_applications,
    LAG(total_applications) OVER (ORDER BY month_number) AS prev_month,
    ROUND((total_applications - LAG(total_applications) OVER (ORDER BY month_number)) * 100.0 /
    LAG(total_applications) OVER (ORDER BY month_number), 2) AS mom_growth_percent
FROM (
    SELECT
        MONTH(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s'))     AS month_number,
        MONTHNAME(STR_TO_DATE(issue_date, '%Y-%m-%d %H:%i:%s')) AS month_name,
        COUNT(id) AS total_applications
    FROM loan_data
    GROUP BY month_number, month_name
) AS monthly_data
ORDER BY month_number;

SELECT
    home_ownership,
    COUNT(id)          AS total_applications,
    SUM(loan_amount)   AS total_funded,
    SUM(total_payment) AS total_received
FROM loan_data
GROUP BY home_ownership
ORDER BY total_applications DESC;

SELECT
    emp_length,
    COUNT(id)          AS total_applications,
    SUM(loan_amount)   AS total_funded,
    SUM(total_payment) AS total_received
FROM loan_data
GROUP BY emp_length
ORDER BY total_applications DESC;

SELECT
    term,
    COUNT(id)          AS total_applications,
    SUM(loan_amount)   AS total_funded,
    SUM(total_payment) AS total_received
FROM loan_data
GROUP BY term
ORDER BY term;

SELECT
    sub_grade,
    COUNT(id)                     AS total_applications,
    SUM(loan_amount)              AS total_funded,
    SUM(total_payment)            AS total_received,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM loan_data
GROUP BY sub_grade
ORDER BY sub_grade;

SELECT
    purpose,
    COUNT(id) AS total_applications,
    COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) AS bad_loans,
    ROUND(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0 / COUNT(id), 2) AS bad_loan_percentage
FROM loan_data
GROUP BY purpose
ORDER BY bad_loan_percentage DESC;