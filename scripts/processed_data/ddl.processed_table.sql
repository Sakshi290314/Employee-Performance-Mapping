/*
===============================================================================
DDL Script: Create Processed Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'processed' schema, dropping existing tables 
    if they already exist.

    The 'processed' layer is used to store cleaned and validated data 
    derived from the 'raw' layer.

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
    LIKE raw.emp_record_table INCLUDING ALL,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================================
-- Create processed.data_science_team
-- =====================================================================
CREATE TABLE processed.data_science_team (
    LIKE raw.data_science_team INCLUDING ALL,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================================
-- Create processed.proj_table
-- =====================================================================
CREATE TABLE processed.proj_table (
    LIKE raw.proj_table INCLUDING ALL,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================================
-- End of Script
-- =====================================================================
