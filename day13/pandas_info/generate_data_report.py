import pandas as pd

def generate_data_quality_report(df: pd.DataFrame) -> dict:
    """
    Generate a data quality report for a Pandas DataFrame.

    Parameters
    ----------
    df : pd.DataFrame
        Input dataset.

    Returns
    -------
    dict
        Dictionary containing dataset quality metrics.
    """

    report = {}

    # Dataset shape
    report["shape"] = {
        "rows": df.shape[0],
        "columns": df.shape[1]
    }

    # Data types
    report["data_types"] = df.dtypes.astype(str).to_dict()

    # Missing values percentage
    report["missing_percentage"] = (
        (df.isnull().sum() / len(df)) * 100
    ).round(2).to_dict()

    # Duplicate rows
    report["duplicate_rows"] = int(df.duplicated().sum())

    # Unique value counts
    report["unique_values"] = df.nunique().to_dict()

    # Statistical summary
    report["numerical_summary"] = df.describe().to_dict()

    # ----------- PRINT FORMATTED SUMMARY -----------

    print("\nDATA QUALITY REPORT")
    print("=" * 50)

    print(f"\nDataset Shape:")
    print(f"Rows: {report['shape']['rows']}, Columns: {report['shape']['columns']}")

    print("\nData Types:")
    for col, dtype in report["data_types"].items():
        print(f"  {col}: {dtype}")

    print("\nMissing Values (%):")
    for col, pct in report["missing_percentage"].items():
        print(f"  {col}: {pct}%")

    print(f"\nDuplicate Rows: {report['duplicate_rows']}")

    print("\nUnique Values per Column:")
    for col, count in report["unique_values"].items():
        print(f"  {col}: {count}")

    print("\nStatistical Summary (Numerical Columns):")
    print(df.describe())

    print("=" * 50)

    return report

# -------------------------------
# Test Case 1: Clean DataFrame
# -------------------------------

clean_df = pd.DataFrame({
    "name": ["Alice", "Bob", "Charlie", "David"],
    "age": [25, 30, 35, 40],
    "salary": [50000, 60000, 70000, 80000]
})

print("\nTESTING CLEAN DATAFRAME")
clean_report = generate_data_quality_report(clean_df)


# -------------------------------
# Test Case 2: Messy DataFrame
# -------------------------------

messy_df = pd.DataFrame({
    "name": ["Alice", "Bob", "Bob", None, "Eve"],
    "age": [25, None, None, 40, 40],
    "salary": [50000, 60000, 60000, None, None]
})

print("\nTESTING MESSY DATAFRAME")