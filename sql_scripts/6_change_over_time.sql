/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: MONTH(), YEAR()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- To check how the data has evolved over time (year on year)
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM [gold.fact_sales]
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);
