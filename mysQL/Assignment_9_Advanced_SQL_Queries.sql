-- Assignment 9: Advanced SQL Queries Using Joins and Subqueries
-- Online Food Delivery System | Alliance University BCA (AI/ML) | Vimal Kumar Rao
-- Run after Complete_Online_Food_Delivery_Setup.sql (Assignments 5-7). Execute each SELECT separately.
USE online_food_delivery;

-- Q1: Multi-table order overview
SELECT o.Order_ID, c.Name AS Customer, r.Restaurant_Name,
       o.Order_Status, p.Payment_Method, p.Payment_Status,
       COALESCE(d.Name, 'Not assigned') AS Delivery_Partner,
       o.Order_Date
FROM   Orders o
JOIN   Customer c ON c.Customer_ID   = o.Customer_ID
JOIN   Restaurant r ON r.Restaurant_ID = o.Restaurant_ID
LEFT JOIN Delivery_Partner d ON d.Delivery_ID = o.Delivery_ID
LEFT JOIN Payment p ON p.Order_ID = o.Order_ID
ORDER BY o.Order_Date DESC, o.Order_ID DESC;

-- Q2: Order-line detail
SELECT o.Order_ID, c.Name AS Customer, r.Restaurant_Name,
       mi.Item_Name, oi.Quantity, oi.Unit_Price,
       (oi.Quantity * oi.Unit_Price) AS Line_Subtotal
FROM   Orders o
JOIN   Customer c    ON c.Customer_ID   = o.Customer_ID
JOIN   Restaurant r  ON r.Restaurant_ID = o.Restaurant_ID
JOIN   Order_Item oi ON oi.Order_ID     = o.Order_ID
JOIN   Menu_Item mi  ON mi.Item_ID      = oi.Item_ID
ORDER BY o.Order_ID, mi.Item_Name;

-- Q3: Top restaurants by paid line value
SELECT r.Restaurant_Name,
       SUM(oi.Quantity * oi.Unit_Price) AS Paid_Line_Value
FROM   Restaurant r
JOIN   Orders o     ON o.Restaurant_ID = r.Restaurant_ID
JOIN   Order_Item oi ON oi.Order_ID    = o.Order_ID
JOIN   Payment p    ON p.Order_ID = o.Order_ID
                   AND p.Payment_Status = 'Paid'
WHERE  o.Order_Status <> 'Cancelled'
GROUP BY r.Restaurant_ID, r.Restaurant_Name
ORDER BY Paid_Line_Value DESC, r.Restaurant_Name ASC
LIMIT 3;

-- Q4: Above-average customer paid spending
SELECT c.Customer_ID, c.Name,
       SUM(oi.Quantity * oi.Unit_Price) AS Paid_Spend
FROM   Customer c
JOIN   Orders o ON o.Customer_ID = c.Customer_ID
JOIN   Payment p ON p.Order_ID = o.Order_ID AND p.Payment_Status = 'Paid'
JOIN   Order_Item oi ON oi.Order_ID = o.Order_ID
GROUP BY c.Customer_ID, c.Name
HAVING SUM(oi.Quantity * oi.Unit_Price) > (
    SELECT AVG(customer_spending.Paid_Spend)
    FROM (
        SELECT o2.Customer_ID,
               SUM(oi2.Quantity * oi2.Unit_Price) AS Paid_Spend
        FROM   Orders o2
        JOIN   Payment p2 ON p2.Order_ID = o2.Order_ID
                         AND p2.Payment_Status = 'Paid'
        JOIN   Order_Item oi2 ON oi2.Order_ID = o2.Order_ID
        GROUP BY o2.Customer_ID
    ) AS customer_spending
)
ORDER BY Paid_Spend DESC;

-- Q5: Customers with no delivered orders
SELECT c.Customer_ID, c.Name
FROM   Customer c
WHERE  NOT EXISTS (
    SELECT 1
    FROM   Orders o
    WHERE  o.Customer_ID  = c.Customer_ID
      AND  o.Order_Status = 'Delivered'
)
ORDER BY c.Customer_ID;

-- Q6: Pending / failed payment follow-up
SELECT o.Order_ID, c.Name AS Customer, r.Restaurant_Name,
       o.Order_Status, p.Payment_Method, p.Payment_Status,
       o.Order_Date
FROM   Orders o
JOIN   Customer c   ON c.Customer_ID   = o.Customer_ID
JOIN   Restaurant r ON r.Restaurant_ID = o.Restaurant_ID
JOIN   Payment p    ON p.Order_ID      = o.Order_ID
WHERE  p.Payment_Status IN ('Pending', 'Failed')
ORDER BY o.Order_Date DESC;

-- Q7: Latest order per customer
SELECT c.Customer_ID, c.Name,
       o.Order_ID, o.Order_Date, o.Order_Status
