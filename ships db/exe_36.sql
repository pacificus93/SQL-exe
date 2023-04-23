SELECT s.name 
FROM ships s 
JOIN classes c ON s.name = c.class

UNION

SELECT o.ship 
FROM outcomes o 
JOIN classes c ON o.ship = c.class