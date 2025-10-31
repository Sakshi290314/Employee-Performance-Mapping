/*
===============================================================================
Script Note: Data Loading into Raw Tables
===============================================================================
Data for the following tables was imported manually using pgAdmin’s Import/Export
option from CSV files stored in the '/data' directory.

Tables Loaded:
    - raw.emp_record_table
    - raw.data_science_team
    - raw.proj_table

No INSERT statements are used in this project for raw layer ingestion.

Steps (for reference):
    1. Right-click each table under the 'raw' schema in pgAdmin.
    2. Select "Import/Export Data".
    3. Choose the corresponding CSV file from the '/data' folder.
    4. Format: CSV | Header: Yes | Delimiter: ',' 
===============================================================================
*/
