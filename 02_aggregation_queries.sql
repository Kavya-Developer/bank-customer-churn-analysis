-- ============================================
-- BANK CUSTOMER CHURN ANALYSIS
-- 02 - AGGREGATION QUERIES
-- ============================================


-- 1. Churn rate by geography
SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY Geography
ORDER BY churn_rate DESC;


-- 2. Churn rate by active member status
SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY IsActiveMember
ORDER BY churn_rate DESC;


-- 3. Average balance by churn status
SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Stayed'
    END AS customer_status,
    COUNT(*) AS customer_count,
    AVG(Balance) AS average_balance
FROM customers
GROUP BY Exited
ORDER BY average_balance DESC;


-- 4. Average credit score by churn status
SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Stayed'
    END AS customer_status,
    COUNT(*) AS customer_count,
    AVG(CreditScore) AS average_credit_score
FROM customers
GROUP BY Exited
ORDER BY average_credit_score DESC;


-- 5. Average tenure by churn status
SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Stayed'
    END AS customer_status,
    COUNT(*) AS customer_count,
    AVG(Tenure) AS average_tenure
FROM customers
GROUP BY Exited
ORDER BY average_tenure DESC;


-- 6. Average estimated salary by churn status
SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Stayed'
    END AS customer_status,
    COUNT(*) AS customer_count,
    AVG(EstimatedSalary) AS average_salary
FROM customers
GROUP BY Exited
ORDER BY average_salary DESC;


-- 7. Churn rate by number of products
SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY NumOfProducts
ORDER BY churn_rate DESC;


-- 8. Churn rate by gender
SELECT
    Gender,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY Gender
ORDER BY churn_rate DESC;