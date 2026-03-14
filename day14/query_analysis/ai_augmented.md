# Prompt:-

Generate 5 medium-difficulty SQL interview questions for a data engineer role, with answers. Include one about JOINs, one about NULL handling, and one about performance


# AI Generated Query:-

```SQL
-- AI generated Queries

-- 1. JOIN Question

SELECT e.firstName, c.customerName
FROM employees e
LEFT JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber;

-- 2. NULL Handling Question

SELECT customerName, COALESCE(country, 'Unknown') AS country
FROM customers;

-- 3. Performance Question

CREATE INDEX idx_salary ON employees(salary);

-- 4. Aggregation Question

SELECT officeCode, AVG(salary)
FROM employees
GROUP BY officeCode
HAVING AVG(salary) > 90000;

-- 5. Window Function Question

SELECT firstName, salary, officeCode,
RANK() OVER (PARTITION BY officeCode ORDER BY salary DESC) AS rank_num
FROM employees;

```


# Evaluation

## Are the questions genuinely medium-difficulty?
- Yes, the set is medium-difficulty because it covers practical SQL topics such as joins, aggregation, window functions, NULL handling, and indexing, which are common in data engineer interviews. However, some questions like INNER JOIN vs LEFT JOIN are closer to upper-beginner level unless followed by a real scenario.

## Are the answers complete?
- The answers are correct and concise, but they can be improved by adding edge cases or interview context, such as when indexes may slow down inserts or how RANK() differs from DENSE_RANK(). For stronger interview preparation, brief explanation of trade-offs would make them more complete.