-- In this query, I'm checking if the data is properly onboard 
SELECT * FROM `full-pipe-line-project.ecommerce_project.orders_raw` LIMIT 10

--This query replace the " " in column names with _ (why cuz ship date gives error)
CREATE OR REPLACE TABLE `full-pipe-line-project.ecommerce_project.orders_clean` AS
SELECT
  `Row ID` AS row_id,
  `Order ID` AS order_id,
  `Order Date` AS order_date,
  `Ship Date` AS ship_date,
  `Ship Mode` AS ship_mode,
  `Customer ID` AS customer_id,
  `Customer Name` AS customer_name,
  `Segment` AS segment,
  `Country` AS country,
  `City` AS city,
  `State` AS state,
  `Postal Code` AS postal_code,
  `Region` AS region,
  `Product ID` AS product_id,
  `Category` AS category,
  `Sub-Category` AS sub_category,
  `Product Name` AS product_name,
  `Sales` AS sales,
FROM `full-pipe-line-project.ecommerce_project.orders_raw`;

-- Againg checking if the column names are replaced correctly
SELECT * 
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
LIMIT 10;

--In this query, I'm checking for null values
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(order_id IS NULL) AS null_order_id,
  COUNTIF(order_date IS NULL) AS null_order_date,
  COUNTIF(ship_date IS NULL) AS null_ship_date,
  COUNTIF(customer_id IS NULL) AS null_customer_id,
  COUNTIF(sales IS NULL) AS null_sales,
  COUNTIF(region IS NULL) AS null_region,
  COUNTIF(category IS NULL) AS null_category

FROM `full-pipe-line-project.ecommerce_project.orders_clean`;

--So in this Query, we r checking if the order_id has duplicates
SELECT 
  order_id, 
  COUNT(*) AS count
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY order_id
HAVING count > 1;


SELECT
  round(SUM(sales),2) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders,
  COUNT(DISTINCT customer_id) AS total_customers,
  round(SUM(sales) / COUNT(DISTINCT order_id),2) AS avg_order_value
FROM `full-pipe-line-project.ecommerce_project.orders_clean`;


SELECT
  DATE_TRUNC(order_date, MONTH) AS month,
  round(SUM(sales),0) AS revenue
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY month
ORDER BY month;


-- Top 10 revenue-generating products
SELECT
  product_name,
  ROUND(SUM(sales),2) AS revenue
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- Revenue by region
SELECT
  region,
  ROUND(SUM(sales),2) AS revenue
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY region
ORDER BY revenue DESC;

-- Revenue by category
SELECT
  category,
  ROUND(SUM(sales),2) AS revenue
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY category
ORDER BY revenue DESC;

-- Top 10 customers by revenue
SELECT
  customer_name,
  ROUND(SUM(sales),2) AS revenue
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY customer_name
ORDER BY revenue DESC
LIMIT 10;


WITH customer_orders AS (
  SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
  FROM `full-pipe-line-project.ecommerce_project.orders_clean`
  GROUP BY customer_id
)

SELECT
  CASE 
    WHEN order_count = 1 THEN 'New Customer'
    ELSE 'Repeat Customer'
  END AS customer_type,
  COUNT(*) AS customer_count
FROM customer_orders
GROUP BY customer_type;

SELECT
  city,
  ROUND(SUM(sales),2) AS revenue
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;


SELECT
  DATE_TRUNC(order_date, MONTH) AS month,
  COUNT(DISTINCT order_id) AS total_orders
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY month
ORDER BY month;


SELECT
  customer_id,
  COUNT(DISTINCT order_id) AS order_count
FROM `full-pipe-line-project.ecommerce_project.orders_clean`
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 10;
