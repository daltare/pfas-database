/*
NOTE: This query is automatically generated using the dbplyr R package, 
from code contained in the 01_create_PFAS_duckdb_database.qmd file.
*/

CREATE VIEW exceedance_report_all_thresholds AS
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
    SELECT
      q01.*,
      CASE
WHEN ((Response_Level IS NULL)) THEN 'No'
WHEN (Result > Response_Level) THEN 'Yes'
WHEN (Result < Response_Level) THEN 'No'
ELSE NULL
END AS Response_Level_Exceedance
    FROM (
      SELECT
        q01.*,
        CASE
WHEN ((Notification_Level IS NULL)) THEN 'No'
WHEN (Result > Notification_Level) THEN 'Yes'
WHEN (Result < Notification_Level) THEN 'No'
ELSE NULL
END AS Notification_Level_Exceedance
      FROM (
        SELECT
          q01.*,
          CASE
WHEN ((Consumer_Confidence_Report_Detection_Level IS NULL)) THEN 'No'
WHEN (Result > Consumer_Confidence_Report_Detection_Level) THEN 'Yes'
WHEN (Result < Consumer_Confidence_Report_Detection_Level) THEN 'No'
ELSE NULL
END AS Consumer_Confidence_Report_Detection_Level_Exceedance
        FROM (
          SELECT
            q01.*,
            CASE
WHEN ((Public_Health_Goal IS NULL)) THEN 'No'
WHEN (Result > Public_Health_Goal) THEN 'Yes'
WHEN (Result < Public_Health_Goal) THEN 'No'
ELSE NULL
END AS Public_Health_Goal_Exceedance
          FROM (
            SELECT
              LHS.*,
              Public_Health_Goal,
              Consumer_Confidence_Report_Detection_Level,
              Notification_Level,
              Response_Level
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
            INNER JOIN PFAS_thresholds
              ON (LHS.Analyte_Name = PFAS_thresholds.Analyte_Name)
          ) q01
        ) q01
      ) q01
    ) q01
  ) q01
  WHERE (Public_Health_Goal_Exceedance = 'Yes' OR Consumer_Confidence_Report_Detection_Level_Exceedance = 'Yes' OR Notification_Level_Exceedance = 'Yes' OR Response_Level_Exceedance = 'Yes')
) LHS
LEFT JOIN well_list
  ON (LHS.PS_Code = well_list.PS_Code)
