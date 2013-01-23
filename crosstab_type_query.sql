create table 16v2crosstab
	SELECT
	a.PostCode,
	SUM(IF(Result<15,1,0)) AS Severe,
	SUM(IF(Result between 15 and 30,1,0)) AS Deficient,
	SUM(IF(Result between 30 and 50,1,0)) AS Insufficiency,
	SUM(IF(Result >50,1,0)) AS Sufficient
FROM
	geocoding.vitamindsept a
GROUP BY
	a.PostCode