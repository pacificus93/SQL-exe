/*
Get the models and prices for all commercially available products (of any type) produced by maker B.
*/

WITH sel AS (
	SELECT * 
	FROM product 
	WHERE maker = 'B')

SELECT pc.model
      ,pc.price 
FROM pc 
JOIN sel ON pc.model = sel.model

UNION

SELECT lp.model
      ,lp.price 
FROM laptop AS lp 
JOIN sel ON lp.model = sel.model

UNION

SELECT pn.model
      ,pn.price 
FROM printer AS pn 
JOIN sel ON pn.model = sel.model