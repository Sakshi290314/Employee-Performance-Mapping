/*
===============================================================================
Cumulative Growth Analysis
===============================================================================
Purpose:
    - To track cumulative increases in workforce and project activity.
    - To measure growth patterns across departments and domains.
    - Helps understand scaling trends and organizational expansion.

SQL Functions Used:
    - Window Function: SUM() OVER (ORDER BY …)
    - GROUP BY for segmentation
===============================================================================
*/

-- Cumulative employee count by department
-- Shows how the total number of employees builds up across departments
SELECT 
    department,
    COUNT(employee_id) AS dept_employee_count,
    SUM(COUNT(employee_id)) OVER (ORDER BY department) AS cumulative_employee_count
FROM processed.emp_record_table
GROUP BY department
ORDER BY department;


-- Cumulative project count by domain
-- Tracks cumulative growth of projects across different business domains
SELECT 
    domain,
    COUNT(project_id) AS domain_project_count,
    SUM(COUNT(project_id)) OVER (ORDER BY domain) AS cumulative_project_count
FROM processed.proj_table
GROUP BY domain
ORDER BY domain;

