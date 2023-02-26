

--FILLFACTOR(리프 페이지 공간 1%만 사용
--PAD_INDEX(FILLFACTOR 중간 페이지 적용)
CREATE INDEX Test_Index ON Test(LastName)
WITH (FILFACTOR =1, PAD_INDEX =ON)
GO

--인덱스 번호찾기
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('Test')

--2번 인덱스 정보 살펴보
DBCC IND('Northwid','Test',2);

--Root(2)->Branch(1)->Leaf(0)

--Heap RID 페이지주소(4), 파일ID(2), 슬롯번호(2) 조합한 ROW식별자, 테이블에서 정보 추출
DBCC PAGE('Northwid', 1/*파일번호*/,832/*페이지번호*/,3/*출력옵션*/);
DBCC PAGE('Northwid', 1/*파일번호*/,840/*페이지번호*/,3/*출력옵션*/);
DBCC PAGE('Northwid', 1/*파일번호*/,841/*페이지번호*/,3/*출력옵션*/);


--Random Access(한 건 읽기 위해 한 페이지씩 접근)
--Bookmark Lookup(RID를 통해 행을 찾음)
