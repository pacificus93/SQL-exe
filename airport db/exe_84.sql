/*
For each airline, calculate the number of passengers carried in April 2003 (if there were any) by ten-day periods. 
Consider only flights that departed that month.
Result set: company name, number of passengers carried for each ten-day period.
*/

SELECT c.name
      ,stats.a as "01-10"
      ,stats.b as "11-20"
      ,stats.c as "21-30"

FROM (
	SELECT t.id_comp
	      ,SUM(CASE WHEN DATEPART(dd,date) BETWEEN '01' and '10' THEN 1 ELSE 0 END) as a
	      ,SUM(CASE WHEN DATEPART(dd,date) BETWEEN '11' and '20' THEN 1 ELSE 0 END) as b
	      ,SUM(CASE WHEN DATEPART(dd,date) BETWEEN '21' and '30' THEN 1 ELSE 0 END) as c
	FROM trip AS t
	JOIN pass_in_trip AS pit ON t.trip_no = pit.trip_no 
	                        AND DATEPART(yy,pit.date) = '2003' 
	                        AND DATEPART(mm,pit.date) = '04'
	GROUP BY id_comp) AS stats

JOIN company AS c ON stats.id_comp = c.id_comp
