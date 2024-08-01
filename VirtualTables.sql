-- First virtual Table--------------------------------------------
create view OrdersView as
	select 
		OrderID,
		Quantity,
		TotalCost
	from orders
	where orders.Quantity >2;
    
-- Calling Virtual Table ------
select * from OrdersVIew;
    
-- Second Virtual Table--------------------------------------------
 create view HighCostView as
	select 
		customers.CustomerID,
		customers.FullName,
		orders.OrderID,
		orders.TotalCost,
		menuitems.Name,
		menuitems.Cuisine
	from
		orders
	inner join menuitems on 
		menuitems.ItemID = orders.ItemID
	inner join customers on
		customers.CustomerID = orders.CustomerID
	where orders.TotalCost >150;
    
-- Calling Virtual Table ------
select * from highcostview;

-- Third Virtual Table------------------------------------------------
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
    

	
    