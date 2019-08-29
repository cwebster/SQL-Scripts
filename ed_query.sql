SELECT 
	Set_Code,
	Date_Received_Index.Date_Received,
	Date_Received_Index.Discipline,
	Date_Received_Index.Specimen_Number,
	Result_Set.Date_Time_Booked_In,
	Result_Set.Date_Booked_In,
	{fn HOUR(Result_Set.Date_Time_Booked_In)} as Hour_Booked_In,
	Request.Date_Time_Collected,
	Request.Date_Time_Received,
	Result_Set.Date_Time_Booked_In,
	Result_Set.Date_Time_Authorised,
	Result_Set.Time_In_System
From 
	iLabTP.Date_Received_Index, 
	iLabTP.Request, 
	iLabTP.Result_Set
WHERE 
	Date_Received_Index.date_received between '2019-05-29' and '2019-06-20' 
	AND Date_Received_Index.Discipline IN ('C','H')
	AND Date_Received_Index.Request_Row_ID =  Request.Request_Row_ID
	AND Request.Request_Row_ID = Result_Set.Request_Row_ID
	AND Request.Location = 'ED'
	GROUP BY Date_Received_Index.Specimen_Number
ORDER BY
	Date_Received_Index.Specimen_Number