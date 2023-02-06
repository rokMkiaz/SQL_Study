/****** SSMS의 SelectTopNRows 명령 스크립트 ******/
SELECT TOP (1000) [playerID]
      ,[yearID]
      ,[stint]
      ,[teamID]
      ,[lgID]
      ,[POS]
      ,[G]
      ,[GS]
      ,[InnOuts]
      ,[PO]
      ,[A]
      ,[E]
      ,[DP]
      ,[PB]
      ,[WP]
      ,[SB]
      ,[CS]
      ,[ZR]
  FROM [BaseballData].[dbo].[fielding]