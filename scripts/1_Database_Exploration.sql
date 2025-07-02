SELECT 
DISTINCT category
FROM gold.dim_products;

-- Explore All objects in the database

SELECT * FROM INFORMATION_SCHEMA.Tables;

-- Explore the columns

SELECT *  FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';


