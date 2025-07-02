-- WHich 5 products generate the highest revenue.

SELECT
	TOP 5
	p.product_name , 
	SUM(s.sales_amount) AS Total_Revenue
FROM gold.dim_products p
RIght JOIN gold.fact_sales s on p.product_key = s.product_key
Group by p.product_name
ORDER BY 2 DESC;


-- What are the 5 worst-Performing products in terms of sales?
SELECT
	TOP 5
	p.product_name , 
	SUM(s.sales_amount) AS Total_Revenue
FROM gold.dim_products p
RIght JOIN gold.fact_sales s on p.product_key = s.product_key
Group by p.product_name
ORDER BY 2 ASC;

-- 5 Sub-Categories that generate highest revenue

SELECT
	TOP 5
	p.subcategory , 
	SUM(s.sales_amount) AS Total_Revenue
FROM gold.dim_products p
RIght JOIN gold.fact_sales s on p.product_key = s.product_key
Group by p.subcategory
ORDER BY 2 DESC;

-- using windows functions
SELECT * FROM(
	SELECT
		p.subcategory , 
		SUM(s.sales_amount) AS Total_Revenue,
		ROW_NUMBER() OVER (order by SUM(s.sales_amount) DESC) AS ranked_products
	FROM gold.dim_products p
	RIght JOIN gold.fact_sales s on p.product_key = s.product_key
	Group by p.subcategory) t
WHERE ranked_products <=5


-- 5 worst-performing sub-categories
SELECT
	TOP 5
	p.subcategory , 
	SUM(s.sales_amount) AS Total_Revenue
FROM gold.dim_products p
RIght JOIN gold.fact_sales s on p.product_key = s.product_key
Group by p.subcategory
ORDER BY 2 ASC;

-- Find the Top-10 Customers who have genrated the highest revenue

SELECT 
	Top 10
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(s.sales_amount) AS Total_Revenue
FROM gold.dim_customers c
Right JOIN gold.fact_sales s on c.customer_key = s.customer_key
Group by 
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY 4 DESC;


-- add 3 customers witht he fewest orders placed

SELECT 
	Top 3
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT order_number) AS Total_orders
FROM gold.dim_customers c
Right JOIN gold.fact_sales s 
on c.customer_key = s.customer_key
Group by 
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY 4 ASC;