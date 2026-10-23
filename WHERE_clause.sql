/*Comparison operators:
col_1 = col_1,
col= value, 
fx= value (UPPER(first_name='John'), 
expression = value(Price*quality=1000)
subquerry= value (SELECT AVG(sales) FROM table_name = 1000)
*/
SELECT * FROM customers
WHERE country <> 'USA';


-- Logical operator (3)
--1)AND
SELECT * FROM customers
WHERE country= 'USA' AND score>500;
--2) OR ~  atleast one is true
SELECT * FROM customers
WHERE country= 'USA' OR score>500;
--3) NOT ~ remove matching values
SELECT * FROM customers
WHERE NOT score < 500 --where score is not less than 500
WHERE NOT country='USA' -- where country is NOT = USA


--RANGE operator BETWEEN uppper_boundary AND lower_boundary
--Tiz inclusive of boundaries
SELECT * FROM customers
WHERE score BETWEEN 350 AND 750


--Membership operators (Define members of a list from values in same column)
--1)IN (members of the list)
-- customers from either GERMANY or USA
SELECT * FROM customers
WHERE country IN ('Germany','USA')
--2)NOT IN (members not in the list)
SELECT * FROM customers
WHERE country NOT IN ('Germany','USA')

/* Search operator [LIKE] which serches for pattersns:
% ~ search anything
_ ~ search exactly 1
*/
-- %
SELECT * FROM customers
WHERE first_name LIKE 'G%'
--_
SELECT * FROM customers
WHERE first_name LIKE '__r__'
--both
SELECT * FROM customers
WHERE first_name LIKE '__r%'