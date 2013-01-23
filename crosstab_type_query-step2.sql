create table 16v2crosstab
	SELECT
	a.PostCode,
	SUM(IF(Vitd<15,1,0)) AS Severe,
	SUM(IF(Vitd between 15 and 30,1,0)) AS Deficient,
	SUM(IF(Vitd between 30 and 50,1,0)) AS Insufficiency,
	SUM(IF(Vitd >50,1,0)) AS Sufficient
FROM
	geo_location.16v2sept a
GROUP BY
	a.PostCode