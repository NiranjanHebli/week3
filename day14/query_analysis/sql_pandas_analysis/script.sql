-- Part A
CREATE DATABASE employee_db;
USE  employee_db;

-- Drop if exists
-- DROP TABLE  customers;
-- DROP TABLE offices;
-- DROP TABLE employees;
-- DROP TABLE IF EXISTS monthly_salaries;


-- Offices table 
CREATE TABLE offices (
  officeCode VARCHAR(10) NOT NULL PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL
);

-- Inserting 7 offices across different countries for diversity in queries
INSERT INTO offices (officeCode, city, phone, country) VALUES
('1', 'San Francisco', '+1 650 219 4782', 'USA'),
('2', 'Boston', '+1 215 837 0825', 'USA'),
('3', 'NYC', '+1 212 555 3000', 'USA'),
('4', 'Paris', '+33 14 723 4404', 'France'),
('5', 'Tokyo', '+81 33 224 5000', 'Japan'),
('6', 'Sydney', '+61 2 9264 2451', 'Australia'),
('7', 'London', '+44 20 7877 2041', 'UK');

-- Employees table
CREATE TABLE employees (
  employeeNumber INT PRIMARY KEY,
  lastName VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  officeCode VARCHAR(10),
  reportsTo INT,
  jobTitle VARCHAR(50),
  salary INT,
  FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
  FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);

-- Inserting 15 employees
INSERT INTO employees (employeeNumber, lastName, firstName, officeCode, reportsTo, jobTitle, salary) VALUES
(1002, 'Murphy', 'Diane', '1', NULL, 'President', 150000),
(1056, 'Patterson', 'Mary', '1', 1002, 'VP Sales', 140000),
(1076, 'Firrelli', 'Jeff', '1', 1002, 'VP Marketing', 130000),
(1088, 'Patterson', 'William', '6', 1056, 'Sales Manager (APAC)', 120000),
(1102, 'Bondur', 'Gerard', '4', 1056, 'Sale Manager (EMEA)', 115000),
(1143, 'Bow', 'Anthony', '1', 1056, 'Sales Manager (NA)', 118000),
(1165, 'Jennings', 'Leslie', '1', 1143, 'Sales Rep', 90000),
(1166, 'Thompson', 'Leslie', '1', 1143, 'Sales Rep', 85000),
(1188, 'Firrelli', 'Julie', '2', 1143, 'Sales Rep', 88000),
(1216, 'Patterson', 'Steve', '2', 1143, 'Sales Rep', 87000),
(1286, 'Tseng', 'Foon Yue', '3', 1143, 'Sales Rep', 92000),
(1323, 'Vanauf', 'George', '3', 1143, 'Sales Rep', 91000),
(1337, 'Bondur', 'Loui', '4', 1102, 'Sales Rep', 86000),
(1370, 'Hernandez', 'Gerard', '4', 1102, 'Sales Rep', 89000),
(1401, 'Castillo', 'Pamela', '4', 1102, 'Sales Rep', 88000),
(1501, 'Bott', 'Larry', '7', 1102, 'Sales Rep', 90000),
(1504, 'Jones', 'Barry', '7', 1102, 'Sales Rep', 91000),
(1611, 'Fixter', 'Andy', '6', 1088, 'Sales Rep', 87000),
(1612, 'Marsh', 'Peter', '6', 1088, 'Sales Rep', 88000),
(1619, 'King', 'Tom', '6', 1088, 'Sales Rep', 89000),
(1621, 'Nishi', 'Mami', '5', 1056, 'Sales Rep', 95000),
(1625, 'Kato', 'Yoshimi', '5', 1621, 'Sales Rep', 92000),
(1702, 'Gerard', 'Martin', '4', 1102, 'Sales Rep', 85000);

-- Customers table
CREATE TABLE customers (
  customerNumber INT PRIMARY KEY,
  customerName VARCHAR(50) NOT NULL,
  salesRepEmployeeNumber INT,
  country VARCHAR(50),
  FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber)
);

-- Inserting 10 customers with sales reps from different offices and countries for diversity in queries
INSERT INTO customers (customerNumber, customerName, salesRepEmployeeNumber, country) VALUES
(103, 'Atelier graphique', 1370, 'France'),
(112, 'Signal Gift Stores', 1166, 'USA'),
(114, 'Australian Collectors, Co.', 1611, 'Australia'),
(119, 'La Rochelle Gifts', 1370, 'France'),
(121, 'Baane Mini Imports', 1504, 'Norway'),
(124, 'Mini Gifts Distributors Ltd.', 1165, 'USA'),
(125, 'Havel & Zbyszek Co', NULL, 'Poland'),
(128, 'Blauer See Auto, Co.', 1504, 'Germany'),
(129, 'Mini Wheels Co.', 1165, 'USA'),
(131, 'Land of Toys Inc.', 1323, 'USA');



