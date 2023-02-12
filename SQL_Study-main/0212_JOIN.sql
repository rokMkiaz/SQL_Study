USE GameDB;
CREATE TABLE testA
(
	a INTEGER
)

CREATE TABLE testB
(
	b VARCHAR(10)
)

INSERT INTO testA VALUES(1)
INSERT INTO testA VALUES(2)
INSERT INTO testA VALUES(3)


INSERT INTO testB VALUES('A')
INSERT INTO testB VALUES('B')
INSERT INTO testB VALUES('C')
--CROSS JOIN(교차 결합/ 순서대로 교차 결합 시켜주어 경우의 모든 데이터를 만듬.)
--데이터가 조금만 많아져도 연산이 힘들어짐
SELECT*
FROM testA
CROSS JOIN testB

SELECT*
FROM testB
----------------------------------------------------------------
USE BaseballData

SELECT*
FROM players
ORDER BY playerID
SELECT*
FROM salaries
ORDER By playerID

--INNER JOIN (두개의 테이블을 가로로 결합+ 결합 기준을 ON으로)
	--playerID가 players, salaries 양쪽 다 있고 일치하는 애들을 결합
	--한쪽에라도 없으면 INNER JOIN에서 걸러진다.
SELECT*
FROM players AS p  --간단하게 이름을 만들어 준다.
 	INNER JOIN salaries AS s
	ON p.playerID=s.playerID --기준

--OUTER JOIN (외부 결합)
	--LEFT / RIGHT
	--어느 한쪽에만 존재하는 데이터 -> 정책?

--LEFT JOIN (두개의 테이블을 가로로 결합+결합 기준을 ON으로
--playerID 가 왼쪽(LEFT)에 있으면 무조건 표시, 오른쪽(salaries)에 없으면 오른쪽 정보는 NULL표시

SELECT*
FROM players AS p 
 	LEFT JOIN salaries AS s
	ON p.playerID=s.playerID --기준

--RIGHT JOIN (두개의 테이블을 가로로 결합+결합 기준을 ON으로
--playerID 가 오른쪽(RIGHT)에 있으면 무조건 표시, 왼쪽(players)에 없으면 왼쪽 정보는 NULL표시

SELECT*
FROM players AS p 
 	RIGHT JOIN salaries AS s
	ON p.playerID=s.playerID --기준