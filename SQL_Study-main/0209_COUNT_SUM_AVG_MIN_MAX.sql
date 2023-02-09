
USE BaseballData

SELECT COUNT(*) --모든 행의 갯수 가져와라
FROM PLAYERS;

SELECT COUNT(birthYear) --집계함수는 집합이  null이면 무시
FROM players;

SELECT DISTINCT/*중복제거*/ birthCity
FROM players

SELECT COUNT(DISTINCT birthCity) 
FROM players

SELECT DISTINCT birthYear,birthMonth, birthDay --중복 제거
FROM players
ORDER BY birthYear

--선수들의 평균 무게
SELECT AVG(weight)
FROM players
-- ==
SELECT SUM(weight) /COUNT(weight)
FROM players

SELECT AVG(CASE WHEN weight IS NULL THEN 0 ELSE weight END) --weight=NULL일 경우 0으로 친다
FROM players

SELECT MIN(weight), MAX(weight)
FROM players;