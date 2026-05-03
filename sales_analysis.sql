CREATE DATABASE sales_project;
USE sales_project;

CREATE TABLE sales_data (
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_name VARCHAR(255),
    segment VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(100),
    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

## verifying data
SELECT COUNT(*) FROM sales_date_clean;
SELECT * FROM sales_date_clean LIMIT 10;

## Total Revenue
SELECT SUM(sales) AS total_revenue FROM sales_date_clean;

## Best selling products By Orders 
SELECT product_name, COUNT(*) AS total_orders
FROM sales_date_clean
GROUP BY product_name
ORDER BY total_orders DESC;

## Best selling product By Revenue
SELECT 
    product_name,
    SUM(sales) AS total_revenue
FROM sales_date_clean
GROUP BY product_name
ORDER BY total_revenue DESC;


## country-wise sales
SELECT 
    country,
    SUM(sales) AS total_revenue
FROM sales_date_clean
GROUP BY country
ORDER BY total_revenue DESC;

## Region-wise sales
SELECT 
    region,
    SUM(sales) AS total_revenue
FROM sales_date_clean
GROUP BY region
ORDER BY total_revenue DESC;

## State-wise sales
SELECT 
    state,
    SUM(sales) AS total_revenue
FROM sales_date_clean
GROUP BY state
ORDER BY total_revenue DESC;

## Average Order Value
SELECT AVG(sales) AS avg_order_value
FROM sales_date_clean;

## Category-wise Revenue
SELECT 
    category,
    SUM(sales) AS total_revenue
FROM sales_date_clean
GROUP BY category
ORDER BY total_revenue DESC;

##sub-category Revenue 
SELECT 
    sub_category,
    SUM(sales) AS total_revenue
FROM sales_date_clean
GROUP BY sub_category
ORDER BY total_revenue DESC;

## Top 5 customers
SELECT 
    customer_name,
    SUM(sales) AS total_revenue
FROM sales_date_clean
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 5;


