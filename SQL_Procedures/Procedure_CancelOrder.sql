delimiter //
create procedure CancelOrder(id int) 
	begin
        delete from orders where OrderID = id;
        select concat("Order", id, " is cancelled") as "Confirmation";  -- Prints confirmation
	end//
delimiter ;

-- Calling Procedure ----------
call CancelOrder(1);