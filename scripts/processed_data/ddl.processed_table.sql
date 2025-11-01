/*
===============================================================================
DDL Script: Create Processed Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'processed' schema, dropping existing tables 
    if they already exist.

    The 'processed' layer stores cleaned and validated data derived from the 'raw' 
    layer. At this stage, no transformations are applied; only table structures are created with an additional column 'dwh_create_date' 
    to record data insertion timestamps.

Execution Notes:
    • Ensure that all 'raw' tables are already created before running this script.
    • This script only creates table structures (no data is inserted here).
===============================================================================
*/

-- Drop existing tables in processed schema if they exist
DROP TABLE IF EXISTS processed.emp_record_table CASCADE;
DROP TABLE IF EXISTS processed.data_science_team CASCADE;
DROP TABLE IF EXISTS processed.proj_table CASCADE;

-- =====================================================================
-- Create processed.emp_record_table
-- =====================================================================
CREATE TABLE processed.emp_record_table (
    employee_id         VARCHAR(10),
    name                VARCHAR(50),
    gender              VARCHAR(10),
    role                VARCHAR(100),
    department          VARCHAR(100),
    experience          NUMERIC(5,2),
    country             VARCHAR(100),
    continent           VARCHAR(100),
    salary              NUMERIC(12,2),
    employee_rating     NUMERIC(3,2),
    manager_id          VARCHAR(10),
    project_id          VARCHAR(10),
    dwh_create_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================================
-- Create processed.data_science_team
-- =====================================================================
CREATE TABLE processed.data_science_team (
    employee_id         VARCHAR(10),
    name                VARCHAR(50),
    gender              VARCHAR(10),
    role                VARCHAR(100),
    department          VARCHAR(100),
    experience          NUMERIC(5,2),
    country             VARCHAR(100),
    continent           VARCHAR(100),
    dwh_create_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================================
-- Create processed.proj_table
-- =====================================================================
CREATE TABLE processed.proj_table (
    project_id              VARCHAR(10),
    project_name            VARCHAR(255),
    project_domain          VARCHAR(100),
    start_date              DATE,
    closure_date            DATE,
    development_quarter     VARCHAR(10),
    project_status          VARCHAR(50),
    dwh_create_date         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================================
-- End of Script
-- =====================================================================
