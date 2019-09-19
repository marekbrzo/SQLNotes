-- WE WILL BE UPDATING THE TABLE

GO
SELECT *
    FROM customer;
GO

-- Time to update by filling in the nulls
UPDATE customer 
    SET address = '123 Musics Avenue', zip = '98056'
WHERE id = 5;

GO
SELECT *
    FROM customer;
GO

-- We can keep on updating over existing values as long as we include the id
UPDATE customer
    SET address = '2603 S Washington St', zip = '98056'
WHERE id = 5

GO
SELECT *
    FROM customer;
GO

-- WE can also update the values back to NULL
UPDATE customer
    SET address = NULL, zip = NULL
WHERE id =5

GO
SELECT *
    FROM customer;
GO