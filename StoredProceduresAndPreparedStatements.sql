-- First Procedure --------------------------------------------
create procedure GetMaxQuantity()
	select 
		max(Quantity) as MaxQuantity
	from 
		orders
	;
-- Calling Procedure------------
call GetMaxQuantity();

-- Second Procedure ------------------------------------------

delimiter //
create procedure CancelOrder(id int) 
	begin
        delete from orders where OrderID = id;
        select concat("Order", id, " is cancelled") as "Confirmation";  -- Prints confirmation
	end//
delimiter ;

-- Calling Procedure ----------
call CancelOrder(1);

-- First Prepared Statement ----------------------------------
prepare GetOrderDetail 
from 
	' select 
		OrderID,
        Quantity,
        TotalCost
	from 
		orders 
	where CustomerID = ?';
    
-- Calling Statement --------------------
set @id = 10;
execute GetOrderDetail using @id;


