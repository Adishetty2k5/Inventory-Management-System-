--CREATE TABLE

--Supplier Table
CREATE TABLE Supplier (
    supplier_id   NUMBER PRIMARY KEY,
    name          VARCHAR2(25) NOT NULL,
    phone         VARCHAR2(15),
    email         VARCHAR2(25) UNIQUE,
    address       VARCHAR2(50)
);

--Customer Table
CREATE TABLE Customer (
    customer_id   NUMBER PRIMARY KEY,
    name          VARCHAR(25) NOT NULL,
    phone         VARCHAR(15),
    email         VARCHAR(25) UNIQUE,
    address       VARCHAR(50)
);

--Product Table
CREATE TABLE Product (
    product_id     NUMBER PRIMARY KEY,
    name           VARCHAR(25) NOT NULL,
    category       VARCHAR(25),
    unit_price     NUMBER(10,2) NOT NULL,
    stock_qty      NUMBER NOT NULL,
    reorder_level  NUMBER
);

--Purchase_Order
CREATE TABLE Purchase_Order (
    po_id         NUMBER PRIMARY KEY,
    po_date       DATE NOT NULL,
    supplier_id   NUMBER NOT NULL,
    FOREIGN KEY (supplier_id)
        REFERENCES Supplier(supplier_id)
);

--Purchase_Order_Item
CREATE TABLE Purchase_Order_Item (
    po_id      NUMBER,
    product_id NUMBER,
    quantity   NUMBER,
    unit_cost  NUMBER(10,2),
    PRIMARY KEY (po_id, product_id),
    FOREIGN KEY (po_id)
        REFERENCES Purchase_Order(po_id),
    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);

--Sales_Order
CREATE TABLE Sales_Order (
    so_id       NUMBER PRIMARY KEY,
    so_date     DATE,
    customer_id NUMBER,
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);

--Sales_Order_Item
CREATE TABLE Sales_Order_Item (
    so_id      NUMBER,
    product_id NUMBER,
    quantity   NUMBER,
    unit_price NUMBER(10,2),
    PRIMARY KEY (so_id, product_id),
    FOREIGN KEY (so_id)
        REFERENCES Sales_Order(so_id),
    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);

--INSRERT INTO TABLES

--Supplier
INSERT INTO Supplier VALUES (1, 'ADISHESH', '9876543210', 'adishesh@gmail.com', 'Bangalore');
INSERT INTO Supplier VALUES (2, 'GAGAN', '9123456780', 'gagan@gmail.com', 'Mysore');
INSERT INTO Supplier VALUES (3, 'VINAYAK', '9988776655', 'vinayak@gmail.com', 'Hubli');
INSERT INTO Supplier VALUES (4, 'SURESH', '8899776655', 'suresh@gmail.com', 'Dharwad');
INSERT INTO Supplier VALUES (5, 'SIDDU', '7766554433', 'siddz@gmail.com', 'Belgaum');
INSERT INTO Supplier VALUES (6, 'DARSHAN', '6655443322', 'darshan@gmail.com', 'Udupi');
INSERT INTO Supplier VALUES (7, 'ADITYA', '5544332211', 'aditya@gmail.com', 'Mangalore');

SELECT * FROM SUPPLIER;

--Customer
INSERT INTO Customer VALUES (1, 'Ravi', '9000011111', 'ravi@gmail.com', 'Bangalore');
INSERT INTO Customer VALUES (2, 'Anil', '9000022222', 'anil@gmail.com', 'Mysore');
INSERT INTO Customer VALUES (3, 'Sita', '9000033333', 'sita@gmail.com', 'Hubli');
INSERT INTO Customer VALUES (4, 'Geeta', '9000044444', 'geeta@gmail.com', 'Dharwad');
INSERT INTO Customer VALUES (5, 'Manoj', '9000055555', 'manoj@gmail.com', 'Udupi');
INSERT INTO Customer VALUES (6, 'Rahul', '9000066666', 'rahul@gmail.com', 'Belgaum');
INSERT INTO Customer VALUES (7, 'Neha', '9000077777', 'neha@gmail.com', 'Mangalore');
INSERT INTO Customer VALUES (8, 'Shreya', '9000088888', 'shreya@gmail.com', 'Bangalore');


SELECT * FROM CUSTOMER;

--Product
INSERT INTO Product VALUES (1, 'Laptop', 'Electronics', 50000, 20, 5);
INSERT INTO Product VALUES (2, 'Mouse', 'Electronics', 500, 100, 20);
INSERT INTO Product VALUES (3, 'Keyboard', 'Electronics', 800, 80, 15);
INSERT INTO Product VALUES (4, 'Monitor', 'Electronics', 12000, 25, 5);
INSERT INTO Product VALUES (5, 'Printer', 'Electronics', 15000, 10, 3);
INSERT INTO Product VALUES (6, 'Scanner', 'Electronics', 9000, 8, 2);
INSERT INTO Product VALUES (7, 'Speaker', 'Electronics', 3000, 30, 7);

SELECT * FROM PRODUCT;

--Purchase_Order
INSERT INTO Purchase_Order VALUES (1, DATE '2025-01-01', 1);
INSERT INTO Purchase_Order VALUES (2, DATE '2025-01-02', 2);
INSERT INTO Purchase_Order VALUES (3, DATE '2025-01-03', 3);
INSERT INTO Purchase_Order VALUES (4, DATE '2025-01-04', 4);
INSERT INTO Purchase_Order VALUES (5, DATE '2025-01-05', 5);
INSERT INTO Purchase_Order VALUES (6, DATE '2025-01-06', 6);
INSERT INTO Purchase_Order VALUES (7, DATE '2025-01-07', 7);

