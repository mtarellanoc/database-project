-- Populating tables to run test of procedure---------------------
-- ---------------------------------------------------------------
start transaction;

insert IGNORE into customers (CustomerID, FullName, Email, PhoneNo)
	values 
		(1, "Mariano Arellano", "123@gmail.com", "123-345-6789" ),
        (2, "Mariano Tovias", "213@gmail.com", "213-345-6789" ),
        (3, "Tovias Arellano", "321@gmail.com", "321-345-6789" );
        
insert Ignore into employees (EmployeeID, FullName, Role, Salary)
values
	(1, "Arellano", "Manager", 120000.00);
		

insert ignore into Bookings (BookingID, CustomerID, TableNo, BookingSlot, EmployeeID)
values 
(1, 1, 5, "2022-10-10", 1),
(2, 3, 3, "2022-11-12", 1),
(3, 2, 2, "2022-10-11", 1),
(4, 1, 2, "2022-10-13", 1);
	
commit;  -- uncomment to commit code to database 
-- ROLLBACK;  -- uncomment if error in code
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------

-- Creating a Procedure called CheckBooking to check whether a table in the restaurant is already booked.
delimiter //
create procedure CheckBooking(slot datetime,tbl int)
begin
	select 
	case
		when (BookingSlot = slot and TableNo = tbl) then concat("Table ", tbl, " is already booked")
		else concat("Table", tbl, " is available")
	end as "Booking Status"
	from Bookings
	where (BookingSlot = slot and TableNo  = tbl);
end//
delimiter ;

call CheckBooking("2022-10-10 00:00:00", 5);




