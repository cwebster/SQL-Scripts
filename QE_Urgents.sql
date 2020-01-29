SELECT 
                                Date_Received_Index.Date_Received,
                                Date_Received_Index.Discipline,
                                Date_Received_Index.Specimen_Number,
                                Request.Specimen_Details_Booked_By,
                                Result_Set.Date_Time_Booked_In,
                                Result_Set.Date_Booked_In,
                                Result_Set.Date_Time_Authorised, 
                                Request.Date_Time_Collected, 
                                Request.Date_Time_Received,
                                Result_Set.Set_Code,
                                Location,
                                Ref_Location.Location_Group_Code,
                                Request.Analytical_Category
                                From 
                                iLabTP.Date_Received_Index
                                LEFT JOIN Request ON Date_Received_Index.Request_Row_ID = Request.Request_Row_ID
                                INNER JOIN Result_Set ON Date_Received_Index.Request_Row_ID = Result_Set.Request_Row_ID
                                INNER JOIN Ref_Location On Request.Location_Row_ID = Ref_Location.Location_Row_ID
                                WHERE 
                                DATEDIFF('D',Date_Received_Index.Date_Received,current_timestamp) < 30
                                AND Date_Received_Index.Discipline = 'C' 
                                AND Result_Set.Set_Code IN ('REN2','PRO2')
                                AND Location ='ED'
                                GROUP BY 
                                Date_Received_Index.Specimen_Number
                                ORDER BY 
                                Result_Set.Date_Time_Booked_In