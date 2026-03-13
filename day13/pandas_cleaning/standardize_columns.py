import pandas as pd


# Standardization Function
def standardize_column(series):
    """Standardizes a pandas Series by stripping whitespace, converting to lowercase, and removing special characters."""
    return (
        series.astype(str)
        .str.strip()  # remove leading/trailing whitespace
        .str.lower()  # convert to lowercase
        .str.replace(r"[^a-z0-9\s]", "", regex=True)  # remove special characters
        .str.replace(
            r"\s+", " ", regex=True
        )  # replace multiple spaces with single space
    )


data = pd.Series(
    ["  Hello  World!! ", "  NEW YORK  ", "san--francisco", "   MUMBAI   "]
)

cleaned = standardize_column(data)

print(cleaned)
