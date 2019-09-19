-- Triggers are important, they can be used as RULES to implement something when another Table has been modified.
-- WE can also make a timestamp table plus, a log book
DROP TABLE IF EXISTS widgetCustomer;

CREATE TABLE widgetCustomer(
    id INTEGER NOT NULL IDENTITY PRIMARY KEY,
    name TEXT,
    last_order_id INT
);

DROP TABLE IF EXISTS widgetSale;

CREATE TABLE widgetSale(
    id INTEGER NOT NULL IDENTITY PRIMARY KEY,
    item_id INT,
    customer_id INT,
    quant INT,
    price INT
);

INSERT INTO widgetCustomer
    (name) VALUES ('BOB');
INSERT INTO widgetCustomer
    (name) VALUES ('SALLY');
INSERT INTO widgetCustomer
    (name) VALUES ('FRED');

SELECT * 
    FROM widgetCustomer


-- Creating a trigger to join two columns together after one has been updated
GO
CREATE TRIGGER newWidgetSale 
    ON widgetSale
    AFTER INSERT
    AS
        BEGIN;
            UPDATE a 
                SET a.last_order_id = b.customer_id 
                FROM widgetCUSTOMER AS a
                INNER JOIN widgetSale AS b
                ON a.id = b.id
        END;

GO
INSERT INTO widgetSale
    (item_id,customer_id,quant,price) VALUES (1,3,5,1995);
INSERT INTO widgetSale
    (item_id,customer_id,quant,price) VALUES (2,2,3,1495);
INSERT INTO widgetSale
    (item_id,customer_id,quant,price) VALUES (3,1,1,2995);

SELECT * 
    FROM widgetSale;
SELECT *
    FROM widgetCustomer;


DROP TABLE IF EXISTS widgetCustomer;
DROP TABLE IF EXISTS widgetSale;

-- -- Triggers can be used to prevent Transactions from completing, by using the RAISE clause in SQL lite, but MSSQL it is different using both rollback and RAISEERROR
-- DROP TABLE IF EXISTS widgetSale;

-- CREATE TABLE widgetSale ( id integer IDENTITY primary key, item_id INT, customer_id INTEGER, quan INT, price INT,
--     reconciled INT );
-- INSERT INTO widgetSale (item_id, customer_id, quan, price, reconciled) VALUES (1, 3, 5, 1995, 0);
-- INSERT INTO widgetSale (item_id, customer_id, quan, price, reconciled) VALUES (2, 2, 3, 1495, 1);
-- INSERT INTO widgetSale (item_id, customer_id, quan, price, reconciled) VALUES (3, 1, 1, 2995, 0);
-- SELECT * FROM widgetSale;

-- GO
-- CREATE TRIGGER updateWidgetSale 
--     ON widgetSale 
--     FOR UPDATE
--     AS
--         BEGIN TRY;
--             Return CAST( 'cannot update table "widgetSale"') FROM widgetSale
--             WHERE id = NEW.id AND reconciled = 1;
--         END
-- ;

-- GO
-- BEGIN TRANSACTION;
-- UPDATE widgetSale SET quan = 9 WHERE id = 2;
-- COMMIT;

-- SELECT * FROM widgetSale;
-- DROP TABLE IF EXISTS widgetCustomer;
-- DROP TABLE IF EXISTS widgetSale;



-- EXAMPLE OF HOW IT COULD BE ACHIEVED
-- BEGIN TRY
--     BEGIN TRANSACTION

--         INSERT INTO myTable (myColumns ...) VALUES (myValues ...);
--         INSERT INTO myTable (myColumns ...) VALUES (myValues ...);
--         INSERT INTO myTable (myColumns ...) VALUES (myValues ...);

--     COMMIT TRAN -- Transaction Success!
-- END TRY
-- BEGIN CATCH
--     IF @@TRANCOUNT > 0
--         ROLLBACK TRAN --RollBack in case of Error

--     -- you can Raise ERROR with RAISEERROR() Statement including the details of the exception
--     RAISERROR(ERROR_MESSAGE(), ERROR_SEVERITY(), 1)
-- END CATCH



-- ANOTHER EXAMPLE NESTED
-- CREATE
-- --ALTER
-- TRIGGER [dbo].[Customer_Insert_Trigger_Test] 
--    ON  [dbo].[Inserts]
--    AFTER INSERT
-- AS 
-- BEGIN
-- SET NOCOUNT ON;
-- SET XACT_ABORT OFF;

-- BEGIN TRY
--     PRINT '@@TRANCOUNT = ' + CONVERT(VARCHAR(10), @@TRANCOUNT); -- for debug only
--     SAVE TRANSACTION InsertSaveHere;

--     --Simulating error situation
--         RAISERROR (N'This is message %s %d.', -- Message text.
--           11, -- Severity,
--           1, -- State,
--           N'number', -- First argument.
--           5); -- Second argument.

--    --Insert into Archive select * from Inserted;
-- END TRY
-- BEGIN CATCH
--     PRINT 'Entering CATCH block...'; -- for debug only
--     ROLLBACK TRANSACTION InsertSaveHere;
-- END CATCH;

-- END;

