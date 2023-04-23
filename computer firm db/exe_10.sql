/*
Find the printer models having the highest price. 
Result set: model, price.
*/

SELECT model
      ,price 
FROM printer AS pn 
WHERE pn.price >= ALL(
	SELECT MAX(price) 
	FROM printer)
