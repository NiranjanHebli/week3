# Q1.Conceptual

## Why this code is slow

The code is slow because it relies on Python's loop control and interpreter overhead, which can be significant when looping over large datasets. NumPy is designed to avoid this overhead by compiling operations into optimized C code that operates on entire arrays at once, offering a much faster execution.

## Vectorized one-line version

```python
result = data**2 + 2*data + 1
```

This computes the same expression for every element simultaneously.

## Why vectorization is faster

- No Python-level loops
- No repeated append() memory reallocations
- No manual reshape needed
- Uses contiguous low-level numeric operations internally

## Estimated speedup for a 1000×1000 matrix

For a 1,000,000 element matrix, vectorized NumPy is typically 50× to 200× faster depending on hardware. In practice, what takes hundreds of milliseconds or seconds in loops often finishes in just a few milliseconds with vectorization.

# Q2. Coding 

```python 
import numpy as np

def k_nearest(data: np.ndarray, point: np.ndarray, k: int) -> np.ndarray:
    """Return indices of k closest points to 'point' in 'data'."""
    distances = np.sqrt(((data - point) ** 2).sum(axis=1))
    return np.argsort(distances)[:k]
```

## How it works

- data - point uses broadcasting to subtract the target point from every row.
- Squaring and summing across axis=1 gives squared Euclidean distance per point.
- np.argsort() returns indices sorted by distance, and [:k] selects the nearest neighbors.



# Q3. Debug

## Bugs in the code

### 1. Wrong axis for column means

axis=1 calculates row means, but column normalization needs column means, so it should use axis=0.

### 2. Wrong axis for column standard deviations

axis=1 again gives row-wise standard deviation, but normalization requires one std value per column, so this must also be axis=0.

### 3. Missing keepdims=True for broadcasting alignment

Without keepdims=True, shapes become (5,) or (100,) depending on axis, which can lead to incorrect broadcasting intent. Keeping dimensions ensures clean column-wise subtraction and division.

## Corrected version

```python
import numpy as np

data = np.random.randn(100, 5)

means = data.mean(axis=0, keepdims=True)
stds = data.std(axis=0, keepdims=True)

normalized = (data - means) / stds
```

## Result

Each column now has approximately:

- mean = 0
- standard deviation = 1
