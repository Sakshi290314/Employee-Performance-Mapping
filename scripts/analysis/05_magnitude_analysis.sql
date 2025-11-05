/*
===============================================================================
Magnitude Analysis – Employee Performance Mapping Project
===============================================================================
Purpose:
    - To quantify employee and project data across different business dimensions.
    - To identify salary distribution, employee composition, and project domain trends.
    - To explore workforce magnitude across department, geography, and hierarchy.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG(), MAX()
    - GROUP BY, ORDER BY, WHERE
===============================================================================
*/

--Average Salary by Continent
SELECT 
    continent,
    AVG(salary) AS average_salary
FROM processed.emp_record_table
GROUP BY continent
ORDER BY average_salary DESC;

--Average Salary by Country
SELECT 
    country,
    AVG(salary) AS average_salary
FROM processed.emp_record_table
GROUP BY country
ORDER BY average_salary DESC;

--Total Salary by Department
SELECT 
    department,
    SUM(salary) AS total_salary
FROM processed.emp_record_table
GROUP BY department
ORDER BY total_salary DESC;

--Employee Count by Gender and Department
SELECT 
    gender,
    department,
    COUNT(employee_id) AS employee_count
FROM processed.emp_record_table
GROUP BY gender, department
ORDER BY employee_count DESC;

--Total Number of Employees per Continent
SELECT 
    continent,
    COUNT(employee_id) AS total_number_of_employees
FROM processed.emp_record_table
GROUP BY continent
ORDER BY total_number_of_employees DESC;

--Department with the Highest Average Salary
SELECT 
    department,
    MAX(salary) AS highest_salary
FROM processed.emp_record_table
GROUP BY department
ORDER BY highest_salary DESC;

--Domain with Maximum Total Project Count
SELECT 
    domain AS project_domain,
    COUNT(project_id) AS number_of_projects
FROM processed.proj_table
GROUP BY domain
ORDER BY number_of_projects DESC;

--Managers with Reporting Employees (Including the President)
SELECT 
    e.manager_id,
    COUNT(e.employee_id) AS number_of_reporters
FROM processed.emp_record_table e
WHERE e.manager_id IS NOT NULL
GROUP BY e.manager_id
ORDER BY number_of_reporters DESC;


