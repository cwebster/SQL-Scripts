SELECT
	count(DATEPART('hh',Date_Time_Received)) as NumberBooked,
	DATEPART('hh',Date_Time_Received) as Hour
FROM (
SELECT
	Request.Specimen_Number, Ref_User.Full_Name, Request.Specimen_Type, Date_Received_Index.Discipline, Request.Date_Time_Received
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
	DATEPART('hh',Date_Time_Received)