/*Among the customers using a single airline, 
find distinct passengers who have flown most frequently. 

Result set: passenger name, number of trips*/

WITH 
info AS (
	SELECT pit.id_psg
              ,t.trip_no
              ,t.id_comp 
	FROM pass_in_trip AS pit
	JOIN trip AS t ON t.trip_no = pit.trip_no),

stat AS (
	SELECT id_psg
              ,count(trip_no) cnt
	FROM info
	GROUP BY id_psg
	HAVING COUNT(DISTINCT id_comp) = 1)

SELECT name
      ,cnt 
FROM stat 
JOIN passenger as p ON stat.id_psg = p.id_psg and cnt = (select max(cnt) from stat)