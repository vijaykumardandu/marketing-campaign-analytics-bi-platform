import pandas as pd
import os

os.makedirs("data/raw", exist_ok=True)

regions = pd.DataFrame({
    "region_id": ["R001", "R002", "R003", "R004"],
    "region_name": ["North", "South", "East", "West"],
    "country": ["India", "India", "India", "India"]
})

regions.to_csv("data/raw/regions.csv", index=False)

print("regions.csv created")