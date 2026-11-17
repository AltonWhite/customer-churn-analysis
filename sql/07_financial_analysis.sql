-- 1. Total charges
SELECT
    SUM("TotalCharges") AS total_charges_sum,
    ROUND(AVG("TotalCharges"), 2) AS total_charges_average,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY "TotalCharges")::NUMERIC,
        2
    ) AS total_charges_median,
    ROUND(STDDEV("TotalCharges"), 2) AS total_charges_std
FROM public.customer_churn_cleaned;

-- 2. Total charges analysis by churn
SELECT
    churn,
    COUNT("TotalCharges") AS customer_count,
    SUM("TotalCharges") AS total_charges_sum,
    ROUND(AVG("TotalCharges"), 2) AS total_charges_average,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY "TotalCharges")::NUMERIC,
        2
    ) AS total_charges_median,
    ROUND(STDDEV("TotalCharges"), 2) AS total_charges_std
FROM public.customer_churn_cleaned
GROUP BY churn;

-- 3. Monthly charges analysis by churn
SELECT
    churn,
    COUNT("MonthlyCharges") AS customer_count,
    SUM("MonthlyCharges") AS monthly_charges_sum,
    ROUND(AVG("MonthlyCharges"), 2) AS monthly_charges_avg,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY "MonthlyCharges")::NUMERIC,
        2
    ) AS monthly_charges_median,
     ROUND(STDDEV("MonthlyCharges"), 2) AS monthly_charges_std
FROM public.customer_churn_cleaned
GROUP BY churn;
