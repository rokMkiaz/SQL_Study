
--DB �����

CREATE DATABASE GameDB;

USE GameDB;


--���̺� ����(CREATE)/����(DROP)/����(ALTER)
--CREATE TABLE ���̺�� (���̸� [DEFAULT �⺻��] [NULL | NOT NULL], ...)

CREATE TABLE accounts(
	accountID INTEGER NOT NULL,--PRIMARY KEY
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
	--,PRIMARY KEY(accountID)
	)

SELECT*
FROM accounts

--���̺� ����
DROP TABLE accounts;

--���̺� ����
--ALTER
ALTER TABLE accounts
ADD lastEnterTime DATETIME; --���̺� �߰�

ALTER TABLE accounts
DROP COLUMN lastEnterTime ;

ALTER TABLE accounts
ALTER COLUMN accountName VARCHAR(20);

--����(CONSTRAINT) �߰� ����
--NOT NULL
--UNIQUE 
--PRIMARY KEY ->�ε��� ���� ���� ������ �߿���.
--FOREIGN KEY

ALTER TABLE accounts
ADD PRIMARY KEY(accountID);

ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY(accountID); --��������Ű ��ü�� �̸��� �޾��� �� ����.

ALTER TABLE accounts
DROP CONSTRAINT PK_Account; -->����Ʈ������ ������.

SELECT *
FROM accounts
WHERE accountID = 1111; -->Ŭ�������� �ε����� �˻�


CREATE UNIQUE INDEX i1 ON accounts(accountName)

DROP INDEX accounts.i1;

CREATE CLUSTERED INDEX i1 ON accounts(acountName) --�ۼ� �Ұ