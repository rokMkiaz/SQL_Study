USE BaseballData

-------------------------����---------------------------
DECLARE @i AS INT=10;

DECLARE @j AS INT;
SET @j=10;

--����)���� �ְ� ������ ���� ���� �̸�
DECLARE @firstName AS NVARCHAR(15)
DECLARE @lastName AS NVARCHAR(15)

SET @firstName = (SELECT TOP 1 nameFirst
					FROM players AS p
						INNER JOIN salaries AS s
						ON p.playerID  = s.playerID
					ORDER BY s.salary DESC);
					
--SQL SERVER
SELECT TOP 1 @firstName=p.nameFirst,@lastName=p.nameLast
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID =s.playerID
ORDER BY s.salary DESC;

SELECT @firstName,@lastName

-------------------------��ġ-------------------------------
GO;  --������� �аڴ�. ������ ��ȿ���� ���� ����
DECLARE @i AS INT =10;

SELECT*
FROM players
GO;

SELECT*
FROM salaries;

--------------------------�帧����----------------
GO;

DECLARE @i AS INT =10;
IF @i=10			--IF ���� Ű���尡 ���ٸ� �ϳ��� ������ �����
	BEGIN
		PRINT('Bingo!');
		PRINT('Bingo!');
	END
ELSE
	PRINT('No');
GO;

--------------------------�帧����----------------

DECLARE @i AS INT =0;
WHILE @i<=10
	BEGIN
		PRINT @i;
		SET @i=@i+1;
		IF @i = 6 BREAK;
	END

DECLARE @j AS INT =0;
WHILE @j<=10
	BEGIN
		SET @j=@j+1;
		IF @j = 6 CONTINUE;
		PRINT @j;
	END
GO;

--------------------------���̺� ����----------------
--DECLARE�� ����ϸ� -> tempDB ������ ���̽��� �ӽ� �����Ѵ�
--���߿��� �׼������͸� �ӽ����̺� ��Ƽ� ����ϸ� �ȴ�.
DECLARE @test TABLE
(
	name VARCHAR(50)NOT NULL,
	salary INT NOT NULL
)
INSERT INTO @test
SELECT p.nameFirst+ ' '  +p.nameLast,s.salary
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

SELECT*
FROM @test
