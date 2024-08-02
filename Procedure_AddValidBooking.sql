-- ---------------------------------------------------------------
delimiter //
create procedure AddValidBooking(date datetime, tbl int)
begin
	start transaction;
    if (select BookingID from bookings where (BookingSlot = date and TableNo = tbl)) is Null then -- condition
        insert into bookings(CustomerID, TableNo, bookingSlot, EmployeeID) values (1, tbl, date, 1);
        commit;
        select concat("Table ", tbl, " is now reserved for ", month(date),"-",day(date),"-",year(date)) as "Booking Status";
	else
		rollback;
        select concat("Table ",  tbl, " is already booked - booking cancelled") as "Booking Status";
	end if;
end//
delimiter ;
-- ---------------------------------------------------------------

select * from bookings;

call AddValidBooking("2022-12-23", 1);