-- Creating monthly_salaries table to track salary changes over 12 months for 3 employees (President, VP Sales, and a Sales Rep)
CREATE TABLE monthly_salaries (
  employeeNumber INT NOT NULL,
  month VARCHAR(7) NOT NULL,  -- Format: '2024-01'
  salary INT NOT NULL,
  PRIMARY KEY (employeeNumber, month),
  FOREIGN KEY (employeeNumber) REFERENCES employees(employeeNumber)
);
-- Insert 12 months for employee 1002 (President)
INSERT INTO monthly_salaries (employeeNumber, month, salary) VALUES
(1002, '2024-01', 150000),
(1002, '2024-02', 152000),
(1002, '2024-03', 149500),
(1002, '2024-04', 151200),
(1002, '2024-05', 153800),
(1002, '2024-06', 152500),
(1002, '2024-07', 154200),
(1002, '2024-08', 155000),
(1002, '2024-09', 153200),
(1002, '2024-10', 156000),
(1002, '2024-11', 157500),
(1002, '2024-12', 158000);

-- Insert 12 months for employee 1056 (VP Sales)
INSERT INTO monthly_salaries (employeeNumber, month, salary) VALUES
(1056, '2024-01', 140000),
(1056, '2024-02', 141500),
(1056, '2024-03', 139800),
(1056, '2024-04', 142200),
(1056, '2024-05', 143000),
(1056, '2024-06', 141900),
(1056, '2024-07', 144500),
(1056, '2024-08', 145200),
(1056, '2024-09', 143800),
(1056, '2024-10', 146000),
(1056, '2024-11', 147300),
(1056, '2024-12', 148000);

-- Insert 12 months for employee 1165 (Sales Rep)
INSERT INTO monthly_salaries (employeeNumber, month, salary) VALUES
(1165, '2024-01', 90000),
(1165, '2024-02', 91000),
(1165, '2024-03', 89500),
(1165, '2024-04', 92000),
(1165, '2024-05', 92500),
(1165, '2024-06', 91500),
(1165, '2024-07', 93000),
(1165, '2024-08', 93500),
(1165, '2024-09', 92200),
(1165, '2024-10', 94000),
(1165, '2024-11', 94500),
(1165, '2024-12', 95200);


-- Basic Selects
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;


-- 1. Get all employees working in USA
SELECT * FROM employees e 
JOIN offices o 
ON e.officeCode = o.officeCode 
WHERE o.country = 'USA';

-- 2. Get all employees with salary greater than 100000
SELECT * FROM employees
WHERE salary > 100000;

-- 3. Get all employees who have sales rep rule
SELECT * FROM employees 
WHERE jobTitle = 'Sales Rep';

-- 4. Get all employees who reports to employee with employee number 1056
SELECT * FROM employees
 WHERE reportsTo = 1056;

-- 5. Get all employee records who live in city Paris 
SELECT * FROM employees e 
JOIN offices o ON e.officeCode = o.officeCode
 WHERE o.city = 'Paris';
 
 
-- 6. Get all employee records with office details (city and country)
 SELECT e.*, o.city, o.country 
 FROM employees e 
 JOIN offices o 
 ON e.officeCode = o.officeCode;
 
 
 -- 7. Get all sales reps with their customer count (including those with zero customers)
 SELECT e.*, COUNT(c.customerNumber) AS customers
 FROM employees e
 LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber 
 WHERE e.jobTitle = 'Sales Rep' GROUP BY e.employeeNumber;
 
 
-- 8. Get all managers with their direct reports count
 SELECT CONCAT(e1.firstName," ",e1.lastName ) AS manager, CONCAT(e2.firstName," ", e2.lastName) AS reports_to
 FROM employees e1
 JOIN employees e2 ON e1.employeeNumber = e2.reportsTo 
 WHERE e1.jobTitle LIKE '%Manager%';
 
-- 9. Get all sales reps who do not have any customers assigned
 SELECT e.* FROM employees e 
 LEFT JOIN customers c 
 ON e.employeeNumber = c.salesRepEmployeeNumber
 WHERE e.jobTitle = 'Sales Rep' AND c.customerNumber IS NULL;
 
 -- 10. Get the number of sales reps per country
 SELECT o.country, COUNT(e.employeeNumber) AS reps 
 FROM offices o 
 JOIN employees e ON o.officeCode = e.officeCode
 WHERE e.jobTitle = 'Sales Rep' 
 GROUP BY o.country;
 

-- 11. Get the average salary per office
SELECT officeCode, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY officeCode;

-- 12. Get the number of employees per country
SELECT o.country, COUNT(*) AS no_of_employees
FROM employees e 
JOIN offices o ON e.officeCode = o.officeCode 
GROUP BY o.country;

-- 13. Get the job title with the highest number of employees
SELECT jobTitle, COUNT(*) AS `count`
FROM employees
GROUP BY jobTitle 
ORDER BY count DESC LIMIT 1;

