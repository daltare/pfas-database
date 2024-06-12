CREATE VIEW upload_report_targeted AS SELECT DB_Upload_DateTime, Batch, COUNT(*) AS Number_Of_Records
FROM targeted_analysis
GROUP BY DB_Upload_DateTime, Batch
