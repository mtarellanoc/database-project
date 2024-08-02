create view HighQuantityView as
	select 
		menuitems.Name as "MenuName"
	from menuitems
	where (
		menuitems.itemID = any (
			select ItemID from orders where Quantity > 2
		)
	);
    
-- Calling Virtual Table ------
select * from highQuantityview;