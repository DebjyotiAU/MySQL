use college;
-- q1)
-- Creating Customer table
CREATE TABLE Customer (
    Cust_id VARCHAR(5) Primary Key,
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20),
    Area VARCHAR(10) NOT NULL,
    Phone VARCHAR(15)
);
-- Creating Movie table
CREATE TABLE Movie (
    Mv_no   INT PRIMARY KEY,
    Cust_id VARCHAR(5),
    Title   VARCHAR(50) NOT NULL,
    Star    VARCHAR(20) NOT NULL,
    Price   DECIMAL(6,2) CHECK (Price BETWEEN 100 AND 250),
   FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
INSERT INTO Customer (Cust_id, Fname, Lname, Area, Phone) VALUES
('A01', 'Ivan',    'Ross',     'SA', '6125467'),
('A02', 'Vandana', 'Ray',      'MU', '5560379'),
('A03', 'Pramada', 'Jauguste', 'DA', '4560389'),
('A04', 'Basu',    'Navindi',  'BA', '6125401'),
('A05', 'Ravi',    'Shridhar', 'NA', NULL),
('A06', 'Rukmini', 'Aiyer',    'GH', '5125274');
INSERT INTO Movie (Mv_no, Cust_id, Title, Star, Price) VALUES
(1,  'A02', 'Bloody','JC', 181),
(2,  'A04', 'The Firm','TC', 200),
(3,  'A01', 'Pretty Woman','RG', 151),
(4,  'A06', 'Home Alone','MC', 150),
(5,  'A05', 'The Fugitive','MF', 200),
(6,  'A03', 'Coma','MD', 100),
(7,  'A02', 'Dracula','GO', 150),
(8,  'A06', 'Quick Change','BM', 100),
(9,  'A03', 'Gone with the Wind','CB', 200),
(10, 'A05', 'Carry on Doctor','LP', 100);
-- q5
SELECT Title FROM Movie
WHERE Price > 100 AND Price < 200;
-- q6
SELECT DISTINCT Cust_id FROM Movie
WHERE Star IN ('JC', 'TC', 'MC');
-- q7
SELECT * FROM Customer
WHERE Area LIKE '%A%';
-- q8
SELECT Title FROM Movie
WHERE Price <=180 AND LENGTH(Title) = 6;
-- q9
SELECT Title,Price AS Original_Price,Price + (Price/100*10) AS Incremented_Price FROM Movie;
-- q10
SELECT CONCAT(Fname, ' ', Lname, ' stays in ', Area, ' and his phone number is ', Phone, '.') AS CustomerDetails
FROM Customer;
-- q11
ALTER TABLE Customer
MODIFY Lname VARCHAR(30) NOT NULL;
-- q12
SELECT Fname, Lname FROM Customer
WHERE Phone Is Null;
-- q13)
UPDATE Customer
SET Phone = '1234576'
WHERE Cust_id = 'A05';
-- q14
SELECT DISTINCT Cust_id
FROM Movie;

-- q15
ALTER TABLE Movie
MODIFY Star VARCHAR(30) NULL;
-- q16
DELETE FROM Customer
WHERE Cust_id = 'A02';
-- q17
DELETE FROM Movie
WHERE Mv_no=6;
-- q18
DROP TABLE Customer;
-- q19
DROP TABLE Movie;
-- q20
SHOW CREATE TABLE Movie;

