/* 
SET Operators - combine multiple querry results into a single result set
~ ensure the columns are same
a)Union						
b)Union All						
c)Except													  |
d)Intersect	

Rules:
1. All  SELECT clauses are used but ORDER BY is allowed only once, 
at the end of querry
2. Use same no of columns
3. Data types must be matching
4. Order of columns must be same (C.ID, C.NAME= E.ID,E.NAME)
5. First querry controls column names
- place aliases in the first querry only
6. Map correct columns
~Even tho your syntaxes are correct, ensure your content is correct/ quality
eg (firstName, lastName =! lastName, firstName) is bad data quality
*/

--1. UNION- return distinct rows, no duplicated

SELECT FirstName, LastName FROM Sales.Customers
UNION
SELECT FirstName, LastName FROM Sales.Employees;

--2. UNION ALL - retuen everything, even duplicates
-- Use when you wanna see duplicates when checking data quality,when your data doesn't have duplicates 
SELECT FirstName, LastName FROM Sales.Customers
UNION ALL
SELECT FirstName, LastName FROM Sales.Employees;

--3. EXCEPT/MINUS - return rows found only in the first querry
--Find employees who are not customers at same time
SELECT FirstName, LastName FROM Sales.Employees
EXCEPT
SELECT FirstName, LastName FROM Sales.Customers;

-- 4.INTERSECT - return only common rows
--Find employees who are also customers
SELECT FirstName, LastName FROM Sales.Employees
INTERSECT
SELECT FirstName, LastName FROM Sales.Customers;

/*
Use cases:
1. Combine similar info before analyzing data(UNION/UNION ALL)
- Combine all orders into one report without duplicates
- Best practice, list all columns(obj explorer, right click table, select top 1000 rows)
*/
SELECT
[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.Orders

UNION

SELECT 
[OrderID]
,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive;

-- Another best practice is listing the source of the data
SELECT
'Orders' AS SourceTable
,[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.Orders

UNION

SELECT 
'OrdersArchive' AS SourceTable
,[OrderID]
,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID; -- ID numbers retain asc order

/*
Use cases:
2. Data completeness check (EXCEPT operator)
- can be used to compare tables to detect dependancies btwn tables
- when moving data from database A to B, use except to ensure everything is moved thus empty result

*/