SELECT * FROM PURCHASE_ORDER;

--Purchase_Order_Item
INSERT INTO Purchase_Order_Item VALUES (1, 1, 5, 48000);
INSERT INTO Purchase_Order_Item VALUES (2, 2, 20, 450);
INSERT INTO Purchase_Order_Item VALUES (3, 3, 15, 750);
INSERT INTO Purchase_Order_Item VALUES (4, 4, 5, 11500);
INSERT INTO Purchase_Order_Item VALUES (5, 5, 3, 14000);
INSERT INTO Purchase_Order_Item VALUES (6, 6, 2, 8500);
INSERT INTO Purchase_Order_Item VALUES (7, 7, 10, 2800);

SELECT * FROM PURCHASE_ORDER_ITEM;

--Sales_Order
INSERT INTO Sales_Order VALUES (1, DATE '2025-02-01', 1);
INSERT INTO Sales_Order VALUES (2, DATE '2025-02-02', 2);
INSERT INTO Sales_Order VALUES (3, DATE '2025-02-03', 3);
INSERT INTO Sales_Order VALUES (4, DATE '2025-02-04', 4);
INSERT INTO Sales_Order VALUES (5, DATE '2025-02-05', 5);
INSERT INTO Sales_Order VALUES (6, DATE '2025-02-06', 6);
INSERT INTO Sales_Order VALUES (7, DATE '2025-02-07', 7);

SELECT * FROM SALES_ORDER;

--Sales_Order_Item
INSERT INTO Sales_Order_Item VALUES (1, 1, 1, 52000);
INSERT INTO Sales_Order_Item VALUES (2, 2, 2, 550);
INSERT INTO Sales_Order_Item VALUES (3, 3, 1, 900);
INSERT INTO Sales_Order_Item VALUES (4, 4, 1, 13000);
INSERT INTO Sales_Order_Item VALUES (5, 5, 1, 16000);
INSERT INTO Sales_Order_Item VALUES (6, 6, 1, 9500);
INSERT INTO Sales_Order_Item VALUES (7, 7, 2, 3200);

SELECT * FROM SALES_ORDER_ITEM;

--Display all products with their current stock
SELECT product_id, name, stock_qty
FROM Product;

--List all customers from Bangalore
SELECT customer_id, name, phone
FROM Customer
WHERE address = 'Bangalore';

--Display products whose stock quantity is below the average stock level(10).
SELECT product_id, name, stock_qty
FROM Product
WHERE stock_qty < 10;

--Display all purchase orders sorted by date
SELECT po_id, po_date, supplier_id
FROM Purchase_Order
ORDER BY po_date;

--Count total number of suppliers
SELECT COUNT(*) AS total_suppliers
FROM Supplier;

--Find total purchase cost for each purchase order
SELECT po_id,
       SUM(quantity * unit_cost) AS total_purchase_cost
FROM Purchase_Order_Item
GROUP BY po_id;

--Display customers who have placed at least one sales order
SELECT name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Sales_Order
);

--Display sales orders placed by customers from Bangalore.
SELECT so.so_id, so.so_date, c.name AS customer_name
FROM Sales_Order so
JOIN Customer c
     ON so.customer_id = c.customer_id
WHERE c.address = 'Bangalore';

--Find products whose selling price is higher than average selling price
SELECT product_id, name
FROM Product
WHERE unit_price >
      (SELECT AVG(unit_price) FROM Product);


--Find total quantity sold for each sales order.
SELECT so_id,
       SUM(quantity) AS total_quantity
FROM Sales_Order_Item
GROUP BY so_id;


--Find products whose total sold quantity is greater than 1.
SELECT product_id,
    		SUM(quantity) AS total_sold
FROM Sales_Order_Item
GROUP BY product_id
HAVING SUM(quantity) > 1;

--Find customers who have placed more than one sales order.
SELECT customer_id,
       COUNT(so_id) AS total_orders
FROM Sales_Order
GROUP BY customer_id
HAVING COUNT(so_id) >= 1;

--Quickly fetch customer contact details.
CREATE OR REPLACE FUNCTION get_customer_phone (
    p_customer_id IN NUMBER
)
RETURN VARCHAR2
IS
    v_phone VARCHAR2(15);
BEGIN
    SELECT phone
    INTO v_phone
    FROM Customer
    WHERE customer_id = p_customer_id;

    RETURN v_phone;
END;
/
SELECT get_customer_phone(1) FROM dual;
SELECT get_customer_phone(4) FROM dual;

--Used to know the category of a product.
CREATE OR REPLACE FUNCTION get_product_category (
    p_product_id IN NUMBER
)
RETURN VARCHAR2
IS
    v_category VARCHAR2(25);
BEGIN
    SELECT category
    INTO v_category
    FROM Product
    WHERE product_id = p_product_id;

    RETURN v_category;
END;
/
SELECT get_product_category(1) FROM dual;

--Gives total number of products in inventory.
CREATE OR REPLACE FUNCTION total_products
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Product;

    RETURN v_count;
END;
/
SELECT total_products FROM dual;






