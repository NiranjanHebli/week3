# Q1. Conceptual 

### Decision-making process for handling 40% missing values in income

First, I would check whether the missing values are random or follow a pattern by comparing missing and non-missing rows across other features. Then I would assess how important the income column is for analysis or modeling, because a critical feature should usually be preserved rather than removed. 

### When would you drop vs fill?

I would drop the column only if income is not important for the objective or if missingness is so high that imputation would introduce too much bias. I would drop rows only when the number of affected rows is small, but with 1M rows and 40% missing, dropping 400k rows could remove too much useful information. 

### What fill strategy would you use and why?

For a skewed income distribution, I would prefer median imputation because median is robust to extreme values and outliers. If other related variables such as age, occupation, or education are available, model-based imputation (for example regression) would be better because it preserves relationships in the data more accurately.

# Q2. Coding

### File :- [standardize_columns.py](./standardize_columns.py)


### Output:- 


# Q3. Debug 

### Bug 1 – Hidden NaN before numeric conversion

The price column contains values like "N/A" and commas such as "1,500", which are not directly numeric. These should be cleaned first, otherwise to_numeric() converts them to NaN without preserving usable values.

### Bug 2 – Using and instead of &

In Pandas, Python’s and cannot compare entire columns because it expects a single boolean result. The correct operator is &, with each condition enclosed in parentheses for row-wise filtering.

### Bug 3 – .str.contains() without NA handling

If the column contains missing values, .str.contains() may raise errors because NaN is not treated as a string. Using na=False ensures missing entries are safely excluded during matching.

### Bug 4 – Mixed date formats

The date column contains multiple formats, such as 15/03/2024 and 22-Nov-2024, which may not parse consistently with default settings. Using mixed-format parsing with errors="coerce" handles invalid or inconsistent dates safely.

```python
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

```

### File :- [debugged_code.py](./debugged_code.py)