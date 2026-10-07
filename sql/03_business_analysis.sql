-- ============================================
-- BANK CUSTOMER CHURN ANALYSIS
-- 03 - BUSINESS ANALYSIS
-- ============================================


-- 1. Identify high-churn geographic segments
SELECT
    Geography,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY Geography, IsActiveMember
ORDER BY churn_rate DESC;


-- 2. Churn rate by age group
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END
ORDER BY churn_rate DESC;


-- 3. Churn rate by geography and gender
SELECT
    Geography,
    Gender,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY Geography, Gender
ORDER BY Geography, churn_rate DESC;


-- 4. Churn rate by products and activity
SELECT
    NumOfProducts,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY NumOfProducts, IsActiveMember
ORDER BY NumOfProducts, churn_rate DESC;


-- 5. Identify high-balance churned customers
SELECT
    COUNT(*) AS customer_count,
    AVG(Balance) AS average_balance,
    SUM(Balance) AS total_balance
FROM customers
WHERE Balance > 97198.54
  AND Exited = 1;


-- 6. High-balance churned customers by geography
SELECT
    Geography,
    COUNT(*) AS customer_count,
    AVG(Balance) AS average_balance,
    SUM(Balance) AS total_balance
FROM customers
WHERE Balance > 97198.54
  AND Exited = 1
GROUP BY Geography
ORDER BY total_balance DESC;


-- 7. Customers with multiple products and high churn
SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers
FROM customers
GROUP BY NumOfProducts
HAVING SUM(Exited) > 100
ORDER BY churned_customers DESC;


-- 8. Geographies with churn rate above 20%
SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    AVG(Exited) * 100 AS churn_rate
FROM customers
GROUP BY Geography
HAVING AVG(Exited) * 100 > 20
ORDER BY churn_rate DESC;


-- 9. Top 10 highest-balance customers who churned
SELECT
    CustomerId,
    Geography,
    Age,
    Balance,
    Exited
FROM customers
WHERE Exited = 1
ORDER BY Balance DESC
LIMIT 10;