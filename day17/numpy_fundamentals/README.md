# Day 17 - AM - NumPy Fundations

## Part A - Concept Application

This task demonstrates how to perform fast vectorized operations such as calculating averages, applying grading curves, assigning categorical letter grades, ranking students, and generating pass/fail reports without writing explicit loops.

### Key Learnings

 - Learned how to use NumPy matrix operations to process large educational datasets efficiently.

 - Understood axis-based aggregation (`axis=1` for students, `axis=0` for courses) for summary statistics.

 - Applied broadcasting and boolean masks to curve selected courses in one step.

 - Used `np.where` chaining to convert numeric scores into categorical letter grades.

 - Practiced `argsort()` for ranking and boolean reduction (`all`) for pass-condition checks across multiple subjects.


### File :- 

[`student_analytics.ipynb`](./student_analytics.ipynb) - Contains code to calculate student statistics, assign letter grades, rank students, and generate pass/fail reports using NumPy.


## Part B:- Explore: NumPy Random Module Deep Dive
This task compares the legacy random API with the modern random generator interface and demonstrates how to create a synthetic regression dataset using NumPy.


## Key Learnings

 - Learned the difference between legacy global random state and instance-based random generators.
 - Understood that `default_rng()` is preferred for modern scientific computing because it improves reproducibility.
 - Practiced generating large-scale random samples efficiently and timing performance.
 - Built a fully synthetic regression dataset using matrix multiplication and Gaussian noise with NumPy only.

## File:- 

[`random_module.ipynb`](./random_module.ipynb) - Contains code to compare the legacy random API with the modern random generator interface and demonstrates how to create a synthetic regression dataset using NumPy.
