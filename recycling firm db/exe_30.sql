/*
Under the assumption that receipts of money (inc) and payouts (out) can be registered 
any number of times a day for each collection point [i.e. the code column is the primary key], 
display a table with one corresponding row for each operating date of each collection point.

Result set: point, date, total payout per day (out), total money intake per day (inc).
Missing values are considered to be NULL.tables.
*/

WITH out AS (
	SELECT point,date,sum(out) as o 
	FROM outcome 
	GROUP BY point,date),
inc AS (
	SELECT point,date,sum(inc) as i 
	FROM income 
	GROUP BY point,date)

SELECT CASE WHEN inc.point IS NULL THEN out.point ELSE inc.point END as point
      ,CASE WHEN inc.date IS NULL THEN out.date ELSE inc.date END as date
      ,o
      ,i 
FROM inc 
FULL JOIN out ON inc.point = out.point AND inc.date = out.date