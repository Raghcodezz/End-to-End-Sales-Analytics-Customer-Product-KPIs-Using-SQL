/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose: Part-to-Whole Analysis is a method used in data analysis to understand
         how individual components (parts) contribute to a total value (whole).

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/
-- to understand how each category is contributing to the total sales.
with cte as(select 
a.category,
sum(b.sales_amount) as total_sales
from  [gold.dim_products] a
join
[gold.fact_sales] b
on a.product_key= b.product_key
group by 
a.category)

select 
category,
total_sales,
sum(total_sales) over() as overall_sales,
round((total_sales*1.0/sum(total_sales) over())*100 ,2)as percentage_of_total
from cte 
order by total_sales desc
