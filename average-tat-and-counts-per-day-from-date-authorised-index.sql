SELECT 
	dai.Date_Authorised
  , rs.Date_Booked_In
  , avg(DATEDIFF('hh',rs.Date_Time_Booked_In,rs.Date_Time_Authorised)) as HrsIn
  , count(dai.Date_Authorised) as numbers
  , rs.Set_Code
  , rs.Date_Time_Authorised
  , r.Date_Time_Received
FROM 
  	Date_Authorised_Index dai    
	INNER JOIN Result_Set rs ON (dai.Date_Authorised = rs.Date_Authorised
                         AND dai.Request_Row_ID = rs.Request_Row_ID)
	INNER JOIN Request R ON (dai.Request_Row_ID = r.Request_Row_ID)
WHERE
	rs.Set_Code='UE' AND 
	DATEPART('mm',dai.Date_Authorised) =8 and 
	DATEPART('yy',dai.Date_Authorised) =2011 
group by 
	rs.Date_Booked_In
