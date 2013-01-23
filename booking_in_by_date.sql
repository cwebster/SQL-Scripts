SELECT
	Date_Received_Index.Date_Received,
	Date_Received_Index.Discipline,
	Date_Received_Index.Registration_Number,
	Date_Received_Index.Specimen_Number,
	Request.Consultant,
	Request.Date_Collected,
	Request.Date_Received,
	Request.Date_Time_Collected,
	Request.Date_Time_Received,
	Request.Location,
	Request.Specimen_Details_Booked_By,
	Request.Specimen_Type,
	Ref_User.Full_Name
FROM
	iLabTP.Date_Received_Index Date_Received_Index,
	iLabTP.Request Request,
	iLabTP.Ref_User
WHERE
	Date_Received_Index.Request_Row_ID = Request.Request_Row_ID
	AND
	Request.Specimen_Details_Booked_By = Ref_User.User_ID
	AND
	Date_Received_Index.Date_Received = '2011-02-25'