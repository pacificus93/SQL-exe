/*
For each maker producing laptops 
with a hard drive capacity of 10 Gb or higher, 
find the speed of such laptops.
 
Result set: maker, speed.
*/

SELECT DISTINCT pd.maker
               ,lp.speed 
FROM product AS pd 
JOIN laptop AS lp ON lp.model = pd.model AND hd >= 10