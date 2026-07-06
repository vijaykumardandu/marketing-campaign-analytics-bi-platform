USE marketing_analytics;

-- ===============================================
-- ROW_NUMBER
-- ===============================================

SELECT

customer_id,

sales,

ROW_NUMBER() OVER(
ORDER BY sales DESC
) row_num

FROM orders;

----------------------------------------------------

-- RANK

SELECT

customer_id,

sales,

RANK() OVER(
ORDER BY sales DESC
) customer_rank

FROM orders;

----------------------------------------------------

-- DENSE_RANK

SELECT

customer_id,

sales,

DENSE_RANK() OVER(
ORDER BY sales DESC
) dense_rank

FROM orders;

----------------------------------------------------

-- Running Revenue

SELECT

order_date,

SUM(sales) daily_sales,

SUM(SUM(sales))
OVER(
ORDER BY order_date
) running_total

FROM orders

GROUP BY order_date;

----------------------------------------------------

-- LAG

SELECT

order_date,

SUM(sales) revenue,

LAG(SUM(sales))
OVER(
ORDER BY order_date
) previous_day

FROM orders

GROUP BY order_date;

----------------------------------------------------

-- LEAD

SELECT

order_date,

SUM(sales) revenue,

LEAD(SUM(sales))
OVER(
ORDER BY order_date
) next_day

FROM orders

GROUP BY order_date;