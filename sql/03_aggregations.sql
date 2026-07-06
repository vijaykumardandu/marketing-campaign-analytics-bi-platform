USE marketing_analytics;

-- Top 10 Products

SELECT
    p.product_name,
    p.category,
    ROUND(SUM(o.sales),2) revenue
FROM orders o
JOIN products p
ON o.product_id=p.product_id
GROUP BY p.product_name,p.category
ORDER BY revenue DESC
LIMIT 10;

--------------------------------------------------

-- Top Customers

SELECT
    c.customer_name,
    ROUND(SUM(o.sales),2) revenue
FROM orders o
JOIN customers c
ON o.customer_id=c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 10;

---------------------------------------------------

-- Top Campaigns

SELECT
    c.campaign_name,
    ROUND(SUM(o.sales),2) revenue
FROM orders o
JOIN campaigns c
ON o.campaign_id=c.campaign_id
GROUP BY c.campaign_name
ORDER BY revenue DESC;