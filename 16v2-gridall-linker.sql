CREATE TABLE geo_16v2
SELECT 16v2crosstab.PostCode, 16v2crosstab.Severe, 16v2crosstab.Deficient,16v2crosstab.Insufficiency, 16v2crosstab.Sufficient, gridall.LSOA
FROM
	geo_location.16v2crosstab 16v2crosstab,
	geo_location.gridall gridall
WHERE
	16v2crosstab.PostCode = gridall.UnitPostCodeVar