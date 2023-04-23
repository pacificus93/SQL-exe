/*
Get pairs of PC models with identical speeds and the same RAM capacity. 
Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
Result set: model with the bigger number, model with the smaller number, speed, and RAM.
*/

SELECT DISTINCT pa.model
               ,pb.model
               ,pa.speed
               ,pb.ram 
FROM pc AS pa 
JOIN pc AS pb ON pa.speed = pb.speed 
	AND pa.ram = pb.ram 
	AND pa.model > pb.model