-- 1. Categorical unique values
SELECT 'Gender' AS column_name, "gender" AS unique_value
FROM public.customer_churn_cleaned
GROUP BY "gender"

UNION ALL

SELECT 'Partner', "partner"
FROM public.customer_churn_cleaned
GROUP BY "partner"

UNION ALL

SELECT 'Dependents', "dependents"
FROM public.customer_churn_cleaned
GROUP BY "dependents"

UNION ALL

SELECT 'PhoneService', "PhoneService"
FROM public.customer_churn_cleaned
GROUP BY "PhoneService"

UNION ALL

SELECT 'MultipleLines', "MultipleLines"
FROM public.customer_churn_cleaned
GROUP BY "MultipleLines"

UNION ALL

SELECT 'InternetService', "InternetService"
FROM public.customer_churn_cleaned
GROUP BY "InternetService"

UNION ALL

SELECT 'OnlineSecurity', "OnlineSecurity"
FROM public.customer_churn_cleaned
GROUP BY "OnlineSecurity"

UNION ALL

SELECT 'OnlineBackup', "OnlineBackup"
FROM public.customer_churn_cleaned
GROUP BY "OnlineBackup"

UNION ALL

SELECT 'DeviceProtection', "DeviceProtection"
FROM public.customer_churn_cleaned
GROUP BY "DeviceProtection"

UNION ALL

SELECT 'TechSupport', "TechSupport"
FROM public.customer_churn_cleaned
GROUP BY "TechSupport"

UNION ALL

SELECT 'StreamingTV', "StreamingTV"
FROM public.customer_churn_cleaned
GROUP BY "StreamingTV"

UNION ALL

SELECT 'StreamingMovies', "StreamingMovies"
FROM public.customer_churn_cleaned
GROUP BY "StreamingMovies"

UNION ALL

SELECT 'Contract', "Contract"
FROM public.customer_churn_cleaned
GROUP BY "Contract"

UNION ALL

SELECT 'PaperlessBilling', "PaperlessBilling"
FROM public.customer_churn_cleaned
GROUP BY "PaperlessBilling"

UNION ALL

SELECT 'PaymentMethod', "PaymentMethod"
FROM public.customer_churn_cleaned
GROUP BY "PaymentMethod"

UNION ALL

SELECT 'Churn', "churn"
FROM public.customer_churn_cleaned
GROUP BY "churn"

ORDER BY column_name, unique_value;


-- 2. Numeric value ranges
SELECT
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    MIN("MonthlyCharges") AS min_monthly_charges,
    MAX("MonthlyCharges") AS max_monthly_charges,
    MIN("TotalCharges") AS min_total_charges,
    MAX("TotalCharges") AS max_total_charges
FROM public.customer_churn_cleaned;


-- 3. Binary SeniorCitizen values
SELECT
    "SeniorCitizen",
    COUNT(*) AS customer_count
FROM public.customer_churn_cleaned
GROUP BY "SeniorCitizen"
ORDER BY "SeniorCitizen";


-- 4. Null value counts
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
FROM public.customer_churn_cleaned;


-- 5. Blank values counts
SELECT
    COUNT(*) FILTER (WHERE BTRIM("customerID") = '') AS customerID_blank,
    COUNT(*) FILTER (WHERE BTRIM("gender") = '') AS gender_blank,
    COUNT(*) FILTER (WHERE BTRIM("partner") = '') AS partner_blank,
    COUNT(*) FILTER (WHERE BTRIM("dependents") = '') AS dependents_blank,
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
    COUNT(*) FILTER (WHERE BTRIM("churn") = '') AS churn_blank
FROM public.customer_churn_cleaned;

-- 6. Duplicate record check
SELECT
    "customerID",
    gender,
    "SeniorCitizen",
    partner,
    dependents,
    tenure,
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
    "MonthlyCharges",
    "TotalCharges",
    churn,
    COUNT(*) AS occurrences
FROM public.customer_churn_cleaned
GROUP BY
    "customerID",
    gender,
    "SeniorCitizen",
    partner,
    dependents,
    tenure,
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
    "MonthlyCharges",
    "TotalCharges",
    churn
HAVING COUNT(*) > 1;