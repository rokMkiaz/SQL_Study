use GameDB;

SELECT*
FROM accounts

--TRAN ������� ������ �ڵ����� COMMIT
INSERT INTO accounts VALUES(1,'rookiss',100,GETUTCDATE());

DELETE accounts

--BEGIN TRAN ->����
--COMMIT ->���� ���ΰ�?
--ROOLBACK -> ����� ���ΰ�? �� ���� �Ͱ� ����.


--�ŷ�
--A�� �κ��丮���� ������ ���� <-������ �߻��� ��� ��� ���簡 �Ǿ������!!!
--B�� �κ��丮���� ������ �߰�
--A�� ��� ����


--����/���� ���ο� ���� COMMIT
BEGIN TRAN;
	INSERT INTO accounts VALUES(2,'rookiss2',100,GETUTCDATE())
ROLLBACK;

BEGIN TRAN;
	INSERT INTO accounts VALUES(2,'rookiss3',100,GETUTCDATE())
COMMIT;


--����(�߰��� �����ϸ� COMMIT �����ϸ�  ROLLBACK

BEGIN TRY
	BEGIN TRAN
		INSERT INTO accounts VALUES(3,'rookiss1',100,GETUTCDATE())
		INSERT INTO accounts VALUES(1,'rookiss2',100,GETUTCDATE()) --�Ѵ� �����ϸ� COMMINT �����ϸ� rooll back
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT >0 --���� Ȱ��ȭ�� Ʈ����� ���� ��ȯ
		ROLLBACK
	PRINT(@@TRANCOUNT)

END CATCH

--�� ���������� ����� �ֵ鸸 �־��.
BEGIN TRAN;
	INSERT INTO accounts VALUES (1,'rookiss',100, GETUTCDATE()) --�۾��߿� �ٸ����� ���� �Ұ�
ROLLBACK;
COMMIT;


