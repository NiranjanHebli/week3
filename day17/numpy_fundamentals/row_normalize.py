import numpy as np

def row_normalize(arr: np.ndarray) -> np.ndarray:
    """Normalize each row to sum to 1. Zero-sum rows stay as zeros."""
    row_sums = arr.sum(axis=1, keepdims=True)
    return np.divide(arr, row_sums, out=np.zeros_like(arr, dtype=float), where=row_sums != 0)

# Example usage:
if __name__ == "__main__":
    arr = np.array([[1, 2, 3], [0, 0, 0], [4, 5, 6]])
    normalized_arr = row_normalize(arr)
    print(normalized_arr)