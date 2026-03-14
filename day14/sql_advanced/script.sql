
-- Part A: 

-- 1. Running total: cumulative salary per office ordered by employee number
SELECT 
    officeCode,
    employeeNumber,
    salary,
    SUM(salary) OVER (
        PARTITION BY officeCode
        ORDER BY employeeNumber
    ) AS running_total
FROM employees;


-- 2. Top-3 customers by revenue per country using ROW_NUMBER()

SELECT *
FROM (
    SELECT 
        country,
        customerName,
        customerNumber,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY customerNumber DESC
        ) AS rn
    FROM customers
) t
WHERE rn <= 3;


-- 3. MoM salary growth using LAG and flag below -5%
SELECT 
    employeeNumber,
    month,
    salary,
    LAG(salary) OVER (
        PARTITION BY employeeNumber
        ORDER BY month
    ) AS prev_salary,
    ROUND(
        (salary - LAG(salary) OVER (
            PARTITION BY employeeNumber
            ORDER BY month
        )) * 100.0 /
        LAG(salary) OVER (
            PARTITION BY employeeNumber
            ORDER BY month
        ), 2
    ) AS growth_pct,
    CASE
        WHEN ((salary - LAG(salary) OVER (
              PARTITION BY employeeNumber
              ORDER BY month
        )) * 100.0 /
        LAG(salary) OVER (
              PARTITION BY employeeNumber
              ORDER BY month
        )) < -5
        THEN 'Flag'
        ELSE 'OK'
    END AS status
FROM monthly_salaries;


-- 4. Multi-CTE: offices where all employees earn above company average

WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.officeCode
FROM employees e
CROSS JOIN company_avg c
GROUP BY e.officeCode, c.avg_salary
HAVING MIN(e.salary) > c.avg_salary;

-- 5. Correlated subquery: 2nd highest salary per office without window functions

SELECT e1.officeCode, e1.firstName, e1.lastName, e1.salary
FROM employees e1
WHERE 1 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employees e2
    WHERE e2.officeCode = e1.officeCode
      AND e2.salary > e1.salary
);

-- Part B: 

CREATE TABLE orders (
    order_date DATE,
    revenue INT
);

INSERT INTO orders VALUES
('2024-01-01', 500),
('2024-01-03', 700),
('2024-01-06', 400),
('2024-01-07', 650);

-- Generate numbers 1 to 100 using recursive CTE

WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 100
)
SELECT * FROM numbers;

-- Fill missing dates using recursive CTE

WITH RECURSIVE dates AS (
    SELECT MIN(order_date) AS dt
    FROM orders

    UNION ALL

    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM dates
    WHERE dt < (SELECT MAX(order_date) FROM orders)
)
SELECT 
    d.dt AS order_date,
    COALESCE(SUM(o.revenue), 0) AS revenue
FROM dates d
LEFT JOIN orders o
    ON d.dt = o.order_date
GROUP BY d.dt
ORDER BY d.dt;

