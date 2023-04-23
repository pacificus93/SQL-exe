/*
Find out the average price of PCs and laptops produced by maker A.
Result set: one overall average price for all items.
*/

SELECT AVG(tot.price) 
FROM(
	SELECT price 
	FROM product AS pd 
	JOIN pc ON pd.model = pc.model AND pd.maker = 'A'
	
	UNION ALL
	
	SELECT price 
	FROM product AS pd 
	JOIN laptop AS lp ON pd.model = lp.model AND pd.maker = 'A') AS tot

