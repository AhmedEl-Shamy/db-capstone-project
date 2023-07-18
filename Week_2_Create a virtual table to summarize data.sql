use littlelemondb;

# Task 1 Create OrdersView
CREATE VIEW OrdersView 
As SELECT orders.OrderID, orders.Quantity, orders.TotalCost
From orders WHERE orders.Quantity>2;

# Task 2
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.TotalCost, m.Name as MenuName, mi.CourseName, mi.DesertName
FROM customers as c INNER JOIN orders as o on c.CustomerID = o.CustomerID
INNER JOIN menus as m on o.MenuID = m.MenuID
INNER JOIN menu_has_menuitems as mhi on m.MenuID = mhi.MenuID
INNER JOIN menuitems as mi on mhi.MenuItemID = mi.MenuItemID
where o.TotalCost>150
ORDER BY o.TotalCost;

# Task 3
SELECT *
FROM menuitems as mi INNER JOIN menu_has_menuitems mhm on mi.MenuItemID = mhm.MenuItemID
INNER JOIN menus as m on m.MenuID = mhm.MenuID
WHERE m.MenuID = ANY (SELECT MenuID FROM Orders WHERE Quantity>2);