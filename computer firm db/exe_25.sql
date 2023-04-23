/*
Find the printer makers also producing PCs with the lowest RAM capacity 
and the highest processor speed of all PCs having the lowest RAM capacity.
Result set: maker.
*/

SELECT DISTINCT pd.maker 
FROM product pd 
JOIN pc ON pd.model = pc.model 
	AND 'Printer' IN (
		SELECT type
		FROM product
		WHERE maker = pd.maker) 
	AND pc.ram IN (
		SELECT MIN(ram)
		FROM pc) 
	AND speed IN (
		SELECT MAX(speed)
		FROM (
			SELECT *
			FROM pc
			WHERE ram = (
				SELECT MIN(ram)
				FROM pc))mr
                     )

