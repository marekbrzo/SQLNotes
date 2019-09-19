-- Determining the TYPEOF of variable/parameter
DROP TABLE IF EXISTS chapter6Test
CREATE TABLE chapter6Test(
    a INTEGER,
    b INTEGER
)

-- Determing Data Type
select Table_name,DATA_TYPE,COLUMN_NAME
    FROM  INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME ='chapter6Test'

DROP TABLE chapter6Test;

-- Rounding In SQL
SELECT 2.55555;
SELECT ROUND(2.55555, 3);
SELECT ROUND(2.55555, 0);

