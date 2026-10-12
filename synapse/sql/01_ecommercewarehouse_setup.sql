```sql
/*
Project: Azure E-commerce Data Engineering Platform
Component: Azure Synapse Analytics - Serverless SQL

Purpose:
Document the EcommerceWarehouse database used by this project.

Important:
- Run this script in the Synapse serverless SQL endpoint.
- The database already exists in this project.
- Gold data files are stored in ADLS Gen2 as Parquet.
- External tables expose those files to SQL queries.
- This script does not recreate or delete existing objects.
*/

-- Select the existing project database.
USE EcommerceWarehouse;
GO

-- List the external tables available in the database.
SELECT
    SCHEMA_NAME(schema_id) AS schema_name,
    name AS external_table_name
FROM sys.external_tables
ORDER BY name;
GO
```
