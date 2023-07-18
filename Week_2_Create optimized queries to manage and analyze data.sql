use LittleLemonDB;

# Task 1
DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity() SELECT max(Quantity) as 'Max Quantity in Order'FROM Orders;
call GetMaxQuantity();

# Task 2
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

# Task 3
DROP PROCEDURE IF EXISTS CancelOrder;
delimiter //
CREATE PROCEDURE CancelOrder(Orderid INT) 
BEGIN
DELETE FROM Orders WHERE OrderID=Orderid;
SELECT concat("Order ", OrderID, " is cancelled") as Confirmation;
END//
delimiter ;

call CancelOrder(5)