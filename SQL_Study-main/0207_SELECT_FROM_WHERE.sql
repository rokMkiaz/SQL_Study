SELECT *
FROM players
WHERE birthCity LIKE 'New Yor_' --������ �̿��� �߰�


SELECT*
FROM players
Where (birthYear = 1974 OR birthCountry !='USA')AND weight >185