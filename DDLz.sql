/*Create a table called persons with  columns: id, person_name, birth_date, phone */

CREATE TABLE persons (
	id INT PRIMARY KEY,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE ,
	phone VARCHAR(15) NOT NULL -- Has special char line  + , ()
	-- can also add a pk here esp if more than 1
	--CONSTRAINT pk_persons PRIMARY KEY(id, person_name)
	--constraint is called pk_persons
	);
-- highlight and run
SELECT *
FROM persons

--add a new column called email
ALTER TABLE persons
ADD email VARCHAR(50) 
-- remove column phone
ALTER TABLE persons
DROP COLUMN phone

ALTER TABLE persons
ADD score VARCHAR(50);


-- from Master dbase, remove the person table
DROP TABLE persons