/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'employee_performance_db' after checking 
    if it already exists. If the database exists, it is dropped and recreated. 
    Additionally, the script sets up three schemas within the database: 
    'raw', 'processed', and 'analysis'.

WARNING:
    ⚠️ Running this script will DROP the existing 'employee_performance_db' database if it exists. 
    All data in that database will be permanently deleted. 
    Proceed with caution and ensure you have proper backups before running this script.
=============================================================
*/

-- =========================================================
-- STEP 1: Drop existing database (if any)
-- =========================================================
DROP DATABASE IF EXISTS employee_performance_db;

-- =========================================================
-- STEP 2: Create a new database
-- =========================================================
CREATE DATABASE employee_performance_db;

-- =========================================================
-- STEP 3: Create Schemas
-- =========================================================

-- Schema for raw/original data (imported as-is)
CREATE SCHEMA raw;

-- Schema for cleaned and transformed data
CREATE SCHEMA processed;

-- Schema for analytical outputs (aggregations, KPIs, reports)
CREATE SCHEMA analysis;

-- =========================================================
-- END OF SCRIPT
-- =========================================================
