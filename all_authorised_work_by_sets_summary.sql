SELECT Set_Code, COUNT(Set_Code) FROM 
(SELECT 
    Result_Set.Set_Code,
    Date_Authorised_Index.Date_Authorised,
    Date_Authorised_Index.Discipline,
    Request.Location,
    Ref_Location.Location_Group_Code,
    Request.Specimen_Details_Booked_By,
    Ref_User.Full_Name,
    Result_Set.Date_Time_Booked_In,
    Result_Set.Date_Booked_In,
    {fn HOUR(Result_Set.Date_Time_Booked_In)} as Hour_Booked_In,
    AVG(DATEDIFF('mi',Request.Date_Time_Received, Result_Set.Date_Time_Authorised)) as MinsIn,
    Result_Set.Date_Booked_In, 
    Result_Set.Date_Time_Authorised, 
    Request.Date_Time_Collected, 
    Request.Date_Time_Received,
    MAX(Date_Authorised_Index.Specimen_Number) AS AllSpecimenNumbers,
    LIST((AVG(DATEDIFF('mi',Request.Date_Time_Received, Result_Set.Date_Time_Authorised)))) AS AllMinsIn,
    LIST(Result_Set.Set_Code) AS AllSets
From 
    iLabTP.Date_Authorised_Index, 
    iLabTP.Request, 
    iLabTP.Result_Set, 
    iLabTP.Ref_User, 
    iLabTP.Ref_Location
WHERE 
    DATEDIFF('D',Date_Authorised_Index.Date_Authorised,current_timestamp) < 7
    AND Date_Authorised_Index.Discipline IN ('C','H') 
    AND Date_Authorised_Index.Request_Row_ID =  Request.Request_Row_ID
    AND Request.Request_Row_ID = Result_Set.Request_Row_ID
    AND Request.Specimen_Details_Booked_By = Ref_User.User_ID
    AND Request.Location_Row_ID = Ref_Location.Location_Row_ID
GROUP BY 
    Date_Authorised_Index.Specimen_Number, Result_Set.Set_Code
)
GROUP BY 
    Set_Code
