import subprocess
import sys

files = [
    "generate_regions.py",
    "generate_products.py",
    "generate_campaigns.py",
    "generate_customers.py",
    "generate_calendar.py",
    "generate_marketing.py",
    "generate_orders.py"
]

for file in files:
    print(f"\nRunning {file}...")
    subprocess.run([sys.executable, f"src/{file}"], check=True)

print("All datasets generated successfully!")