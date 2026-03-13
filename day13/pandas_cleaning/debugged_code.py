import pandas as pd

df = pd.DataFrame({
    "price": ["1,500", "2000", "N/A", "3,200", "abc"],
    "category": ["  Electronics ", "CLOTHING", "electronics", " Books", ""],
    "date": ["15/03/2024", "2024-07-01", "22-Nov-2024", "01/10/2024", None],
})

# Bug 1 Fix: remove commas and replace hidden NaN markers before numeric conversion
df["price"] = (
    df["price"]
    .replace("N/A", pd.NA)          # hidden NaN marker fixed
    .str.replace(",", "", regex=False)
)
df["price"] = pd.to_numeric(df["price"], errors="coerce")

# Bug 2 Fix: use & instead of Python 'and' and wrap conditions in parentheses
clean = df[(df["price"] > 1000) & (df["category"] != "")]

# Bug 3 Fix: standardize text and use na=False in str.contains
df["category"] = df["category"].str.strip().str.lower()
electronics = df[df["category"].str.contains("electronics", na=False)]

# Bug 4 Fix: mixed date formats handled safely
df["date"] = pd.to_datetime(df["date"], format="mixed", dayfirst=True, errors="coerce")

print(df)
print("\nFiltered clean rows:\n", clean)
print("\nElectronics rows:\n", electronics)