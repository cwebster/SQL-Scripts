-- Update 12/6/2019 doesnt appear to work anymore
SELECT 
    iLabTP_Date_Authorised_Index.Date_Authorised, 
    iLabTP_Date_Received_Index.Date_Received, 
    iLabTP_Request.Date_Time_Received, 
    iLabTP_Result_Set.Date_Time_Authorised, 
    iLabTP_Result_Set.Set_Code
FROM 
    ((iLabTP_Date_Authorised_Index 
        INNER JOIN iLabTP_Date_Received_Index ON (iLabTP_Date_Authorised_Index.Request_Row_ID = iLabTP_Date_Received_Index.Request_Row_ID) 
        AND (iLabTP_Date_Authorised_Index.Discipline = iLabTP_Date_Received_Index.Discipline)) 
        INNER JOIN iLabTP_Request ON iLabTP_Date_Received_Index.Request_Row_ID = iLabTP_Request.Request_Row_ID) 
        INNER JOIN iLabTP_Result_Set ON iLabTP_Request.Request_Row_ID = iLabTP_Result_Set.Request_Row_ID;