/* Comnine tables basics :rows or columns
__________________________________________________________________________
1. Rows(SET operators)			|	2. Columns side by side(Joins)		  |
__________________________________________________________________________|
-  need same no of columns		|	- Key column						  |
a)Union							|	a)Inner	*							  |						
b)Union All						|	b)Full	*							  |
c)Except						|	c)Left	*							  |
d)Intersect						|	d)Right								  |
__________________________________________________________________________|	

1. Joins
why?
 - Recombine data (INNER|LEFT|FULL)
 - Data enrichment/ get extra info (LEFT)
 - Check existence of data in another table (INNER| LEFT+ WHERE| FULL+ WHERE)

Categories:
All data - no join, full join
Matching data -= (inner, left, right)join
Unmatching data/ (left, right, full)anti join, cross join

*/

-- 1. No join
SELECT * FROM customers
Select * from orders

-- 2. Inner join (Default) (Only matching rows[by a column], order doesn't matter)
SELECT 
	c.id,c.first_name, o.order_id, o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id=o.customer_id
/*
- on specifies what to match to join
- if you have somilar column names= table_name.col_name
- Good practice= assign each column the table
- if col names are too long, assign an alias name to table name 
	eg: FROM customers AS c | INNER JOIN orders AS o
*/

-- 3. Left Join ~ all data comes from one table (FROM clause), 
--and only matching data from the secondary table (JOIN clause)
-- umatching data from the secondary table is not considered 
SELECT c.id,c.first_name, o.order_id, o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id= o.customer_id

-- 4. Right Join ~ all data comes from the right table 
--and only the matching ones on the left are taken
-- all customers with their orders are taken and includes 
--orders without matching customers

SELECT c.id,c.first_name, o.order_id, o.sales 
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id= o.customer_id

-- 5. Full Join ~ all data is taken, order not important
-- opposite of inner join
SELECT 
	c.id,c.first_name, o.order_id, o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id=o.customer_id

/*
1.2) Anti- Join
- Left Anti *
- Right Anti
- Alternative to Right Anti (LEFT ANTI WITH TABLES SWITCHED in select clause)
- Full anti *
- Advanced inner
- Cross join
*/

--1.2.1) LEFT ANTI ~get customers who havent placed order(no intersection)
SELECT *
FROM customers as c
LEFT JOIN orders AS o
ON c.id=o.customer_id 
WHERE o.customer_id IS NULL

--1.2.2) RIGHT ANTI ~ get those who are not in customer table but are in orders
SELECT *
FROM customers as c
RIGHT JOIN orders AS o
ON c.id=o.customer_id 
WHERE c.id IS NULL

--1.2.3) FULL ANTI - get those who are not in both customer and orders table
--order is not important here
SELECT *
FROM customers as c
FULL JOIN orders AS o
ON c.id=o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL

--1.2.4) ADVANCED INNER - get those who are in both customer and orders table
--Don't use INNER JOIN
SELECT *
FROM customers as c
FULL JOIN orders AS o
ON c.id=o.customer_id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL

-- GET THOSE WHO ARE CUSTOMERS AND HAVE ORDERED
SELECT *
FROM customers as c
LEFT JOIN orders AS o
ON c.id=o.customer_id
WHERE o.customer_id IS NOT NULL 

--1.2.5) CROSS JOIN - GET POSSIBLE COMBO OF everything from A and B(cartesian product)
--NO CONDITION USED
SELECT *
FROM customers 
CROSS JOIN orders 
