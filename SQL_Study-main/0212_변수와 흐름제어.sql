USE BaseballData

-------------------------변수---------------------------
DECLARE @i AS INT=10;

DECLARE @j AS INT;
SET @j=10;

--예제)역대 최고 연봉을 받은 선수 이름
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

-------------------------배치-------------------------------
GO;  --여기까지 읽겠다. 변수의 유효범위 설정 가능
DECLARE @i AS INT =10;

SELECT*
FROM players
GO;

SELECT*
FROM salaries;

--------------------------흐름제어----------------
GO;

DECLARE @i AS INT =10;
IF @i=10			--IF 에서 키워드가 없다면 하나의 구문만 실행됨
	BEGIN
		PRINT('Bingo!');
		PRINT('Bingo!');
	END
ELSE
	PRINT('No');
GO;

--------------------------흐름제어----------------

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

--------------------------테이블 변수----------------
--DECLARE를 사용하면 -> tempDB 데이터 베이스에 임시 저장한다
--나중에는 액셀데이터를 임시테이블에 담아서 사용하면 된다.
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
