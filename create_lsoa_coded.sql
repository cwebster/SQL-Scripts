create table geocoding.tmp_lsoa_coded_rewrite
	SELECT
		data_for_rewrite.TVITDN,
		data_for_rewrite.PostCode,
		nhs_postcode_lookup.UnitPostCodeVar,
		nhs_postcode_lookup.LSOA
	FROM
		geocoding.data_for_rewrite data_for_rewrite,
		geocoding.nhs_postcode_lookup nhs_postcode_lookup
	WHERE
		data_for_rewrite.PostCode = nhs_postcode_lookup.UnitPostCodeVar
