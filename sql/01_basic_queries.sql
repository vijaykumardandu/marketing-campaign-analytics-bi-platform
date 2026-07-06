USE marketing_analytics;

-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Revenue
SELECT ROUND(SUM(sales),2) AS total_revenue
FROM orders;

-- Total Profit
SELECT ROUND(SUM(profit),2) AS total_profit
FROM orders;

-- Average Order Value
SELECT ROUND(AVG(sales),2) AS average_order_value
FROM orders;

-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Products
SELECT COUNT(*) AS total_products
FROM products;

-- Total Campaigns
SELECT COUNT(*) AS total_campaigns
FROM campaigns;