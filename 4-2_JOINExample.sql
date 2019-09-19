-- Examples of joining

DROP TABLE IF EXISTS leftJOIN;
DROP TABLE IF EXISTS rightJOIN;

CREATE TABLE leftJOIN(
    id INTEGER,
    DESCRIPTION TEXT
);
CREATE TABLE rightJOIN(
    id INTEGER,
    DESCRIPTION TEXT
);

INSERT INTO leftJOIN
    VALUES(1, 'left 01');
INSERT INTO leftJOIN
    VALUES(2, 'left 02');
INSERT INTO leftJOIN
    VALUES(3, 'left 03');
INSERT INTO leftJOIN
    VALUES(4, 'left 04');
INSERT INTO leftJOIN
    VALUES(5, 'left 05');
INSERT INTO leftJOIN
    VALUES(6, 'left 06');
INSERT INTO leftJOIN
    VALUES(7, 'left 07');
INSERT INTO leftJOIN
    VALUES(8, 'left 08');
INSERT INTO leftJOIN
    VALUES(9, 'left 09');

INSERT INTO rightJOIN
    VALUES(1, 'right 01');
INSERT INTO rightJOIN
    VALUES(2, 'right 02');
INSERT INTO rightJOIN
    VALUES(3, 'right 03');
INSERT INTO rightJOIN
    VALUES(4, 'right 04');
INSERT INTO rightJOIN
    VALUES(5, 'right 05');
INSERT INTO rightJOIN
    VALUES(6, 'right 06');
INSERT INTO rightJOIN
    VALUES(7, 'right 07');
INSERT INTO rightJOIN
    VALUES(8, 'right 08');
INSERT INTO rightJOIN
    VALUES(9, 'right 09');
INSERT INTO rightJOIN
    VALUES(10, 'right 10');
INSERT INTO rightJOIN
    VALUES(11, 'right 11');
INSERT INTO rightJOIN
    VALUES(12, 'right 12');
INSERT INTO rightJOIN
    VALUES(13, 'right 13');
INSERT INTO rightJOIN
    VALUES(14, 'right 14');

SELECT * 
    FROM leftJOIN;

SELECT *
    FROM rightJOIN;
    
-- Joining the right table on the right side of the left table, linking the ids together
SELECT l.DESCRIPTION AS leftJOIN, r.DESCRIPTION AS rightJOIN
    FROM leftJOIN AS l
    JOIN rightJOIN AS r ON l.id = r.id
;

DROP TABLE IF EXISTS leftJOIN;
DROP TABLE IF EXISTS rightJoin;

SELECT *
    FROM sale;
SELECT *
    FROM item;

SELECT s.id AS sale, i.name, s.price
    FROM sale AS s
    JOIN item AS i ON s.item_id = i.id
;