-- 14. Get the maximum salary for each manager (reportsTo)
SELECT reportsTo, MAX(salary) AS max_salary 
FROM employees 
WHERE reportsTo IS NOT NULL
GROUP BY reportsTo;

-- 15. Get the number of employees reporting to VPs
SELECT jobTitle, COUNT(*) AS `count`
FROM employees
 WHERE reportsTo IN 
 (SELECT employeeNumber
 FROM employees
 WHERE jobTitle LIKE '%VP%') 
 GROUP BY jobTitle;
 
-- 16. Get the ranking of sales reps based on their customer count, partitioned by country and globally
SELECT 
  e.lastName, e.firstName, o.country,
  COUNT(c.customerNumber) AS customer_count,
  RANK() OVER (PARTITION BY o.country ORDER BY COUNT(c.customerNumber) DESC) AS country_rank,
  DENSE_RANK() OVER (ORDER BY COUNT(c.customerNumber) DESC) AS global_rank
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices o ON e.officeCode = o.officeCode
WHERE e.jobTitle = 'Sales Rep'
GROUP BY e.employeeNumber, o.country;

 
-- 17. Get the top 3 highest paid employees in each office
SELECT * FROM (
  SELECT officeCode, salary, 
         RANK() OVER (PARTITION BY officeCode ORDER BY salary DESC) AS rnk 
  FROM employees
) AS ranked_employees  
WHERE rnk <= 3;
 
-- 18. Get the month-over-month salary growth percentage for each employee
 SELECT employeeNumber, month, salary, LAG(salary) OVER 
 (PARTITION BY employeeNumber ORDER BY month) AS prev_month,
 (salary - LAG(salary) 
 OVER (PARTITION BY employeeNumber ORDER BY month)) / LAG(salary) OVER (PARTITION BY employeeNumber ORDER BY month) * 100 AS growth_pct 
 FROM monthly_salaries;
 
-- 19. Get all employees whose salary is above the average salary of their office
 WITH high_earners AS 
 (SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees)), 
 dept_avg AS (SELECT officeCode, AVG(salary) AS avg
 FROM employees GROUP BY officeCode) SELECT h.* FROM high_earners h JOIN dept_avg d ON h.officeCode = d.officeCode
 WHERE h.salary > d.avg;
 
 -- 20. Get all employees whose salary is above the average salary of their office (without using CTEs)
 SELECT e.* FROM employees e
 WHERE e.salary > (
 SELECT AVG(salary) FROM employees e2 
 WHERE e2.officeCode = e.officeCode);
 
 -- Using explain to understand the query

-- 2. Get all employees with salary greater than 100000
EXPLAIN SELECT * FROM employees
WHERE salary > 100000;

-- 3. Get all employees who have sales rep rule
EXPLAIN SELECT * FROM employees 
WHERE jobTitle = 'Sales Rep';

-- 4. Get all employees who reports to employee with employee number 1056
EXPLAIN SELECT * FROM employees
 WHERE reportsTo = 1056;


-- Part B
 
-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    officeCode VARCHAR(10),
    dept_budget INT,
    FOREIGN KEY (officeCode) REFERENCES offices(officeCode)
);

-- Insert department data
INSERT INTO departments VALUES
(1, 'North America Sales', '1', 500000),
(2, 'East Coast Sales', '2', 300000),
(3, 'Europe Sales', '4', 400000),
(4, 'APAC Sales', '6', 350000),
(5, 'Japan Sales', '5', 250000);

-- Create projects table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    lead_emp_id INT,
    budget INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (lead_emp_id) REFERENCES employees(employeeNumber)
);

-- Insert 5 rows into projects
INSERT INTO projects VALUES
(101, 'CRM Upgrade', 1165, 120000, '2024-01-10', '2024-06-30'),
(102, 'Market Expansion', 1370, 180000, '2024-02-01', '2024-09-15'),
(103, 'Sales Dashboard', 1188, 150000, '2024-03-01', '2024-10-30'),
(104, 'APAC Client Growth', 1611, 130000, '2024-04-15', '2024-11-30'),
(106, 'Japan Retail Project', 1621, 110000000, '2024-05-01', '2024-12-31');

-- 1. 3-table JOIN: employee name, department budget, project budget
SELECT 
    e.firstName,
    e.lastName,
    d.dept_name,
    d.dept_budget,
    p.project_name,
    p.budget AS project_budget
FROM projects p
JOIN employees e 
    ON p.lead_emp_id = e.employeeNumber
JOIN departments d 
    ON e.officeCode = d.officeCode;
    
 -- 2. Departments where total project budget exceeds department budget
SELECT 
    d.dept_name,
    d.dept_budget,
    SUM(p.budget) AS total_project_budget
FROM projects p
JOIN employees e 
    ON p.lead_emp_id = e.employeeNumber
JOIN departments d 
    ON e.officeCode = d.officeCode
GROUP BY d.dept_name, d.dept_budget
HAVING SUM(p.budget) > d.dept_budget;
 

