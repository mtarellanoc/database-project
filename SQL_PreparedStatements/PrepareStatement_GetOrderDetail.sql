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