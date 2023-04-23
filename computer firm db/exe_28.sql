/*
Using Product table, find out the number of makers who produce only one model.
*/

SELECT COUNT(*) 
FROM (
	SELECT maker 
	FROM Product 
	GROUP BY maker 
	HAVING COUNT(model) = 1
      ) qty