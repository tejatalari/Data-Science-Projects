create database superstore;
#1 
select customer_name as customername, customer_segment as customersegment from superstore.cust_dimen;

#2
select * from superstore.cust_dimen
order by Customer_Name desc, province desc, Region desc, Customer_Segment desc, Cust_id desc;

#3
select order_id, order_date from superstore.orders_dimen
where Order_Priority ='high';

#4
select avg(sales) , sum(sales) from superstore.market_fact ;

#5
select min(sales) , max(sales) from superstore.market_fact;

#6
select region, count(*) as no_of_customers from superstore.cust_dimen
group by region
order by count(*) desc;

#7
select region, count(*) as no_of_customers from superstore.cust_dimen
group by region
order by count(*) desc
limit 2;

#8*
select a.Customer_Name, count(c.product_Sub_Category) as no_of_tables_purchased
from superstore.cust_dimen as a
inner join superstore.market_fact as b on a.cust_id=b.cust_id
inner join superstore.prod_dimen as c on b.Prod_id=c.prod_id
where region='atlantic' and product_sub_category='tables' group by customer_name;

#9
select  Customer_Name, count(*) as no_of_small_business_owner from superstore.cust_dimen
where Province='ontario' and customer_segment='small business'
group by Customer_Name;

#10
select prod_id, count(sales) as no_of_product_sold from superstore.market_fact
group by Prod_id
order by count(Sales) desc;

#11
select prod_id , product_sub_category from superstore.prod_dimen
where Product_Category='furniture' or Product_Category='technology';

#12*
select a.Product_Category ,sum(b.Profit) as profit  from superstore.prod_dimen as a
inner join superstore.market_fact as b on a.Prod_id= b.Prod_id
group by Product_Category
order by Profit desc;

#13
select a.product_category , a.product_sub_category , sum(b.profit) as profit from superstore.prod_dimen as a
inner join superstore.market_fact as b on a.Prod_id=b.Prod_id 
group by Product_Sub_Category
order by Product_Category;

#14
select a.order_date as "order date", b.order_quantity as "order quantity" ,b.sales as "sales" from superstore.orders_dimen as a
inner join superstore.market_fact as b on a.Ord_id=b.Ord_id;

#15##1
select customer_name as "customer name" from superstore.cust_dimen
where Customer_Name like '_r%';

#15##2
select customer_name as "customer name" from superstore.cust_dimen
where Customer_Name like '___d%';

#16
select a.cust_id, a.customer_name,a.region ,b.sales from superstore.cust_dimen as a
inner join superstore.market_fact as b on a.Cust_id=b.Cust_id
where sales between 1000 and 5000;

#17 Write a SQL query to find the 3rd highest sales.
select sales 
from superstore.market_fact 
order by sales desc
limit 2, 1;

#18