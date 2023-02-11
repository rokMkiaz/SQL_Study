
--DB 만든다

CREATE DATABASE GameDB;

USE GameDB;


--테이블 생성(CREATE)/삭제(DROP)/변경(ALTER)
--CREATE TABLE 테이블명 (열이름 [DEFAULT 기본값] [NULL | NOT NULL], ...)

CREATE TABLE accounts(
	accountID INTEGER NOT NULL,--PRIMARY KEY
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
	--,PRIMARY KEY(accountID)
	)

SELECT*
FROM accounts

--테이블 삭제
DROP TABLE accounts;

--테이블 변경
--ALTER
ALTER TABLE accounts
ADD lastEnterTime DATETIME; --테이블 추가

ALTER TABLE accounts
DROP COLUMN lastEnterTime ;

ALTER TABLE accounts
ALTER COLUMN accountName VARCHAR(20);

--제약(CONSTRAINT) 추가 삭제
--NOT NULL
--UNIQUE 
--PRIMARY KEY ->인덱스 에서 개념 굉장히 중요함.
--FOREIGN KEY

ALTER TABLE accounts
ADD PRIMARY KEY(accountID);

ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY(accountID); --프리마리키 자체에 이름을 달아줄 수 있음.

ALTER TABLE accounts
DROP CONSTRAINT PK_Account; -->리스트형으로 삭제함.

SELECT *
FROM accounts
WHERE accountID = 1111; -->클러스터형 인덱스로 검색


CREATE UNIQUE INDEX i1 ON accounts(accountName)

DROP INDEX accounts.i1;

CREATE CLUSTERED INDEX i1 ON accounts(acountName) --작성 불가