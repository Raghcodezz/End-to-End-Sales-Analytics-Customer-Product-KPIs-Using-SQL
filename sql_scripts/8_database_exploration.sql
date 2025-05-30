/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/
/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */

-- calculating the sum of sales of each product
with cte as (select 
a.product_name as product_name,
b.order_date as order_date,
sum(b.sales_amount) as total_sales
from [gold.dim_products] a
join
[gold.fact_sales] b
on a.product_key=b.product_key
where b.order_date is not null
group by a.product_name, b.order_date)

--calculating the avg sales and previous year sales to compare it with the current sales and to determine whether it is a growth or decline.
select *,
avg(total_sales) over(partition by product_name) as avg_sales,
lag(total_sales) over(partition by product_name order by order_date) as previous_year_sales,

-- comparing with avergae sales of category
case
    when total_sales-avg(total_sales) over(partition by product_name) <0 then 'Below Avg'
    when total_sales-avg(total_sales) over(partition by product_name) >0 then 'Aboce Avg'
    else 'Same'
end as difference,

-- comparing with previous year sales of product  
case 
    when total_sales >lag(total_sales) over(partition by product_name order by order_date) then 'Increase'
    when total_sales <lag(total_sales) over(partition by product_name order by order_date) then 'Decrease'
    else 'no change'
end as dnfs
from cte
