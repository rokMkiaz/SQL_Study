--DATE ��/��/��
--TIME ��/��/��
--DATETIME ��/��/��/��/��/��

SELECT TOP (1000) [time]
  FROM [BaseballData].[dbo].[DateTimeTest]

  SELECT CAST('20200425 05:03:02' AS DATETIME)-- ĳ����

  SELECT GETDATE(); --����ð�
  SELECT CURRENT_TIMESTAMP -- ""

  USE [BaseballData]
GO

INSERT INTO [dbo].[DateTimeTest]
           ([time])
     VALUES
           ( CAST('20200425 05:03:02' AS DATETIME)) --�ڵ����� ĳ���� �ȴ�.
GO

SELECT *
FROM [DateTimeTest]
WHERE time >= CAST('20200426 05:03:02' AS DATETIME)

SELECT GETUTCDATE()--������ UTC�ð� (GMT/Greenwich Mean Time ���� ���� �ð�)

SELECT DATEADD(YEAR,1, '20200426')
SELECT DATEADD(DAY,1, '20200426')
SELECT DATEADD(SECOND,122, '20200426')

SELECT DATEDIFF(SECOND, '20200426','20210526')

SELECT DATEPART(YEAR,'20200826')
SELECT DATEPART(MONTH,'20200826')
SELECT DATEPART(DAY,'20200826')