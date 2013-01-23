SELECT VitaminDCrossTab.PostCode, VitaminDCrossTab.Severe, VitaminDCrossTab.Deficient,VitaminDCrossTab.Insufficiency, VitaminDCrossTab.Sufficient, gridall.`1998Ward`, gridall.LSOA, gridall.MSOA
FROM
	geocoding.VitaminDCrossTab VitaminDCrossTab,
	geocoding.gridall gridall
WHERE
	VitaminDCrossTab.PostCode = gridall.UnitPostCodeVar