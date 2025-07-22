/*
=============================================================
Create Database for Data Warehouse Project (MySQL Version)
=============================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' 
    for organizing data into different layers: bronze, silver, and gold.
    
    Since MySQL doesn't support schemas inside a database like SQL Server, 
    we simulate them using naming conventions (e.g., bronze_table_name).

WARNING:
    If the database already exists, drop it manually with:
        DROP DATABASE DataWarehouse;
    This will permanently delete all data.
=============================================================
*/

-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;

-- Select the newly created database for use
USE DataWarehouse;

-- NOTE:
-- In SQL Server, you’d use CREATE SCHEMA for bronze/silver/gold.
-- In MySQL, simulate them using naming prefixes:
--    bronze_ : Raw ingested data (from source)
--    silver_ : Cleaned and transformed data
--    gold_   : Final analytics-ready data

-- Example simulated table names:
--    CREATE TABLE bronze_crm_cust_info (...);
--    CREATE TABLE silver_customer_cleaned (...);
--    CREATE TABLE gold_customer_summary (...);

-- Continue your project with table creation here...