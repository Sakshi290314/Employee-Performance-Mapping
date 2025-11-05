/*
===============================================================================
Ranking Analysis – Employee Performance Mapping Project
===============================================================================
Purpose:
    - To rank employees, departments, and countries based on performance or other metrics.
    - To identify top-performing and bottom-performing entities across dimensions.
    - To apply ranking functions for comparative business insights.

SQL Functions Used:
    - Window and Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), LIMIT
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

--Top 5 Employees with the Highest Salary
SELECT 
    employee_id,
    salary
FROM processed.emp_record_table
ORDER BY salary DESC
LIMIT 5;

--Top 5 Employees with the Lowest Salary
SELECT 
    employee_id,
    salary
FROM processed.emp_record_table
ORDER BY salary ASC
LIMIT 5;

--Top 5 Employees with the Highest Performance Rating
SELECT 
    employee_id,
    employee_rating
FROM processed.emp_record_table
ORDER BY employee_rating DESC
LIMIT 5;

--Top 5 Most Experienced Employees
SELECT 
    employee_id,
    experience
FROM processed.emp_record_table
ORDER BY experience DESC
LIMIT 5;

--Top 3 Countries Contributing the Most Employees
SELECT 
    country,
    COUNT(employee_id) AS number_of_employees
FROM processed.emp_record_table
GROUP BY country
ORDER BY COUNT(employee_id) DESC
LIMIT 3;

--Top 3 Departments by Total Salary
SELECT 
    department,
    SUM(salary) AS total_salary,
    COUNT(employee_id) AS number_of_employees
FROM processed.emp_record_table
GROUP BY department
ORDER BY SUM(salary) DESC
LIMIT 3;

--Top 3 Departments by Employee Headcount
SELECT 
    department,
    COUNT(employee_id) AS total_employees
FROM processed.emp_record_table
GROUP BY department
ORDER BY total_employees DESC
LIMIT 3;

-- Rank Employees by Salary Using Window Function
SELECT 
    employee_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM processed.emp_record_table;

--Rank Employees by Performance Rating Using DENSE_RANK
SELECT 
    employee_id,
    employee_rating,
    DENSE_RANK() OVER (ORDER BY employee_rating DESC) AS rating_rank
FROM processed.emp_record_table;

--Rank Employees by Experience Using ROW_NUMBER
SELECT 
    employee_id,
    experience,
    ROW_NUMBER() OVER (ORDER BY experience DESC) AS experience_rank
FROM processed.emp_record_table;

