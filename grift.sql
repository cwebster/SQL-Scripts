SELECT
Location,
Test_Result.Result,
Test_Result.Test_Code,
Ref_Location.Location_Group_Code,
COUNT(Test_Result.Test_Code)
From
iLabTP.Date_Received_Index
LEFT JOIN Request ON Date_Received_Index.Request_Row_ID = Request.Request_Row_ID
INNER JOIN Result_Set ON Date_Received_Index.Request_Row_ID = Result_Set.Request_Row_ID
INNER JOIN Ref_Location On Request.Location_Row_ID = Ref_Location.Location_Row_ID
INNER JOIN Test_Result On Result_Set.Result_Set_Row_ID = Test_Result.Result_Set_Row_ID
WHERE
Date_Received_Index.Date_Received BETWEEN {d '2018-04-01'} AND {d '2019-03-31'} 
AND Date_Received_Index.Discipline IN ('H', 'C')
AND Test_Result.Test_Code IN ('K', 'NA', 'CREAT','CRE', 'UREA', 'CL', 'BILI','TBIL', 'ALP', 'ALP1', 'ALT', 'AST', 'GGT', 'ALB', 'LDH', 'LDH1','TP', 'TPROT','TSH', 'TSH1', 'FT4', 'FT4A', 'FT3','FT3A','VITDA', 'VITD', 'VITDT', 'CRP', 'CK','FER', 'FER2','B12', 'B12A', 'B12', 'PTH', 'PTH1', 'PTH2', 'PTH3', 'PTH4', 'PTH5', 'PTH6', 'PTHA', 'CA','GL', 'GLUF', 'GLUC', 'MALB', 'ACR', 'ACR1', 'UTP')
GROUP BY
Ref_Location.Location_Group_Code, Location, Test_Result.Test_Code