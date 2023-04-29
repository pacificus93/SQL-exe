/*
Find out the names of the ships in the Ships table that meet at least four criteria from the following list:
numGuns = 8,
bore = 15,
displacement = 32000,
type = bb,
launched = 1915,
class = Kongo,
country = USA.
*/

SELECT s.name
FROM ships AS s JOIN classes AS c ON c.class = s.class
WHERE (CASE WHEN c.numguns = 8 THEN 1 ELSE 0 END) 
     + (CASE WHEN c.bore = 15 THEN 1 ELSE 0 END) 
     + (CASE WHEN c.displacement = 32000 THEN 1 ELSE 0 END) 
     + (CASE WHEN c.type = 'bb' THEN 1 ELSE 0 END)
     + (CASE WHEN s.launched = 1915 THEN 1 ELSE 0 END)
     + (CASE WHEN c.class = 'Kongo' THEN 1 ELSE 0 END)
     + (CASE WHEN c.country = 'USA' THEN 1 ELSE 0 END) >= 4