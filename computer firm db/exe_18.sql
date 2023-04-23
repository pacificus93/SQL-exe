/*
Find the makers of the cheapest color printers.
Result set: maker, price.
*/

SELECT DISTINCT pd.maker
               ,pn.price 
FROM Product AS pd 
JOIN printer AS pn ON pd.model = pn.model 
	AND pd.model = pn.model 
	AND pn.color = 'y' 
	AND pn.price = (
		SELECT MIN(price) 
		FROM Printer 
		WHERE color = 'y')