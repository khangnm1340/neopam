-- Create a simple table named 'Customers'
CREATE TABLE Customers (
    Customerid int PRIMARY KEY,
    Firstname varchar(50),
    Lastname varchar(50),
    City varchar(50)
);

-- Insert some data into the 'Customers' table
INSERT INTO Customers (Customerid, Firstname, Lastname, City)
    VALUES (1, 'John', 'Doe', 'New York');

INSERT INTO Customers (Customerid, Firstname, Lastname, City)
    VALUES (2, 'Jane', 'Smith', 'London');

INSERT INTO Customers (Customerid, Firstname, Lastname, City)
    VALUES (3, 'Peter', 'Jones', 'Paris');

-- Select all data from the 'Customers' table
SELECT
    *
FROM
    Customers;

SELECT
    -- Select only the FirstName and City for customers in 'New York'
    Firstname,
    City
FROM
    Customers
WHERE
    City = 'New York';
