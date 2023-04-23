/*
For each maker having models in the Laptop table, 
find out the average screen size of the laptops he produces.
Result set: maker, average screen size.
*/

SELECT pd.maker
      ,AVG(lp.screen) 
FROM Product AS pd 
JOIN Laptop AS lp ON pd.model = lp.model
GROUP BY maker

