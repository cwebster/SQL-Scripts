SELECT AVG(Result) as PatMean, 
	iLabTP.Date_Authorised_Index.Date_Authorised 
FROM 
	iLabTP.Test_Result, 
	iLabTP.Date_Authorised_Index, 
	iLabTP.Result_Set
Where
	(iLabTP.Date_Authorised_Index.Date_Authorised between '2012-01-01' and '2012-07-12')
	and iLabTP.Date_Authorised_Index.namespace in ('CHEMHRT','HAEMHRT','IMMHRT')
	and (iLabTP.Result_Set.Date_Authorised between '2012-01-01' and '2012-07-12')
	and iLabTP.Date_Authorised_Index.Request_Row_ID=iLabTP.Result_Set.Request_Row_ID
	and iLabTP.Result_Set.Result_Set_Row_ID = Test_Result.Result_Set_Row_ID
	and Test_Result.Test_Code = 'ALB' 
GROUP BY
	iLabTP.Date_Authorised_Index.Date_Authorised