Select * from [KMS sql Case Study]

------1. Which product category had the highest sales?
SELECT TOP 1
    product_category,
    SUM (sales) AS highest_sales
FROM 
    [KMS sql Case Study]
GROUP BY 
    product_category
ORDER BY 
    highest_sales DESC

----2. What are the Top 3 and Bottom 3 regions in terms of sales?

SELECT TOP 3
    region,
    SUM(sales) AS Top_sales
FROM 
    [KMS sql Case Study]
GROUP BY 
    region
ORDER BY 
    Top_sales DESC

SELECT TOP 3
    region,
    SUM(sales) AS Bottom_sales
FROM 
    [KMS sql Case Study]
GROUP BY 
    region
ORDER BY 
    Bottom_sales Asc

--- 3. What were the total sales of appliances in Ontario?
SELECT 
Product_Category,Customer_Segment, Order_Priority,
    SUM(Order_Quantity * Unit_Price) AS total_sales
FROM 
    [KMS sql Case Study]
WHERE 
    Product_Sub_Category = 'Appliances'
    AND province = 'Ontario' or Region = 'Ontario'
	Group by 
	Product_Category,Customer_Segment, Order_Priority
	order by total_sales desc

------ 4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
SELECT TOP 10
    customer_segment,
    customer_name,
    SUM(order_quantity * unit_price) AS buttom_customers
FROM 
     [KMS sql Case Study]
GROUP BY 
    Customer_Segment, customer_name
ORDER BY 
buttom_customers ASC

---5. KMS incurred the most shipping cost using which shipping method?

---SELECT TOP 1
SELECT TOP 5
  ship_mode,
    SUM(shipping_cost) AS total_shipping_cost
FROM 
   [KMS sql Case Study]
GROUP BY 
ship_mode
ORDER BY 
    total_shipping_cost DESC


----6. Who are the most valuable customers, and what products or services do they typically purchase?
SELECT 
    Customer_Name,Product_Category,
    SUM(Sales) AS Total_Revenue,
    STRING_AGG(Product_Name, ', ') AS Products_Purchased
FROM 
   [dbo].[KMS Sql Case Study]
GROUP BY 
    Customer_Name, Product_Category
ORDER BY 
    Total_Revenue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;



---7. Which small business customer had the highest sales?

	--SELECT TOP 1
	Select 
    Customer_Name,Product_Sub_Category,Region,
    SUM(Sales) AS Total_Sales
FROM 
   [dbo].[KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Small Business'
GROUP BY 
    Customer_Name,Product_Sub_Category, Region
ORDER BY 
    Total_Sales DESC
	OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


------JOINING THE KMS AND ORDER STATUS TABLE
	select
	order_status.order_id,
	order_status.Status,
---[KMS Sql Case Study].row_id,
[dbo].[KMS Sql Case Study].order_id,
[dbo].[KMS Sql Case Study].customer_name,
[dbo].[KMS Sql Case Study].customer_segment
from[dbo].[KMS Sql Case Study]
join order_status
on order_status.order_id=[dbo].[KMS Sql Case Study].order_id 


----8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 5
    Customer_Name,Province,
    COUNT([dbo].[KMS Sql Case Study].Order_id) AS Total_Orders
FROM 
  [dbo].[KMS Sql Case Study],Order_Status
WHERE 
    Customer_Segment = 'Corporate'
    AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY 
    Customer_Name, Province
ORDER BY 
    Total_Orders DESC;

---9. Which consumer customer was the most profitable one?
	SELECT 
    Customer_Name,
    SUM(Profit) AS Total_Profit
FROM 
 [dbo].[KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Profit DESC;

-----10. Which customer returned items, and what segment do they belong to?
SELECT DISTINCT 
    Customer_Name, 
    Customer_Segment 
FROM 
   [dbo].[KMS Sql Case Study],Order_Status
WHERE 
    Status = 'Returned'

/*------11. If the delivery truck is the most economical but the slowest, shipping method and 
Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer*/

SELECT 
    Order_Priority,
    Ship_Mode,
    COUNT(*) AS Order_Count,
    sum(Shipping_Cost) AS Sum_Shipping_Cost
FROM 
    [dbo].[KMS Sql Case Study]
GROUP BY 
    Order_Priority, Ship_Mode
ORDER BY 
    Order_Priority, Sum_Shipping_Cost DESC

------------                         ------------------
	select * from [KMS sql Case Study]
	alter table [KMS sql Case Study]
	alter column Sales decimal (10,3)

	alter table [KMS sql Case Study]
	alter column Profit decimal (10,3)

		alter table [KMS sql Case Study]
	alter column Unit_Price decimal (10,3)

		alter table [KMS sql Case Study]
	alter column Shipping_Cost decimal (10,3)

		alter table [KMS sql Case Study]
	alter column Product_Base_Margin decimal (10,3)