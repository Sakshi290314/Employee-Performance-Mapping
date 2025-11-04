/*
===============================================================================
02. DIMENSIONS EXPLORATION
===============================================================================
Purpose:
    - To explore key dimension attributes such as country, continent, department, role, and gender from the employee dataset.
    - To identify the organizational structure and diversity dimensions before performing deeper analytical queries.

Tables Referenced:
    - processed.emp_record_table
    - processed.proj_table

SQL Functions Used:
    - DISTINCT
    - UNION
    - COUNT()

Objectives:
    - List all unique countries and continents employees belong to.
    - Identify all departments and roles available in the organization.
    - Explore the gender distribution across departments.
    - Identify distinct project IDs.
    - Retrieve unique managers and understand team hierarchy.
    - Combine department data using UNION.
    - Count the number of distinct roles and departments.

===============================================================================
*/

-- List all unique countries and continents employees belong to
SELECT DISTINCT country 
FROM processed.emp_record_table;

SELECT DISTINCT continent 
FROM processed.emp_record_table;

-- List all unique departments and roles available
SELECT DISTINCT department 
FROM processed.emp_record_table;

SELECT DISTINCT role 
FROM processed.emp_record_table;

-- Identify number of distinct projects
SELECT COUNT(DISTINCT project_id) AS total_unique_projects
FROM processed.proj_table;

-- Explore gender distribution across departments
SELECT DISTINCT gender 
FROM processed.emp_record_table;

-- Identify unique managers and their total team size
SELECT DISTINCT manager_id, name
FROM processed.emp_record_table
WHERE manager_id IS NOT NULL;

-- To find total team size per manager (aggregated view)
SELECT 
    manager_id, 
    COUNT(emp_id) AS team_size
FROM processed.emp_record_table
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY team_size DESC;

-- List all employees from Healthcare and Finance departments using UNION
SELECT name, department 
FROM processed.emp_record_table 
WHERE department = 'Healthcare'
UNION
SELECT name, department 
FROM processed.emp_record_table 
WHERE department = 'Finance';

-- Find number of distinct roles and departments (organizational overview)
SELECT COUNT(DISTINCT role) AS total_roles 
FROM processed.emp_record_table;

SELECT COUNT(DISTINCT department) AS total_departments
FROM processed.emp_record_table;
