/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To analyze proportional contributions of different categories to the total.
    - To understand workforce, regional, and project composition.
    - Useful for identifying dominant segments and diversity within the organization.

SQL Functions Used:
    - COUNT(), ROUND()
    - Subqueries for percentage calculation
===============================================================================
*/

-- Percentage of employees by gender
SELECT 
    gender,
    ROUND((COUNT(employee_id) * 100.0 / (SELECT COUNT(employee_id) FROM processed.emp_record_table)), 2) 
    AS percentage_of_employees
FROM processed.emp_record_table
GROUP BY gender
ORDER BY percentage_of_employees DESC;


-- Department-wise employee contribution
SELECT 
    department,
    ROUND((COUNT(employee_id) * 100.0 / (SELECT COUNT(employee_id) FROM processed.emp_record_table)), 2) 
    AS percentage_of_employees
FROM processed.emp_record_table
GROUP BY department
ORDER BY percentage_of_employees DESC;


-- Salary distribution across the organization
SELECT 
    CASE 
        WHEN salary < 7000 THEN 'Low Earner'
        WHEN salary BETWEEN 7000 AND 10000 THEN 'Medium Earner'
        ELSE 'High Earner'
    END AS salary_bracket,
    ROUND((COUNT(employee_id) * 100.0 / (SELECT COUNT(employee_id) FROM processed.emp_record_table)), 2) 
    AS percentage_of_employees
FROM processed.emp_record_table
GROUP BY salary_bracket
ORDER BY percentage_of_employees DESC;


-- Percentage of projects by status (Completed, Work In Progress, Delayed, Yet To Start)
SELECT 
    project_status,
    ROUND((COUNT(project_id) * 100.0 / (SELECT COUNT(project_id) FROM processed.proj_table)), 2) 
    AS percentage_of_projects
FROM processed.proj_table
GROUP BY project_status
ORDER BY percentage_of_projects DESC;


-- Country contribution to total employee base
SELECT 
    country,
    ROUND((COUNT(employee_id) * 100.0 / (SELECT COUNT(employee_id) FROM processed.emp_record_table)), 2) 
    AS percentage_of_employees
FROM processed.emp_record_table
GROUP BY country
ORDER BY percentage_of_employees DESC;

