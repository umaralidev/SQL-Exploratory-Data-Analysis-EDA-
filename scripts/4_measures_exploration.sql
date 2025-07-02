-- Calculate the key metric of the business ( Big Numbers)
-- Highest Level of aggreagtions  | Low Level of Aggregations 

-- Find the total sales

SELECT 
	SUM(sales_amount) AS total_sales 
FROM gold.fact_sales;

-- Find how many items are sold
SELECT 
	SUM(quantity) as total_quantity
FROM gold.fact_sales;

-- Find the average selling price

SELECT 
	AVG(price) AS avg_selling_price
FROM gold.fact_sales;

-- Find the total number of orders
SELECT 
	COUNT(order_number) AS total_orders
FROM gold.fact_sales

SELECT 
	COUNT(DISTINCT(order_number)) AS total_orders
FROM gold.fact_sales

-- Find the total number of products
SELECT 
	COUNT(product_name) AS total_products
FROM gold.dim_products

SELECT 
	COUNT(DISTINCT(product_name)) AS total_products
FROM gold.dim_products

-- Find the total number of customers
SELECT 
	COUNT(customer_number) AS total_customers
FROM gold.dim_customers

SELECT 
	COUNT(DISTINCT(customer_key)) AS total_customers
FROM gold.dim_customers

-- Find the total number of customers that has placed the order.

SELECT COUNT(DISTINCT(customer_key)) AS Customer_placed_order
FROM gold.fact_sales;

-- Generate a Report that shows all key metrics of the business

SELECT 
	'Total Sales' As measure_name,
	SUM(sales_amount) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT 
	'Total Quantity' As measure_name,
	SUM(quantity) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT 
	'AVG Selling Price' As measure_name,
	AVG(price) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT 
	'Total Orders' As measure_name,
	COUNT(DISTINCT(order_number)) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT 
	'Total Products' As measure_name,
	COUNT(DISTINCT(product_name)) AS measure_value
FROM gold.dim_products
UNION ALL
SELECT 
	'Total Customers' As measure_name,
	COUNT(DISTINCT(customer_key)) AS measure_value
FROM gold.dim_customers
UNION ALL
SELECT 
	'Customers Placed Orders' As measure_name,
	COUNT(DISTINCT(customer_key)) AS measure_value
FROM gold.fact_sales;