FROM   Customer c
JOIN   Orders o ON o.Customer_ID = c.Customer_ID
WHERE  o.Order_Date = (
    SELECT MAX(o2.Order_Date)
    FROM   Orders o2
    WHERE  o2.Customer_ID = c.Customer_ID   -- re-evaluated per customer
)
ORDER BY c.Customer_ID;

-- Q8: Menu size and average menu price
SELECT r.Restaurant_Name,
       (SELECT COUNT(*)
        FROM   Menu_Item mi
        WHERE  mi.Restaurant_ID = r.Restaurant_ID)           AS Menu_Items,
       (SELECT ROUND(AVG(mi.Price), 2)
        FROM   Menu_Item mi
        WHERE  mi.Restaurant_ID = r.Restaurant_ID)           AS Average_Menu_Price
FROM   Restaurant r
ORDER BY Menu_Items DESC, r.Restaurant_Name;

-- Q9: BONUS: average order value per restaurant
SELECT r.Restaurant_Name,
       COUNT(*)                         AS Orders,
       ROUND(AVG(ot.Order_Total), 2)    AS Avg_Order_Value
FROM   Restaurant r
JOIN   Orders o ON o.Restaurant_ID = r.Restaurant_ID
JOIN  (SELECT Order_ID, SUM(Quantity * Unit_Price) AS Order_Total
       FROM   Order_Item
       GROUP BY Order_ID) AS ot ON ot.Order_ID = o.Order_ID
WHERE  o.Order_Status <> 'Cancelled'
GROUP BY r.Restaurant_ID, r.Restaurant_Name
ORDER BY Avg_Order_Value DESC;

-- Q10: BONUS: delivery partner workload
SELECT d.Name, d.Status,
       COUNT(o.Order_ID) AS Assigned_Orders
FROM   Delivery_Partner d
LEFT JOIN Orders o ON o.Delivery_ID = d.Delivery_ID
GROUP BY d.Delivery_ID, d.Name, d.Status
ORDER BY Assigned_Orders DESC, d.Name;

-- Q11: BONUS: best-selling items by quantity
SELECT mi.Item_Name, r.Restaurant_Name,
       SUM(oi.Quantity) AS Units_Sold
FROM   Menu_Item mi
JOIN   Restaurant r  ON r.Restaurant_ID = mi.Restaurant_ID
JOIN   Order_Item oi ON oi.Item_ID      = mi.Item_ID
JOIN   Orders o      ON o.Order_ID      = oi.Order_ID
WHERE  o.Order_Status <> 'Cancelled'
GROUP BY mi.Item_ID, mi.Item_Name, r.Restaurant_Name
ORDER BY Units_Sold DESC, mi.Item_Name
LIMIT 5;

-- Q12: BONUS: items priced above their restaurant's average
SELECT r.Restaurant_Name, mi.Item_Name, mi.Price
FROM   Menu_Item mi
JOIN   Restaurant r ON r.Restaurant_ID = mi.Restaurant_ID
WHERE  mi.Price > (
    SELECT AVG(m2.Price)
    FROM   Menu_Item m2
    WHERE  m2.Restaurant_ID = mi.Restaurant_ID
)
ORDER BY r.Restaurant_Name, mi.Price DESC;

-- Q13: BONUS: customers who ordered from Urban Pizza Co.
SELECT c.Customer_ID, c.Name
FROM   Customer c
WHERE  c.Customer_ID IN (
    SELECT o.Customer_ID
    FROM   Orders o
    JOIN   Restaurant r ON r.Restaurant_ID = o.Restaurant_ID
    WHERE  r.Restaurant_Name = 'Urban Pizza Co.'
)
ORDER BY c.Customer_ID;

-- Q14: BONUS: revenue by delivery city
SELECT a.City,
       COUNT(DISTINCT o.Order_ID)        AS Orders,
       SUM(oi.Quantity * oi.Unit_Price)  AS Line_Value
FROM   Orders o
JOIN   Address a     ON a.Address_ID = o.Address_ID
JOIN   Order_Item oi ON oi.Order_ID  = o.Order_ID
WHERE  o.Order_Status <> 'Cancelled'
GROUP BY a.City
ORDER BY Line_Value DESC;

-- Q15: BONUS: integrity audit, order lines from the wrong restaurant
SELECT o.Order_ID, o.Restaurant_ID AS Order_Restaurant,
       mi.Item_ID, mi.Restaurant_ID  AS Item_Restaurant
FROM   Orders o
JOIN   Order_Item oi ON oi.Order_ID = o.Order_ID
JOIN   Menu_Item mi  ON mi.Item_ID  = oi.Item_ID
WHERE  mi.Restaurant_ID <> o.Restaurant_ID;

