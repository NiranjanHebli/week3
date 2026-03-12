# Q1. Conceptual 

### 1. .loc[] (Label-based indexing)
.loc[] is used to select rows and columns based on index labels. It looks for the actual names of the index values, not their positions. When slicing with .loc, the ending label is included in the result.

Example:

```python
df.loc[0:3]
```

If the index is 0,1,2,3,4, this returns rows 0,1,2,3 because .loc includes the end label.

### 2. .iloc[] (Position-based indexing)
.iloc[] is used to select rows and columns based on integer positions (like Python list indexing). It does not use index labels, only the position numbers starting from 0. When slicing with .iloc, the ending position is excluded.

Example:
```python
df.iloc[0:3]
```
If the index is 0,1,2,3,4, this returns rows 0,1,2 because .iloc excludes the end position.

### 3. When the index is 0,1,2,3,4
For a DataFrame with numeric index 0,1,2,3,4, df.loc[0:3] returns rows 0,1,2,3 because .loc includes the ending label. However, df.iloc[0:3] returns rows 0,1,2 because .iloc excludes the ending position.

### 4. When the index is 'a','b','c','d','e'
If the index labels are 'a','b','c','d','e', .loc works with the labels directly. For example, df.loc['a':'c'] returns rows 'a','b','c' because .loc includes the end label. On the other hand, .iloc still works with positions, so df.iloc[0:3] returns the rows at positions 0,1,2, which correspond to 'a','b','c'.

### 5. Key Difference
The main difference is that .loc[] uses labels and includes the ending value, while .iloc[] uses numeric positions and excludes the ending value in slicing.


# Q2. Coding 

### File Link :-  [analyze_csv.ipynb](./analyze_csv/analyze_csv.ipynb)

# Q3 Debug 
## Bug 1: Wrong operator for compound condition

The code uses and, which does not work with Pandas Series. In pandas, element-wise logical operations must use & and each condition must be wrapped in parentheses.

Fix: Replace and with &.

## Bug 2: Chained indexing for assignment

df["age"][0] = 26 uses chained indexing, which can lead to unpredictable behavior or warnings because it may modify a copy instead of the original DataFrame.

Fix: Use .loc[] for safe assignment.

## Bug 3: .iloc end index misunderstanding

.iloc uses Python slicing rules, meaning the end index is excluded. Therefore df.iloc[0:2] returns rows 0 and 1, not 0,1,2.

Fix: Change the slice to include position 2.


### Corrected Code:-

```python
import pandas as pd

df = pd.DataFrame({
    "name": ["Alice", "Bob", "Charlie"],
    "age": [25, 30, 35],
    "salary": [50000, 60000, 70000]
})

# Bug 1 fixed: Use & for element-wise condition
high_earners = df[(df["age"] > 25) & (df["salary"] > 55000)]

# Bug 2 fixed: Use .loc instead of chained indexing
df.loc[0, "age"] = 26

# Bug 3 fixed: iloc end index is exclusive
first_two = df.iloc[0:3]  # returns rows 0,1,2
print(f"Got {len(first_two)} rows, expected 3")

```