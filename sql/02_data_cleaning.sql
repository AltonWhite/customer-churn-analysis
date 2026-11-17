-- 1. Data type check
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'customer_churn_raw'
ORDER BY ordinal_position;


-- 2. Check for unexpected non-numeric values in numeric columns before conversion
SELECT
    COUNT(*) FILTER (
        WHERE BTRIM("tenure") !~ '^[0-9]+$'
          AND BTRIM("tenure") <> ''
    ) AS invalid_tenure,

    COUNT(*) FILTER (
        WHERE BTRIM("SeniorCitizen") !~ '^[0-9]+$'
          AND BTRIM("SeniorCitizen") <> ''
    ) AS invalid_senior_citizen,

    COUNT(*) FILTER (
        WHERE BTRIM("MonthlyCharges") !~ '^[0-9]+(\.[0-9]+)?$'
          AND BTRIM("MonthlyCharges") <> ''
    ) AS invalid_monthly_charges,

    COUNT(*) FILTER (
        WHERE BTRIM("TotalCharges") !~ '^[0-9]+(\.[0-9]+)?$'
          AND BTRIM("TotalCharges") <> ''
    ) AS invalid_total_charges
FROM public.customer_churn_raw;


-- 3. Create a cleaned version of the customer_churn_raw table with appropriate data types and handling of blank values
/* CREATE TABLE public.customer_churn_cleaned AS
SELECT
    "customerID",
    "gender",
    "SeniorCitizen"::INTEGER AS "SeniorCitizen",
    "partner",
    "dependents",
    "tenure"::INTEGER AS "tenure",
    "PhoneService",
    "MultipleLines",
    "InternetService",
    "OnlineSecurity",
    "OnlineBackup",
    "DeviceProtection",
    "TechSupport",
    "StreamingTV",
    "StreamingMovies",
    "Contract",
    "PaperlessBilling",
    "PaymentMethod",
    "MonthlyCharges"::NUMERIC(10,2) AS "MonthlyCharges",
    NULLIF(BTRIM("TotalCharges"), '')::NUMERIC(10,2) AS "TotalCharges",
    "churn"
FROM public.customer_churn_raw;
*/


-- 4. Verify the cleaned data
SELECT *
FROM public.customer_churn_cleaned
LIMIT 10;


-- 5. Data type check for cleaned data
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'customer_churn_cleaned'
ORDER BY ordinal_position;


-- 6. Verify record counts
SELECT COUNT(*) AS total_records
FROM public.customer_churn_cleaned;


-- 7. Verify churn distribution
SELECT
    churn,
    COUNT(*) AS customer_count
FROM public.customer_churn_cleaned
GROUP BY churn
ORDER BY customer_count DESC;


-- 8. Verify unique values in categorical columns
SELECT DISTINCT "Contract"
FROM public.customer_churn_cleaned
ORDER BY "Contract";


-- 9. Unique values counts by column in the cleaned table
SELECT
    COUNT(DISTINCT "customerID") AS customerID_unique_count,
    COUNT(DISTINCT "gender") AS gender_unique_count,
    COUNT(DISTINCT "SeniorCitizen") AS senior_citizen_unique_count,
    COUNT(DISTINCT "partner") AS partner_unique_count,
    COUNT(DISTINCT "dependents") AS dependents_unique_count,
    COUNT(DISTINCT "tenure") AS tenure_unique_count,
    COUNT(DISTINCT "PhoneService") AS phone_service_unique_count,
    COUNT(DISTINCT "MultipleLines") AS multiple_lines_unique_count,
    COUNT(DISTINCT "InternetService") AS internet_service_unique_count,
    COUNT(DISTINCT "OnlineSecurity") AS online_security_unique_count,
    COUNT(DISTINCT "OnlineBackup") AS online_backup_unique_count,
    COUNT(DISTINCT "DeviceProtection") AS device_protection_unique_count,
    COUNT(DISTINCT "TechSupport") AS tech_support_unique_count,
    COUNT(DISTINCT "StreamingTV") AS streaming_tv_unique_count,
    COUNT(DISTINCT "StreamingMovies") AS streaming_movies_unique_count,
    COUNT(DISTINCT "Contract") AS contract_unique_count,
    COUNT(DISTINCT "PaperlessBilling") AS paperless_billing_unique_count,
    COUNT(DISTINCT "PaymentMethod") AS payment_method_unique_count,
    COUNT(DISTINCT "MonthlyCharges") AS monthly_charges_unique_count,
    COUNT(DISTINCT "TotalCharges") AS total_charges_unique_count,
    COUNT(DISTINCT "churn") AS churn_unique_count
FROM public.customer_churn_cleaned;