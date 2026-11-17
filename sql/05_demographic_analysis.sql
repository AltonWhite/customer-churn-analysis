-- 1. Gender demographic
SELECT gender, COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY gender
ORDER BY 
    CASE
        WHEN gender = 'Male' THEN 1
        WHEN gender = 'Female' THEN 2
    END;


-- 2. Partners
SELECT partner, COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY partner
ORDER BY 
    CASE
        WHEN partner = 'Yes' THEN 1
        WHEN partner = 'No' THEN 2
    END;


-- 3. Dependents
SELECT dependents, COUNT(*)
FROM public.customer_churn_cleaned
GROUP BY dependents
ORDER BY 
    CASE
        WHEN dependents = 'Yes' THEN 1
        WHEN dependents = 'No' THEN 2
    END;


-- 4. Senior Citizen status
SELECT
    CASE
        WHEN "SeniorCitizen" = 1 THEN 'Yes'
        WHEN "SeniorCitizen" = 0 THEN 'No'
    END AS senior_citizen,
    COUNT(*) AS customer_count
FROM public.customer_churn_cleaned
GROUP BY "SeniorCitizen"
ORDER BY "SeniorCitizen" DESC;