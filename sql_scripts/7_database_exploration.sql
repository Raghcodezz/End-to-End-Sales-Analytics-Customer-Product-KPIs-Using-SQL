/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/
--Running Sum over the order_dates

with cte as (select 
DATETRUNC(month, order_date) as date,
sum(sales_amount) as total_sales
from [gold.fact_sales]
group by DATETRUNC(month, order_date))

select *, 
sum(total_sales) over(order by date) as running_sum
from cte

