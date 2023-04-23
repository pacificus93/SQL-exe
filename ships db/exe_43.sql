SELECT name 
FROM BATTLES 
WHERE NOT EXISTS (
	SELECT * 
	FROM ships S 
	WHERE datepart(YEAR,BATTLES.date) IN (
		SELECT launched 
		FROM ships)
	)
