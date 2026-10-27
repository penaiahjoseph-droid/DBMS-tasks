USE BrightMartDB;

DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Seller;
CREATE TABLE Seller (
    Seller_ID INT AUTO_INCREMENT PRIMARY KEY,
    Seller_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Address VARCHAR(200) NOT NULL
);

CREATE TABLE Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Seller_ID INT NOT NULL,
    Stock_Quantity INT NOT NULL CHECK (Stock_Quantity >= 0),
    Stock_Status VARCHAR(20) NOT NULL,
    Last_Updated DATE NOT NULL,

    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID),

    CHECK (Stock_Status IN ('In Stock', 'Out of Stock', 'Low Stock'))
);

INSERT INTO Seller (Seller_Name, Email, Phone, Address)
VALUES
('Ravi Kumar', 'ravi@gmail.com', '9876543210', 'Chennai'),
('Arun Stores', 'arun@gmail.com', '9876543211', 'Vellore'),
('Kumar Traders', 'kumar@gmail.com', '9876543212', 'Bangalore');

INSERT INTO Inventory
(Product_ID, Seller_ID, Stock_Quantity, Stock_Status, Last_Updated)
VALUES
(1, 1, 25, 'In Stock', '2026-09-28'),
(2, 1, 8, 'Low Stock', '2026-09-28'),
(3, 2, 15, 'In Stock', '2026-09-28'),
(4, 2, 0, 'Out of Stock', '2026-09-28'),
(5, 3, 30, 'In Stock', '2026-09-28');

SELECT 
    s.Seller_Name,
    p.Product_Name
FROM Seller s
JOIN Inventory i ON s.Seller_ID = i.Seller_ID
JOIN Product p ON i.Product_ID = p.Product_ID;

SELECT 
    s.Seller_Name,
    COUNT(i.Product_ID) AS Product_Count
FROM Seller s
LEFT JOIN Inventory i ON s.Seller_ID = i.Seller_ID
GROUP BY s.Seller_ID, s.Seller_Name;

UPDATE Seller
SET Phone = '9999999999',
    Address = 'Chennai'
WHERE Seller_ID = 1;

SELECT *
FROM Inventory
WHERE Stock_Quantity > 0;

SELECT *
FROM Inventory
WHERE Stock_Quantity = 0;

SELECT *
FROM Inventory
WHERE Stock_Quantity < 10;

UPDATE Inventory
SET Stock_Quantity = 20,
    Stock_Status = 'In Stock',
    Last_Updated = '2026-09-28'
WHERE Inventory_ID = 1;

DELETE FROM Inventory
WHERE Inventory_ID = 5;

SELECT 
    s.Seller_Name,
    p.Product_Name,
    i.Stock_Quantity
FROM Seller s
JOIN Inventory i ON s.Seller_ID = i.Seller_ID
JOIN Product p ON i.Product_ID = p.Product_ID
ORDER BY s.Seller_Name;

SELECT 
    p.Product_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Product p
JOIN Inventory i ON p.Product_ID = i.Product_ID;

SELECT COUNT(*) AS Total_Available_Products
FROM Inventory
WHERE Stock_Quantity > 0;


SELECT COUNT(*) AS Out_of_Stock_Products
FROM Inventory
WHERE Stock_Quantity = 0;

SELECT 
    p.Product_Name,
    i.Stock_Quantity
FROM Product p
JOIN Inventory i ON p.Product_ID = i.Product_ID
ORDER BY i.Stock_Quantity DESC
LIMIT 1;

SELECT 
    AVG(Stock_Quantity) AS Average_Inventory_Quantity
FROM Inventory;