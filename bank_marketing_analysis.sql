-- =====================================================
-- BANK MARKETING SQL ANALYSIS
-- Author: Raya Sesan Firdaus
-- Objective:
-- Analyze customer behavior and campaign performance
-- to improve term deposit subscription rates.
-- =====================================================


-- =====================================================
-- SECTION 1: DATASET OVERVIEW
-- =====================================================

-- 1. Total Customers
SELECT COUNT(*) AS total_customers
FROM bank_marketing;


-- 2. Subscription Distribution
SELECT
    y AS subscription_status,
    COUNT(*) AS total_customers
FROM bank_marketing
GROUP BY y;


-- 3. Subscription Rate (%)
SELECT
    y,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM bank_marketing),
        2
    ) AS percentage
FROM bank_marketing
GROUP BY y;


-- =====================================================
-- SECTION 2: CUSTOMER ANALYSIS
-- =====================================================

-- 4. Customer Distribution by Job
SELECT
    job,
    COUNT(*) AS total_customers
FROM bank_marketing
GROUP BY job
ORDER BY total_customers DESC;


-- 5. Conversion Rate by Job
SELECT
    job,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,

    ROUND(
        SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END)
        *100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_marketing
GROUP BY job
ORDER BY conversion_rate DESC;

-- =====================================================
-- BUSINESS INSIGHT
--
-- Students have the highest conversion rate (28.68%),
-- indicating strong interest in term deposits.
--
-- Retired customers show a conversion rate of 22.79%,
-- making them a valuable target segment.
--
-- Management customers convert nearly twice as often
-- as blue-collar customers despite similar population size.
-- =====================================================

-- 6. Ranking Job Categories by Conversion Rate

WITH job_conversion AS (
    SELECT
        job,
        COUNT(*) AS total_customers,
        SUM(
            CASE
                WHEN y='yes' THEN 1
                ELSE 0
            END
        ) AS subscribed_customers,

        ROUND(
            SUM(
                CASE
                    WHEN y='yes' THEN 1
                    ELSE 0
                END
            ) *100.0 / COUNT(*),
            2
        ) AS conversion_rate

    FROM bank_marketing

    GROUP BY job
)

SELECT
    job,
    total_customers,
    subscribed_customers,
    conversion_rate,

    RANK() OVER(
        ORDER BY conversion_rate DESC
    ) AS conversion_rank

FROM job_conversion;

-- 7. Conversion Rate by Education

SELECT
    education,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_marketing
GROUP BY education
ORDER BY conversion_rate DESC;


-- 8. Conversion Rate by Age Group

SELECT
    CASE
        WHEN age < 25 THEN '<25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_marketing
GROUP BY age_group
ORDER BY conversion_rate DESC;


-- 9. Conversion Rate by Contact Method

SELECT
    contact,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_marketing
GROUP BY contact
ORDER BY conversion_rate DESC;


-- 10. Conversion Rate by Month

SELECT
    month,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_marketing
GROUP BY month
ORDER BY conversion_rate DESC;

-- 11. Previous Campaign Outcome Analysis

SELECT
    poutcome,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,

    ROUND(
        SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END)
        *100.0 / COUNT(*),
        2
    ) AS conversion_rate

FROM bank_marketing

GROUP BY poutcome

ORDER BY conversion_rate DESC;

-- =====================================================
-- BUSINESS INSIGHT
--
-- Previous campaign success is the strongest indicator
-- of future subscription behavior.
--
-- Customers with successful previous campaigns achieve
-- a conversion rate of 64.73%.
--
-- The bank should prioritize these customers in future
-- marketing campaigns to maximize conversion efficiency.
-- =====================================================