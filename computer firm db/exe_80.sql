/*
Find the computer equipment makers not producing any PC models absent in the PC table.
*/

SELECT DISTINCT maker 
FROM product
WHERE maker NOT IN(
	SELECT pd.maker 
	FROM product AS pd 
	LEFT JOIN pc ON pc.model = pd.model 
	WHERE pc.code IS NULL AND type = 'PC')