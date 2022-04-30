--GENERAL SELECT QUERIES

--SELECT All column name from table name (Products)
SELECT * from Products

--SELECT column name (ProductName) from table name (Products)
SELECT ProductName from Products

--Select column name (ContactName) as new column name (name) from table name (products)
SELECT ContactName as Name,Phone as PhoneNumber FROM Customers

--Select tablename(p).columname(ProductId) from table name(Products) as re name table(p) 
SELECT p.ProductID from Products as p

/*SELECT tablename(p).columnname(ProductName), tablenname(p).columnname(UnitInStock) multiple by tablename(p).columnname(UnitPrice) as total 
from tablename(Products) as re name table(p) */
SELECT p.ProductName, p.UnitsInStock * p.UnitPrice as total from Products as p

--SELECT tablename(p).columnname(ProductName) space(' ') tablename(p).columnname(QuantityPerUnit) from tablename(Products) as re name table(p) 
SELECT p.ProductName + ' ' + p.QuantityPerUnit from Products p

--SELECT tablename(p).columnname(ProductName) space arrow space ( => ) tablename(p).columnname(QuantityPerUnit) from tablename(Products) as re name table(p)
SELECT p.ProductName + ' => ' + p.QuantityPerUnit from Products p 

-- Basic Math
--SELECT number1 (9) math operator (*) number2 show result as Result (72)
SELECT 9 * 8 as Result

--SELECT number1 (9) math operator (+) number2 (8) show result as Result (17)
SELECT 9 + 8 as Result

--SELECT number1 (9) math operator (-) number2 (8) show result as Result (1)
SELECT 9 - 8 as Result

--SELECT number1 (9) math operator (/) number2 (3) show result as Result (3)
SELECT 9 / 3 as Result


-- Show my name as Student
SELECT 'Robin Winters' as Student

-- Conditional Queries

--SELECT all (*) Products belongs to Category which have 1 id number
SELECT * from Products WHERE CategoryID = 1

--SELECT all(*) ProductsName as Name and UnitInStock as Stock which have UnitsInStock equal or more than 10
SELECT ProductName as Name, UnitsInStock as Stock from Products WHERE UnitsInStock >= 10

--SELECT all(*) ProductsName as Name and UnitInStock as Stock which have UnitsInStock equal or less than 10
SELECT ProductName as Name, UnitsInStock as Stock from Products WHERE UnitsInStock <= 10

--Products are not in the stock
SELECT ProductName as Name, UnitsInStock as Stock from Products WHERE UnitsInStock = 0

--And
-- Emergency need product
SELECT ProductName as Name, UnitsInStock as Stock, UnitsOnOrder as onOrder from Products WHERE UnitsInStock = 0 and UnitsOnOrder > 0

--Or
-- Not need products
SELECT ProductName as name, UnitsInStock as Stock, UnitsOnOrder as OnOrder from Products WHERE UnitsInStock = UnitsOnOrder or UnitsOnOrder < UnitsInStock

-- Only show Chai
SELECT * from Products WHERE ProductName = 'Chai'

--NOT
-- Not show me the products which is stock amount more than order amount
SELECT ProductName as Name, UnitsInStock as Stock, UnitsOnOrder as OnOrder from Products WHERE not UnitsInStock > UnitsOnOrder

--Order By
-- Sort Products by ProductName (alphametically)
SELECT * FROM Products order by ProductName

-- Sort Products by UnitPrice from cheapest to most expensive
SELECT * FROM Products order by UnitPrice

-- Sort Products by UnitPrice from the most expensive to the cheapest
SELECT * FROM Products order by UnitPrice desc

--Like
-- show product name starts with ch
SELECT * from Products where ProductName like 'ch%'

-- show product name ends with ra
SELECT * from Products where ProductName like '%ra'

-- show product name contains with ch
SELECT * from Products where ProductName like '%ch%'

--Between
-- show products which in unitprice is between 10 and 50 from the cheapest
SELECT * from Products WHERE UnitPrice BETWEEN 10 and 50 ORDER BY UnitPrice

-- IN
-- show only products which have category id 1 and 2
SELECT * FROM Products where CategoryId in (1,2)

-- Count
--Count products
SELECT COUNT(*) as [Products Number] from Products
SELECT COUNT(ProductName) as [Products Number] from Products

-- Count will not count the nulls
SELECT COUNT(Region) from Customers

-- Min
--show the cheapest product
SELECT Min(UnitPrice) from Products

-- Max
--show the most expensive product
SELECT Max(UnitPrice) from Products

-- Avg
--show the avarage of unit prices
SELECT AVG(UnitPrice) from Products

-- SUM
-- show the sum of unitprices of sold products
SELECT SUM(UnitPrice * Quantity) as Profit from [Order Details]

--Rand
-- a random number
SELECT RAND()

--String Function
--LEFT
-- Show the first three characters from left side
SELECT LEFT('Robin Winters', 3) --Output: Rob

SELECT LEFT(ProductName, 3) from Products -- Output: It will return All ProductsName in Products. Every Items first 3 characters

--RIGHT
-- Show the first three characters from RIGHT side
SELECT RIGHT('Robin Winters', 3) --Output: ers

