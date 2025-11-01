/* 
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs a comprehensive set of quality checks to ensure 
    data consistency, accuracy, and standardization across the **Raw Layer**. 
    These checks validate that the data loaded into the raw tables is 
    clean, well-structured, and ready for further processing into the 
    Processed Layer.

Scope:
    - Tables Covered:
        • raw.emp_record_table
        • raw.data_science_team
        • raw.proj_table

Key Checks Performed:
    ✅ Duplicate or NULL primary keys
    ✅ Unwanted leading/trailing spaces in string fields
    ✅ Invalid or inconsistent categorical values
    ✅ Negative or zero numerical values (salary, experience)
    ✅ Invalid date orders (start_date > closure_date)
    ✅ Data standardization and uniqueness across categorical columns

Usage Notes:
    - Execute this script after data ingestion into the Raw Layer.
    - Review and address any anomalies before proceeding to transformation 
      and loading into the Processed Layer.
    - Stored Procedure Naming Convention: sp_<action>_<entity>
      Example: sp_insert_emp_record

===============================================================================
*/

-- ====================================================================
-- Checking 'raw.emp_record_table'
-- ====================================================================

-- Check for NULLs or Duplicates in Primary Key
SELECT emp_id, COUNT(*) 
FROM raw.emp_record_table
GROUP BY emp_id
HAVING COUNT(*) > 1 OR emp_id IS NULL;

-- Check for Unwanted Spaces
SELECT first_name FROM raw.emp_record_table WHERE first_name != TRIM(first_name);
SELECT last_name FROM raw.emp_record_table WHERE last_name != TRIM(last_name);

-- Data Standardization & Consistency
SELECT DISTINCT gender FROM raw.emp_record_table;
SELECT DISTINCT role FROM raw.emp_record_table;
SELECT DISTINCT dept FROM raw.emp_record_table;
SELECT DISTINCT country FROM raw.emp_record_table;
SELECT DISTINCT continent FROM raw.emp_record_table;
SELECT DISTINCT emp_rating FROM raw.emp_record_table;

-- Check for Negative or Zero Values
SELECT salary FROM raw.emp_record_table WHERE salary <= 0;
SELECT exp FROM raw.emp_record_table WHERE exp < 0;

-- ====================================================================
-- Checking 'raw.data_science_team'
-- ====================================================================

-- Check for NULLs or Duplicates in Primary Key
SELECT emp_id, COUNT(*) 
FROM raw.data_science_team
GROUP BY emp_id
HAVING COUNT(*) > 1 OR emp_id IS NULL;

-- Check for Unwanted Spaces
SELECT first_name FROM raw.data_science_team WHERE first_name != TRIM(first_name);
SELECT last_name FROM raw.data_science_team WHERE last_name != TRIM(last_name);

-- Data Standardization & Consistency
SELECT DISTINCT gender FROM raw.data_science_team;
SELECT DISTINCT role FROM raw.data_science_team;
SELECT DISTINCT dept FROM raw.data_science_team;
SELECT DISTINCT country FROM raw.data_science_team;
SELECT DISTINCT continent FROM raw.data_science_team;

-- Check for Negative Experience
SELECT exp FROM raw.data_science_team WHERE exp < 0;

-- ====================================================================
-- Checking 'raw.proj_table'
-- ====================================================================

-- Check for NULLs or Duplicates in Primary Key
SELECT project_id, COUNT(*) 
FROM raw.proj_table
GROUP BY project_id
HAVING COUNT(*) > 1 OR project_id IS NULL;

-- Check for Invalid Date Orders (Start Date > End Date)
SELECT project_id, start_date, closure_date
FROM raw.proj_table
WHERE closure_date < start_date;

-- Data Standardization & Consistency
SELECT DISTINCT dev_qtr FROM raw.proj_table;
SELECT DISTINCT status FROM raw.proj_table;
SELECT DISTINCT domain FROM raw.proj_table;
SELECT DISTINCT proj_name FROM raw.proj_table;

===============================================================================
-- End of Raw Layer Data Quality Checks
===============================================================================
