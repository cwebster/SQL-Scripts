SELECT
    JSON_ARRAYAGG(DATEDIFF('mi',Result_Set.Date_Time_Booked_In,Result_Set.Date_Time_Authorised)) AS HrsIn, 
    Date_Received_Index.Date_Received,
    JSON_ARRAYAGG(Request.Location) as Locations,
    JSON_ARRAYAGG(Date_Received_Index.Specimen_Number) as SpecimenNumbers,
    MAX(Result_Set.Date_Time_Authorised) as LastDateAuthoirsed,
    COUNT(Date_Received_Index.Specimen_Number) AS CountOfSpecimens,
    COUNT(case when Result_Set.Date_Time_Authorised = '' then Result_Set.Date_Time_Authorised end) as NotAuthorised,
    COUNT(case when Result_Set.Date_Time_Authorised IS NOT NULL then Result_Set.Date_Time_Authorised end) as Authorised
FROM
    iLabTP.Date_Received_Index,
    iLabTP.Result_Set Result_Set,
    iLabTP.Request
WHERE
    DATEDIFF('D',Date_Received_Index.Date_Received,current_timestamp) < 30 and
    Date_Received_Index.Request_Row_ID = Result_Set.Request_Row_ID and
    Date_Received_Index.Request_Row_ID = Request.Request_Row_ID and
	Result_Set.Set_Code = 'FCP'
GROUP BY 
    Date_Received_Index.Date_Received
ORDER BY 
    Result_Set.Date_Time_Booked_In
