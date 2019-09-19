-- NULL VALUE
-- NULL is a special state in SQL not a specific value, more a lack of a number
-- TO test for NULL we need to use a special case

SELECT *
    FROM chapter3Test;

-- Looking for NULL
SELECT *
    FROM chapter3Test
    WHERE a IS NULL;

-- Looking for not NULL
SELECT *
    FROM chapter3Test
    WHERE a is NOT NULL;

-- Testing no values from zeros and blanks.
INSERT INTO chapter3Test
    VALUES (0, NULL, '');

SELECT *
    FROM chapter3Test;

-- Only NULL is NULL, everything is not NULL
SELECT *
    FROM chapter3Test
    WHERE c is NULL;

-- WE can create tables that will not accept NULLs in columns
DROP TABLE IF EXISTS chapter3TestNull
CREATE TABLE chapter3TestNull (
    a INTEGER NOT NULL,
    b TEXT NOT NULL,
    c TEXT
)

INSERT INTO chapter3TestNull
    VALUES ( 1, 'this', 'that')

SELECT * 
    FROM chapter3TestNull;

-- The following command will create an error because it cannot accept NULLs in that column
GO
INSERT INTO chapter3TestNull
    (b,c) VALUES ( 'this', 'that')    
GO

-- However this will work
GO
INSERT INTO chapter3TestNull
    (a,b) VALUES ( 1, 'two')    
GO

SELECT * 
    FROM chapter3TestNull