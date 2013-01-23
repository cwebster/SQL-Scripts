SELECT
	osam.Service_Request_Index, Collection_DateTime, HospitalNumber, Date_Last_Edited, osum.Date_Added, otest.Status, osum.Location_Index, Collection_Date, Order_Accession_Number, Priority,
	ls.Name, otest.Test_Code, otest.Test_Name
FROM
	ICE.dbo.ICEView_OrderSamples osam, ICEView_OrderSummary osum, ICEView_LocationSummary ls, ICEView_OrderTests otest
where
	osam.Service_Request_Index = osum.Service_Request_Index
		AND
	osum.Location_Index = ls.Location_Index 
		AND
	osum.Service_Request_Index = otest.Service_Request_Index
		AND
	DATEPART(dd,Collection_DateTime) = DATEPART(dd,CURRENT_TIMESTAMP)
		AND
	DATEPART(yy,Collection_DateTime) = DATEPART(yy,CURRENT_TIMESTAMP)
		AND 
	Sample_Number = ''
		AND
	osum.Location_Index = 438