-- 1. Tenure range
SELECT
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
        WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
        WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
        WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
        WHEN tenure BETWEEN 61 AND 72 THEN '61-72 months'
    END AS tenure_range,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY tenure_range
ORDER BY tenure_range;

-- 2. Average and Median Tenure by Churn
SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(tenure), 2) AS average_tenure_by_churn,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY tenure)::NUMERIC AS median_tenure_by_churn,
    ROUND(STDDEV(tenure), 2) AS tenure_std_by_churn
FROM public.customer_churn_cleaned
GROUP BY churn;

-- 3. Overall Tenure statistics
SELECT
    COUNT(*) AS customer_count,
    MAX(tenure) AS max_tenure,
    MIN(tenure) AS min_tenure,
    ROUND(AVG(tenure), 2) AS average_tenure,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY tenure)::NUMERIC AS median_tenure,
    ROUND(STDDEV(tenure), 2) AS tenure_std
FROM public.customer_churn_cleaned;
