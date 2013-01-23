SELECT
	REQ.Specimen_Number, TS.Test_Code, TS.Test_Exp, REQ.Location, LOC.Lab_Statistics_Group_Exp, LOC.Unit_Location_Group_Exp, TS.Discipline, REQ.Date_Time_Received, RS.Date_Time_Authorised
FROM 
	iLabTP.Date_Received_Index DAI, iLabTP.Request REQ, iLabTP.Result_Set RS, iLabTP.Test_Result TS, iLabTP.Ref_Location LOC
WHERE
	({fn WEEK(DAI.Date_Received)}) = 48 AND
	({fn YEAR(DAI.Date_Received)}) = 2012 AND
	DAI.Request_Row_ID = REQ.Request_Row_ID AND
	DAI.Request_Row_ID = RS.Request_Row_ID AND
	REQ.Location_Row_ID = LOC.Location_Row_ID AND
	RS.Result_Set_Row_ID = TS.Result_Set_Row_ID