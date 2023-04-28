/*
Find the days with the maximum number of flights departed from Rostov. Result set: number of trips, date.
*/

WITH num_of_trips AS (
	SELECT COUNT(DISTINCT pit.trip_no) as cnt
	      ,pit.date
	FROM pass_in_trip AS pit
	JOIN trip AS t ON t.trip_no = pit.trip_no 
	              AND t.town_from = 'Rostov'
	GROUP BY pit.date)

SELECT * 
FROM num_of_trips AS num_of_trips_1
WHERE num_of_trips_1.cnt = (SELECT MAX(cnt) FROM num_of_trips)