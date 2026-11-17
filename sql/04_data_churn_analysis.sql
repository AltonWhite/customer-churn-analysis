-- 1. Churn distribution
SELECT churn, COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY churn
ORDER BY 
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 2. Churn Rate
SELECT churn, COUNT(*) AS count, 
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM public.customer_churn_cleaned
GROUP BY churn
ORDER BY 
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 3. Churn distribution by gender
SELECT
    gender,
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY gender),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY gender, churn
ORDER BY gender, 
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 4. Churn by contract
SELECT
    "Contract",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "Contract"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "Contract", churn
ORDER BY
    "Contract",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 5. Churn by Internet Service
SELECT
    "InternetService",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "InternetService"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "InternetService", churn
ORDER BY
    "InternetService",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 6. Churn by Payment Method
SELECT
    "PaymentMethod",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "PaymentMethod"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "PaymentMethod", churn
ORDER BY
    "PaymentMethod",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 7. Churn by Paperless Billing
SELECT
    "PaperlessBilling",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "PaperlessBilling"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "PaperlessBilling", churn
ORDER BY
    "PaperlessBilling",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 8. Churn by partner and dependents
SELECT
    "partner",
    "dependents",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "partner", "dependents"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "partner", "dependents", churn
ORDER BY
    "partner",
    "dependents",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 9. Churn by Senior Citizen status
SELECT
    CASE
        WHEN "SeniorCitizen" = 1 THEN 'Yes'
        WHEN "SeniorCitizen" = 0 THEN 'No'
    END AS senior_citizen,
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "SeniorCitizen"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "SeniorCitizen", churn
ORDER BY
    "SeniorCitizen",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 10. Churn by Device Protection
SELECT
    "DeviceProtection",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "DeviceProtection"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "DeviceProtection", churn
ORDER BY
    "DeviceProtection",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 11. Churn by Online Backup
SELECT
    "OnlineBackup",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "OnlineBackup"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "OnlineBackup", churn
ORDER BY
    "OnlineBackup",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 12. Churn by Online Security
SELECT
    "OnlineSecurity",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "OnlineSecurity"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "OnlineSecurity", churn
ORDER BY
    "OnlineSecurity",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 13. Churn by Tech Support
SELECT
    "TechSupport",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "TechSupport"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "TechSupport", churn
ORDER BY
    "TechSupport",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 14. Churn by Phone Service
SELECT
    "PhoneService",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "PhoneService"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "PhoneService", churn
ORDER BY
    "PhoneService",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 15. Churn by Multiple Lines
SELECT
    "MultipleLines",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "MultipleLines"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "MultipleLines", churn
ORDER BY
    "MultipleLines",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 16. Churn by Streaming TV
SELECT
    "StreamingTV",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "StreamingTV"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "StreamingTV", churn
ORDER BY
    "StreamingTV",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;


-- 17. Churn by Streaming Movies
SELECT
    "StreamingMovies",
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY "StreamingMovies"),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY "StreamingMovies", churn
ORDER BY
    "StreamingMovies",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;

-- 18. Churn by Tenure Range
SELECT
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
        WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
        WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
        WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
        WHEN tenure BETWEEN 61 AND 72 THEN '61-72 months'
    END AS tenure_range,
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY 
            CASE
                WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
                WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
                WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
                WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
                WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
                WHEN tenure BETWEEN 61 AND 72 THEN '61-72 months'
            END),
        2
    ) AS percentage
FROM public.customer_churn_cleaned
GROUP BY tenure_range, churn
ORDER BY
    "tenure_range",
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 2
    END;