# Prompt :- 

Create a Python function that accepts a Pandas DataFrame as input and automatically generates a data quality report. The function should compute and include the following details:

Dataset shape (number of rows and columns)

Data types of each column

Percentage of missing values per column

Number of duplicate rows

Unique value counts for each column

Basic statistical summary for numerical columns

The function should return the complete report as a dictionary and also print a clean, well formatted summary of the results for easy interpretation.

## AI - Generated Code:- 

### File Link :- [generate_data_report.py](./generate_data_report.py)

### 1. Does it handle edge cases (empty DataFrame, all-null columns)?
The function does not explicitly handle an empty DataFrame. If the DataFrame has zero rows, the missing value percentage calculation may cause a division by zero issue. It also does not flag columns that contain only null values, which are important indicators of poor data quality.

### 2. Does it use df.memory_usage()?
No, the function does not use df.memory_usage(). As a result, it does not provide information about how much memory each column or the entire dataset consumes. Including this metric would be useful for analyzing large datasets and optimizing storage.

### 3. Does it identify columns with single unique values (useless features)?
The function calculates unique value counts but does not explicitly identify columns with only one unique value. Such columns often carry no useful information for analysis or machine learning. Flagging them would improve the usefulness of the report.

### 4. What improvements would you make?
The function could be improved by handling empty DataFrames safely and explicitly detecting all null columns. It should also include memory usage statistics and flag constant columns with a single unique value. Additional enhancements like detecting outliers and high cardinality columns would make the report more robust.