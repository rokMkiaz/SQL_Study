

--임시 테스트 테이블을 만들고 데이터를 복사
SELECT*
INTO TestOrderDetails
FROM[ORder Details];

--복합 인덱스 추가
CREATE INDEX Index_TestOrderDetails
ON TestOrderDetails(OrderID, ProductID);

--인덱스 정보 살펴보기
EXEC sp_helpindex 'TestOrderDetails'

SELECT*
FROM TestOrderDetails
WHERE OrderID=10248 AND ProductID=11;

--페이지 공간이 없다면 페이지 분할이 발생한다.

--가공 테스트
SELECT LastName
INTO TestEmployees
FROM Employees

SELECT*FROM TestEmployees;

--인덱스 추가
CREATE INDEX Index_TestEmployees
ON TestEmployees(LastName)

--INDEX SCAN ->BAD :SUBSTRING으로 찾는건 비효율적
SELECT*
FROM TestEmployees
WHERE SUBSTRING(LastName,1,2)='Bu';

-- INDEX SEEK 로 찾아줘야 DB차원에서 최적화를 해준다.
SELECT*
FROM TestEmployees
WHERE LastName LIKE='Bu%';