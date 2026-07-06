import pandas as pd
import random

random.seed(42)

campaigns = pd.read_csv("data/raw/campaigns.csv")

dates = pd.date_range("2025-01-01", "2025-12-31")

marketing = []

pid = 1

for _, campaign in campaigns.iterrows():

    for current_date in dates:

        impressions = random.randint(5000, 50000)

        clicks = random.randint(
            int(impressions * 0.02),
            int(impressions * 0.08)
        )

        leads = random.randint(
            int(clicks * 0.15),
            int(clicks * 0.35)
        )

        conversions = random.randint(
            int(leads * 0.10),
            max(int(leads * 0.40), 1)
        )

        marketing.append({
            "performance_id": f"MP{pid:06}",
            "campaign_id": campaign["campaign_id"],
            "date": current_date.date(),
            "impressions": impressions,
            "clicks": clicks,
            "leads": leads,
            "conversions": conversions,
            "marketing_cost": random.randint(5000, 25000)
        })

        pid += 1

marketing = pd.DataFrame(marketing)

marketing.to_csv(
    "data/raw/marketing_performance.csv",
    index=False
)

print("✅ marketing_performance.csv created")