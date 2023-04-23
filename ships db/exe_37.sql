SELECT class
FROM (
	SELECT c.class
              ,o.ship 
	FROM outcomes o 
	JOIN classes c ON o.ship = c.class

	UNION
	
	SELECT c.class
              ,s.name ship 
	FROM ships s 
	JOIN classes c ON s.class = c.class) c

GROUP BY class
HAVING COUNT(*) = 1