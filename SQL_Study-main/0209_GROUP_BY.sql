USE BaseballData;

SELECT *
FROM batting
WHERE yearID = 2004 AND teamID = 'BOS'

SELECT SUM(HR)
FROM batting
WHERE yearID =2004 AND teamID = 'BOS'

SELECT*
FROM batting
WHERE yearID =2004
ORDER BY teamID;

--팀별로 묶어서 뭔가를 분석하고 싶다.
SELECT teamID, COUNT(teamID)AS playerCount, SUM(HR) AS homeRuns 
FROM batting
WHERE yearID = 2004
GROUP BY teamID; --최종적인 내용만 출력이 가능하다.

--2004년에 가장 많은 홈런을 날린 팀
SELECT teamID,  SUM(HR) AS homeRuns 
FROM batting
WHERE yearID = 2004
GROUP BY teamID
ORDER BY homeRuns DESC;

--2004년에 200홈런 이상을 날린 팀의 목록
SELECT teamID,  SUM(HR) AS homeRuns 
FROM batting
WHERE yearID = 2004 -- AND homeRuns>=200 이런식으로 하면 로직적으로 보면 Where다음에 실행됨 그렇기에 에러 
GROUP BY teamID
HAVING SUM(HR)>=200 --그룹핑 후에 추가적으로 조건을 거는 문 그러나 하빙도  SELECT전에 실행되므로 SUM을 사용해 따로해줘야한다.
ORDER BY homeRuns DESC;


--단일 년도에 가장 많은 홈런을 날린팀
SELECT teamID,yearID, SUM(HR) AS homeRuns
FROM batting
GROUP BY teamID,yearID --둘다 일치해야 묶임
ORDER BY homeRuns DESC;
