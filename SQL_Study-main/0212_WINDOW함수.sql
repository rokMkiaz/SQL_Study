USE BaseballData

--������ �Լ�
SELECT*
FROM salaries
ORDER BY salary DESC;

SELECT playerID , MAX(salary) , salary--�׷��ο� ������ ���Ұ�
FROM salaries
GROUP BY playerID
ORDER BY MAX(salary) DESC

-- OVER ([PARTITION] , [ORDER BY], [ROWS])
--��ü �����͸� ���������� �����ϰ�, ���� ǥ��
SELECT*,
	ROW_NUMBER() OVER(ORDER BY salary DESC),  --�� #��ȣ
	RANK() OVER(ORDER BY salary DESC),        --��ŷ������, ����ó���� ��.
	DENSE_RANK() OVER(ORDER BY salary DESC),  --��ŷ ǥ������ �� ���� ������ ����
	NTILE(100) OVER(ORDER BY salary DESC)     --�����
FROM salaries

--playerID .�� ������ ���� �ϰ� �ʹٸ�?
SELECT *,
	RANK()OVER (PARTITION BY playerID ORDER BY salary DESC) --ID�� ���� salary�� ��ŷ�� ���δ�
FROM salaries
ORDER By playerID;

--LAG(�ٷ� ����), LEAD(�ٷ� ����)
SELECT *,
	RANK()OVER (PARTITION BY playerID ORDER BY salary DESC) ,
	LAG(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS prevSalary,
	LEAD(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS nextSalary
FROM salaries
ORDER By playerID;

--FIRST_VALUE, LAST_VALUE
--FRAME : FIRST~CURRENT ó������ ���������� ����.
SELECT *,
	RANK()OVER (PARTITION BY playerID ORDER BY salary DESC) as Ranking,
	FIRST_VALUE(salary) OVER(PARTITION BY playerID
							ORDER By salary DESC 
							ROWS BETWEEN UNBOUNDED PRECEDING/*�������� ������ ����(ó������)*/ AND CURRENT ROW /*���� ������ ���� ��´�.*/
							) AS best,
	LAST_VALUE(salary) OVER(PARTITION BY playerID
							ORDER By salary DESC
							ROWS BETWEEN CURRENT ROW/*���翡��*/ AND UNBOUNDED FOLLOWING /*������ ������ �κб���*/
							) AS worst
FROM salaries
ORDER By playerID;