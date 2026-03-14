# Q1 Conceptual 

Q: What is the logical execution order of a SQL SELECT statement?

- SQL executes a SELECT query logically in this order: FROM, JOIN, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, and LIMIT. This means data is first collected and filtered before final output is produced.

Q: Why does this matter when writing queries with aliases?

- Aliases are created during the SELECT step, so they cannot be used in WHERE or GROUP BY because those execute earlier. However, aliases can be used in ORDER BY since it runs after SELECT.

# Q2 Coding 


```SQL
SELECT *
FROM (
    SELECT 
        firstName,
        lastName,
        salary,
        AVG(salary) OVER (PARTITION BY officeCode) AS dept_avg_salary,
        AVG(salary) OVER () AS company_avg
    FROM employees
) t
WHERE salary > company_avg;

```

# Q3  Debug


```sql
SELECT department, AVG(salary) as avg_sal 
FROM employees 
WHERE AVG(salary) > 70000 -- BUG GROUP BY department;
```
- Bug: AVG(salary) is an aggregate function, so it cannot be used in the WHERE clause because WHERE filters rows before grouping happens.

- Correct query: Use HAVING because it filters after aggregation.

```SQL
SELECT department, AVG(salary) AS avg_sal
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;
```

- Reason: HAVING is designed for conditions on aggregate results like AVG(), COUNT(), or SUM().