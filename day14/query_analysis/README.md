# Day - 14 - AM - Pandas Fundamentals

## Part A - Query Analysis

In this section, we will explore how to use Pandas to demonstrate querying a database using SQL and compare it with SQL results

## Key Learnings

-  Using .read_sql_query() to query a database and load data into a DataFrame
-  Using .to_sql() to export data from a DataFrame to a SQL database
-  Using .query() to filter data using conditional statements
-  Using .groupby() to group data by one or more columns
-  Using .agg() to apply aggregation functions to grouped data

## File Link :- 

- [`query_analysis.ipynb`](./sql_pandas_analysis/query_analysis.ipynb) - This file contains the code for demonstrating querying featuresusing Pandas to compare it with SQL results.

## SQL Script Link :- 

- [`script.sql`](./sql_pandas_analysis/script.sql) - This file contains the SQL script for querying a database. It consists of 20 examples.

## Data Files :-

- [`customers.csv`](./sql_pandas_analysis/data/customers.csv) - Customer data with columns such as customerName, contactName, address, city, postalCode, country and phone.

- [`employees.csv`](./sql_pandas_analysis/data/employees.csv) - Employee data with columns such as employeeNumber, lastName, firstName, email, jobTitle, birthDate, hireDate, reportsTo and officeCode.

- [`monthly_salaries.csv`](./sql_pandas_analysis/data/monthly_salaries.csv) - Monthly salary data with columns such as employeeNumber, month, salary.

- [`offices.csv`](./sql_pandas_analysis/data/offices.csv) - Office data with columns such as officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode and territory.

## Output:- 

### SQL Script :- 

#### 1. Get all employees working in USA
![alt text](./sql_pandas_analysis/assets/query1_output.png)


#### 2. Get all employees with salary greater than 100000

![alt text](./sql_pandas_analysis/assets/query2_output.png)

#### 3. Get all employees who have sales rep rule

![alt text](./sql_pandas_analysis/assets/query3_output.png)

#### 4. Get all employees who reports to employee with employee number 1056

![alt text](./sql_pandas_analysis/assets/query4_output.png)


#### 5. Get all employee records who live in city Paris 

![alt text](./sql_pandas_analysis/assets/query5_output.png)

#### 6. Get all employee records with office details (city and country)

![alt text](./sql_pandas_analysis/assets/query6_output.png)


#### 7. Get all sales reps with their customer count (including those with zero customers)

![alt text](./sql_pandas_analysis/assets/query7_output.png)

#### 8. Get all managers with their direct reports count

![alt text](./sql_pandas_analysis/assets/query8_output.png)

#### 9. Get all sales reps who do not have any customers assigned

![alt text](./sql_pandas_analysis/assets/query9_output.png)


#### 10. Get the number of sales reps per country

![alt text](./sql_pandas_analysis/assets/query10_output.png)

#### 11. Get the average salary per office

![alt text](./sql_pandas_analysis/assets/query11_output.png)


#### 12. Get the number of employees per country
![alt text](./sql_pandas_analysis/assets/query12_output.png)


#### 13. Get the job title with the highest number of employees
![alt text](./sql_pandas_analysis/assets/query13_output.png)


#### 14. Get the maximum salary for each manager (reportsTo)

![alt text](./sql_pandas_analysis/assets/query14_output.png)

#### 15. Get the number of employees reporting to VPs
![alt text](./sql_pandas_analysis/assets/query15_output.png)

#### 16. Get the ranking of sales reps based on their customer count, partitioned by country and globally
![alt text](./sql_pandas_analysis/assets/query16_output.png)

#### 17. Get the top 3 highest paid employees in each office
![alt text](./sql_pandas_analysis/assets/query17_output.png)


#### 18. Get the month-over-month salary growth percentage for each employee
![alt text](./sql_pandas_analysis/assets/query18_output.png)

#### 19. Get all employees whose salary is above the average salary of their office

![alt text](./sql_pandas_analysis/assets/query19_output.png)

#### 20. Get all employees whose salary is above the average salary of their office (without using CTEs)

![alt text](./sql_pandas_analysis/assets/query20_output.png)


### Using explain to understand the query

#### 2. Get all employees with salary greater than 100000
![alt text](./sql_pandas_analysis/assets/explain_query2.png)

#### 3. Get all employees who have sales rep rule
![alt text](./sql_pandas_analysis/assets/explain_query3.png)

#### 4. Get all employees who reports to employee with employee number 1056
![alt text](./sql_pandas_analysis/assets/explain_query4.png)

## Part B - Stretch Problem
 
 In this section, we will create a 'projects' table (project_id, project_name, lead_emp_id, budget, start_date, end_date). Insert 5 rows. Write:
 -  (1) a 3-table JOIN showing employee name, department budget, and project budget; 
 - (2) a query showing departments where total project budget exceeds department budget.

## SQL Script Link :- 

- [`script.sql`](./sql_pandas_analysis/script.sql) - This file contains the SQL script for querying a database. It consists of 20 examples.

## Output:- 

### 1. 3-table JOIN: employee name, department budget, project budget
![alt text](./sql_pandas_analysis/assets/partB_query1_output.png)

### 2. Departments where total project budget exceeds department budget

![alt text](./sql_pandas_analysis/assets/partB_query2_output.png)

