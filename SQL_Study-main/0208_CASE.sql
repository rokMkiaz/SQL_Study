USE BaseballData

SELECT* ,
	CASE birthMonth
		WHEN 1 THEN N'r�ܿ�'
		WHEN 2 THEN N'��'
		WHEN 3 THEN N'��'
		WHEN 4 THEN N'��'
		WHEN 5 THEN N'��'
		WHEN 6 THEN N'����'
		WHEN 7 THEN N'����'
		WHEN 8 THEN N'����'
		WHEN 9 THEN N'����'
		WHEN 10THEN N'����'
		WHEN 11THEN N'�ܿ�'
		WHEN 12THEN N'�ܿ�'
		ELSE N'�����'
	END AS birthSeason
FROM players

SELECT* ,
	CASE 
		WHEN birthMonth <= 2 THEN N'�ܿ�' 
		WHEN birthMonth <= 5 THEN N'��' 
		WHEN birthMonth <= 8 THEN N'����' 
		WHEN birthMonth <= 11 THEN N'����'
		ELSE N'�ܿ�'
	END AS birthSeason
FROM players