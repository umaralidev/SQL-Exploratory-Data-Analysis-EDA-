-- identify the earliest and lates dates(boundries)

SELECT MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date
FROM gold.fact_sales;


--How Many years of sales are avaiale
SELECT MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(YEAR, MIN(order_date),MAX(order_date)) AS order_range_years
FROM gold.fact_sales;

-- FInd the youngest and oldes age

SELECT 
MIN(birthdate) AS oldest_age,
DATEDIFF(YEAR, MIN(birthdate),GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_age,
DATEDIFF(year, max(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;