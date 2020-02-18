USE [BDA 103]

-- Changing the table names
-- exec sp_rename '[BDA 103].[dbo].[1Expanded_sales]', 'sales'; 
-- exec sp_rename '[BDA 103].[dbo].[2Expanded_clients]', 'clients';
-- exec sp_rename '[BDA 103].[dbo].[Expanded_zip_code_database]', 'zip_code';



-- exec sp_rename 'clients.column1', 'Client_ID', 'COLUMN';
-- exec sp_rename 'clients.[Column2]', 'Name', 'COLUMN';
-- exec sp_rename 'clients.[Column3]', 'Symbol', 'COLUMN';
-- exec sp_rename 'clients.[Column4]', 'Last_Sale', 'COLUMN';
-- exec sp_rename 'clients.[Column5]', 'Market_Cap', 'COLUMN';
-- exec sp_rename 'clients.[Column6]', 'Cap_Float', 'COLUMN';
-- exec sp_rename 'clients.[Column7]', 'IPO_Year', 'COLUMN';
-- exec sp_rename 'clients.[Column8]', 'Sector', 'COLUMN';
-- exec sp_rename 'clients.[Column9]', 'Industry', 'COLUMN';
-- exec sp_rename 'clients.[Column10]', 'URL', 'COLUMN';

SELECT *
    FROM [BDA 103].[dbo].[clients];


-- Converting datatype to float for 'Cap_Float' column. Can be done also by using SQL Management by 1.right-clicking datatable
-- GO

ALTER TABLE clients
    ALTER COLUMN Cap_Float float
    -- Error converting data type nvarchar to float. 
GO

-- Find non numeric values
GO
SELECT *
    FROM clients
    WHERE ISNUMERIC(Cap_Float) = 0;
    Error while sum


GO
SELECT SUM(Cap_Float)
    FROM clients;

    --Operand data type nvarchar is invalid for sum operator.  

-- Replacing 'n/a' with 0 from 'Cap_Float' column
GO
UPDATE clients
    SET Cap_Float = 0
    WHERE Cap_Float ='#VALUE!'


-- Converting datatype to INT for 'Last_Sale' column. Can be done also by using SQL Management by 1.right-clicking datatable
-- GO
ALTER TABLE clients
    ALTER COLUMN Last_Sale DECIMAL
GO


SELECT *
    FROM clients
    WHERE ISNUMERIC(Last_Sale) = 0;

GO
UPDATE clients
    SET Last_sale = 0
    WHERE Last_Sale ='n/a'

ALTER TABLE clients
    ALTER COLUMN Last_Sale DECIMAL
GO

-- Changing IPO into INT datatype
ALTER TABLE clients
    ALTER COLUMN IPO_Year INT
GO

SELECT *
    FROM dbo.clients
    WHERE ISNUMERIC(IPO_Year) = 0;

GO
UPDATE clients
    SET IPO_Year = NULL
    WHERE IPO_Year ='n/a'

ALTER TABLE clients
    ALTER COLUMN IPO_Year INT
GO

SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'clients';

GO
CREATE TABLE clients_assignment2 AS
    SELECT Client_ID,Name,Symbol,Last_Sale,Market_Cap,Cap_Float,IPO_Year,Sector,Industry,URL
        FROM clients;


-- Create dummy table to finishing play with 
SELECT *
Into sales_assignment2
    FROM sales

SELECT *
    From sales_assignment2

-- Null orderID find
SELECT *
    FROM sales_assignment2
    WHERE stage_sales_orderid = NULL;

-- Delete rows from table 'TableName'
DELETE FROM sales_assignment2
WHERE stage_sales_orderid = NULL;
GO

--Replace Nulls with 9999-12-31 in OrderDate
SELECT *
    FROM sales_assignment2
    WHERE stage_sales_orderdate = NULL;

UPDATE sales_assignment2
SET
    stage_sales_orderdate = '9999-12-31'
WHERE 	stage_sales_orderdate = NULL
GO

GO
UPDATE sales_assignment2
    SET IPO_Year = NULL
    WHERE stage_sales_orderid =NULL

-- Null Product Keys Replaced with #Unknown
SELECT *
    FROM sales_assignment2
    WHERE stage_sales_productkey = NULL


-- Joining of two tables
SELECT *
    FROM sales_assignment2
    LEFT JOIN clients ON Client_ID = stage_sales_rowid
    ORDER BY stage_sales_rowid asc;


-- Part 2 from additional information
SELECT Client_ID, Name, stage_sales_companyname, COUNT(1)
    FROM sales, clients
    WHERE stage_sales_companyname = name
    GROUP BY Client_ID, name, stage_sales_companyname
    ORDER BY COUNT(1)desc;
