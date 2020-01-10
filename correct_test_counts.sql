SELECT 	Test_Code, 
		COUNT(Test_Code) As Workload,
		Quarter,
		Unit_Location_Group
		
FROM
		(SELECT 
            Result_Set.Set_Code,
            Date_Received_Index.Date_Received,
            Date_Received_Index.Specimen_Number,
            Date_Received_index.Discipline AS Disc,
            Test_Result.Test_Code,
            Test_Result.Test_Result_Row_ID,
            Test_Result.Test_Row_ID,
            Test_Result.Results_Sequence_No,
   			Test_Result.Test_Row_ID, 
  			Test_Result.Test_Exp,
  			Ref_Set.Lab_Section,
            Date_Received_Index.Discipline,
            Request.Analytical_Category,
            Ref_Location.Lab_Statistics_Group_Code,
            Ref_Location.Unit_Location_Group,
            DATEPART('quarter', Date_Received_Index.Date_Received) AS Quarter
		FROM 
            Result_Set
            LEFT JOIN Test_Result ON Result_Set.Result_Set_Row_ID = Test_Result.Result_Set_Row_ID
            INNER JOIN Date_Received_Index ON (Date_Received_Index.Request_Row_ID = Result_Set.Request_Row_ID)
            INNER JOIN iLabTP.Request ON (Result_Set.Request_Row_ID = Request.Request_Row_ID)
            INNER JOIN iLabTP.Ref_Location ON (iLabTP.Ref_Location.Location_Row_ID = Request.Location_Row_ID)
            INNER JOIN iLabTP.Ref_Set ON (Result_Set.Set_Row_ID = Ref_Set.Set_Row_ID)
		GROUP BY 
			Date_Received_Index.Specimen_Number, Test_Result.Test_Code)
WHERE
		Date_Received >= '2019-04-01'
		AND Date_Received < '2019-12-31'
GROUP BY 	Unit_Location_Group, Quarter, Test_Code
