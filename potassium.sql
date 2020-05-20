SELECT Date_Received_Index.Specimen_Number,
       Date_Received_Index.Date_Received,
       LOCATION,
       Test_Result.Result,
       Test_Result.Test_Code,
       Ref_Location.Location_Group_Code,
       Request.Age_At_Request,
       Request.Req_DoB,
       Result_Set.Date_Time_Booked_In,
       Result_Set.Date_Booked_In,
       Result_Set.Date_Time_Authorised,
       Request.Date_Time_Collected,
       Request.Date_Time_Received,
       LOCATION
FROM iLabTP.Date_Received_Index
LEFT JOIN Request ON Date_Received_Index.Request_Row_ID = Request.Request_Row_ID
INNER JOIN Result_Set ON Date_Received_Index.Request_Row_ID = Result_Set.Request_Row_ID
INNER JOIN Ref_Location ON Request.Location_Row_ID = Ref_Location.Location_Row_ID
INNER JOIN Test_Result ON Result_Set.Result_Set_Row_ID = Test_Result.Result_Set_Row_ID
WHERE Date_Received_Index.Date_Received BETWEEN {d '2019-04-01'} AND {d '2019-04-15'}
  AND Date_Received_Index.Discipline IN ('H',
                                         'C')
  AND Test_Result.Test_Code IN ('K',
                                'NA',
                                'CREAT',
                                'CRE',
                                'UREA',
                                'CL',
                                'ALP',
                                'ALP1',
                                'CA')
