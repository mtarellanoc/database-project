-- ------------------------------------------------
delimiter //
create procedure UpdateBooking(booking int, slot datetime)
begin
	update bookings
    set BookingSlot = slot
    where BookingID = booking;
    select concat("Booking ", booking, " updated") as "Confirmation";
end//
delimiter ;
-- ------------------------------------------------

call UpdateBooking(9,  "2022-10-01");
