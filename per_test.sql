SELECT * 
FROM 
	Date_Received_Index
WHERE
	DATEDIFF('D',Date_Received_Index.Date_Received,current_timestamp) < 1