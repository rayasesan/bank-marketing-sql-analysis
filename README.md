# Bank Marketing SQL Analysis

## Project Overview

This project analyzes a bank marketing campaign dataset using SQL to identify customer segments and campaign factors that influence term deposit subscriptions.

## Dataset

Bank Marketing Dataset (UCI Machine Learning Repository)

- Total Records: 45,211
- Features: 17
- Target Variable: Subscription (yes/no)

## Tools

- SQLite
- DB Browser for SQLite
- SQL

## Business Questions

1. What is the overall subscription rate?
2. Which job categories have the highest conversion rate?
3. How does education affect subscription behavior?
4. Which contact methods perform best?
5. How does campaign timing influence conversion?
6. Does previous campaign outcome affect future subscriptions?

## Key Findings

### Job Analysis
- Students achieved the highest conversion rate (28.68%).
- Retired customers achieved a conversion rate of 22.79%.

### Education Analysis
- Customers with tertiary education showed the highest conversion rate (15.01%).

### Contact Analysis
- Cellular contact achieved a conversion rate of 14.92%.
- Unknown contact methods achieved only 4.07%.

### Campaign Timing
- March achieved the highest conversion rate (51.99%).

### Previous Campaign Outcome
- Customers with successful previous campaigns achieved a conversion rate of 64.73%.
- Previous campaign success is the strongest predictor of future subscription behavior.

## SQL Skills Demonstrated

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate Functions
- CASE WHEN
- Subquery
- Common Table Expressions (CTE)
- Window Functions (RANK)

## Business Recommendations

1. Prioritize customers with successful previous campaign outcomes.
2. Focus on high-converting customer segments such as students and retirees.
3. Increase the use of cellular contact channels.
4. Optimize campaign timing based on historical conversion performance.
