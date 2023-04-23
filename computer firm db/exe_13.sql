/*
Find out the average speed of the PCs produced by maker A.
*/

SELECT AVG(pc.speed) 
FROM product AS pd 
JOIN pc ON pd.model = pc.model AND pd.maker = 'A'