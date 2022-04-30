-- INSERT - UPDATE - DELETE
-- Adding Values
-- INSERT INTO + TABLE NAME + (COLUMN NAMES) + (values) 
-- (1 row affected) Means the query is successful
INSERT INTO Categories (CategoryName, Description) VALUES('fruits', 'Banana') -- Output: (1 row affected)

-- Column name is optioanl. if there is not column name all columns has to be declared
INSERT INTO [Order Details] VALUES(10248, 13, 12, 10, 0) -- Output (1 row affected)

INSERT INTO [Order Details] VALUES(10248, 13, 12, 10, 0) /* ERROR -Violation of PRIMARY KEY constraint 'PK_Order_Details'. Cannot insert duplicate key in object 'dbo.Order Details'. 
The duplicate key value is (10248, 13). NOTE: PRIMARY KEYS SHOULD BE UNIQUE */

INSERT INTO [Order Details] VALUES(10249, 14, 12, 10) -- ERROR Column name or number of supplied values does not match table definition. - There is not column name. Therefore all column name values should be declared.

INSERT INTO [Order Details] VALUES(10249, 9, 12, 10, 0) -- Output (1 row affected)

-- Update values
-- UPDATE + TABLE NAME + SET + COLUMN NAME = 'VALUE' + CONDITION
UPDATE Categories SET CategoryName = 'cat' WHERE CategoryID = 11 -- Output (1 row affected)
--multiple column name update
UPDATE Categories SET CategoryName = 'cat3', Description = 'Test category 3 description' WHERE CategoryID = 15 -- Output (1 row affected)

-- DELETE VALUES
-- DELETE + TABLE NAME + CONDITION
DELETE FROM Categories WHERE CategoryID = 11 --OUTPUT (1 row affected)

-- INSERT , UPDATE, DELETE WITH JOIN
-- New table created ** Table Name: CustomersWork , Columns: CustomerId, CompanyName, ContactName
SELECT * FROM CustomersWork  -- Output CustomersWork table with empty CustomerId, CompanyName, ContactName columns

-- Insert CustomerId, CompanyName, ContactName columns from Customers table to the new CustomersWork table
INSERT INTO CustomersWork(CustomerId, CompanyName, ContactName) SELECT CustomerID, CompanyName, ContactName FROM Customers -- Output: (91 rows affected)

-- Delete new table data
DELETE FROM CustomersWork -- Output: (91 rows affected)

-- Only Insert CustomerId, CompanyName, ContactName columns which Company name contains end from Customers table to the new CustomersWork table
INSERT INTO CustomersWork(CustomerId, CompanyName, ContactName) SELECT CustomerID, CompanyName, ContactName FROM Customers WHERE ContactName like '%en%' -- Output: (17 rows affected)

-- Replace Customers table CompanyName column with CustomersWork Company name column according to condition
UPDATE Customers SET CompanyName = CustomersWork.CompanyName from Customers INNER JOIN CustomersWork on Customers.CustomerID = CustomersWork.CustomerId -- Output: (17 rows affected)

--Delete Customers according to condition 
DELETE Customers from Customers INNER JOIN CustomersWork on Customers.CustomerID = CustomersWork.CustomerId WHERE CustomersWork.CompanyName like '%Test%' /*-- Output (0 rows affected) Because condition is false there is not any companyName 
contains test */

--Union
-- Combine two queries (NOT TABLES). It does not repeat if values are the same. It adds only different values
SELECT * from Customers union SELECT * FROM CustomersWork -- Error , columns numbers are not the same. 
SELECT CustomerID, CompanyName, ContactName from Customers UNION SELECT * FROM CustomersWork -- OUTPUT: (91 rows affected)

-- Combine two queries (NOT TABLES). IF THERE ARE COMMON VALUES IN COMBINED QUERIES REPEAT THEM
SELECT CustomerID, CompanyName, ContactName from Customers UNION ALL SELECT * FROM CustomersWork -- OUTPUT: (108 rows affected)