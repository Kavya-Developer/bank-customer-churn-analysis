-- ============================================
-- BANK CUSTOMER CHURN ANALYSIS
-- 01 - BASIC SQL QUERIES
-- ============================================


-- 1. Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- 2. Count customers by churn status
SELECT
    Exited,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Exited;


-- 3. Display customers by readable churn status
SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Stayed'
    END AS customer_status,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Exited;


-- 4. Count customers by geography
SELECT
    Geography,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Geography
ORDER BY customer_count DESC;


-- 5. Count customers by gender
SELECT
    Gender,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Gender
ORDER BY customer_count DESC;


-- 6. Count customers by number of products
SELECT
    NumOfProducts,
    COUNT(*) AS customer_count
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- 7. Count customers by credit card status
SELECT
    HasCrCard,
    COUNT(*) AS customer_count
FROM customers
GROUP BY HasCrCard
ORDER BY HasCrCard;


-- 8. Count customers by active member status
SELECT
    IsActiveMember,
    COUNT(*) AS customer_count
FROM customers
GROUP BY IsActiveMember
ORDER BY IsActiveMember;