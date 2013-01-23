CREATE TABLE crosstabvitamind16sept
SELECT
	a.PostCode,
	SUM(IF(VitD<15,1,0)) AS Severe,
	SUM(IF(VitD between 15 and 30,1,0)) AS Deficient,
	SUM(IF(VitD between 30 and 50,1,0)) AS Insufficiency,
	SUM(IF(VitD >50,1,0)) AS Sufficient,
	g.LSOA
FROM
	geocoding.vitaminSept16 a
INNER JOIN geocoding.gridall g on a.PostCode = g.UnitPostCodeVar
GROUP BY
	a.PostCode