USE littlelemondb;

# Task 1
INSERT INTO Bookings (BookingDate, TableNo, CustomerID)
VALUES 	("2022-10-10", 5, 1),
		("2022-11-12", 3, 3),
		("2022-10-11", 2, 2),
		("2022-10-13", 2, 1);
SELECT * FROM bookings;

# Task 2
DROP PROCEDURE IF EXISTS CheckBooking;
CREATE PROCEDURE CheckBooking(BookingDate DATE,Table_Number INT)
	SELECT CASE
    WHEN BookingDate IN (SELECT bookings.BookingDate FROM bookings WHERE TableNo = Table_Number) THEN concat("Table ", Table_Number, " is already booked")
    ELSE concat("Table ", Table_Number, " is not booked")
    END as 'IS Booked?';
CALL CheckBooking("2022-11-12", 3);

# Task 3
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(B_Date DATE,TableNumber INT)
BEGIN
START TRANSACTION;
INSERT INTO bookings (bookings.BookingDate, bookings.TableNo) VALUES (B_Date, TableNumber);
IF B_Date IN (SELECT bookings.BookingDate FROM bookings WHERE TableNo = TableNumber) THEN
	SELECT concat('Table ',TableNumber,'is already booked - booking cancelled');
	ROLLBACK;
ELSE
	COMMIT;
END IF;
END//
DELIMITER ;

CALL AddValidBooking("2022-12-17", 6);

