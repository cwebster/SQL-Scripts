SELECT 
    Date_Received_Index.Date_Received,
    Date_Received_Index.Discipline,
    Request.Location,
    Ref_Location.Location_Group_Code,
    Request.Specimen_Details_Booked_By,
    Ref_User.Full_Name,
    Result_Set.Date_Time_Booked_In,
    Result_Set.Date_Booked_In,
    AVG(DATEDIFF('mi',Request.Date_Time_Received, Result_Set.Date_Time_Authorised)) as MinsIn,
    Result_Set.Date_Booked_In, 
    Result_Set.Date_Time_Authorised, 
    Request.Date_Time_Collected, 
    Request.Date_Time_Received,
    LIST(Date_Received_Index.Specimen_Number) AS AllSpecimenNumbers,
    LIST((AVG(DATEDIFF('mi',Request.Date_Time_Received, Result_Set.Date_Time_Authorised)))) AS AllMinsIn,
    LIST(Result_Set.Set_Code) AS AllSets
From 
    iLabTP.Date_Received_Index, 
    iLabTP.Request, 
    iLabTP.Result_Set, 
    iLabTP.Ref_User, 
    iLabTP.Ref_Location
WHERE 
    DATEDIFF('D',Date_Received_Index.Date_Received,current_timestamp) < 7
    AND Date_Received_Index.Discipline IN ('C','H') 
    AND Date_Received_Index.Request_Row_ID =  Request.Request_Row_ID
    AND Request.Request_Row_ID = Result_Set.Request_Row_ID
    AND Request.Specimen_Details_Booked_By = Ref_User.User_ID
    AND Request.Location_Row_ID = Ref_Location.Location_Row_ID
GROUP BY 
    Date_Received_Index.Specimen_Number
ORDER BY 
    Result_Set.Date_Time_Booked_In