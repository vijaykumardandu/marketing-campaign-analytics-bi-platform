USE marketing_analytics;

CREATE INDEX idx_customer
ON orders(customer_id);

CREATE INDEX idx_product
ON orders(product_id);

CREATE INDEX idx_campaign
ON orders(campaign_id);

CREATE INDEX idx_order_date
ON orders(order_date);git init