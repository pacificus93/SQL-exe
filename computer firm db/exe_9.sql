/*
Find the makers of PCs with a processor speed of 450 MHz or more. 
Result set: maker.
*/

SELECT DISTINCT pd.maker 
FROM product AS pd 
JOIN pc ON pc.model = pd.model AND pc.speed >= 450