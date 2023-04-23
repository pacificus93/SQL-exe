SELECT DISTINCT s.name 
FROM ships s 
JOIN classes c ON s.class =c.class
WHERE s.launched >= 1922 AND c.type ='bb' AND c.displacement > 35000