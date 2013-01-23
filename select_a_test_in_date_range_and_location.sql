SELECT
	dri.Date_Received,
	dri.Registration_Number,
	dri.Specimen_Number,
	rs.Date_Time_Authorised,
	rs.Namespace,
	rs.Set_Code,
	r.Consultant,
	r.Date_Time_Received,
	r.Req_Postcode,
	r.Sex,
	r.Specimen_Number,
	ts.Result,
	ts.Test_Code,
	ts.Units
FROM
	iLabTP.Date_Received_Index dri,
	iLabTP.Result_Set rs,
	iLabTP.Request r,
	iLabTP.Test_Result ts
WHERE
	dri.Request_Row_ID = rs.Request_Row_ID AND
	dri.Request_Row_ID = r.Request_Row_ID AND
	rs.Result_Set_Row_ID = ts.Result_Set_Row_ID AND
	ts.Test_Code ='GL' AND
	r.Location ='AMU1' AND
	DATEPART('yy',dri.Date_Received) =2010 
