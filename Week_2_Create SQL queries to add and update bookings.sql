use littlelemondb;

# Task 1
DROP PROCEDURE IF EXISTS AddBooking; 
DELIMITER // 
CREATE PROCEDURE AddBooking(IN b_id INT, IN Customer_ID INT, IN TableNumber INT, IN b_date DATE)
BEGIN 
INSERT INTO bookings (BookingID, CustomerID, TableNo, BookingDate) VALUES (b_id, Customer_ID, TableNumber, b_date); 
SELECT "New booking added" AS "Confirmation";
END//
DELIMITER ; 
CALL AddBooking(9, 3, 4, "2022-12-30");

# Task 2
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER // 
CREATE PROCEDURE UpdateBooking(IN b_id INT, IN b_date DATE) 
BEGIN
UPDATE bookings SET bookings.BookingDate = b_date WHERE bookings.BookingID = b_id; 
SELECT CONCAT("Booking ", b_id, " updated") AS "Confirmation"; 
END//
DELIMITER ; 
CALL UpdateBooking(9, "2022-12-17");

# Task 3
DROP PROCEDURE IF EXISTS CancelBooking; 
DELIMITER //
CREATE PROCEDURE CancelBooking(IN b_id INT) 
BEGIN 
DELETE FROM bookings WHERE BookingID = b_id; SELECT CONCAT("Booking ", b_id, " cancelled") AS "Confirmation"; 
END// 
DELIMITER ; 
CALL CancelBooking(9);