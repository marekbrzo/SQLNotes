-- Transactions, are many actions performed in sequence and there if there is a failure it reverts th action just performed
-- Can be used with multiple ppl access the account.
-- Transactions can improve performance

DROP TABLE IF EXISTS widgetInventory
CREATE TABLE widgetInventory(
    id INTEGER IDENTITY PRIMARY KEY,
    descri TEXT,
    onhand INTEGER NOT NULL
);

DROP TABLE IF EXISTS widgetSale
CREATE TABLE widgetSale(
    id INTEGER NOT NULL IDENTITY PRIMARY KEY,
    inv_id INTEGER,
    quan INTEGER,
    price INTEGER
);

INSERT INTO widgetInventory
    (descri, onhand) VALUES ('rock', 25);
INSERT INTO widgetInventory
    (descri, onhand) VALUES ('paper', 25);
INSERT INTO widgetInventory
    (descri, onhand) VALUES ('scissors', 25);

SELECT *
    FROM widgetInventory;

BEGIN TRANSACTION;
INSERT INTO widgetSale 
    (inv_id,quan,price) VALUES (1,5,500);
UPDATE widgetInventory SET onhand = ( onhand -5) WHERE id =1;
COMMIT;

SELECT *
    FROM widgetInventory
SELECT * 
    FROM widgetSale;

BEGIN TRANSACTION;
INSERT INTO widgetInventory
    (descri, onhand) VALUES ('toy',25);
ROLLBACK

SELECT * 
    FROM widgetInventory

DROP TABLE IF EXISTS widgetInventory

-- LETS view the performance improvements Transactions do.
DROP TABLE IF EXISTS performanceTEST
CREATE TABLE performanceTEST(
    id INTEGER NOT NULL IDENTITY PRIMARY KEY,
    info TEXT
);
BEGIN TRANSACTION
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
INSERT INTO performanceTEST
    (info) VALUES ('Even with text this long can be improved by TRANSACTIONS');
COMMIT

-- Without Tranasction 019ms WITH 013ms

DROP TABLE IF EXISTS performanceTEST