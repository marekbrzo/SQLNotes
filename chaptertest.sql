SELECT @@VERSION

GO
SELECT *
FROM dbo.Products

GO

GO
SELECT *
FROM dbo.Products
ORDER BY ProductID
GO

GO
SELECT *
FROM dbo.Products
ORDER BY ProductID
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY
GO