SELECT DISTINCT
	TS.Test_Code, TS.Test_Exp, DAI.Date_Authorised, RS.Set_Code, REQ.Location, REQ.Specimen_Number, LOC.Unit_Location_Group_Exp
FROM
	Test_Result TS, Result_Set RS,Request REQ, Date_Authorised_Index DAI, Ref_Location LOC
WHERE
	({fn MONTH(DAI.Date_Authorised)} in (10,11)) AND
	DAI.Discipline ='C' AND
	TS.Result_Set_Row_ID = RS.Result_Set_Row_ID AND
	RS.Request_Row_ID = REQ.Request_Row_ID AND
	REQ.Location_Row_ID = LOC.Location_Row_ID