USE BaseballData

--윈도우 함수
SELECT*
FROM salaries
ORDER BY salary DESC;

SELECT playerID , MAX(salary) , salary--그룹핑에 빠지면 사용불가
FROM salaries
GROUP BY playerID
ORDER BY MAX(salary) DESC

-- OVER ([PARTITION] , [ORDER BY], [ROWS])
--전체 데이터를 연본순서로 나열하고, 순위 표기
SELECT*,
	ROW_NUMBER() OVER(ORDER BY salary DESC),  --행 #번호
	RANK() OVER(ORDER BY salary DESC),        --랭킹이지만, 공동처리를 함.
	DENSE_RANK() OVER(ORDER BY salary DESC),  --랭킹 표시지만 그 다음 데이터 인정
	NTILE(100) OVER(ORDER BY salary DESC)     --백분율
FROM salaries

--playerID .별 순위를 따로 하고 싶다면?
SELECT *,
	RANK()OVER (PARTITION BY playerID ORDER BY salary DESC) --ID로 묶고 salary로 랭킹을 맥인다
FROM salaries
ORDER By playerID;

--LAG(바로 이전), LEAD(바로 다음)
SELECT *,
	RANK()OVER (PARTITION BY playerID ORDER BY salary DESC) ,
	LAG(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS prevSalary,
	LEAD(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS nextSalary
FROM salaries
ORDER By playerID;

--FIRST_VALUE, LAST_VALUE
--FRAME : FIRST~CURRENT 처음에서 마지막값을 본다.
SELECT *,
	RANK()OVER (PARTITION BY playerID ORDER BY salary DESC) as Ranking,
	FIRST_VALUE(salary) OVER(PARTITION BY playerID
							ORDER By salary DESC 
							ROWS BETWEEN UNBOUNDED PRECEDING/*무한으로 앞으로 간다(처음부터)*/ AND CURRENT ROW /*현재 까지의 값을 잡는다.*/
							) AS best,
	LAST_VALUE(salary) OVER(PARTITION BY playerID
							ORDER By salary DESC
							ROWS BETWEEN CURRENT ROW/*현재에서*/ AND UNBOUNDED FOLLOWING /*마지막 수행한 부분까지*/
							) AS worst
FROM salaries
ORDER By playerID;