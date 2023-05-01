/*
Get makers having most models in the Product table, as well as those having least.
Output: maker, number of models
*/

WITH cnts AS (
	SELECT maker
	      ,COUNT(model) as cnt 
	FROM product AS pd 
	GROUP BY maker)

SELECT * 
FROM cnts 
WHERE cnt IN (
	SELECT MAX(cnt) as cnt
	FROM cnts
	
	UNION

	SELECT MIN(cnt) as cnt
	FROM cnts)