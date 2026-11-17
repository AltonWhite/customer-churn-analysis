-- 1. Contract analysis
SELECT "Contract", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "Contract"
ORDER BY COUNT(*) DESC;

-- 2. Device Protection
SELECT "DeviceProtection", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "DeviceProtection"
ORDER BY COUNT(*) DESC;

-- 3. Internet Service
SELECT "InternetService", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "InternetService"
ORDER BY COUNT(*) DESC;

-- 4. Multiple Lines
SELECT "MultipleLines", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "MultipleLines"
ORDER BY COUNT(*) DESC;

-- 5. Online Backup
SELECT "OnlineBackup", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "OnlineBackup"
ORDER BY COUNT(*) DESC;

-- 6. Online Security
SELECT "OnlineSecurity", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "OnlineSecurity"
ORDER BY COUNT(*) DESC;

-- 7. Phone Service
SELECT "PhoneService", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "PhoneService"
ORDER BY COUNT(*) DESC;

-- 8. Streaming Movies
SELECT "StreamingMovies", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "StreamingMovies"
ORDER BY COUNT(*) DESC;

-- 9. Streaming TV
SELECT "StreamingTV", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "StreamingTV"
ORDER BY COUNT(*) DESC;

-- 10. TechSupport
SELECT "TechSupport", COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY "TechSupport"
ORDER BY COUNT(*) DESC;