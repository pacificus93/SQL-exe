/*
Find out the maximum PC price for each maker having models in the PC table. 
Result set: maker, maximum price.
*/

SELECT pd.maker
      ,MAX(pc.price)
FROM product pd
JOIN pc ON pd.model = pc.model
GROUP BY pd.maker

