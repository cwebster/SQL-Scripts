SELECT
    iLabTP.Date_Received_Index.Date_Received,
    Request.HIS_Order_Number,
    Request.Customer_Reference_Number,
    Request.Order_Number,
    Request.Date_Time_Collected,
    Request.Booking_In_Area,  
    Patient.NHS_Number,  
    Request.Location,
    Test_Result.Result,
    Test_Result.Test_Code,
    Ref_Location.Location_Group_Code
From
    iLabTP.Date_Received_Index
    LEFT JOIN Request ON Date_Received_Index.Request_Row_ID = Request.Request_Row_ID
    INNER JOIN Result_Set ON Date_Received_Index.Request_Row_ID = Result_Set.Request_Row_ID
    INNER JOIN Ref_Location On Request.Location_Row_ID = Ref_Location.Location_Row_ID
    INNER JOIN Test_Result On Result_Set.Result_Set_Row_ID = Test_Result.Result_Set_Row_ID
    INNER JOIN Patient On Patient.Patient_Row_ID = Request.Patient_Row_ID
WHERE
    Date_Received_Index.Date_Received BETWEEN {d '2018-04-01'}  AND {d '2019-03-31'}   
    AND Date_Received_Index.Discipline IN ('H', 'C')
    AND Test_Result.Test_Code IN ('K')
