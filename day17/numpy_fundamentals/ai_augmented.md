## Prompt:- 

Write a Python function using NumPy that accepts a 2D NumPy array as input and performs min-max normalization column-wise, scaling each column independently to the range [0, 1]. The function should compute each column’s minimum and maximum values using vectorized NumPy operations, avoid loops, and return a new normalized array. Also handle edge cases where a column has constant values (max = min) so division by zero does not occur, and briefly explain the logic used.

## AI Generated Output:-

### [ChatGPT Response](https://chatgpt.com/s/t_69b6d8830b548191b1c517dbd3cf6603)


### 1. Does it handle edge cases?
Yes, it handles constant-value columns by replacing zero denominators with 1, so division by zero does not occur. As a result, all values in that column become 0 after normalization.

### 2. Is it truly vectorized?
Yes, all operations use NumPy’s built-in vectorized functions (min, max, subtraction, division) without any explicit Python loops. This makes it efficient even for large arrays.

### 3. Does it use broadcasting correctly?
Yes, column-wise minimum and range arrays are 1D, and NumPy automatically broadcasts them across all rows during subtraction and division.

### 4. What would you improve?
I would add validation to check that the input is a non-empty 2D array. Using np.where() for zero-range columns could also make the code clearer and avoid modifying intermediate arrays directly.
