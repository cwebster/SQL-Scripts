-- SQL provides details of booking in per hour of day and by Booking in User. Change Date_Received_Index.Date_Received = '2011-02-25' date to select different day
SELECT HourOfDay, Count(BookingUser) as NumberBookedByUser, BookingUser, Name FROM (
SELECT
	Count(Date_Received_Index.Registration_Number) as NumberBooked,
	DATEPART('hh',Request.Date_Time_Received) as HourOfDay,
	Request.Specimen_Details_Booked_By as BookingUser,
	Ref_User.Full_Name as Name
FROM
	iLabTP.Date_Received_Index Date_Received_Index,
	iLabTP.Request Request,
	iLabTP.Ref_User
WHERE
	Date_Received_Index.Request_Row_ID = Request.Request_Row_ID
	AND
	Request.Specimen_Details_Booked_By = Ref_User.User_ID
	AND
	Date_Received_Index.Date_Received = '2013-01-1'
Group by
	Date_Received_Index.Registration_Number, Request.Specimen_Details_Booked_By, DATEPART('hh',Request.Date_Time_Received)
	)
GROUP by HourOfDay,BookingUser
Order by HourOfDay