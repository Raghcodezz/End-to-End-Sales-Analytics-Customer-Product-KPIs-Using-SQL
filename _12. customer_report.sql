/*
===============================================================================
Customer Report
===============================================================================
Purpose:
    - This report consolidates key customer metrics and behaviors

Highlights:
    1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
    3. Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
    4. Calculates valuable KPIs:
	    - recency (months since last order)
		- average order value
		- average monthly spend
===============================================================================
*/
 
with cte as( select 
 a.customer_key,
 concat(a.first_name, a.last_name) as customer_name,
 DATEDIFF(year, a.birthdate,GETDATE()) as age,
 count(b.order_number) as count_of_orders,
 sum(b.sales_amount) as total_expenses,
 sum(b.quantity) as quantity,
 datediff(month, min(b.order_date), max(b.order_date)) as lifespan,
 count(distinct b.product_key) as total_products,
 max(b.order_date) as last_order_date
 from [gold.dim_customers] a
 join 
 [gold.fact_sales] b on
 a.customer_key=b.customer_key
 group by  a.customer_key,a.first_name,a.last_name,a.birthdate)

select *,
 case 
     when total_expenses >=5000 and lifespan>=12 then 'VIP'
     when total_expenses<5000 and lifespan>=12 then 'Regular'
     when total_expenses<5000 and lifespan<12 then 'Newbie'
end as 'customer_Category',
case 
     WHEN age < 20 THEN 'Under 20'
	 WHEN age between 20 and 29 THEN '20-29'
	 WHEN age between 30 and 39 THEN '30-39'
	 WHEN age between 40 and 49 THEN '40-49'
	 ELSE '50 and above'
END AS age_group,
datediff(month, last_order_date, GETDATE()) as recency,
case 
    when count_of_orders=0 then 0
    else total_expenses/count_of_orders 
end as avg_order_value,
case 
    when lifespan=0 then 0
    else total_expenses/lifespan 
end as avg_monthly_spend
from cte
