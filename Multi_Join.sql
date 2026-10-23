/* Multiple table joins 
1. Using SalesDB, retrieve list of all orders along with related customer, product and employee details
*/
--Orders is the main/left table

SELECT 
	o.OrderID,
	o.Sales,
	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,
	P.Product,	
	p.Price,
	e.EmployeeID,
	e.FirstName AS EmployeeFirstName,
	e.LastName AS EmployeeLastName
FROM Sales.Orders AS o 
LEFT JOIN Sales.Customers AS c
ON o.CustomerID= c.CustomerID

LEFT JOIN Sales.Products AS p
ON o.ProductID=p.ProductID

LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID= e.EmployeeID



