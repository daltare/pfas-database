CREATE VIEW exceedance_report_CCRDL AS SELECT 
targeted_analysis.Lab_Sample_ID, 
targeted_analysis.PS_Code, 
targeted_analysis.Collection_Date,
targeted_analysis.Collection_Time,
targeted_analysis.Analyte_Name, 
targeted_analysis.Result, 
targeted_analysis.Result_Units, 
PFAS_thresholds.Consumer_Confidence_Report_Detection_Level, 
IIf((CDbl([Result])>CDbl([Consumer_Confidence_Report_Detection_Level]))<0,'Yes','No') AS Exceedence_YesNo
FROM PFAS_thresholds 
INNER JOIN targeted_analysis ON PFAS_thresholds.[Analyte_Name] = targeted_analysis.[Analyte_Name]
WHERE (((targeted_analysis.Result)<>'ND') 
AND ((PFAS_thresholds.Consumer_Confidence_Report_Detection_Level) Is Not Null) 
AND ((IIf((CDbl([Result])>CDbl([Consumer_Confidence_Report_Detection_Level]))<0,'Yes','No'))='Yes'));
