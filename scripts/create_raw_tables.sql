/*
===============================================================================
DDL Script: Create Raw Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'raw' schema, dropping existing tables 
    if they already exist. These tables represent the raw layer in the 
    'employee_performance_db' database, containing unprocessed data directly 
    ingested from source files.

Run this script to re-define the DDL structure of all 'raw' tables.
===============================================================================
*/

-- =========================================================
-- STEP 1: Drop existing tables if they exist
-- =========================================================
DROP TABLE IF EXISTS raw.emp_record_table CASCADE;
DROP TABLE IF EXISTS raw.data_science_team CASCADE;
DROP TABLE IF EXISTS raw.proj_table CASCADE;

-- =========================================================
-- STEP 2: Create raw.emp_record_table
-- =========================================================
CREATE TABLE raw.emp_record_table (
    EMP_ID          VARCHAR(10) PRIMARY KEY,
    FIRST_NAME      VARCHAR(50),
    LAST_NAME       VARCHAR(50),
    GENDER          CHAR(1),
    ROLE            VARCHAR(100),
    DEPT            VARCHAR(50),
    EXP             INT,
    COUNTRY         VARCHAR(50),
    CONTINENT       VARCHAR(50),
    SALARY          NUMERIC(10,2),
    EMP_RATING      INT,
    MANAGER_ID      VARCHAR(10),
    PROJ_ID         VARCHAR(10)
);

-- =========================================================
-- STEP 3: Create raw.data_science_team
-- =========================================================
CREATE TABLE raw.data_science_team (
    EMP_ID      VARCHAR(10) PRIMARY KEY,
    FIRST_NAME  VARCHAR(50),
    LAST_NAME   VARCHAR(50),
    GENDER      CHAR(1),
    ROLE        VARCHAR(100),
    DEPT        VARCHAR(50),
    EXP         INT,
    COUNTRY     VARCHAR(50),
    CONTINENT   VARCHAR(50)
);

-- =========================================================
-- STEP 4: Create raw.proj_table
-- =========================================================
CREATE TABLE raw.proj_table (
    PROJECT_ID      VARCHAR(10) PRIMARY KEY,
    PROJ_NAME       VARCHAR(100),
    DOMAIN          VARCHAR(50),
    START_DATE      DATE,
    CLOSURE_DATE    DATE,
    DEV_QTR         VARCHAR(10),
    STATUS          VARCHAR(20)
);

-- =========================================================
-- END OF SCRIPT
-- =========================================================
