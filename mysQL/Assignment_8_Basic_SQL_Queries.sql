-- Assignment 8: Basic SQL Queries and Aggregate Functions
-- Online Food Delivery System | Alliance University BCA (AI/ML) | Vimal Kumar Rao
-- Run after Complete_Online_Food_Delivery_Setup.sql (Assignments 5-7). Execute each SELECT separately.
USE online_food_delivery;

-- Q1: WHERE: delivered orders
SELECT Order_ID, Order_Date, Order_Status
FROM   Orders
WHERE  Order_Status = 'Delivered'
ORDER BY Order_Date DESC;

-- Q2: ORDER BY and LIMIT: most expensive menu items
SELECT Item_ID, Item_Name, Price
FROM   Menu_Item
ORDER BY Price DESC, Item_Name ASC
LIMIT 5;

-- Q3: GROUP BY: orders per restaurant
SELECT r.Restaurant_Name,
       COUNT(o.Order_ID) AS Total_Orders
FROM   Restaurant r
LEFT JOIN Orders o ON o.Restaurant_ID = r.Restaurant_ID
GROUP BY r.Restaurant_ID, r.Restaurant_Name
ORDER BY Total_Orders DESC, r.Restaurant_Name ASC;

-- Q4: HAVING: repeat customers
SELECT c.Name, COUNT(o.Order_ID) AS Order_Count
FROM   Customer c
JOIN   Orders o ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2
ORDER BY Order_Count DESC, c.Name ASC;

-- Q5: Aggregate functions: COUNT, SUM, AVG, MIN, MAX
SELECT COUNT(*)                          AS Item_Lines,
       SUM(oi.Quantity * oi.Unit_Price)   AS Line_Value_Total,
       ROUND(AVG(oi.Unit_Price), 2)       AS Average_Unit_Price,
       MIN(oi.Unit_Price)                 AS Lowest_Unit_Price,
       MAX(oi.Unit_Price)                 AS Highest_Unit_Price
FROM   Order_Item oi
JOIN   Orders o ON o.Order_ID = oi.Order_ID
WHERE  o.Order_Status <> 'Cancelled';

-- Q6: GROUP BY and SUM: subtotal by order status
SELECT o.Order_Status,
       COUNT(DISTINCT o.Order_ID)        AS Orders,
       SUM(oi.Quantity * oi.Unit_Price)  AS Line_Subtotal
FROM   Orders o
JOIN   Order_Item oi ON oi.Order_ID = o.Order_ID
GROUP BY o.Order_Status
ORDER BY Orders DESC, o.Order_Status ASC;

-- Q7: GROUP BY date: daily subtotal
SELECT DATE(o.Order_Date)              AS Order_Day,
       COUNT(DISTINCT o.Order_ID)        AS Orders,
       SUM(oi.Quantity * oi.Unit_Price)  AS Line_Subtotal
FROM   Orders o
JOIN   Order_Item oi ON oi.Order_ID = o.Order_ID
WHERE  o.Order_Status <> 'Cancelled'
GROUP BY DATE(o.Order_Date)
ORDER BY Order_Day ASC;

-- Q8: GROUP BY: payment status distribution
SELECT Payment_Status, COUNT(*) AS Payment_Records
FROM   Payment
GROUP BY Payment_Status
ORDER BY Payment_Records DESC, Payment_Status ASC;

-- Q9: BONUS: HAVING on an aggregate, orders above Rs 400
SELECT o.Order_ID,
       SUM(oi.Quantity * oi.Unit_Price) AS Order_Total
FROM   Orders o
JOIN   Order_Item oi ON oi.Order_ID = o.Order_ID
WHERE  o.Order_Status <> 'Cancelled'
GROUP BY o.Order_ID
HAVING SUM(oi.Quantity * oi.Unit_Price) > 400
ORDER BY Order_Total DESC;

-- Q10: BONUS: LIKE pattern search
SELECT Item_ID, Item_Name, Price
FROM   Menu_Item
WHERE  Item_Name LIKE '%Paneer%'
ORDER BY Price ASC;

