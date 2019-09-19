-- Deleting Rows and data from an existing table
-- DELETING ROWS are hard to recover.

SELECT * 
    FROM chapter3Test;

-- DELETING rows with specific parameters
DELETE 
    FROM chapter3Test
    WHERE a = 3;

SELECT *
    FROM chapter3Test;

SELECT *
    FROM chapter3Test
    WHERE a = 1;

-- Can delete multiple rows
DELETE 
    FROM chapter3Test
    WHERE a =1;

SELECT *
    FROM chapter3Test    
