CREATE DATABASE IF NOT EXISTS BrightMartDB;
USE BrightMartDB;

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(200)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL UNIQUE,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock_Quantity INT NOT NULL CHECK (Stock_Quantity >= 0),

    CONSTRAINT fk_product_category
    FOREIGN KEY (Category_ID)
    REFERENCES Category(Category_ID)
);

INSERT INTO Category (Category_Name, Description)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Mobiles', 'Smartphones and mobile accessories'),
('Laptops', 'Laptops and computer devices'),
('Home Appliances', 'Appliances for home use'),
('Fashion', 'Clothing and fashion products');

INSERT INTO Product
(Product_Name, Category_ID, Price, Stock_Quantity)
VALUES
('Wireless Mouse', 1, 599.00, 50),
('Bluetooth Speaker', 1, 1499.00, 30),
('USB Keyboard', 1, 799.00, 40),

('Samsung Galaxy M15', 2, 13999.00, 25),
('Redmi Note 14', 2, 15999.00, 20),

('HP Laptop 15', 3, 54999.00, 15),
('Dell Inspiron 14', 3, 62999.00, 10),
('Lenovo IdeaPad 3', 3, 48999.00, 12),

('LG Washing Machine', 4, 32999.00, 8),
('Samsung Refrigerator', 4, 45999.00, 6),

('Men T-Shirt', 5, 799.00, 60),
('Women Jeans', 5, 1299.00, 45);

SELECT * FROM Category;

SELECT * FROM Product;
SELECT Product_Name, Price, Stock_Quantity
FROM Product;


INSERT INTO Product
(Product_Name, Category_ID, Price, Stock_Quantity)
VALUES
('Smart Watch', 1, 2999.00, 25);

SELECT * FROM Product
WHERE Product_Name = 'Smart Watch';


UPDATE Product
SET Price = 2799.00,
    Stock_Quantity = 30
WHERE Product_Name = 'Smart Watch';

SELECT * FROM Product
WHERE Product_Name = 'Smart Watch';


DELETE FROM Product
WHERE Product_Name = 'Smart Watch';

-- Check deleted record
SELECT * FROM Product
WHERE Product_Name = 'Smart Watch';


SELECT
    c.Category_Name,
    p.Product_Name,
    p.Price,
    p.Stock_Quantity
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
ORDER BY c.Category_Name;

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Product_Count
FROM Category c
LEFT JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name;

SELECT
    Product_Name,
    Price
FROM Product
WHERE Price = (
    SELECT MAX(Price)
    FROM Product
);

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Product_Count
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name
HAVING COUNT(p.Product_ID) > 5;

SELECT
    AVG(Price) AS Average_Product_Price
FROM Product;

SELECT
    c.Category_Name,
    AVG(p.Price) AS Average_Price
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name;

SELECT
    p.Product_ID,
    p.Product_Name,
    c.Category_Name,
    p.Price,
    p.Stock_Quantity
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID;

SELECT
    Product_Name,
    Price
FROM Product
WHERE Price > 10000;

SELECT
    Product_Name,
    Stock_Quantity
FROM Product
WHERE Stock_Quantity < 10;