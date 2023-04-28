/*
Find the overall flight duration for passengers who never occupied the same seat.
Result set: passenger name, flight duration in minutes.
*/

SELECT p.name
      ,a.minutes
FROM (
	SELECT pass.id_psg
	      ,SUM(CASE WHEN DATEDIFF(mi,time_out,t.time_in) < 0 
	                THEN DATEDIFF(mi,time_out,t.time_in) + 1440 
	                ELSE DATEDIFF(mi,time_out,t.time_in) END) as minutes
	FROM pass_in_trip AS pit 
	JOIN trip AS t ON t.trip_no = pit.trip_no
	JOIN passenger AS pass ON pass.id_psg = pit.id_psg
	GROUP BY pass.id_psg
	HAVING COUNT(pit.trip_no) = COUNT(DISTINCT pit.place)) AS a

JOIN passenger AS p ON p.id_psg = a.id_psg