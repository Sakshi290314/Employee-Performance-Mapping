**📘 Data Catalog – Employee Performance Mapping Project**

This document provides a detailed description of all datasets used in the Employee Performance Mapping project. It defines each table, its purpose, and column-level details including data type, description, and possible values where applicable.

🧩 1. emp_record_table

Description:

Contains information about all employees in the organization, including their demographics, job roles, experience, salary, ratings, and project associations.

| Column Name    | Data Type         | Description                                                       |
| -------------- | ----------------- | ----------------------------------------------------------------- |
| **EMP_ID**     | VARCHAR           | Unique identifier for each employee                               |
| **FIRST_NAME** | VARCHAR           | Employee’s first name                                             |
| **LAST_NAME**  | VARCHAR           | Employee’s last name                                              |
| **GENDER**     | VARCHAR           | Gender of the employee (e.g., Male, Female)                       |
| **ROLE**       | VARCHAR           | Job title or designation (e.g., Manager, Data Scientist)          |
| **DEPT**       | VARCHAR           | Department name where the employee works (e.g., Finance, HR, IT)  |
| **EXP**        | INTEGER           | Total years of experience the employee holds                      |
| **COUNTRY**    | VARCHAR           | Country where the employee is currently located                   |
| **CONTINENT**  | VARCHAR           | Continent corresponding to the employee’s country                 |
| **SALARY**     | DECIMAL           | Current salary of the employee                                    |
| **EMP_RATING** | INTEGER           | Performance rating of the employee                                |
| **MANAGER_ID** | VARCHAR           | ID of the manager supervising the employee                        |
| **PROJ_ID**    | VARCHAR           | Project ID linked to the employee’s current or past project       |


🧩 2. proj_table

Description:

Contains details about projects executed by the company, including project domain, duration, and current status.

| Column Name      | Data Type         | Description                                                       |
| ---------------- | ----------------- | ----------------------------------------------------------------- |
| **PROJECT_ID**   | VARCHAR           | Unique identifier for each project                                |
| **PROJ_NAME**    | VARCHAR           | Name of the project                                               |
| **DOMAIN**       | VARCHAR           | Area or field of the project (e.g., Healthcare, Retail, Finance)  |
| **START_DATE**   | DATE              | Date when the project started                                     |
| **CLOSURE_DATE** | DATE              | Date when the project was or is expected to be completed          |
| **DEV_QTR**      | VARCHAR           | Development quarter when the project was scheduled (e.g., Q1, Q2) |
| **STATUS**       | VARCHAR           | Current project status (e.g., Done, delayed)                      |


🧩 3. data_science_team

Description:

Contains employee information specifically related to the Data Science department. Used for validating organizational role standards and analyzing team composition.

| Column Name    | Data Type         | Description                                                                   |
| -------------- | ----------------- | ----------------------------------------------------------------------------- |
| **EMP_ID**     | VARCHAR           | Unique identifier for each data science employee                              |
| **FIRST_NAME** | VARCHAR           | Employee’s first name                                                         |
| **LAST_NAME**  | VARCHAR           | Employee’s last name                                                          |
| **GENDER**     | VARCHAR           | Gender of the employee                                                        |
| **ROLE**       | VARCHAR           | Job title within the data science team (e.g., Junior Data Scientist)          |
| **DEPT**       | VARCHAR           | Department name                                                               |
| **EXP**        | INTEGER           | Total years of experience                                                     |
| **COUNTRY**    | VARCHAR           | Current country of residence                                                  |
| **CONTINENT**  | VARCHAR           | Continent corresponding to the employee’s country                             |
