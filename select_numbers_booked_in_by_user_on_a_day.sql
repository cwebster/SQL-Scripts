SELECT
	count(Full_Name) as NumberBooked,
	Full_Name
FROM (
SELECT
	Request.Specimen_Number, Ref_User.Full_Name, Request.Specimen_Type, Date_Received_Index.Discipline
FROM
	iLabTP.Date_Received_Index Date_Received_Index,
	iLabTP.Request Request,
	iLabTP.Ref_User
WHERE
	Date_Received_Index.Request_Row_ID = Request.Request_Row_ID
	AND
	Request.Specimen_Details_Booked_By = Ref_User.User_ID
	AND
	Date_Received_Index.Date_Received = '2012-02-25'
GROUP BY
	Request.Specimen_Number
	)
GROUP BY
	Full_Name