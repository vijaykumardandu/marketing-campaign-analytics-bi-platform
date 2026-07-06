USE marketing_analytics;

DELIMITER $$

CREATE PROCEDURE GetRevenueByRegion()

BEGIN

SELECT

r.region_name,

ROUND(SUM(o.sales),2) revenue

FROM orders o

JOIN customers c
ON o.customer_id=c.customer_id

JOIN regions r
ON c.region_id=r.region_id

GROUP BY r.region_name;

END $$

DELIMITER ;
