USE marketing_analytics;

-- ===============================================
-- CTE 1 : Top 10 Customers by Revenue
-- ===============================================

WITH CustomerRevenue AS
(
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT *
FROM CustomerRevenue
ORDER BY revenue DESC
LIMIT 10;

----------------------------------------------------

-- CTE 2 : Revenue by Region

WITH RegionRevenue AS
(
    SELECT
        r.region_name,
        SUM(o.sales) revenue
    FROM orders o
    JOIN customers c
        ON o.customer_id=c.customer_id
    JOIN regions r
        ON c.region_id=r.region_id
    GROUP BY r.region_name
)

SELECT *
FROM RegionRevenue
ORDER BY revenue DESC;

----------------------------------------------------

-- CTE 3 : Monthly Revenue

WITH MonthlyRevenue AS
(
SELECT

MONTH(order_date) Month_No,

MONTHNAME(order_date) Month_Name,

SUM(sales) Revenue

FROM orders

GROUP BY
MONTH(order_date),
MONTHNAME(order_date)
)

SELECT *
FROM MonthlyRevenue
ORDER BY Month_No;