/*
Get makers producing either printers only or personal computers only; in case of PC manufacturers they should produce at least 3 models.
*/

WITH tt AS (
	SELECT pd.maker 
	FROM product AS pd 
	GROUP BY pd.maker 
	HAVING count(distinct pd.type) = 1)

SELECT tt.* 
FROM tt 
JOIN product AS pd ON pd.maker = tt.maker AND pd.type IN ('Printer')

union

SELECT tt.* 
FROM tt 
JOIN (
	SELECT maker,type 
	FROM product 
	GROUP BY maker,type 
	HAVING count(model) >= 3) AS t ON t.maker = tt.maker AND t.type IN ('PC')
