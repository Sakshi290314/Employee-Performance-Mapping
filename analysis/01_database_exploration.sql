/*
===============================================================================
01. DATABASE EXPLORATION
===============================================================================
Purpose:
    The goal of this step is to understand the structure of the database before performing any analytical queries. It provides an overview of the available tables, their schemas, and the column-level metadata.

Objectives:
    - Explore all available tables in the current database.
    - Understand the schema and data types used.
    - Identify relationships and dependencies among tables.
    - Validate if all required tables are loaded correctly.

Tables Referenced:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS

Insights Expected:
    - Number of tables present in the database.
    - Type of tables (BASE TABLE or VIEW).
    - Column names, data types, and nullability.
    - Structural understanding to support later analysis (e.g., employee details, project info, performance data).

===============================================================================
*/

-- Retrieve a list of all tables in the database
SELECT 
    TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

-- Retrieve all columns for a specific table (emp_record_table)
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'emp_record_table';

-- Example: Check table structure for another key table if required
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'proj_table';
