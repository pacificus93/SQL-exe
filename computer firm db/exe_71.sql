/*
Find the PC makers with all personal computer models produced by them being present in the PC table.
*/

WITH tt1 AS (
	SELECT maker
              ,type
              ,pc.model 
	FROM product AS pd 
	LEFT JOIN pc ON pc.model = pd.model 
	WHERE type = 'PC')

SELECT DISTINCT maker 
FROM tt1

EXCEPT

SELECT DISTINCT maker 
FROM tt1 
WHERE model IS NULL