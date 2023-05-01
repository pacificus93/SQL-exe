/*
Supposing a passenger lives in the town his first flight departs from, 
find non-Muscovites who have visited Moscow more than once.
Result set: passenger's name, number of visits to Moscow.
*/

WITH a AS (
	SELECT pit.id_psg
	      ,t.town_from
	      ,t.town_to
	      ,pit.date + t.time_out as date
	FROM pass_in_trip AS pit
	JOIN trip AS t ON t.trip_no = pit.trip_no),

non_muscovites AS (
	SELECT id_psg 
	FROM (
		SELECT a.*
		      ,ROW_NUMBER() OVER(PARTITION BY id_psg ORDER BY date) as row 
		FROM a) AS b 
	WHERE row = 1 AND town_from = 'Moscow' 
	GROUP BY id_psg)

SELECT name
      ,qty
FROM (
	SELECT id_psg
	      ,COUNT(*) as qty 
	FROM a 
	WHERE id_psg NOT IN (SELECT * FROM non_muscovites) AND town_to = 'Moscow' 
	GROUP BY id_psg 
	HAVING COUNT(*) > 1) AS aa 

JOIN passenger AS p ON p.id_psg = aa.id_psg