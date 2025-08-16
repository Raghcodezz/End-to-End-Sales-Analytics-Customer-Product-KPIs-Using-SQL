# Customer and Product Segmentation & KPI Analysis Using SQL

## Business Problem

The business was unable to analyze customer behavior and product performance, leading to losses and inefficient targeting.

1) **Lack of Customer Insights**:
   - Unable to segment the age into specific age groups, making it difficult to tailor marketing strategies and target ads.
   - Unable to identify the VIPs, regular, and newbie customers.
   - Unable to calculate the lifespan (business relationship with the company) of the customer. 

2) **Product Performance**:
   - Unable to track sales trends over time.
   - Unable to segment products into high selling, low selling, etc.
   - Without recency and lack of product KPIs such as average order value and average monthly spend of each customer, we cannot decide how the product is performing, which can lead to overstocking and understocking.

## Goal of the Project

To analyze customer behavior and product performance using SQL in order to segment customers, classify products, and generate key performance indicators (KPIs) that support data-driven decisions in marketing, sales, and inventory management.

## Project Overview

This is a SQL Data Analysis Project which analyzes customer and sales data over the years.

The steps included in this project were:

1) **Data Warehousing** → Organize, structure, and prepare the data.  
2) **Exploratory Data Analysis (EDA)** → Performing basic aggregations and writing basic queries.  
3) **Advanced Data Analytics** → Complex queries, window functions, deriving new dimensions through measures, and grouping the data accordingly to gain a better understanding of the dataset.

## Insights Driven from this project:
   1) Grouped the customers according to lifespan and analyzed that VIP Customers generated most of the revenue ie 55% of total revenue.
   2) Created product categories and identified that only top 3 categories generated most of the sales
   3) 40% of customer base is 'newbies' (customers with lifespan < 12months)
   4) Identified the 30+ products that are under performing with sales <10,000rs.
   5) 3 Countries accounted for 70% customer base.

## Business Impact :
   1) VIP Customer contributed to 55% of Total Revenue and by enabling good marketing strategies we can expect increase in average spend of atleast 10-15% because they contribute 55% of the revenue and even a           small in number of VIP Customers could lead to huge difference in revenue.
   2) Discovered that top 3 product categories accounted for 78% of sales. The remaining products can be either replaced or removed which can save warehouse cost and lead to better inventory management. We can          expect a cutdown of 20% in the inventory costs because the products which are not sold much are high in quantity so removing them can reduce costs drastically where we can assume 20% at minimum.
   3) We observe that 40% of the customers are newbies (lifespan of < 12 months) leading to leaky bucket problem. We can implement strategies such as running campaigns, good CRM, discounts etc could keep the            customers hooked which can increase the customer retention rate rannging between 10-15% approx. (estimate)
   4) From the data analysis I observed that there is a 8-10% month on month growth which tells us that market is rising now and this is the best time to experiment by introducing new products so that we can know        the customer behaviour and work according to them.
         



