# Q1 Conceptual 

## Explain the difference between RANK() and DENSE_RANK(). When does the difference matter in a business context?

RANK() assigns the same rank to equal values, but the next rank is skipped. For example, if two employees share rank 1, the next employee gets rank 3.

DENSE_RANK() also gives the same rank to ties, but it does not skip the next rank, so the next employee would get rank 2.

This difference matters in business when ranking sales performance, salaries, or customer revenue, because RANK() preserves position gaps while DENSE_RANK() keeps rankings continuous for cleaner reporting.


# Q2 Coding 

```sql
WITH monthly_txn AS (
    SELECT DISTINCT 
        user_id,
        DATE_FORMAT(transaction_date, '%Y-%m-01') AS month_start
    FROM transactions
),
numbered AS (
    SELECT 
        user_id,
        month_start,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY month_start
        ) AS rn
    FROM monthly_txn
),
grouped AS (
    SELECT 
        user_id,
        month_start,
        DATE_SUB(month_start, INTERVAL rn MONTH) AS grp
    FROM numbered
)
SELECT user_id
FROM grouped
GROUP BY user_id, grp
HAVING COUNT(*) >= 3;
```


# Q3 Optimize

```sql
SELECT name, salary
FROM (
    SELECT 
        name,
        salary,
        department,
        AVG(salary) OVER (PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;
```