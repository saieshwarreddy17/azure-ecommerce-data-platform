```sql
/*
Project: Azure E-commerce Data Engineering Platform
Component: Azure Synapse Analytics - Serverless SQL
Purpose: Inventory and verify the eight Gold external tables.

This script reads metadata only. It does not modify tables or data.
*/

USE EcommerceWarehouse;
GO

SELECT
    SCHEMA_NAME(schema_id) AS schema_name,
    name AS external_table_name,
    create_date,
    modify_date
FROM sys.external_tables
ORDER BY name;
GO

-- Verify row counts for the Gold external tables.
SELECT 'dim_customer' AS table_name, COUNT_BIG(*) AS row_count
FROM dbo.dim_customer
UNION ALL
SELECT 'dim_product', COUNT_BIG(*) FROM dbo.dim_product
UNION ALL
SELECT 'dim_date', COUNT_BIG(*) FROM dbo.dim_date
UNION ALL
SELECT 'dim_address', COUNT_BIG(*) FROM dbo.dim_address
UNION ALL
SELECT 'fact_orders', COUNT_BIG(*) FROM dbo.fact_orders
UNION ALL
SELECT 'fact_order_items', COUNT_BIG(*) FROM dbo.fact_order_items
UNION ALL
SELECT 'fact_payments', COUNT_BIG(*) FROM dbo.fact_payments
UNION ALL
SELECT 'payment_status_summary', COUNT_BIG(*) FROM dbo.payment_status_summary
ORDER BY table_name;
GO
```
