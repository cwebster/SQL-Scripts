SELECT DISTINCT R.Set_Code, R.Turnaround_Time, A.BItoAuth, A.ReqtoAuth, A.Date_Authorised, A.Countofsets, {fn WEEK(A.Date_Authorised)} as weekno
FROM
Ref_Set R JOIN
(select  iLabTP.Date_Authorised_Index.Date_Authorised,
        iLabTP.Date_Authorised_Index.namespace,
        iLabTP.Result_Set.Set_Code,
        iLabTP.Ref_Set.Set_Exp,
        count(iLabTP.Result_Set.Set_Code) Countofsets,
        $piece(avg({fn TIMESTAMPDIFF(SQL_TSI_MINUTE,Result_Set.Date_Time_Booked_In,Result_Set.Date_Time_Authorised)}),'.')as BItoAuth,
        $piece(avg({fn TIMESTAMPDIFF(SQL_TSI_MINUTE,iLabTP.Request.Date_Time_Received,Result_Set.Date_Time_Authorised)}),'.')as ReqtoAuth,
        MAX({fn TIMESTAMPDIFF(SQL_TSI_MINUTE,Result_Set.Date_Time_Booked_In,Result_Set.Date_Time_Authorised)})as MaximumBItoAuth,
        MIN({fn TIMESTAMPDIFF(SQL_TSI_MINUTE,Result_Set.Date_Time_Booked_In,Result_Set.Date_Time_Authorised)})as MinimumBItoAuth,
        MAX({fn TIMESTAMPDIFF(SQL_TSI_MINUTE,iLabTP.Request.Date_Time_Received,Result_Set.Date_Time_Authorised)})as MaximumReqtoAuth,
        MIN({fn TIMESTAMPDIFF(SQL_TSI_MINUTE,iLabTP.Request.Date_Time_Received,Result_Set.Date_Time_Authorised)})as MinimumReqtoAuth
from    iLabTP.Date_Authorised_Index,
		iLabTP.Request,iLabTP.Result_Set,
        iLabTP.Ref_Set
where   ({fn WEEK(iLabTP.Date_Authorised_Index.Date_Authorised)}= 31)
		and iLabTP.Date_Authorised_Index.namespace in ('CHEMHRT','IMMHRT')
        and ({fn WEEK(iLabTP.Result_Set.Date_Authorised)}=31)
        and iLabTP.Date_Authorised_Index.Request_Row_ID=iLabTP.Request.Request_Row_ID
        and iLabTP.Date_Authorised_Index.Request_Row_ID=iLabTP.Result_Set.Request_Row_ID
        and iLabTP.Result_Set.Set_Row_ID=iLabTP.Ref_Set.Set_Row_ID
group by    
		{fn WEEK(iLabTP.Date_Authorised_Index.Date_Authorised)},
		iLabTP.Date_Authorised_Index.namespace,
        iLabTP.Result_Set.Set_Code) A
ON (A.Set_Code = R.Set_Code)
WHERE A.BItoAuth > R.Turnaround_Time and Countofsets>20
