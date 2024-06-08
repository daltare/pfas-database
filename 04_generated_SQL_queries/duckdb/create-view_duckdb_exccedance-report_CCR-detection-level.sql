/*
NOTE: This query is automatically generated using the dbplyr R package, 
from code contained in the 01_create_PFAS_duckdb_database.qmd file.
*/

CREATE VIEW CCR_detection_level AS
SELECT
  LHS.*,
  PWSID,
  PWS_water_system_name,
  PWS_County,
  PWS_population,
  PWS_DAC_satus_for_2023,
  PWS_number_service_connection,
  Regulating_Agency,
  Well_facility_name,
  Well_Latitude,
  Well_Longitude,
  Well_elevation_in_ft_msl,
  Well_casing_diameter_in_inches,
  Well_top_of_screen_in_ft_bgs,
  Well_screen_length_in_ft,
  NTA_preselected_Locations,
  Previous_Order,
  ActivityStatus,
  Removed,
  Added,
  Updated,
  Changelog
FROM (
  SELECT q01.*
  FROM (
    SELECT LHS.*, Consumer_Confidence_Report_Detection_Level
    FROM (
      SELECT
        PS_Code,
        Lab_Sample_ID,
        Batch,
        Analyte_Name,
        Collection_Date,
        Collection_Date_Formatted,
        Collection_DateTime_Formatted,
        Analysis_Start_DateTime_Formatted,
        Analysis_Complete_DateTime_Formatted,
        CAST(Result AS NUMERIC) AS Result,
        Result_Units
      FROM (
        SELECT
          PS_Code,
          Lab_Sample_ID,
          Batch,
          Analyte_Name,
          Collection_Date,
          Collection_Date_Formatted,
          Collection_DateTime_Formatted,
          Analysis_Start_DateTime_Formatted,
          Analysis_Complete_DateTime_Formatted,
          CASE WHEN (Result = 'ND') THEN '0' WHEN NOT (Result = 'ND') THEN Result END AS Result,
          Result_Units
        FROM targeted_analysis
      ) q01
    ) LHS
    INNER JOIN (
      SELECT Analyte_Name, Consumer_Confidence_Report_Detection_Level
      FROM PFAS_thresholds
      WHERE (NOT(('Consumer_Confidence_Report_Detection_Level' IS NULL)))
    ) RHS
      ON (LHS.Analyte_Name = RHS.Analyte_Name)
  ) q01
  WHERE (Result > 'Consumer_Confidence_Report_Detection_Level')
) LHS
LEFT JOIN well_list
  ON (LHS.PS_Code = well_list.PS_Code)
