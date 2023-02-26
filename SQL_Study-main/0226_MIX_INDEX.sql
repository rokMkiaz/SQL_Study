

--�ӽ� �׽�Ʈ ���̺��� ����� �����͸� ����
SELECT*
INTO TestOrderDetails
FROM[ORder Details];

--���� �ε��� �߰�
CREATE INDEX Index_TestOrderDetails
ON TestOrderDetails(OrderID, ProductID);

--�ε��� ���� ���캸��
EXEC sp_helpindex 'TestOrderDetails'

SELECT*
FROM TestOrderDetails
WHERE OrderID=10248 AND ProductID=11;

--������ ������ ���ٸ� ������ ������ �߻��Ѵ�.

--���� �׽�Ʈ
SELECT LastName
INTO TestEmployees
FROM Employees

SELECT*FROM TestEmployees;

--�ε��� �߰�
CREATE INDEX Index_TestEmployees
ON TestEmployees(LastName)

--INDEX SCAN ->BAD :SUBSTRING���� ã�°� ��ȿ����
SELECT*
FROM TestEmployees
WHERE SUBSTRING(LastName,1,2)='Bu';

-- INDEX SEEK �� ã����� DB�������� ����ȭ�� ���ش�.
SELECT*
FROM TestEmployees
WHERE LastName LIKE='Bu%';