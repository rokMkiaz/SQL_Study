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

--������ ��� ������ �м��ϰ� �ʹ�.
SELECT teamID, COUNT(teamID)AS playerCount, SUM(HR) AS homeRuns 
FROM batting
WHERE yearID = 2004
GROUP BY teamID; --�������� ���븸 ����� �����ϴ�.

--2004�⿡ ���� ���� Ȩ���� ���� ��
SELECT teamID,  SUM(HR) AS homeRuns 
FROM batting
WHERE yearID = 2004
GROUP BY teamID
ORDER BY homeRuns DESC;

--2004�⿡ 200Ȩ�� �̻��� ���� ���� ���
SELECT teamID,  SUM(HR) AS homeRuns 
FROM batting
WHERE yearID = 2004 -- AND homeRuns>=200 �̷������� �ϸ� ���������� ���� Where������ ����� �׷��⿡ ���� 
GROUP BY teamID
HAVING SUM(HR)>=200 --�׷��� �Ŀ� �߰������� ������ �Ŵ� �� �׷��� �Ϻ���  SELECT���� ����ǹǷ� SUM�� ����� ����������Ѵ�.
ORDER BY homeRuns DESC;


--���� �⵵�� ���� ���� Ȩ���� ������
SELECT teamID,yearID, SUM(HR) AS homeRuns
FROM batting
GROUP BY teamID,yearID --�Ѵ� ��ġ�ؾ� ����
ORDER BY homeRuns DESC;
