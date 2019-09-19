-- Muliple ways af acquiring Time and Date

-- Getting current system date and time 
SELECT SYSDATETIME()  AS 'Current System Date and Time' 

    -- ,SYSDATETIMEOFFSET()  
    -- ,SYSUTCDATETIME()  
    -- ,CURRENT_TIMESTAMP  
    -- ,GETDATE()  
    -- ,GETUTCDATE();  

-- Getting current system date only
SELECT CONVERT (date, SYSDATETIME()) AS "Current System Date Only"  
-- Method 2
select convert(date, getdate(), 1) AS "Method 2 Data"  

-- Method 3 
select convert(varchar(10), GETDATE(), 108) AS 'Method 3 Date'

-- Method 4
select cast(getdate() as date) AS 'Method 4 Date'

-- Additional date arguments
    -- ,CONVERT (date, SYSDATETIMEOFFSET())  
    -- ,CONVERT (date, SYSUTCDATETIME())  
    -- ,CONVERT (date, CURRENT_TIMESTAMP)  
    -- ,CONVERT (date, GETDATE())  
    -- ,CONVERT (date, GETUTCDATE());

-- Getting current time only
SELECT CONVERT (time(0), SYSDATETIME())  AS "Current System Time Only"
-- Method 2: Using getutcdate to recieve time in UTC
select convert(time, getutcdate(), 1) AS "Current UTC Time Only"

-- Additional Time arguments
    -- ,CONVERT (time, SYSDATETIMEOFFSET())  
    -- ,CONVERT (time, SYSUTCDATETIME())  
    -- ,CONVERT (time, CURRENT_TIMESTAMP)  
    -- ,CONVERT (time, GETDATE())  
    -- ,CONVERT (time, GETUTCDATE());  




-- EXTRA Information

-- SQL Lite
-- SELECT DATE('now');
-- SELECT TIME('now');
-- SELECT DATETIME('now', '+1 day');
-- SELECT DATETIME('now', '+3 days');
-- SELECT DATETIME('now', '-1 month');
-- SELECT DATETIME('now', '+1 year');
-- SELECT DATETIME('now', '+3 hours', '+27 minutes', '-1 day', '+3 years');



--   The following are examples of adding timestamps to the data entry. You use the ROWVERSION argument
--   DROP TABLE IF EXISTS statess
--   CREATE TABLE statess
--   (
--      id CHAR(2),
--      name VARCHAR(90),
--      rv ROWVERSION
--   );
 
--   -- Second table with ROWVERSION column
--   DROP TABLE IF EXISTS citiess
--   CREATE TABLE citiess
--   (
--      name VARCHAR(90),
--      state CHAR(2),
--      rv ROWVERSION
--   );
 
--   INSERT INTO statess (id, name) VALUES ('CA', 'California');
--   INSERT INTO citiess (name, state) VALUES ('San Mateo', 'CA');

-- SELECT *
--     From statess
-- SELECT *
--     FROM citiess

--   DROP TABLE IF EXISTS statess
--   DROP TABLE IF EXISTS citiess 