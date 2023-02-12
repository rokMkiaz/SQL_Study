use GameDB;

SELECT*
FROM accounts

--TRAN 명시하지 않으면 자동으로 COMMIT
INSERT INTO accounts VALUES(1,'rookiss',100,GETUTCDATE());

DELETE accounts

--BEGIN TRAN ->메일
--COMMIT ->보낼 것인가?
--ROOLBACK -> 취소할 것인가? 를 묻는 것과 같다.


--거래
--A의 인벤토리에서 아이템 제거 <-문제가 발생할 경우 골드 복사가 되어버린다!!!
--B의 인벤토리에서 아이템 추가
--A의 골드 감소


--성공/실패 여부에 따라 COMMIT
BEGIN TRAN;
	INSERT INTO accounts VALUES(2,'rookiss2',100,GETUTCDATE())
ROLLBACK;

BEGIN TRAN;
	INSERT INTO accounts VALUES(2,'rookiss3',100,GETUTCDATE())
COMMIT;


--응용(중간에 성공하면 COMMIT 실패하면  ROLLBACK

BEGIN TRY
	BEGIN TRAN
		INSERT INTO accounts VALUES(3,'rookiss1',100,GETUTCDATE())
		INSERT INTO accounts VALUES(1,'rookiss2',100,GETUTCDATE()) --둘다 성공하면 COMMINT 실패하면 rooll back
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT >0 --현재 활성화된 트랜잭션 수를 반환
		ROLLBACK
	PRINT(@@TRANCOUNT)

END CATCH

--꼭 원자적으로 실행될 애들만 넣어라.
BEGIN TRAN;
	INSERT INTO accounts VALUES (1,'rookiss',100, GETUTCDATE()) --작업중에 다른쿼리 실행 불가
ROLLBACK;
COMMIT;


