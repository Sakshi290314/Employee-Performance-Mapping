**🧩 Naming Conventions**

To maintain consistency and readability across all database layers, this project follows standardized naming conventions. All object names are written in lowercase using snake_case (words separated by underscores).
This ensures clarity, avoids errors, and keeps the schema organized.

**📂 Schema Layers**

The project is divided into three schemas:

raw – stores unprocessed source data directly loaded from files.

processed – contains cleaned and standardized data ready for analysis.

analysis – holds analytical views and derived insights for reporting.

**🧱 Base Tables**

Tables are named after their business entities, e.g., emp_record_table, proj_table, and data_science_team.

Each table name clearly represents its purpose and data source.

**👁️ Views**

**Named using the format:** vw_entity_purpose

Example: vw_employee_performance_summary

**⚙️ Stored Procedures**

**Named using the format:** sp_action_entity

Example: sp_load_emp_record_table

**➕ Derived Columns**

Calculated fields are prefixed with cal_

Example: cal_project_duration

**🕒 Technical Columns**

Metadata or audit columns are prefixed with dwh_

Example: dwh_create_date

**🔑 Surrogate Keys**

Surrogate key columns follow the format <table_name>_key

Example: emp_record_table_key

These conventions ensure clarity, consistency, and scalability across all schemas and database objects.
