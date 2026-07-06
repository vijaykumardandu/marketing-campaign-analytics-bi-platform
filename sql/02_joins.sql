USE marketing_analytics;

-- Revenue by Region

SELECT
    r.region_name,
    ROUND(SUM(o.sales),2) AS revenue
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN regions r
ON c.region_id = r.region_id
GROUP BY r.region_name
ORDER BY revenue DESC;

------------------------------------------------

-- Revenue by Marketing Channel

SELECT
    c.channel,
    ROUND(SUM(o.sales),2) AS revenue
FROM orders o
JOIN campaigns c
ON o.campaign_id = c.campaign_id
GROUP BY c.channel
ORDER BY revenue DESC;

------------------------------------------------

-- Revenue by Customer Segment

SELECT
    c.segment,
    ROUND(SUM(o.sales),2) revenue
FROM orders o
JOIN customers c
ON o.customer_id=c.customer_id
GROUP BY c.segment
ORDER BY revenue DESC;