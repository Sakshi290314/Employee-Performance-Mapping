/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To analyze quarterly and domain-level project trends using the existing
      development_quarter field.
    - To identify variations in project initiation, completion, and employee
      performance over time.
    - To complement the quarter-based data with formatted date-based summaries.

SQL Functions Used:
    - GROUP BY, COUNT()
    - TO_CHAR()
===============================================================================
*/

--Number of projects started in each development quarter
SELECT 
    development_quarter,
    COUNT(project_id) AS total_projects_started
FROM processed.proj_table
WHERE development_quarter IS NOT NULL
GROUP BY development_quarter
ORDER BY development_quarter;

--Project completion trend per domain (by quarter)
SELECT 
    project_domain,
    development_quarter,
    COUNT(project_id) AS completed_projects
FROM processed.proj_table
WHERE project_status = 'Done'
GROUP BY project_domain, development_quarter
ORDER BY development_quarter, completed_projects DESC;

--Monthly trend for project initiation
SELECT 
    TO_CHAR(start_date, 'YYYY-Mon') AS start_month,
    COUNT(project_id) AS total_projects_started
FROM processed.proj_table
WHERE start_date IS NOT NULL
GROUP BY TO_CHAR(start_date, 'YYYY-Mon')
ORDER BY MIN(start_date);

