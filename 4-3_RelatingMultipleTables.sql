--  Joining multiple columns together
 SELECT *
    FROM customer;
SELECT *
    FROM item;
SELECT *
    FROM sale;

SELECT i.name AS Item, c.name AS Customer, s.price AS Price
    FROM sale AS s
    JOIN item AS i ON s.item_id = i.id
    JOIN customer as c ON s.customer_id = c.id
    --ORDER BY Convert(Varchar(max),customer) --, CONVERT(varchar(max), item);
    ORDER BY convert(varchar(max), 'customer'), convert(varchar(max), 'item')


SELECT c.name AS Customer, c.zip, i.name AS Item, i.description, s.quantity AS Quantity, s.price AS Price
    FROM customer AS c
    LEFT JOIN sale AS s ON s.customer_id = c.id
    LEFT JOIN item AS i ON s.item_id = i.id
    ORDER BY convert(varchar(max), 'customer'), convert(varchar(max), 'item')