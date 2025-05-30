/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/
-- segment the products according to their costs and count how many products fall into those cost_ranges.

with cte as(select 
product_key as product_key,
product_name as product_name,
cost as cost,
case 
     when cost <100 then 'Below 100'
     when cost between 100 and 500 then '100-500'
     when cost between 500 and 1000 then '500-1000'
     else 'Above 1000'
end as cost_range
from [gold.dim_products] 
)

select cost_range,
count(cost_range) from cte
group by cost_range


-- Now, group the customers into segments based on spending behaviour.
-- And find the total number of customer in each group.

with cte as (select 
b.customer_number as customer_number,
b.customer_key as customer_key,
sum(a.price) as total_expenses,
DATEDIFF(month, min(a.order_date), max(a.order_date)) as lifespan
from [gold.fact_sales] a 
join
[gold.dim_customers] b
on a.customer_key=b.customer_key
group by b.customer_number,b.customer_key
),

--dividing the customers into categories.
cte1 as(
select *,
case
     when total_expenses >=5000 and lifespan>=12 then 'VIP'
     when total_expenses<5000 and lifespan>=12 then 'Regular'
     when total_expenses<5000 and lifespan<12 then 'Newbie'
end as customer_segment
from cte)

--count the number of customers in this category
select customer_segment, 
count(*)
from cte1
group by customer_segment







