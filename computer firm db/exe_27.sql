/*
Find out the average hard disk drive capacity of PCs produced by makers who also manufacture printers.
Result set: maker, average HDD capacity.
*/

SELECT pd.maker
      ,AVG(pc.hd) 
FROM Product pd 
JOIN PC ON pd.model=pc.model 
GROUP BY pd.maker 
HAVING 'Printer' IN (
	SELECT type 
	FROM Product 
	WHERE maker = pd.maker)
