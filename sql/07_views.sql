USE marketing_analytics;

CREATE OR REPLACE VIEW vw_sales_summary AS

SELECT

o.order_id,

o.order_date,

c.customer_name,

p.product_name,

ca.campaign_name,

r.region_name,

o.sales,

o.profit

FROM orders o

JOIN customers c
ON o.customer_id=c.customer_id

JOIN products p
ON o.product_id=p.product_id

JOIN campaigns ca
ON o.campaign_id=ca.campaign_id

JOIN regions r
ON c.region_id=r.region_id;