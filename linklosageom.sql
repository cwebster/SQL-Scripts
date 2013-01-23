SELECT
	lsoa_feb_2004_ew_bfe.the_geom as geom,
	lsoa_feb_2004_ew_bfe.lsoa04cd as LOSA,
	sum(codedvitamindresultssept14.severe) as severe,
	sum(codedvitamindresultssept14.deficient) as deficient,
	sum(codedvitamindresultssept14.insufficiency) as insufficiency,
	sum(codedvitamindresultssept14.sufficient) as sufficient,
	count(codedvitamindresultssept14.postcode) as postcodes
FROM
	public.lsoa_feb_2004_ew_bfe lsoa_feb_2004_ew_bfe,
	public.codedvitamindresultssept14 codedvitamindresultssept14
WHERE
	lsoa_feb_2004_ew_bfe.lsoa04cd = codedvitamindresultssept14.lsoa
group by
	lsoa_feb_2004_ew_bfe.lsoa04cd, lsoa_feb_2004_ew_bfe.the_geom
