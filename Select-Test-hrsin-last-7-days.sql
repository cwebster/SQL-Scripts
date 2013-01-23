SELECT
		 DATEDIFF('hh',Result_Set.Date_Time_Booked_In,Result_Set.Date_Time_Booked_In) AS HrsIn, Date_Authorised_Index.Date_Authorised
			FROM
		iLabTP.Date_Authorised_index,
		iLabTP.Result_Set Result_Set,
		iLabTP.Request
			WHERE
				DATEDIFF('D',Date_Authorised_Index.Date_Authorised,current_timestamp) < 7 and
				Date_Authorised_index.Request_Row_ID = Result_Set.Request_Row_ID and
				Date_Authorised_index.Request_Row_ID = Request.Request_Row_ID and
				Result_Set.Set_Code = 'TVITDN'