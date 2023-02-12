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
--CROSS JOIN(���� ����/ ������� ���� ���� �����־� ����� ��� �����͸� ����.)
--�����Ͱ� ���ݸ� �������� ������ �������
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

--INNER JOIN (�ΰ��� ���̺��� ���η� ����+ ���� ������ ON����)
	--playerID�� players, salaries ���� �� �ְ� ��ġ�ϴ� �ֵ��� ����
	--���ʿ��� ������ INNER JOIN���� �ɷ�����.
SELECT*
FROM players AS p  --�����ϰ� �̸��� ����� �ش�.
 	INNER JOIN salaries AS s
	ON p.playerID=s.playerID --����

--OUTER JOIN (�ܺ� ����)
	--LEFT / RIGHT
	--��� ���ʿ��� �����ϴ� ������ -> ��å?

--LEFT JOIN (�ΰ��� ���̺��� ���η� ����+���� ������ ON����
--playerID �� ����(LEFT)�� ������ ������ ǥ��, ������(salaries)�� ������ ������ ������ NULLǥ��

SELECT*
FROM players AS p 
 	LEFT JOIN salaries AS s
	ON p.playerID=s.playerID --����

--RIGHT JOIN (�ΰ��� ���̺��� ���η� ����+���� ������ ON����
--playerID �� ������(RIGHT)�� ������ ������ ǥ��, ����(players)�� ������ ���� ������ NULLǥ��

SELECT*
FROM players AS p 
 	RIGHT JOIN salaries AS s
	ON p.playerID=s.playerID --����