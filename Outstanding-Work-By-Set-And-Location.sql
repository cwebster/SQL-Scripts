SELECT 
	                                      count(Request.Specimen_Number) As SpecNos,
                                      	Request.Date_Received,
	                                      count(Result_Set.Set_Code) AsSets,
	                                      Request.Location,
	                                      Result_Set.Set_Code
                                  FROM
                                        Request,
                                      	Outstanding_Work_Index,
	                                      Result_Set
                                  WHERE
                                        Outstanding_Work_Index.Request_Row_ID = Request.Request_Row_ID AND
                                        Result_Set.Request_Row_ID = Request.Request_Row_ID AND
                                        Request.Date_Received > '2019-08-01'
                                  GROUP BY Request.Location, Result_Set.Set_Code