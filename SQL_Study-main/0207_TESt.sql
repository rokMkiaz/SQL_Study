USE BaseballData

SELECT 2023 - NULL --어떤 연산을 해도 NULL이 나온다.

SELECT 2023 - birthYear AS koreaAge
FROM players
WHERE deathYear IS NULL AND birthYear IS NOT NULL--사망하지 않은 사람 기준
		AND (2023-birthYear)<=80 --WHERE 후에 SELECT구문이 작동한다.
ORDER BY koreaAge

SELECT 3.0/2;

--SELECT ROUND