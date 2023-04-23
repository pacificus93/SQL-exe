/*
Find the battles in which Kongo-class ships from the Ships table were engaged.
*/

SELECT DISTINCT b.name 
FROM battles AS b
JOIN outcomes AS o ON b.name = o.battle
JOIN ships AS s ON o.ship = s.name AND s.class = 'Kongo'
