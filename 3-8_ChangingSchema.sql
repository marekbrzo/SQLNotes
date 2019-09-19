-- ALTERING EXISITNG TABLES
-- ALTER is a powerful tool, becarful when using it

DROP TABLE IF EXISTS chapter3testSchema
CREATE TABLE chapter3testSchema(
    a TEXT,
    b TEXT,
    c TEXT
);

INSERT INTO chapter3testSchema
    VALUES ('one', 'two', 'three');
INSERT INTO chapter3testSchema
    VALUES ('two', 'three', 'four');
INSERT INTO chapter3testSchema
    VALUES ('three','four','five');

SELECT *
    FROM chapter3testSchema;

-- Altering exisiting table
ALTER TABLE chapter3testSchema 
    ADD d TEXT;

SELECT *
    FROM chapter3testSchema;

-- Altering table with default value.
ALTER TABLE chapter3testSchema 
    ADD e TEXT 
    NOT NULL DEFAULT ('panda')

SELECT *
    FROM chapter3testSchema
