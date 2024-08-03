-- ------------------------------------------------
delimiter //
create procedure AddBooking(booking int, customer int, tbl int, slot datetime)
begin
	insert into bookings (BookingID, CustomerID, TableNo, BookingSlot, EmployeeID)
    values (booking, customer, tbl, slot, 1);
end//
delimiter ;
-- ------------------------------------------------

call AddBooking(9, 3, 4, "2022-12-30");

