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