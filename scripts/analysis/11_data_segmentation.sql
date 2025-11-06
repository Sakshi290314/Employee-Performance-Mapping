/*
===============================================================================
Employee Segmentation & Standardization Analysis
===============================================================================
Purpose:
    - To segment employees based on multiple measures such as rating, experience, 
      and salary for performance and compensation insights.
    - To identify patterns and correlations between employee experience and ratings.
    - To standardize job titles based on experience and detect role mismatches.

SQL Functions Used:
    - CASE: For categorization and standard role mapping.
    - CORR(): To identify correlation between numeric attributes.
    - Stored Function (plpgsql): For reusable job standardization logic.
===============================================================================
*/

-- Segment employees by performance rating
SELECT
    employee_id,
    employee_rating, 
    CASE 
        WHEN employee_rating < 2 THEN 'Less than 2'
        WHEN employee_rating BETWEEN 2 AND 4 THEN 'Between 2 and 4'
        WHEN employee_rating > 4 THEN 'Greater than 4'
    END AS emp_performance
FROM processed.emp_record_table;

--Identify correlation between experience and employee rating
SELECT
    CORR(experience, employee_rating) AS exp_rating_correlation
FROM processed.emp_record_table;

--Categorize employees into salary brackets
SELECT
    employee_id,
    salary,
    CASE 
        WHEN salary < 7000 THEN 'Low Earner'
        WHEN salary BETWEEN 7000 AND 10000 THEN 'Medium Earner'
        WHEN salary > 11000 THEN 'High Earner'
    END AS salary_bracket
FROM processed.emp_record_table;

-- Job Standardization Check
-- Define standard job titles based on experience range
CREATE OR REPLACE FUNCTION processed.fn_get_standard_role(exp NUMERIC)
RETURNS TEXT AS
$$
BEGIN
    RETURN (
        CASE 
            WHEN exp <= 2 THEN 'JUNIOR DATA SCIENTIST'
            WHEN exp > 2 AND exp <= 5 THEN 'ASSOCIATE DATA SCIENTIST'
            WHEN exp > 5 AND exp <= 10 THEN 'SENIOR DATA SCIENTIST'
            WHEN exp > 10 AND exp <= 12 THEN 'LEAD DATA SCIENTIST'
            WHEN exp > 12 AND exp <= 16 THEN 'MANAGER'
            WHEN exp > 16 THEN 'PRESIDENT'
            ELSE 'UNKNOWN'
        END
    );
END;
$$
LANGUAGE plpgsql;

--Compare actual roles with standardized roles to identify mismatches
SELECT
    employee_id,
    name,
    experience,
    role,
    processed.fn_get_standard_role(experience) AS standard_role,
    CASE 
        WHEN UPPER(role) = processed.fn_get_standard_role(experience) THEN 'MATCH'
        ELSE 'MISMATCH'
    END AS role_comparison
FROM processed.emp_record_table;

