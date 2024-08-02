-- ------------------------------------------------
delimiter //
create procedure CancelBooking(booking int)
begin
	delete from bookings
    where BookingID = booking;
    select concat("Booking ", booking, " cancelled") as "Confirmation";
end//
delimiter ;
-- ------------------------------------------------

call CancelBooking(9);

select * from bookings;
