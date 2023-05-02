/*
Display all records from the Product table except for three rows with the smallest model numbers and three ones with the greatest model numbers.
*/

WITH a AS (
	SELECT TOP 3 model 
	FROM product 
	ORDER BY model),
b AS (
	SELECT TOP 3 model 
	FROM product 
	ORDER BY model DESC)

SELECT * 
FROM product 
WHERE model NOT IN (
	
	SELECT * 
	FROM a

	UNION ALL

	SELECT * 
	FROM b)