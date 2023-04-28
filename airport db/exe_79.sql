/*
Get the passengers who, compared to others, spent most time flying.
Result set: passenger name, total flight duration in minutes.
*/

WITH fd AS (
	SELECT pass.id_psg
	      ,SUM(CASE WHEN DATEDIFF(mi,time_out,t.time_in) < 0 
	                THEN DATEDIFF(mi,time_out,t.time_in) + 1440 
	                ELSE DATEDIFF(mi,time_out,t.time_in) END) as minutes 
	FROM pass_in_trip AS pit 
	JOIN trip AS t ON t.trip_no = pit.trip_no 
	JOIN passenger AS pass ON pass.id_psg = pit.id_psg 
	GROUP BY pass.id_psg)

SELECT p.name,fd1.minutes 
FROM fd AS fd1
JOIN passenger AS p ON p.id_psg = fd1.id_psg 
                   AND fd1.minutes = (SELECT MAX(minutes) FROM fd)