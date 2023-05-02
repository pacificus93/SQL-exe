/*
Under the assumption that receipts of money (inc) and payouts (out) are registered 
not more than once a day for each collection point [i.e. the primary key consists of (point, date)], 
write a query displaying cash flow data (point, date, income, expense).

Use Income_o and Outcome_o tables.
*/

SELECT CASE WHEN i.point IS NULL 
            THEN o.point 
            ELSE i.point END as point
      ,CASE WHEN i.date IS NULL 
            THEN o.date 
            ELSE i.date END as date
      ,inc as income
      ,out as expense
FROM income_o AS i 
FULL JOIN outcome_o AS o ON i.point = o.point AND i.date = o.date