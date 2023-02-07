SELECT *
FROM players
WHERE birthCity LIKE 'New Yor_' --패턴을 이용한 추가


SELECT*
FROM players
Where (birthYear = 1974 OR birthCountry !='USA')AND weight >185