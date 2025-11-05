/*
===============================================================================
Measures Exploration – Key Metrics of Employee Performance Mapping
===============================================================================
Purpose:
    - To calculate key aggregated metrics (totals, averages, and distributions)
      for employee data across roles, departments, and regions.
    - To identify salary patterns, experience ranges, and performance insights
      across the organization.

SQL Functions Used:
    - COUNT(), DISTINCT(), SUM(), AVG(), MIN(), MAX(), GROUP BY
===============================================================================
*/

-- 🧮 Total Number of Employees
SELECT COUNT(emp_id) AS total_employees
FROM processed.emp_record_table;

-- 👩‍💻 Total Number of Employees in Data Science Team
SELECT COUNT(emp_id) AS total_ds_employees
FROM processed.data_science_team;

-- 🏢 Total Number of Departments and Roles
SELECT COUNT(DISTINCT(dept)) AS total_departments
FROM processed.emp_record_table;

SELECT COUNT(DISTINCT(role)) AS total_roles
FROM processed.emp_record_table;

-- 💰 Salary Statistics – MIN, MAX, AVG, SUM
SELECT 
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary,
    SUM(salary) AS total_salary
FROM processed.emp_record_table;

-- 💼 Salary and Experience Distribution by Role
SELECT 
    role,
    SUM(salary) AS total_salary,
    AVG(exp) AS avg_experience
FROM processed.emp_record_table
GROUP BY role;

-- 📈 Minimum and Maximum Salary by Each Role
SELECT 
    role,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary
FROM processed.emp_record_table
GROUP BY role;

-- ⏱️ Experience Range (MAX, MIN, AVG)
SELECT 
    MAX(exp) AS max_experience,
    MIN(exp) AS min_experience,
    AVG(exp) AS avg_experience
FROM processed.emp_record_table;

-- ⭐ Average Performance Rating per Role
SELECT 
    role,
    AVG(emp_rating) AS avg_rating
FROM processed.emp_record_table
GROUP BY role;

-- 🌍 Total Salary Expense per Continent
SELECT 
    continent,
    SUM(salary) AS total_salary_expense
FROM processed.emp_record_table
GROUP BY continent;

-- 🗺️ Total Salary Expense per Country
SELECT 
    country,
    SUM(salary) AS total_salary_expense
FROM processed.emp_record_table
GROUP BY country;

-- 📊 Summary Report of Key Business Metrics
SELECT 'Total Employees' AS measure_name, COUNT(emp_id) AS measure_value FROM processed.emp_record_table
UNION ALL
SELECT 'Total Data Science Employees', COUNT(emp_id) FROM processed.data_science_team
UNION ALL
SELECT 'Distinct Departments', COUNT(DISTINCT(dept)) FROM processed.emp_record_table
UNION ALL
SELECT 'Distinct Roles', COUNT(DISTINCT(role)) FROM processed.emp_record_table
UNION ALL
SELECT 'Total Salary Expense', SUM(salary) FROM processed.emp_record_table
UNION ALL
SELECT 'Average Salary', AVG(salary) FROM processed.emp_record_table
UNION ALL
SELECT 'Average Experience', AVG(exp) FROM processed.emp_record_table
UNION ALL
SELECT 'Average Employee Rating', AVG(emp_rating) FROM processed.emp_record_table;

