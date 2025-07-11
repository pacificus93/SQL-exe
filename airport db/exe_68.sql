WITH summary AS (
	SELECT 
	   town_from,
	   town_to,
	   COUNT(trip_no) AS cnt
	FROM(
		SELECT 
		   CASE WHEN town_from < town_to THEN town_from ELSE town_to END AS town_from,
		   CASE WHEN town_from < town_to THEN town_to ELSE town_from END AS town_to,
		   trip_no
		FROM trip) AS s 
	GROUP BY town_from,town_to)
SELECT COUNT(*) 
FROM summary 
WHERE cnt = (
	SELECT MAX(cnt) 
	FROM summary)