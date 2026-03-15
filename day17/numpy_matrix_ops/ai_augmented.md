## Prompt:-

Write a NumPy function that detects column-wise IQR outliers in a 2D array and replaces them with the column median. Use Q1, Q3, and IQR (1.5 × IQR rule), apply vectorized NumPy operations only, preserve shape, and return the cleaned array.

## AI - Output:-

### [ChatGPT Response](https://chatgpt.com/s/t_69b6e321ae988191a37b3710fb9e7de7)

### 1. Does it correctly compute IQR per column (axis=0)?
Yes, np.percentile(arr, 25, axis=0) and np.percentile(arr, 75, axis=0) compute Q1 and Q3 independently for each column, so IQR is correctly calculated column-wise.

### 2. Does it handle the replacement correctly (in-place vs copy)?
Yes, np.where() creates a new cleaned array, so the original input remains unchanged. This avoids unintended modification of source data.

### 3. Is it truly vectorized or does it loop over columns?
It is fully vectorized. NumPy broadcasting handles bounds checking and replacement across all columns without explicit Python loops.

### 4. Test it on data with known outliers — does it work?
Yes, if a column contains values like [30, 32, 35, 500], 500 is detected as an outlier and replaced with the column median correctly.
