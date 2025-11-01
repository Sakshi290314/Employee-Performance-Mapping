/*
===============================================================================
Stored Procedure: sp_load_processed
===============================================================================
Purpose:
    This stored procedure loads cleaned and standardized data 
    from the 'raw' schema into the 'processed' schema. 
    It performs truncation of existing tables and re-inserts transformed data.

Schemas:
    - Source: raw
    - Target: processed

Execution:
    CALL sp_load_processed();

===============================================================================
*/

CREATE OR REPLACE PROCEDURE sp_load_processed()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    duration NUMERIC;
BEGIN
    RAISE NOTICE '=====================================================';
    RAISE NOTICE '              Loading Processed Layer';
    RAISE NOTICE '=====================================================';

    ----------------------------------------------------------------
    -- EMPLOYEE RECORD TABLE
    ----------------------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE '>> Truncating Table: processed.emp_record_table';
    TRUNCATE TABLE processed.emp_record_table;

    RAISE NOTICE '>> Inserting Data Into: processed.emp_record_table';
    start_time := CURRENT_TIMESTAMP;

    INSERT INTO processed.emp_record_table (
        employee_id, name, gender, role, department, experience, country, continent, 
        salary, employee_rating, manager_id, project_id, dwh_create_date
    )
    SELECT  
        emp_id AS employee_id,
        CONCAT(first_name, ' ', last_name) AS name,
        CASE 
            WHEN gender = 'M' THEN 'Male'
            WHEN gender = 'F' THEN 'Female'
            ELSE 'Other'
        END AS gender,
        INITCAP(role),
        INITCAP(dept) AS department,
        exp AS experience,
        INITCAP(country),
        INITCAP(continent),
        salary,
        emp_rating AS employee_rating,
        manager_id,
        proj_id AS project_id,
        CURRENT_TIMESTAMP AS dwh_create_date
    FROM raw.emp_record_table;

    end_time := CURRENT_TIMESTAMP;
    duration := EXTRACT(EPOCH FROM (end_time - start_time));
    RAISE NOTICE '>> Load Duration (emp_record_table): % seconds', duration;

    ----------------------------------------------------------------
    -- DATA SCIENCE TEAM TABLE
    ----------------------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE '>> Truncating Table: processed.data_science_team';
    TRUNCATE TABLE processed.data_science_team;

    RAISE NOTICE '>> Inserting Data Into: processed.data_science_team';
    start_time := CURRENT_TIMESTAMP;

    INSERT INTO processed.data_science_team (
        employee_id, name, gender, role, department, experience, country, continent, dwh_create_date
    )
    SELECT 
        emp_id AS employee_id,
        CONCAT(first_name, ' ', last_name) AS name,
        CASE 
            WHEN gender = 'M' THEN 'Male'
            WHEN gender = 'F' THEN 'Female'
            ELSE 'Other'
        END AS gender,
        INITCAP(role),
        INITCAP(dept) AS department,
        exp AS experience,
        INITCAP(country),
        INITCAP(continent),
        CURRENT_TIMESTAMP AS dwh_create_date
    FROM raw.data_science_team;

    end_time := CURRENT_TIMESTAMP;
    duration := EXTRACT(EPOCH FROM (end_time - start_time));
    RAISE NOTICE '>> Load Duration (data_science_team): % seconds', duration;

    ----------------------------------------------------------------
    -- PROJECT TABLE
    ----------------------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE '>> Truncating Table: processed.proj_table';
    TRUNCATE TABLE processed.proj_table;

    RAISE NOTICE '>> Inserting Data Into: processed.proj_table';
    start_time := CURRENT_TIMESTAMP;

    INSERT INTO processed.proj_table (
        project_id, project_name, project_domain, start_date, closure_date, development_quarter, project_status, dwh_create_date
    )
    SELECT 
        project_id,
        proj_name AS project_name,
        INITCAP(domain) AS project_domain,
        start_date,
        closure_date,
        COALESCE(dev_qtr, 'n/a') AS development_quarter,
        INITCAP(
            CASE 
                WHEN status = 'WIP' THEN 'Work In Progress'
                WHEN status = 'YTS' THEN 'Yet To Start'
                ELSE status
            END
        ) AS project_status,
        CURRENT_TIMESTAMP AS dwh_create_date
    FROM raw.proj_table;

    end_time := CURRENT_TIMESTAMP;
    duration := EXTRACT(EPOCH FROM (end_time - start_time));
    RAISE NOTICE '>> Load Duration (proj_table): % seconds', duration;

    ----------------------------------------------------------------
    -- END OF PROCEDURE
    ----------------------------------------------------------------
    RAISE NOTICE '=====================================================';
    RAISE NOTICE '>> Processed Layer Load Completed Successfully';
    RAISE NOTICE '=====================================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred during procedure execution: %', SQLERRM;
END;
$$;
