USE BaseballData

--RDBMS (Relational ������)
--�����͸� �������� �����ϴ�.

--������ ���̺��� �ٷ�� ���

SELECT playerID,AVG(salary)
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000

--12���� ���¾ �������� ID
SELECT playerID, birthMonth
FROM players
WHERE birthMonth=12

--Ŀ���� ��� ������ 3000000�̻�, �̰ų� 12���� �¾ ����
--UNION(�ߺ� ����) UNION ALL(�ߺ� ���)
SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000
UNION ALL
SELECT playerID
FROM players
WHERE birthMonth=12
ORDER BY playerID

--Ŀ���� ��� ������ 3000000�̻� && �̰ų� 12���� �¾ ����
--INTERSECT (�Ѵ� ����)

SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000
INTERSECT
SELECT playerID
FROM players
WHERE birthMonth=12
ORDER BY playerID

--Ŀ���� ��� ������ 3000000�̻� -  12���� �¾ ����
--EXCEPT (�Ѵ� ����)

SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000
EXCEPT
SELECT playerID
FROM players
WHERE birthMonth=12
ORDER BY playerID