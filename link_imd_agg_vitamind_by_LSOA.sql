SELECT
	agg_lsoa_coded_vtidn_gh_plus_heft.Result_Mean,
	agg_lsoa_coded_vtidn_gh_plus_heft.Result_median,
	agg_lsoa_coded_vtidn_gh_plus_heft.Result_nu,
	agg_lsoa_coded_vtidn_gh_plus_heft.Result_plt,
	agg_lsoa_coded_vtidn_gh_plus_heft.Result_sd,
	imdscores.LSOACODE,
	imdscores.LACODE,
	imdscores.IMDSCORE,
	imdscores.RANK
FROM
	geocoding.agg_lsoa_coded_vtidn_gh_plus_heft agg_lsoa_coded_vtidn_gh_plus_heft,
	geocoding.imdscores imdscores,
	Geocoding.census_2001_ethnic_data ethnic
WHERE
	agg_lsoa_coded_vtidn_gh_plus_heft.LSOA = imdscores.LSOACODE AND
	agg_lsoa_coded_vtidn_gh_plus_heft.LSOA = ethnic.zonecode