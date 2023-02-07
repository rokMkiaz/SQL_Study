USE BaseballData

SELECT /*TOP 10 PERCENT*/*
FROM players
WHERE birthYear IS NOT NULL
ORDER By birthYear DESC, birthMonth DESC, birthDay DESC --3개 순서대로 정렬
--OFFSET 100 ROWS FETCH NEXT 100 ROWS ONLY --offset 필터 잘 안씀
