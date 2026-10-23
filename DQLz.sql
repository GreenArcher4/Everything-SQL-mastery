SELECT DISTINCT TOP 2
	country,
	SUM(score)
FROM customers
WHERE country = 'Germany'
GROUP BY country
HAVING SUM(score) >800
ORDER BY country DESC;


SELECT country,
	SUM(score)
FROM customers
GROUP BY country
HAVING SUM(score) >800;

SELECT *
FROM customers
ORDER BY score asc

SELECT DISTINCT country
FROM customers

SELECT *
FROM customers
LIMIT 2