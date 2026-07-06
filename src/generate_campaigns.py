import pandas as pd
import random
from datetime import datetime, timedelta

random.seed(42)

channels = [
    "Google Ads",
    "Facebook Ads",
    "LinkedIn Ads",
    "Email",
    "Organic Search"
]

campaigns = []

for i in range(1, 51):

    start = datetime(2025, 1, 1) + timedelta(days=random.randint(0, 250))

    end = start + timedelta(days=90)

    campaigns.append({
        "campaign_id": f"CMP{i:03}",
        "campaign_name": f"Campaign {i}",
        "channel": random.choice(channels),
        "start_date": start.date(),
        "end_date": end.date(),
        "budget": random.randint(100000, 1000000)
    })

campaigns = pd.DataFrame(campaigns)

campaigns.to_csv("data/raw/campaigns.csv", index=False)

print("✅ campaigns.csv created")