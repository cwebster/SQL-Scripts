-- this does not appear to work 14-6-2019

SELECT DISTINCT
	TS.Test_Code, 
	TS.Test_Exp, 
	DAI.Date_Authorised, 
	REQ.Location, 
	COUNT(REQ.Specimen_Number), 
	LOC.Unit_Location_Group_Exp
FROM
	Test_Result TS, Result_Set RS,Request REQ, Date_Authorised_Index DAI, Ref_Location LOC
WHERE
    DATEDIFF('D',Date_Received_Index.Date_Received,current_timestamp) < 7
    AND Date_Received_Index.Discipline IN ('C','H') AND
	TS.Result_Set_Row_ID = RS.Result_Set_Row_ID AND
	RS.Request_Row_ID = REQ.Request_Row_ID AND
	REQ.Location_Row_ID = LOC.Location_Row_ID
GROUP BY TS.Test_Code