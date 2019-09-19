
SELECT * 
    FROM country

-- WHERE clause takes a boolean expression
SELECT Name, Continent, Population 
    FROM Country
    WHERE Population < 100000 
    ORDER BY Population DESC


-- WHERE clause can take also OR and AND boolean expressions
SELECT Name, Continent, Population 
    FROM Country
    WHERE Population < 100000 AND Convert(Varchar(max),Continent) = ('Oceania')
    ORDER BY Population DESC

-- Wildcard (LIKE OPERATOR): any word starting with *island* gets picked out
SELECT Name, Continent, Population
    FROM Country
    WHERE Convert(Varchar(max),Name) LIKE ('%island%')
    ORDER BY Convert(Varchar(max),Name);

-- Wildcard: any word starting with *island gets picked out
SELECT Name, Continent, Population
    FROM Country
    WHERE Convert(Varchar(max),Name) LIKE ('%island')
    ORDER BY Convert(Varchar(max),Name);

-- Wildcard Second letter is a
SELECT Name, Continent, Population
    FROM Country
    WHERE Convert(Varchar(max),Name) LIKE ('_a%')
    ORDER BY Convert(Varchar(max),Name);


--Wildcard (IN OPERATOR)
SELECT Name, Continent, Population
    FROM Country
    WHERE Convert(Varchar(max),Continent) IN ('Europe', 'Asia');
    