import pandas as pd
import random
from datetime import datetime, timedelta

random.seed(42)

customers = pd.read_csv("data/raw/customers.csv")
campaigns = pd.read_csv("data/raw/campaigns.csv")
products = pd.read_csv("data/raw/products.csv")

customer_ids = customers["customer_id"].tolist()
campaign_ids = campaigns["campaign_id"].tolist()

price_dict = products.set_index("product_id")["price"].to_dict()
product_ids = list(price_dict.keys())

orders = []

for i in range(1, 100001):

    product = random.choice(product_ids)

    quantity = random.randint(1, 5)

    sales = quantity * price_dict[product]

    profit = round(
        sales * random.uniform(0.10, 0.35),
        2
    )

    order_date = (
        datetime(2025, 1, 1)
        + timedelta(days=random.randint(0, 364))
    ).date()

    orders.append({
        "order_id": f"ORD{i:06}",
        "customer_id": random.choice(customer_ids),
        "campaign_id": random.choice(campaign_ids),
        "product_id": product,
        "order_date": order_date,
        "quantity": quantity,
        "sales": sales,
        "profit": profit
    })

orders = pd.DataFrame(orders)

orders.to_csv("data/raw/orders.csv", index=False)

print("✅ orders.csv created")