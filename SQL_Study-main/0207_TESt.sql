USE BaseballData

SELECT 2023 - NULL --� ������ �ص� NULL�� ���´�.

SELECT 2023 - birthYear AS koreaAge
FROM players
WHERE deathYear IS NULL AND birthYear IS NOT NULL--������� ���� ��� ����
		AND (2023-birthYear)<=80 --WHERE �Ŀ� SELECT������ �۵��Ѵ�.
ORDER BY koreaAge

SELECT 3.0/2;

--SELECT ROUND