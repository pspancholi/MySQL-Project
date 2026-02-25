use mini_project;

#--------------------------------------------------------------------------
#Level 1 Basics
#--------------------------------------------------------------------------

#1. Retrieve customer names and emails for email marketing
select name,email from customers;

#2. View complete product catalog with all available details
select * from products;

#3. List all unique product categories
select distinct category from products;

#4. Show all products priced above ₹1,000
select * from products where price>1000;

#5. Display products within a mid-range price bracket (₹2,000 to ₹5,000)
select * from products where price>2000 and price<5000;

#6. Fetch data for specific customer IDs (e.g., from loyalty program list)
select * from customers where customer_id in(6,7,8,9,10);

#7. Identify customers whose names start with the letter ‘A’
select * from customers where name like 'A%';

#8. List electronics products priced under ₹3,000
select * from products where category="electronics" and price<3000;

#9. Display product names and prices in descending order of price
select name,price from products order by price desc;

#10. Display product names and prices, sorted by price and then by name
select name,price from products order by price desc,name asc;



#---------------------------------------------------------------------------------------------
#Level 2: Filtering and Formatting
#---------------------------------------------------------------------------------------------

#1. Retrieve orders where customer information is missing (possibly due to data migration or deletion)
select * from orders where customer_id is null;

#2. Display customer names and emails using column aliases for frontend readability
select name as cusotmer_name,email as emails from customers;

#3. Calculate total value per item ordered by multiplying quantity and item price
select name, price*stock_quantity as total from products;

#4. Combine customer name and phone number in a single column
select concat(name,'--',phone) as Name_And_Phone from customers;

#5. Extract only the date part from order timestamps for date-wise reporting
select date(order_date) from orders;

#6. List products that do not have any stock left
select * from products where stock_quantity=0;




#---------------------------------------------------------------------------------------------
#Level 3: Aggregations
#---------------------------------------------------------------------------------------------

#1. Count the total number of orders placed
select count(order_id) as count_orders from orders;

#2. Calculate the total revenue collected from all orders
select sum(total_amount) as Total_Revenue from orders;

#3. Calculate the average order value
select avg(total_amount) as Average_Order_Value from orders;

#4. Count the number of customers who have placed at least one order
select count(distinct customer_id) as Customers from orders;

#5. Find the number of orders placed by each customer
select customer_id,count(order_id) as Number_Of_Orders from orders group by customer_id;

#6. Find total sales amount made by each customer
select customer_id,sum(total_amount) as Total_Amount from orders group by customer_id;

#7. List the number of products sold per category
select p.category, count(p.category)
from order_items oi
left join products p
on oi.product_id = p.product_id
group by p.category;

#8. Find the average item price per category
select category,avg(price) as Average_Price from products group by category;

#9. Show number of orders placed per day
select date(order_date),count(order_id) from orders group by date(order_date);

#10. List total payments received per payment method
select method,sum(amount_paid) as Total_Amount from payments group by method;



#---------------------------------------------------------------------------------------------
#Level 4: Multi-Table Queries
#---------------------------------------------------------------------------------------------

#1. Retrieve order details along with the customer name
select c.name,o.*
from orders o
left join customers c
on o.customer_id=c.customer_id;

#2. Get list of products that have been sold
select p.name 
from products p
inner join order_items oi
on p.product_id=oi.product_id group by p.name;

#3. List all orders with their payment method (INNER JOIN)
select distinct oi.order_id,pmt.method
from order_items oi
inner join payments pmt
on oi.order_id=pmt.order_id;

#4. Get list of customers and their orders (LEFT JOIN)
select c.name, o.order_id
from customers c
left join orders o
on c.customer_id=o.customer_id;

#5. List all products along with order item quantity (LEFT JOIN)
select p.name, sum(oi.quantity) as Ordered_Quantity
from products p
left join order_items oi
on p.product_id= oi.product_id group by p.name;

#6. List all payments including those with no matching orders (RIGHT JOIN)
select p.*,o.order_id
from orders o
right join payments p
on o.order_id=p.order_id;


#7. Combine data from three tables: customer, order, and payment
select c.*,o.*,p.*
from orders o
left join customers c
on o.customer_id= c.customer_id
left join payments p
on o.order_id=p.order_id;



#------------------------------------------------------------------------------------------
#Level 5: Subqueries (Inner Queries)
#------------------------------------------------------------------------------------------

#1. List all products priced above the average product price
select * from products where price > (select avg(price) from products);

#2. Find customers who have placed at least one order
select distinct customer_id from orders;

#3. Show orders whose total amount is above the average for that customer
select * 
from orders o 
where total_amount > 
(select avg(total_amount) from orders 
where customer_id=o.customer_id);

#4. Display customers who haven’t placed any orders
select name from customers where customer_id not in (select customer_id from orders);

#5. Show products that were never ordered
select name as Not_Ordered_Product from products where product_id not in (select product_id from order_items);

#6. Show highest value order per customer
select customer_id, max(total_amount) from orders group by customer_id;

#7. Highest Order Per Customer (Including Names)
select c.name,max(o.total_amount) as Highest_Order_Amount
from customers c
left join orders o
on c.customer_id=o.customer_id group by c.name;


#---------------------------------------------------------------------------------------------
#Level 6: Set Operations
#---------------------------------------------------------------------------------------------

#1. List all customers who have either placed an order or written a product review
select customer_id from orders
union
select customer_id from product_reviews;

#2. List all customers who have placed an order as well as reviewed a product
select distinct customer_id from orders where customer_id
in (select customer_id from product_reviews);