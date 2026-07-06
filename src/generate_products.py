import pandas as pd
import random
from faker import Faker

fake = Faker("en_IN")

random.seed(42)

categories = [
    "Electronics",
    "Furniture",
    "Office Supplies",
    "Fashion",
    "Home Appliances"
]

products = []

for i in range(1, 101):

    products.append({
        "product_id": f"P{i:03}",
        "product_name": fake.word().title(),
        "category": random.choice(categories),
        "price": random.randint(500, 50000)
    })

products = pd.DataFrame(products)

products.to_csv("data/raw/products.csv", index=False)

print("✅ products.csv created")