CREATE VIEW exceedance_report_response_level AS SELECT 
targeted_analysis.Lab_Sample_ID, 
targeted_analysis.State_Sample_ID, 
targeted_analysis.Batch, 
targeted_analysis.Sample_Type,
targeted_analysis.Collection_Date,
targeted_analysis.Collection_Time,
targeted_analysis.Analyte_Name, 
targeted_analysis.Result, 
targeted_analysis.Result_Units, 
PFAS_thresholds.Response_Level, 
IIf((CDbl([Result])>CDbl([Response_Level]))<0,'Yes','No') AS Exceedence_YesNo,
well_list.PWS_water_system_name, 
well_list.Well_facility_name, 
targeted_analysis.DB_Upload_DateTime
FROM well_list INNER JOIN (
  PFAS_thresholds INNER JOIN 
  targeted_analysis ON PFAS_thresholds.[Analyte_Name] = targeted_analysis.[Analyte_Name]
  ) 
  ON well_list.PS_Code = targeted_analysis.PS_Code
WHERE (
((targeted_analysis.Sample_Type)<>'LCS' 
    And (targeted_analysis.Sample_Type)<>'MS' 
    And (targeted_analysis.Sample_Type)<>'MSD') 
AND ((targeted_analysis.Result)<>'ND')
AND ((targeted_analysis.Result)<>'ND') 
AND ((PFAS_thresholds.Response_Level) Is Not Null) 
AND ((IIf((CDbl([Result])>CDbl([Response_Level]))<0,'Yes','No'))='Yes')
);
