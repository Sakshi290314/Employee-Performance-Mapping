/*
===============================================================================
Performance Analysis
===============================================================================
Purpose:
    - To evaluate employee performance and reward alignment.
    - To identify top and low performers for training or recognition.
    - To analyze the relationship between salary and performance.
    - To benchmark team performance by department.

SQL Functions Used:
    - Aggregate Functions: AVG(), ROUND()
    - Conditional Filtering: WHERE
    - Arithmetic Expressions for Bonus Calculation
===============================================================================
*/

-- Calculate bonus for each employee based on salary and performance rating
SELECT 
    employee_id,
    ROUND(0.05 * salary * employee_rating, 2) AS bonus
FROM processed.emp_record_table
ORDER BY bonus DESC;


-- Identify high performers (rating ≥ 4.5)
SELECT 
    employee_id,
    name,
    employee_rating
FROM processed.emp_record_table
WHERE employee_rating >= 4.5
ORDER BY employee_rating DESC;


-- Identify underperformers (rating < 2.5)
SELECT 
    employee_id,
    name,
    employee_rating
FROM processed.emp_record_table
WHERE employee_rating < 2.5
ORDER BY employee_rating ASC;


-- Compare average salary vs. average performance
-- (To check whether higher pay correlates with better performance)
SELECT 
    ROUND(AVG(salary), 2) AS avg_salary,
    ROUND(AVG(employee_rating), 2) AS avg_rating
FROM processed.emp_record_table;


-- Compare average rating by department to identify best-performing teams
SELECT 
    department,
    ROUND(AVG(employee_rating), 2) AS avg_department_rating
FROM processed.emp_record_table
GROUP BY department
ORDER BY avg_department_rating DESC;
