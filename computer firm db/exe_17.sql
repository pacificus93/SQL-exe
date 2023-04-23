/*
Get the laptop models that have a speed smaller than the speed of any PC.
Result set: type, model, speed.
*/

SELECT DISTINCT pd.type
               ,lp.model
               ,lp.speed 
FROM Laptop AS lp 
JOIN product AS pd ON pd.model = lp.model 
	AND lp.speed < (
		SELECT MIN(speed) 
		FROM PC)