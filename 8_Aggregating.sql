-- AGGREGATES

SELECT *
    From Country

SELECT COUNT(*)
    FROM Country;

-- Group by clause sorts first then counts is applied after
SELECT CONVERT(char,Region), COUNT(*)
    FROM Country
    GROUP BY CONVERT(char,Region);

SELECT CONVERT(char,Region), COUNT(*) AS Count
    FROM Country
    GROUP BY CONVERT(char,Region)
    ORDER BY Count, CONVERT(char,Region) DESC

SELECT *
    FROM album;

SELECT *
    FROM track;



select Table_name,DATA_TYPE,COLUMN_NAME
    FROM  INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME ='track'

select Table_name,DATA_TYPE,COLUMN_NAME
    FROM  INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME ='album'

-- Joining an aggregate table

SELECT CONVERT(Varchar,a.title) AS Album, COUNT(t.track_number) AS Tracks
    FROM track AS t 
    JOIN album AS a
        ON a.id = t.album_id
    GROUP BY CONVERT(Varchar,a.title)
    ORDER BY Tracks DESC, CONVERT(Varchar,a.title)

-- Good to use HAVING, because even if this filter can be done using the WHERE, we might to use WHERE again
GO
SELECT CONVERT(Varchar,a.title) AS Album, COUNT(t.track_number) AS Tracks
    FROM track AS t 
    JOIN album AS a
        ON a.id = t.album_id
    GROUP BY CONVERT(Varchar,a.title)
    HAVING COUNT(t.track_number) >= 10
    ORDER BY Tracks DESC, CONVERT(Varchar,a.title)
GO


-- Using both WHERE and HAVING
-- USE WHERE before GROUPBY and HAVING AFTER GROUPBY
-- HAVING is for AGGREGRATED DATA, WHERE IS NOT

-- Need to Groupby each other column.
GO
SELECT CONVERT(varchar,a.artist) AS Artist, CONVERT(Varchar,a.title) AS Album, COUNT(t.track_number) AS Tracks
    FROM track AS t 
    JOIN album AS a
        ON a.id = t.album_id
    WHERE CONVERT(varchar,a.artist) = 'The Beatles'
    GROUP BY CONVERT(Varchar,a.title), CONVERT(varchar,a.artist)
    HAVING COUNT(t.track_number) >= 10
    ORDER BY Tracks DESC, CONVERT(Varchar,a.title) 
GO

-- Count work in the following ways, we can specify all, columns, DISTINCT values, average
GO
SELECT COUNT(*)
    FROM Country;

SELECT COUNT(Population)
    FROM Country;

SELECT Population
    FROM Country;

SELECT COUNT(DISTINCT CONVERT(varchar,HeadOfState))
    FROM Country;
GO