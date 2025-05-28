CREATE DATABASE COMPANY;
SELECT * FROM sales;

#1:find all orders shipped via 'economy' mode with a total amount greaterthan 25000
SELECT *FROM sales
WHERE ship_mode = 'economy'
AND total_amount > 25000;

#2:Retrive all sales data for 'technology' category in 'ireland' made aftter 2020-01-01
SELECT * FROM sales
WHERE Category = 'technology' AND country ='ireland'
AND order_date > '2020-01-01';

#3:list the top 10 most profitable sales transactions in decscendimg order.
SELECT * FROM sales
ORDER BY unit_profit DESC
LIMIT 10,20;         #--------SKIP 10 RECORDS,SHOWING NEXT 20 RECORDS

#4:find the all customers name starts with 'j' and ends with 'n'
SELECT order_Id ,customer_name FROM sales
WHERE Customer_Name LIKE 'j%n';

#5:retrive all product names that contain 'acco' anywhere in the name.
SELECT*FROM sales
WHERE Product_Name LIKE '%acco%';

#6:get the top 5 cities with the highest total sales amount.
SELECT city, SUM(total_amount) AS total_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 5;
--
#7: display the secound set of 10 records for customer_name and total_amount in dessending order
SELECT customer_name ,total_amount 
from sales 
ORDER BY total_amount DESC
LIMIT 10,20;
--
#8:find the total revenue,average unit cost,and total number of orders.
SELECT SUM(Total_Amount) AS `total_revenue`, 
AVG(unit_cost) AS `average unit cost`,
COUNT(order_id) AS `total number of orders`
FROM sales;
--
#9:count unique no'of regions
SELECT COUNT(distinct(region)) as uniq_reg
FROM sales;
--
#10:find no'of orders placed by each customer
SELECT customer_name,COUNT(order_id) AS order_count
from sales
group by Customer_Name
order by order_count DESC;
 --
 #11:rank 5 products based on the total sales using rank().
 select product_name, sum(total_amount) as total_sales,
 rank() over (order by sum(total_amount)desc) as sales_rank
 from sales
 group by Product_Name
 limit 5;

