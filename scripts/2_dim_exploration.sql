-- Explore all countries our customers come from?

SELECT DISTINCT country
FROM gold.dim_customers

-- EXPLORE all Product categories 'The Major Disvisons'

SELECT 
DISTINCT category, subcategory
FROM gold.dim_products;

SELECT 
DISTINCT category, subcategory, product_name
FROM gold.dim_products
ORDER BY 1,2,3;

