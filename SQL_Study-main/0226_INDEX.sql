

--FILLFACTOR(���� ������ ���� 1%�� ���
--PAD_INDEX(FILLFACTOR �߰� ������ ����)
CREATE INDEX Test_Index ON Test(LastName)
WITH (FILFACTOR =1, PAD_INDEX =ON)
GO

--�ε��� ��ȣã��
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('Test')

--2�� �ε��� ���� ���캸
DBCC IND('Northwid','Test',2);

--Root(2)->Branch(1)->Leaf(0)

--Heap RID �������ּ�(4), ����ID(2), ���Թ�ȣ(2) ������ ROW�ĺ���, ���̺��� ���� ����
DBCC PAGE('Northwid', 1/*���Ϲ�ȣ*/,832/*��������ȣ*/,3/*��¿ɼ�*/);
DBCC PAGE('Northwid', 1/*���Ϲ�ȣ*/,840/*��������ȣ*/,3/*��¿ɼ�*/);
DBCC PAGE('Northwid', 1/*���Ϲ�ȣ*/,841/*��������ȣ*/,3/*��¿ɼ�*/);


--Random Access(�� �� �б� ���� �� �������� ����)
--Bookmark Lookup(RID�� ���� ���� ã��)
