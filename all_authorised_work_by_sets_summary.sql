SELECT 	{fn YEAR(Date_Received_Index.Date_Received)} AS YEAR, 
		{fn MONTH(Date_Received_Index.Date_Received)} AS MONTH, 
		Test_Result.Test_Code, 
		COUNT (DISTINCT Date_Received_Index.Specimen_Number) AS Count_Of_Tests,
		Set_Code,
        Date_Received_Index.Discipline 
FROM 
		iLabTP.Date_Received_Index, 
		iLabTP.Result_Set, 
		iLabTP.Test_Result,
		iLabTP.Request
WHERE 
		Date_Received_Index.Date_Received >= '2019-11-01'
		AND Date_Received_Index.Date_Received < '2019-11-02'
		AND Date_Received_Index.Request_Row_ID = Result_Set.Request_Row_ID
		AND Result_Set.Result_Set_Row_ID = Test_Result.Result_Set_Row_ID
		AND Date_Received_Index.Request_Row_ID = Request.Request_Row_ID