SELECT RIGHT(ProductName, 3) from Products -- Output: It will return All ProductsName in Products. Every Items last 3 characters

-- LEN
-- Show the length of characters
SELECT LEN('Robin Winters') -- Output 13 (empty space counted)
SELECT LEN(ProductName) from Products -- Output Each product name character length

-- LOWER
-- show each character as lower case
SELECT LOWER('RoBiN WINTERS') --Output : robin winters
SELECT LOWER(ProductName) from Products -- Output Each Product Name Lower case

-- UPPER
-- show each character as CAPITAL case
SELECT UPPER('robiN winters') --Output : ROBIN WINTERS
SELECT UPPER(ProductName) from Products -- Output Each Product Name CAPITAL case

-- TRIM
-- Remove empty space of the beggining and in the end
SELECT TRIM('  ROBIN WINTERS   ')

-- LTRIM
-- Remove empty space of the beggining
SELECT LTRIM('    Robin Winters    ') -- Output Robin Winters    '

-- RTRIM
-- Remove empty space of the END
SELECT RTRIM('    Robin Winters    ') -- Output '    Robin Winters

-- REVERSE
-- Reverse string
SELECT REVERSE('ROBIN WINTERS') --OUTPUT: SRETNIW NIBOR
SELECT REVERSE(ProductName) from Products -- OUTPUT: Reverse each product name

-- CHARINDEX
-- Search spesific character or characters from a string. IT RETURNS ONLY FIRST MATHED CHARACTER
-- Search 'n' in robin winters start from first character  
SELECT CHARINDEX('n', 'ROBIN WINTERS', 1) -- OUTPUT 5
SELECT ProductName from Products WHERE CHARINDEX(' ', ProductName, 1) > 0  -- return all names contain empty space

-- REPLACE
-- REPLACE given strings
-- REPLACE empty space with underscore in Robin Winters
SELECT REPLACE('Robin Winters' , ' ' , '_') -- OUTPUT Robin_Winters


-- SUBSTRING
-- Split given string
--SPLIT Robin Winters from the first character and return 5 characters 
SELECT SUBSTRING('Robin Winters', 1, 5) -- Output Robin

--ASCII
-- ASCII function returns the NUMBER code that represents the specified character. 
SELECT ASCII('a') --OUTPUT 97

--DISTINCT
--Show customers contries, It will return one country only one time even if one country has multiple customers and sort alphabetically
SELECT DISTINCT(Country) FROM Customers ORDER BY Country

--Group by
-- Group Customers table by country 

SELECT Country, City, COUNT(*) [Number of Customers] from Customers GROUP BY Country, City ORDER BY Country -- Output: Query will return each country, each city of country
-- and number of customers from the countries and sorted alpahabetically

SELECT Country, City, COUNT(*) [Number of Customers] from Customers GROUP BY Country, City HAVING COUNT(*) > 1 ORDER BY Country  --Query will return each country, each city of country
-- and number of customers from the countries and sorted alpahabetically with HAVING conditional it returns the countries has more than one customers

-- QUERY FOR MULTIPLE TABLES
--INNER JOIN
SELECT * from Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID -- OUTPUT: QUERY RETURNS EACH  DATA FROM PRODUCTS AND CATEGORIES TABLE WHERE PRODUCT ID IS EQUAL TO CATEGORYID

-- show products have been order sor far with order date and amount of profits and sort it alphabetically also sort by order date
-- Table we need to join Orders, Order Details, Products 
SELECT p.ProductName, o.OrderDate, od.Quantity * od.UnitPrice as Total from Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID INNER JOIN Orders o ON o.OrderID = od.OrderID ORDER BY p.ProductName, o.OrderDate

-- LEFT JOIN
-- show products that have not been sold so far
SELECT * from Products p LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID WHERE od.ProductID IS NULL -- Output: None
-- show customers who have not ordered any products yet
SELECT * from Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID WHERE o.CustomerID IS NULL

-- RIGHT JOIN
-- show customers who have not ordered any products yet
SELECT c.ContactName, c.CustomerID from Orders o RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID WHERE o.CustomerID IS NULL

-- FULL JOIN
SELECT * FROM Customers c FULL JOIN Orders o on o.CustomerID = c.CustomerID


-- Examples
-- 1) Show the employers who has not sold any products yet
SELECT * from Employees e LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID WHERE o.EmployeeID IS NULL -- Output none. (There is not any employees that have not sold anything yet)

-- 2) Show the product name and number of sold products
SELECT p.ProductName, COUNT(*) as Sold FROM Products p INNER JOIN [Order Details] o on p.ProductID = o.ProductID GROUP BY p.ProductName ORDER BY p.ProductName

-- 3) Show the Category name and number of sold products
SELECT c.CategoryName, COUNT(*) as Sold from Products p INNER JOIN Categories c on p.CategoryID = c.CategoryID INNER JOIN [Order Details] od on od.ProductID = p.ProductID GROUP BY c.CategoryName

-- 4) Shows which eployer have to report to whose

SELECT e2.FirstName + ' ' + e2.LastName as Employes, e1.FirstName + ' ' + e1.LastName as [Reports to] from Employees e1 INNER JOIN Employees e2 on e1.EmployeeID = e2.ReportsTo

