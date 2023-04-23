/*
Get the makers producing both PCs having a speed of 750 MHz or higher and 
laptops with a speed of 750 MHz or higher.
Result set: maker
*/

SELECT DISTINCT pd.maker 
FROM Product AS pd 
JOIN pc ON pd.model = pc.model AND pc.speed >= 750

INTERSECT

SELECT DISTINCT pd.maker 
FROM Product AS pd 
JOIN Laptop AS lp ON pd.model = lp.model AND lp.speed >= 750

