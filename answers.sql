-- Answer to QUESTION 1
-- Step 1: Create the ProductDetail table
CREATE TABLE ProductDetail (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Step 2: Insert each product separately
INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Mouse');

INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Mouse');

INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES (103, 'Emily Clark', 'Phone');


-- ANSWER TO QUESTION 2
-- Step 1: Create Orders table (removes partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Step 2: Create OrderDetails table (ensures each non-key attribute depends on full primary key)
CREATE TABLE OrderDetails (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES (101, 'John Doe');
INSERT INTO Orders (OrderID, CustomerName) VALUES (102, 'Jane Smith');
INSERT INTO Orders (OrderID, CustomerName) VALUES (103, 'Emily Clark');

-- Step 4: Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES (101, 'Laptop', 2);
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES (101, 'Mouse', 1);
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES (102, 'Tablet', 3);
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES (102, 'Mouse', 2);
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES (103, 'Phone', 1);