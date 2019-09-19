
DROP TABLE IF EXISTS dbo.Products;

CREATE TABLE dbo.Products  
   (ProductID int PRIMARY KEY NOT NULL,  
   ProductName varchar(25) NOT NULL,  
   Price money NULL,  
   ProductDescription text NULL)  
GO

INSERT dbo.Products (ProductID, ProductName, Price, ProductDescription)  
    VALUES (1, 'Clamp', 12.48, 'Workbench clamp')  
GO 
INSERT dbo.Products (ProductName, ProductID, Price, ProductDescription)  
    VALUES ('Screwdriver', 50, 3.17, 'Flat head')  
GO  


INSERT dbo.Products  
    VALUES (75, 'Tire Bar', NULL, 'Tool fo12r changing tires.')  
GO  

INSERT dbo.Products (ProductID, ProductName, Price, ProductDescription)  
    VALUES (4, 'C2lamp', 12.28, 'Workbenc23h clamp')  
GO 
INSERT dbo.Products (ProductName, ProductID, Price, ProductDescription)  
    VALUES ('Screw3driver', 12, 1.17, 'Fl23t head')  
GO  


INSERT dbo.Products  
    VALUES (8, 'Tire31 Bar', NULL, 'Tool 34for changing tires.')  
GO