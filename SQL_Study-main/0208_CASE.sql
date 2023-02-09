USE BaseballData

SELECT* ,
	CASE birthMonth
		WHEN 1 THEN N'r°Ü¿ï'
		WHEN 2 THEN N'º½'
		WHEN 3 THEN N'º½'
		WHEN 4 THEN N'º½'
		WHEN 5 THEN N'º½'
		WHEN 6 THEN N'¿©¸§'
		WHEN 7 THEN N'¿©¸§'
		WHEN 8 THEN N'¿©¸§'
		WHEN 9 THEN N'°¡À»'
		WHEN 10THEN N'°¡À»'
		WHEN 11THEN N'°Ü¿ï'
		WHEN 12THEN N'°Ü¿ï'
		ELSE N'¸ô¶ó¿ä'
	END AS birthSeason
FROM players

SELECT* ,
	CASE 
		WHEN birthMonth <= 2 THEN N'°Ü¿ï' 
		WHEN birthMonth <= 5 THEN N'º½' 
		WHEN birthMonth <= 8 THEN N'¿©¸§' 
		WHEN birthMonth <= 11 THEN N'°¡À»'
		ELSE N'°Ü¿ï'
	END AS birthSeason
FROM players