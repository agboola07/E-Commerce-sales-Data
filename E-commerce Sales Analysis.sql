select * from list_of_orders;
select * from order_details;
select * from sales_target;

-- What is the average order value?
SELECT round(AVG(amount)) avg_order_value
FROM order_details;


-- What is the most popular category ordered?
SELECT category, COUNT(*) AS order_frequency
FROM order_details
GROUP BY category
ORDER BY order_frequency DESC
LIMIT 1;

-- What is the most popular sub-category ordered?
SELECT Sub_Category, COUNT(*) AS order_frequency
FROM order_details
GROUP BY sub_category
ORDER BY order_frequency DESC
LIMIT 1;

-- Total amount of all orders: 
SELECT SUM(amount) 
FROM order_details;

-- Product category with highest revenue
 SELECT category, SUM(amount*quantity) 
 FROM order_details 
 GROUP BY category 
 ORDER BY SUM(amount) DESC LIMIT 1;
 
-- Which subcategory has the lowest or highest quantity ordered
-- Lowest Quantity Ordered
SELECT sub_category, SUM(quantity) total_quantity
FROM order_details
GROUP BY sub_category
ORDER BY total_quantity ASC
LIMIT 1;

-- Highest Quantity Ordered
SELECT sub_category, SUM(quantity) total_quantity
FROM order_details
GROUP BY sub_category
ORDER BY total_quantity DESC
LIMIT 1;

-- What is the average profit by order in each category
SELECT Category, round(AVG(profit)) average_profit
FROM order_details
group by Category;

-- Which product sub category has the highest profit margin
SELECT sub_category, SUM(profit) / SUM(amount) profit_margin
FROM order_details
GROUP BY sub_category
ORDER BY profit_margin DESC LIMIT 1;

-- Customer with most orders
 SELECT customername, COUNT(*) 
 FROM list_of_orders 
 GROUP BY customername 
 ORDER BY COUNT(*) DESC LIMIT 1;

-- Top  10 Average orders per customer
SELECT customername, COUNT(*) order_count
 FROM list_of_orders
 GROUP BY customername
 order by order_count desc limit 10;
 
 -- How many orders were made in each month/year?
 SELECT EXTRACT(MONTH FROM order_date) AS order_month, COUNT(*) AS num_orders
FROM list_of_orders
GROUP BY  order_month
ORDER BY  order_month;


-- Average Order Value by State
SELECT state, order_id
FROM list_of_orders
GROUP BY state
ORDER BY Order_ID DESC;

-- Product Categories with Highest Profit Margin
SELECT Category, SUM(Profit) / SUM(Amount) AS profit_margin
FROM Order_Details
GROUP BY Category
ORDER BY profit_margin DESC;

-- Top-Performing Customers by State
SELECT lo.State, lo.CustomerName, SUM(od.Amount*quantity) AS total_sales
FROM List_of_Orders lo
JOIN Order_Details od ON lo.Order_ID = od.Order_ID
GROUP BY lo.State, lo.CustomerName
ORDER BY total_sales DESC limit 10;

-- Customer Sales by State
SELECT lo.State, SUM(od.Amount*quantity) AS total_sales
FROM List_of_Orders lo
JOIN Order_Details od ON lo.Order_ID = od.Order_ID
GROUP BY lo.State
ORDER BY total_sales DESC;

-- Monthly Sales Trend
SELECT EXTRACT(MONTH FROM lo.Order_Date) AS order_month, SUM(od.Amount) AS total_sales
FROM List_of_Orders lo
JOIN Order_Details od ON lo.Order_ID = od.Order_ID
GROUP BY order_month
ORDER BY order_month;

-- Sales Target Analysis ;Sales Performance vs. Target by Category
SELECT st.Category, SUM(od.Amount) AS actual_sales, st.Target AS target_sales
FROM Order_Details od
JOIN Sales_Target st ON od.Category = st.Category
GROUP BY st.Category, st.Target
ORDER BY st.Category;

-- Which cities have the highest sales revenue?
SELECT lo.City, SUM(od.Amount) total_sales
FROM List_of_Orders lo
JOIN Order_Details od ON lo.Order_ID = od.Order_ID
GROUP BY lo.City
order by total_sales desc;










