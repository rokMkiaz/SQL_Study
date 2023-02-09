
USE BaseballData

SELECT COUNT(*) --��� ���� ���� �����Ͷ�
FROM PLAYERS;

SELECT COUNT(birthYear) --�����Լ��� ������  null�̸� ����
FROM players;

SELECT DISTINCT/*�ߺ�����*/ birthCity
FROM players

SELECT COUNT(DISTINCT birthCity) 
FROM players

SELECT DISTINCT birthYear,birthMonth, birthDay --�ߺ� ����
FROM players
ORDER BY birthYear

--�������� ��� ����
SELECT AVG(weight)
FROM players
-- ==
SELECT SUM(weight) /COUNT(weight)
FROM players

SELECT AVG(CASE WHEN weight IS NULL THEN 0 ELSE weight END) --weight=NULL�� ��� 0���� ģ��
FROM players

SELECT MIN(weight), MAX(weight)
FROM players;