# Prompt:- 

Write a Python function that accepts a messy Pandas DataFrame and performs automated data cleaning. The function should first identify and replace hidden missing value markers such as 'N/A', '', 'null', and 'None' with proper null values. It should then detect object columns and convert them to appropriate data types wherever possible, including numeric and datetime using safe conversion methods.


## AI - Generated Code:- 

```python 
import pandas as pd
import numpy as np

def clean_dataframe(df):
    summary = {}

    # Step 1: Replace hidden missing values
    hidden_missing = ['N/A', '', 'null', 'None']
    before_missing = df.isna().sum().sum()
    df = df.replace(hidden_missing, np.nan)
    after_missing = df.isna().sum().sum()
    summary["missing_values_replaced"] = int(after_missing - before_missing)

    # Step 2: Process object columns
    converted_cols = []
    text_cleaned_cols = []

    for col in df.columns:
        if df[col].dtype == "object":

            # Try numeric conversion
            numeric_col = pd.to_numeric(df[col], errors='coerce')
            if numeric_col.notna().sum() > 0 and numeric_col.notna().sum() >= len(df[col]) / 2:
                df[col] = numeric_col
                converted_cols.append(f"{col} -> numeric")
                continue

            # Try datetime conversion
            datetime_col = pd.to_datetime(df[col], errors='coerce')
            if datetime_col.notna().sum() > 0 and datetime_col.notna().sum() >= len(df[col]) / 2:
                df[col] = datetime_col
                converted_cols.append(f"{col} -> datetime")
                continue

            # Standardize text columns
            df[col] = df[col].astype(str).str.strip().str.lower()
            text_cleaned_cols.append(col)

    summary["converted_columns"] = converted_cols
    summary["text_standardized"] = text_cleaned_cols

    # Step 3: Remove duplicates
    before_rows = len(df)
    df = df.drop_duplicates()
    after_rows = len(df)
    summary["duplicates_removed"] = before_rows - after_rows

    return df, summary
```

### File Link:- [clean_dataframe.ipynb](./ai_augmented/clean_dataframe.ipynb)


### Does it handle edge cases (all-NaN columns, mixed date formats)?

The function handles mixed date formats reasonably well by using safe conversion with errors='coerce', which prevents failures when formats differ. However, all-NaN columns may still need extra checks because automatic type conversion can misclassify them or leave them unchanged without clear handling.

### Does it choose the right fill strategy per column?

The current version mainly focuses on cleaning and conversion, but it does not apply column-specific fill strategies automatically. In practice, numeric columns should usually use median or mean, while categorical columns should use mode or a fixed placeholder depending on business meaning.

### Does it document what changes it made?

Yes, the summary records key changes such as missing values replaced, columns converted, and duplicates removed. However, it could be improved by reporting row counts before and after cleaning, along with exact columns affected by each operation.

### What would you improve?

I would add stronger type inference rules, explicit handling for all-null columns, and separate fill logic for numeric, categorical, and datetime columns. Logging invalid conversions and detecting outliers would also make the cleaner more reliable.

#### Would this work on a 1M-row dataset (performance)?

The logic would work on a 1M-row dataset, but repeated conversions inside loops may slow performance on very large data. Performance can improve by minimizing per-column repeated scans and using vectorized operations more carefully.