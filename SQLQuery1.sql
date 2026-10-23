/*
=============================================================
Database Creation and Table Setup Script
=============================================================
Script Purpose:
    This script creates a new SQL Server database named 'MyDatabase'. 
    If the database already exists, it is dropped to ensure a clean setup. 
    The script then creates three tables: 'customers', 'orders', and 'employees' 
    with their respective schemas, and populates them with sample data.
    
WARNING:
    Running this script will drop the entire 'MyDatabase' database if it exists, 
    permanently deleting all data within it. Proceed with caution and ensure you 
    have proper backups before executing this script.
*/

USE master;
GO

-- Drop and recreate the 'MyDatabase' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'MyDatabase')
BEGIN
    ALTER DATABASE MyDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE MyDatabase;
END;
GO

-- Create the 'MyDatabase' database
CREATE DATABASE MyDatabase;
GO

