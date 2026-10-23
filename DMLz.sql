-- add data to tables
INSERT INTO persons (id, person_name, phone, email, score)
VALUES (628,'Debby Hill', +19999999,' debbziesh@gmail.com',' C')


SELECT *
FROM persons

-- Copy the values from src table 'Customers' to target table 'persons'
-- INSERT+ SELECT
-- 1. Keep an eye on target table on onject explorer-> target table -> column folder
-- 2.select columns that match and insert into target table columns
INSERT INTO persons(id, person_name)
SELECT id, first_name 
FROM customers

/*Modify your data of already existing rows */
--Where clause updates specifics. If left out everything is modified
UPDATE persons
	SET phone= 'unknown' 
	WHERE phone IS NULL;
--for confirmation purposes
	SELECT *
	FROM persons
	WHERE phone IS NULL

/*Deleting rows*/
DELETE FROM persons
WHERE id>2 AND id<5

SELECT *
FROM persons
WHERE id>2 AND id<5

--Delete all data using DELETE or TRUNCATE(faster for bigger tables)
TRUNCATE TABLE persons
