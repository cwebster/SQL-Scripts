SELECT Date_Received_Index.Date_Received,
Date_Received_Index.Discipline,
Request.Location,
Date_Received_Index.Specimen_Number,
Request.Specimen_Details_Booked_By,
Ref_User.Full_Name,
Result_Set.Date_Time_Booked_In,
Result_Set.Date_Booked_In,
{fn HOUR(Result_Set.Date_Time_Booked_In)} as Hour_Booked_In,
COUNT(Result_Set.Time_In_System) AS Number_of_Sets,
AVG(Result_Set.Time_In_System) AS AVG_TaT,
MAX(Result_Set.Time_In_System) AS Completed,
MIN(Result_Set.Time_In_System) AS First_Result,
Result_Set.Date_Booked_In, Result_Set.Date_Time_Authorised, Request.Date_Time_Collected, Request.Date_Time_Received

From iLabTP.Date_Received_Index, iLabTP.Request, iLabTP.Result_Set, iLabTP.Ref_User

WHERE Date_Received_Index.Date_Received > '2019-04-30'
AND Date_Received_Index.Discipline IN ('C','H') 
AND Date_Received_Index.Request_Row_ID =  Request.Request_Row_ID
AND Request.Request_Row_ID = Result_Set.Request_Row_ID
AND Request.Specimen_Details_Booked_By = Ref_User.User_ID

GROUP BY Date_Received_Index.Specimen_Number

ORDER BY Result_Set.Date_Time_Booked_In