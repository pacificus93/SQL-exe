/*
For each maker, list the types of products he produces in alphabetic order, using a slash ("/") as a delimiter.
Result set: maker, list of product types.
*/

SELECT maker
      ,STRING_AGG(a.type,'/') 
FROM (
	SELECT maker
	      ,type 
	FROM product 
	GROUP BY maker,type) AS a
GROUP BY maker
