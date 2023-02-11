USE BaseballData

--RDBMS (Relational 관계형)
--데이터를 집합으로 간주하다.

--복수의 테이블을 다루는 방법

SELECT playerID,AVG(salary)
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000

--12월에 ㄴ태어난 선수들의 ID
SELECT playerID, birthMonth
FROM players
WHERE birthMonth=12

--커리어 평균 연봉이 3000000이상, 이거나 12월에 태어난 선수
--UNION(중복 제거) UNION ALL(중복 허용)
SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000
UNION ALL
SELECT playerID
FROM players
WHERE birthMonth=12
ORDER BY playerID

--커리어 평균 연봉이 3000000이상 && 이거나 12월에 태어난 선수
--INTERSECT (둘다 만족)

SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000
INTERSECT
SELECT playerID
FROM players
WHERE birthMonth=12
ORDER BY playerID

--커리어 평균 연봉이 3000000이상 -  12월에 태어난 선수
--EXCEPT (둘다 제외)

SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000
EXCEPT
SELECT playerID
FROM players
WHERE birthMonth=12
ORDER BY playerID