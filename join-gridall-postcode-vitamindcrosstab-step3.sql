use geocoding
create table geo_16v2crosstab
SELECT 16v2crosstab.PostCode, 16v2crosstab.Severe, 16v2crosstab.Deficient,16v2crosstab.Insufficiency, 16v2crosstab.Sufficient, gridall.LSOA
FROM
	geocoding.16v2crosstab 16v2crosstab,
	geocoding.gridall gridall
WHERE
	16v2crosstab.PostCode = gridall.UnitPostCodeVar