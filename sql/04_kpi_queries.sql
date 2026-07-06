USE marketing_analytics;

SELECT

SUM(impressions) total_impressions,

SUM(clicks) total_clicks,

SUM(leads) total_leads,

SUM(conversions) total_conversions,

ROUND(
SUM(clicks)*100.0/
SUM(impressions),2
) CTR,

ROUND(
SUM(conversions)*100.0/
SUM(clicks),2
) Conversion_Rate,

ROUND(
SUM(marketing_cost)/
SUM(clicks),2
) CPC,

ROUND(
SUM(marketing_cost)/
SUM(leads),2
) CPL

FROM marketing_performance;