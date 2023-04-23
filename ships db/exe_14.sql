/*
For the ships in the Ships table that have at least 10 guns, get the class, name, and country.
*/

SELECT cl.class
      ,sp.name
      ,cl.country 
FROM classes AS cl 
JOIN ships AS sp ON cl.class = sp.class AND cl.NumGuns >= 10