/*
Among those flying with a single airline find the names of different passengers who have flown most often.
Result set: passenger name, number of trips, and airline name.
*/

WITH tc AS (
	SELECT pit.id_psg
	      ,COUNT(*) as trip_Qty 
	FROM pass_in_trip AS pit 
	JOIN trip AS t ON t.trip_no = pit.trip_no 
	GROUP BY id_psg 
	HAVING COUNT(DISTINCT t.id_comp) = 1)

SELECT p.name
      ,a.trip_qty
      ,c.name
FROM (
	SELECT pit.id_psg
	      ,trip_qty
	      ,t.id_comp 
	FROM tc 
	JOIN pass_in_trip AS pit ON pit.id_psg = tc.id_psg
	JOIN trip AS t ON pit.trip_no = t.trip_no
	WHERE trip_Qty = (SELECT MAX(trip_Qty) FROM tc)
	GROUP BY pit.id_psg,trip_qty,t.id_comp) AS a

JOIN passenger AS p ON p.id_psg = a.id_psg
JOIN company AS c ON c.id_comp = a.id_comp