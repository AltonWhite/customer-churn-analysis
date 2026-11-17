/*
The table was created through pgAdmin 4.
All columns were initially defined as TEXT
to preserve the original CSV values during inspection.

Equivalent SQL definition:

CREATE TABLE public.customer_churn_raw (
    "customerID" TEXT,
    "gender" TEXT,
    "SeniorCitizen" TEXT,
    "partner" TEXT,
    "dependents" TEXT,
    "tenure" TEXT,
    "PhoneService" TEXT,
    "MultipleLines" TEXT,
    "InternetService" TEXT,
    "OnlineSecurity" TEXT,
    "OnlineBackup" TEXT,
    "DeviceProtection" TEXT,
    "TechSupport" TEXT,
    "StreamingTV" TEXT,
    "StreamingMovies" TEXT,
    "Contract" TEXT,
    "PaperlessBilling" TEXT,
    "PaymentMethod" TEXT,
    "MonthlyCharges" TEXT,
    "TotalCharges" TEXT,
    "churn" TEXT
);
*/


-- 1. Total records
SELECT COUNT(*)
FROM public.customer_churn_raw;


-- 2. Preview records
SELECT *
FROM public.customer_churn_raw
LIMIT 10;


-- 3. Column names and count
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'customer_churn_raw'
ORDER BY ordinal_position;


-- 4. Unique value counts by column
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
FROM public.customer_churn_raw;


-- 5. NULL values in each column
SELECT
    SUM(CASE WHEN "customerID" IS NULL THEN 1 ELSE 0 END) AS customerID_NULL_count,
    SUM(CASE WHEN "gender" IS NULL THEN 1 ELSE 0 END) AS gender_NULL_count,
    SUM(CASE WHEN "SeniorCitizen" IS NULL THEN 1 ELSE 0 END) AS senior_citizen_NULL_count,
    SUM(CASE WHEN "partner" IS NULL THEN 1 ELSE 0 END) AS partner_NULL_count,
    SUM(CASE WHEN "dependents" IS NULL THEN 1 ELSE 0 END) AS dependents_NULL_count,
    SUM(CASE WHEN "tenure" IS NULL THEN 1 ELSE 0 END) AS tenure_NULL_count,
    SUM(CASE WHEN "PhoneService" IS NULL THEN 1 ELSE 0 END) AS phone_service_NULL_count,
    SUM(CASE WHEN "MultipleLines" IS NULL THEN 1 ELSE 0 END) AS multiple_lines_NULL_count,
    SUM(CASE WHEN "InternetService" IS NULL THEN 1 ELSE 0 END) AS internet_service_NULL_count,
    SUM(CASE WHEN "OnlineSecurity" IS NULL THEN 1 ELSE 0 END) AS online_security_NULL_count,
    SUM(CASE WHEN "OnlineBackup" IS NULL THEN 1 ELSE 0 END) AS online_backup_NULL_count,
    SUM(CASE WHEN "DeviceProtection" IS NULL THEN 1 ELSE 0 END) AS device_protection_NULL_count,
    SUM(CASE WHEN "TechSupport" IS NULL THEN 1 ELSE 0 END) AS tech_support_NULL_count,
    SUM(CASE WHEN "StreamingTV" IS NULL THEN 1 ELSE 0 END) AS streaming_tv_NULL_count,
    SUM(CASE WHEN "StreamingMovies" IS NULL THEN 1 ELSE 0 END) AS streaming_movies_NULL_count,
    SUM(CASE WHEN "Contract" IS NULL THEN 1 ELSE 0 END) AS contract_NULL_count,
    SUM(CASE WHEN "PaperlessBilling" IS NULL THEN 1 ELSE 0 END) AS paperless_billing_NULL_count,
    SUM(CASE WHEN "PaymentMethod" IS NULL THEN 1 ELSE 0 END) AS payment_method_NULL_count,
    SUM(CASE WHEN "MonthlyCharges" IS NULL THEN 1 ELSE 0 END) AS monthly_charges_NULL_count,
    SUM(CASE WHEN "TotalCharges" IS NULL THEN 1 ELSE 0 END) AS total_charges_NULL_count,
    SUM(CASE WHEN "churn" IS NULL THEN 1 ELSE 0 END) AS churn_NULL_count
FROM public.customer_churn_raw;


-- 6. Blank values in each column
SELECT
    COUNT(*) FILTER (WHERE BTRIM("customerID") = '') AS customerID_blank,
    COUNT(*) FILTER (WHERE BTRIM("gender") = '') AS gender_blank,
    COUNT(*) FILTER (WHERE BTRIM("SeniorCitizen") = '') AS senior_citizen_blank,
    COUNT(*) FILTER (WHERE BTRIM("partner") = '') AS partner_blank,
    COUNT(*) FILTER (WHERE BTRIM("dependents") = '') AS dependents_blank,
    COUNT(*) FILTER (WHERE BTRIM("tenure") = '') AS tenure_blank,
    COUNT(*) FILTER (WHERE BTRIM("PhoneService") = '') AS phone_service_blank,
    COUNT(*) FILTER (WHERE BTRIM("MultipleLines") = '') AS multiple_lines_blank,
    COUNT(*) FILTER (WHERE BTRIM("InternetService") = '') AS internet_service_blank,
    COUNT(*) FILTER (WHERE BTRIM("OnlineSecurity") = '') AS online_security_blank,
    COUNT(*) FILTER (WHERE BTRIM("OnlineBackup") = '') AS online_backup_blank,
    COUNT(*) FILTER (WHERE BTRIM("DeviceProtection") = '') AS device_protection_blank,
    COUNT(*) FILTER (WHERE BTRIM("TechSupport") = '') AS tech_support_blank,
    COUNT(*) FILTER (WHERE BTRIM("StreamingTV") = '') AS streaming_tv_blank,
    COUNT(*) FILTER (WHERE BTRIM("StreamingMovies") = '') AS streaming_movies_blank,
    COUNT(*) FILTER (WHERE BTRIM("Contract") = '') AS contract_blank,
    COUNT(*) FILTER (WHERE BTRIM("PaperlessBilling") = '') AS paperless_billing_blank,
    COUNT(*) FILTER (WHERE BTRIM("PaymentMethod") = '') AS payment_method_blank,
    COUNT(*) FILTER (WHERE BTRIM("MonthlyCharges") = '') AS monthly_charges_blank,
    COUNT(*) FILTER (WHERE BTRIM("TotalCharges") = '') AS total_charges_blank,
    COUNT(*) FILTER (WHERE BTRIM("churn") = '') AS churn_blank
FROM public.customer_churn_raw;


-- 7. Show the rows in which the TotalCharges column is blank
SELECT
    "customerID",
    "tenure",
    "MonthlyCharges",
    "TotalCharges",
    "Contract",
    "churn"
FROM public.customer_churn_raw
WHERE BTRIM("TotalCharges") = '';