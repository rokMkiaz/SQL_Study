USE BaseballData

SELECT*
FROM batting


--1 보스턴 소속 선수들의 정보
SELECT*
FROM batting 
WHERE teamID = 'BOS'

--2 보스턴 소속 선수들의 수는 몇명? 
SELECT COUNT(DISTINCT playerID)
FROM batting
WHERE teamID = 'BOS'

--3 보스턴 팀이 2004년에 친 홈런 개수
SELECT SUM(HR)
FROM batting
WHERE teamID = 'BOS' AND yearID = 2004

--4 보스턴 팀 소속으로 단일 년도 최다 홈런을 친 사람의 정보
SELECT TOP 1*
FROM batting
WHERE teamID = 'BOS'
ORDER BY HR DESC

SELECT *
FROM players
WHERE playerID = 'ortizda01'