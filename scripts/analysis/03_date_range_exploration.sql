/*
===============================================================================
Project Timeline & Resource Exploration
===============================================================================
Purpose:
    - To analyze the temporal aspects of projects, including start and closure timelines.
    - To identify the duration of projects and active project counts.
    - To explore team allocation across projects.

Tables Used:
    - processed.proj_table
    - processed.emp_record_table

SQL Functions Used:
    - MIN(), MAX(), AGE(), COUNT(), GROUP BY, JOIN
===============================================================================
*/

-- Identify the earliest and latest project start dates
SELECT 
    MIN(start_date) AS earliest_project_start,
    MAX(start_date) AS latest_project_start
FROM processed.proj_table;

-- Identify the earliest and latest project completion dates
SELECT 
    MIN(closure_date) AS earliest_project_complete,
    MAX(closure_date) AS latest_project_complete
FROM processed.proj_table;

-- Calculate the duration of each project (difference between start and closure date)
SELECT 
    AGE(closure_date, start_date) AS project_duration
FROM processed.proj_table;

-- Count of active projects (based on project status)
SELECT 
    project_status, 
    COUNT(project_id) AS total_projects
FROM processed.proj_table
WHERE project_status IN ('Work In Progress', 'Delayed')
GROUP BY project_status;

-- Identify number of employees working on each project
SELECT 
    p.project_name,
    COUNT(e.employee_id) AS no_of_employees
FROM processed.emp_record_table e
LEFT JOIN processed.proj_table p 
    ON e.project_id = p.project_id
WHERE p.project_name IS NOT NULL
GROUP BY p.project_name
ORDER BY no_of_employees DESC;
