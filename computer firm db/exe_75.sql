/*
For makers who have products with a known price in at least one of the Laptop, 
PC, or Printer tables, find the maximum price for each product type.
Output: maker, maximum price of laptops, maximum price of PCs, maximum price of printers. 

For missing products/prices, use NULL.
*/

WITH max_prices AS (
	SELECT pd.maker
              ,MAX(lp.price) as laptop
              ,MAX(pc.price) as pc
              ,MAX(pn.price) as printer 
	FROM product AS pd
	LEFT JOIN laptop AS lp ON lp.model = pd.model
	LEFT JOIN pc ON pc.model = pd.model
	LEFT JOIN printer AS pn ON pn.model = pd.model
	GROUP BY pd.maker)

SELECT * 
FROM max_prices

WHERE laptop IS NOT NULL 
   OR pc IS NOT NULL 
   OR printer IS NOT NULL