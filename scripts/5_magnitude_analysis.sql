--Find total customers by countries
SELECT
	country, 
	COUNT(customer_key) As Total_Customer 
FROM gold.dim_customers 
Group by country
ORDER BY 2 DESC;

--Find total customers by gender
SELECT 
	gender, 
	COUNT(customer_key) As Total_Customer 
FROM gold.dim_customers 
Group by gender
ORDER BY 2 DESC;

--Find total products by category

SELECT 
	category,
	count(product_key) AS Total_Products
FROM gold.dim_products
group by category
ORDER BY 2 DESC;
--WHAT Is the average costs in each category?
SELECT 
	category,
	AVG(cost) AS Average_Costs
FROM gold.dim_products
group by category
ORDER BY 2 DESC;

--What is the total revenue is genrated by each category?

SELECT 
	p.category , 
	SUM(s.sales_amount) AS Total_Revenue
FROM gold.dim_products p
RIght JOIN gold.fact_sales s on p.product_key = s.product_key
Group by p.category
ORDER BY 2 DESC;

--Find total revenue is genrated by each customer.
SELECT 
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

--WHat is the distribution of sold items across countries?

SELECT 
	c.country,
	SUM(s.quantity) AS Total_sold_items
FROM gold.dim_customers c
LEFT JOIN gold.fact_sales s on c.customer_key = s.product_key
Group by 
	c.country
ORDER BY 2 DESC;