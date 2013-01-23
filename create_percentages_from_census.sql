create table geocoding.census_2001_ethnic_data_percentages
SELECT
	zonecode,
	zonename,
	((WhiteandBlackCar + WhiteandBlackAfrican + WhiteandAsian + OtherMixed + Indian + Pakistani + Bangladeshi+ OtherAsian+Caribbean+African+OtherBlack+Chinese+OtherEthnic) / `All`) as pctNonWhite,
	((WhiteBritish + WhiteIrish + WhiteOther) /  `All`) as pctwhite,
	(WhiteBritish / `All`) as pctwhitebritish,
	(WhiteIrish / `All`) as pctwhiteirish,
	(WhiteOther / `All`) as pctwhiteother,
	(WhiteandBlackCar / `All`) as pctwhiteblackcar,
	(WhiteandBlackAfrican / `All`) as pctwhiteandblackafrican,
	(OtherMixed / `All`) as pctOtherMixed,
	(Indian / `All`) as pctIndian,
	(Pakistani / `All`) as pctPakistani,
	(Bangladeshi / `All`) as pctBangladeshi,
	(Caribbean / `All`) as pctCaribbean,
	(African / `All`) as pctAfrican,
	(OtherBlack / `All`) as pctOtherBlack,
	(Chinese / `All`) as pctChinese,
	(OtherEthnic / `All`) as pctOtherEthnic
	
FROM
	geocoding.census_2001_ethnic_data;