USE BaseballData

SELECT*
FROM batting


--1 ������ �Ҽ� �������� ����
SELECT*
FROM batting 
WHERE teamID = 'BOS'

--2 ������ �Ҽ� �������� ���� ���? 
SELECT COUNT(DISTINCT playerID)
FROM batting
WHERE teamID = 'BOS'

--3 ������ ���� 2004�⿡ ģ Ȩ�� ����
SELECT SUM(HR)
FROM batting
WHERE teamID = 'BOS' AND yearID = 2004

--4 ������ �� �Ҽ����� ���� �⵵ �ִ� Ȩ���� ģ ����� ����
SELECT TOP 1*
FROM batting
WHERE teamID = 'BOS'
ORDER BY HR DESC

SELECT *
FROM players
WHERE playerID = 'ortizda01'