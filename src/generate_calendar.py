import pandas as pd

dates = pd.date_range("2025-01-01", "2025-12-31")

calendar = pd.DataFrame({
    "date": dates,
    "year": dates.year,
    "quarter": "Q" + dates.quarter.astype(str),
    "month": dates.month_name(),
    "month_number": dates.month,
    "week": dates.isocalendar().week,
    "day": dates.day_name()
})

calendar.to_csv("data/raw/calendar.csv", index=False)

print("✅ calendar.csv created")