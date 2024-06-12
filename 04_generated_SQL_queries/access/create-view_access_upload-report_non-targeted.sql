CREATE VIEW upload_report_non_targeted AS SELECT DB_Upload_DateTime, Batch, COUNT(*) AS Number_Of_Records
FROM non_targeted_analysis
GROUP BY DB_Upload_DateTime, Batch
