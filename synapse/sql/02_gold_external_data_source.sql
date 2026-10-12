```sql
/*
Project: Azure E-commerce Data Engineering Platform
Component: Synapse Serverless SQL
Purpose: Document the external data source for the ADLS Gen2 Gold container.

Storage account: stcommercesrc
Container: gold

Important:
This script checks for the existing external data source.
It does not drop or overwrite any objects.
*/

USE EcommerceWarehouse;
GO

SELECT
    name AS external_data_source_name,
    location,
    type_desc
FROM sys.external_data_sources
WHERE name = 'EcommerceGold';
GO
```
