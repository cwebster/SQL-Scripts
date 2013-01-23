select DISTINCT
	TS.Result, TS.Test_Exp, REQ.Consultant,REQ.Date_Time_Received, PAT.Sex, REQ.Location, REQ.GP, REQ.Specimen_Number, PAT.NHS_Number, PAT.Postcode, GP.National_Code, PAT.DoB
FROM 
	iLabTP.Request REQ
	Inner Join iLabTP.Result_Set RS ON (REQ.Request_Row_ID = RS.Request_Row_ID)
	Inner Join iLabTP.Test_Result TS ON (RS.Result_Set_Row_ID = TS.Result_Set_Row_ID)
	Inner Join iLabTP.Ref_GP GP ON (REQ.GP_Row_ID = GP.GP_Row_ID)
	Inner Join iLabTP.Patient PAT ON (REQ.Patient_Row_ID = PAT.Patient_Row_ID)
WHERE
	DATEPART('yy', REQ.Date_Time_Received)=2009 AND
	RS.Set_Code='UE'