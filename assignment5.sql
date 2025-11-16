use college;
-- q1)a
CREATE TABLE Client_Master (
    Client_no VARCHAR(5) NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Address1 VARCHAR(30),
    State VARCHAR(30),
    City VARCHAR(15),
	CONSTRAINT pk_client PRIMARY KEY (Client_no),
    CONSTRAINT chk_client_no CHECK (Client_no LIKE 'C%'),
    CONSTRAINT unq_client_name UNIQUE (Name),
    CONSTRAINT chk_city CHECK (City IN ('Delhi', 'Mumbai', 'Chennai'))
);
INSERT INTO Client_Master (Client_no, Name, Address1, State, City)
VALUES
('C01', 'Ivaan', 'Church Rd', 'Maharashtra', 'Mumbai'),
('C02', 'Vandana', 'St.Mary Rd', 'Tamil Nadu', 'Chennai'),
('C03', 'Pramada', 'Mall Rd', 'Maharashtra', 'Mumbai'),
('C04', 'Basu', 'Church Rd', 'Maharashtra', 'Mumbai'),
('C05', 'Ravi', 'Chandni', NULL, 'Delhi'),
('C06', 'Rukmini', 'Mall Rd', 'Maharashtra', 'Mumbai');

-- b
CREATE TABLE Products_Master (
    Product_no VARCHAR(10) NOT NULL,
    Description VARCHAR(20) NOT NULL,
    Qty_on_hand INT,
    Sell_price DECIMAL(8,2) NOT NULL,
    Cost_price DECIMAL(8,2) NOT NULL,
    
    CONSTRAINT pk_product PRIMARY KEY (Product_no),
    CONSTRAINT chk_product_no CHECK (Product_no LIKE 'P%'),
    CONSTRAINT unq_description UNIQUE (Description),
    CONSTRAINT chk_qty CHECK (Qty_on_hand > 10)
);
INSERT INTO Products_Master (Product_no, Description, Qty_on_hand, Sell_price, Cost_price) VALUES
('P01', '1.44 Floppies',100,325.00,  300.00),
('P02', 'Monitors',25, 12000.00, 11280.00),
('P03', 'Mouse',20,1050.00, 1000.00),
('P04', '1.22 Floppies', 100,325.00,  300.00),
('P05', 'Keyboards', 15,3150.00, 3050.00),
('P06', 'Cd drive', 14,5250.00, 5100.00);

-- c         
CREATE TABLE Sales_Order (
    S_order_no VARCHAR(10) NOT NULL,
    S_order_date DATE,
    Client_no VARCHAR(5),
    Salesman_no VARCHAR(10),
    Product_no VARCHAR(10),

    CONSTRAINT pk_sales_order PRIMARY KEY (S_order_no),
    CONSTRAINT chk_sales_order_no CHECK (S_order_no LIKE 'O%'),
    CONSTRAINT chk_salesman_no CHECK (Salesman_no LIKE 'S%'),
    CONSTRAINT fk_client_no FOREIGN KEY (Client_no) REFERENCES Client_Master(Client_no),
    CONSTRAINT fk_product_no FOREIGN KEY (Product_no) REFERENCES Products_Master(Product_no)
);
INSERT INTO Sales_Order (S_order_no, S_order_date, Client_no, Salesman_no, Product_no)
VALUES
('O19001', '1996-01-12', 'C01', 'S01', 'P01'),
('O19002', '1996-01-25', 'C02', 'S02', 'P02'),
('O19003', '1996-02-18', 'C03', 'S03', 'P03'),
('O19004', '1996-04-03', 'C01', 'S01', 'P04'),
('O19005', '1996-05-20', 'C04', 'S02', 'P05'),
('O19006', '1996-05-24', 'C05', 'S04', 'P06');

-- q2
ALTER TABLE Client_Master
MODIFY Address1 VARCHAR(30) NOT NULL;
-- q3)
SELECT (Sell_price - Cost_price) AS Profit
FROM Products_Master;
-- q4
SELECT (Qty_on_hand * Cost_price) AS Total_Cost_Price
FROM Products_Master;
-- q5
SELECT *
FROM Client_Master
WHERE Name LIKE 'I%';
-- q6
SELECT *
FROM Client_Master
WHERE Name LIKE 'R%i';  
-- q7
SELECT *
FROM Client_Master
WHERE Name LIKE '__a_a%';
-- q8
SELECT *
FROM Client_Master
WHERE Name LIKE '%aa%';
-- q9
SELECT *
FROM Client_Master
WHERE Name LIKE '____';
-- q10
SELECT *
FROM Client_Master
WHERE State Is Null;
-- q11
SELECT *
FROM Sales_Order
WHERE S_order_date > '1996-01-31';
-- q12  from here it starts
UPDATE Sales_Order
SET S_order_date = '1996-07-24',Product_no = 'P06',Salesman_no = 'S04'
WHERE Client_no = 'C01';
-- q13
UPDATE Client_Master
SET City = 'Kolkata'
WHERE Client_no = 'C05';
-- q14
ALTER TABLE Client_Master MODIFY Client_no VARCHAR(15);
ALTER TABLE Sales_Order MODIFY Client_no VARCHAR(15);
-- q15
DELETE FROM Client_Master
WHERE Client_no = 'C02';
-- q16
DELETE FROM Products_Master
WHERE Sell_price BETWEEN 1000 AND 10000;
-- q17
CREATE TABLE Student_Course (
    Student_id VARCHAR(10),
    Course_id VARCHAR(10),
    Enrollment_Date DATE,
    CONSTRAINT pk_student_course PRIMARY KEY (Student_id, Course_id)
);
-- 18
CREATE TABLE Exam_Result (
    Student_id VARCHAR(10),
    Course_id VARCHAR(10),
    Marks INT,
    Grade CHAR(2),
    CONSTRAINT fk_student_course FOREIGN KEY (Student_id, Course_id)
        REFERENCES Student_Course (Student_id, Course_id)
);






















