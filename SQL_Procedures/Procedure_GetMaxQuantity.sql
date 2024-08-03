create procedure GetMaxQuantity()
	select 
		max(Quantity) as MaxQuantity
	from 
		orders
	;
-- Calling Procedure------------
call GetMaxQuantity();