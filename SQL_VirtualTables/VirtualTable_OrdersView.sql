create view OrdersView as
	select 
		OrderID,
		Quantity,
		TotalCost
	from orders
	where orders.Quantity >2;
    
-- Calling Virtual Table ------
select * from OrdersVIew;