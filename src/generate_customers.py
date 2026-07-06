import pandas as pd
import random
from faker import Faker

fake = Faker("en_IN")

random.seed(42)

cities = [
    ("Hyderabad", "Telangana", "R002"),
    ("Bengaluru", "Karnataka", "R002"),
    ("Chennai", "Tamil Nadu", "R002"),
    ("Mumbai", "Maharashtra", "R004"),
    ("Pune", "Maharashtra", "R004"),
    ("Ahmedabad", "Gujarat", "R004"),
    ("Delhi", "Delhi", "R001"),
    ("Noida", "Uttar Pradesh", "R001"),
    ("Lucknow", "Uttar Pradesh", "R001"),
    ("Jaipur", "Rajasthan", "R001"),
    ("Kolkata", "West Bengal", "R003"),
    ("Bhubaneswar", "Odisha", "R003"),
    ("Patna", "Bihar", "R003"),
    ("Visakhapatnam", "Andhra Pradesh", "R002")
]

segments = [
    "Consumer",
    "Corporate",
    "Small Business"
]

customers = []

for i in range(1, 10001):

    city, state, region = random.choice(cities)

    customers.append({
        "customer_id": f"C{i:05}",
        "customer_name": fake.name(),
        "gender": random.choice(["Male", "Female"]),
        "age": random.randint(18, 65),
        "city": city,
        "state": state,
        "region_id": region,
        "segment": random.choice(segments),
        "join_date": fake.date_between(
            start_date="-3y",
            end_date="today"
        )
    })

customers = pd.DataFrame(customers)

customers.to_csv("data/raw/customers.csv", index=False)

print("✅ customers.csv created")