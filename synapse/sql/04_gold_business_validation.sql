```sql
/*
Project: Azure E-commerce Data Engineering Platform
Component: Synapse Serverless SQL
Purpose: Validate business totals in the Gold layer.

These queries are read-only. Fact-table totals are calculated
separately to avoid double-counting across different grains.
*/

USE EcommerceWarehouse;
GO

-- 1. Order performance
SELECT
    COUNT_BIG(*) AS total_order_rows,
    COUNT(DISTINCT order_id) AS distinct_orders,
    SUM(final_amount) AS total_order_sales,
    SUM(discount_amount) AS total_discount,
    SUM(tax_amount) AS total_tax,
    AVG(CAST(final_amount AS DECIMAL(18,2))) AS average_order_value
FROM dbo.fact_orders;
GO

-- 2. Order-item performance
SELECT
    COUNT_BIG(*) AS total_order_item_rows,
    SUM(quantity) AS total_units,
    SUM(line_total) AS total_item_sales
FROM dbo.fact_order_items;
GO

-- 3. Payment and refund performance
SELECT
    COUNT_BIG(*) AS total_payment_rows,
    SUM(payment_amount) AS total_payment_amount,
    SUM(refund_amount) AS total_refund_amount
FROM dbo.fact_payments;
GO

-- 4. Payment status summary
SELECT
    payment_status,
    payment_count,
    order_count,
    payment_amount,
    refund_amount
FROM dbo.payment_status_summary
ORDER BY payment_status;
GO
```
