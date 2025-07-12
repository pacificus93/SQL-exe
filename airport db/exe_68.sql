WITH route_summary AS (
	--Count the number of trips for each Route
	SELECT 
	   town_from,
	   town_to,
	   COUNT(trip_no) AS cnt
	FROM(
		--"Equating" Routes A - B and B - A
		SELECT 
		   CASE WHEN town_from < town_to THEN town_from ELSE town_to END AS town_from,
		   CASE WHEN town_from < town_to THEN town_to ELSE town_from END AS town_to,
		   trip_no
		FROM trip) AS s 
	GROUP BY town_from,town_to)
--Count the number of routes with the maximum number of trips
SELECT COUNT(*) 
FROM route_summary 
WHERE cnt = (
	SELECT MAX(cnt) 
	FROM route_summary)