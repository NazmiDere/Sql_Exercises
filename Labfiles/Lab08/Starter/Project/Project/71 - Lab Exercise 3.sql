---------------------------------------------------------------------
-- LAB 08
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL2012;
GO

SELECT * FROM Sales.Customers
---------------------------------------------------------------------
-- Task 1
-- 
-- Write a SELECT statement to retrieve the contactname and fax columns from the Sales.Customers table. If there is a missing value in the fax column, return the value �No information�.
--
-- Write two solutions, one using the COALESCE function and the other using the ISNULL function.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 72 - Lab Exercise 3 - Task 1 Result.txt. 
--
-- What is the difference between the ISNULL and COALESCE functions?
---------------------------------------------------------------------
SELECT contactname, COALESCE(Fax, 'No information') FROM Sales.Customers

SELECT contactname, ISNULL(Fax, 'No information') FROM Sales.Customers

---------------------------------------------------------------------
-- Task 2
-- 
-- Update the provided T-SQL statement with a WHERE clause to filter the region column using the provided variable @region, which can have a value or a NULL. Test the solution using both provided variable declaration cases.
---------------------------------------------------------------------

DECLARE @region AS NVARCHAR(30) = NULL; 

SELECT 
	custid, region
FROM Sales.Customers
WHERE region = @region OR (region IS NULL AND @region IS NULL);
GO

DECLARE @region AS NVARCHAR(30) = 'WA'; 

SELECT 
	custid, region
FROM Sales.Customers
WHERE region = @region


---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement to retrieve the contactname, city, and region columns from the Sales.Customers table. Return only rows that do not have two characters in the region column, including those with an inapplicable region (where the region is NULL).
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 73 - Lab Exercise 3 - Task 3 Result.txt. Notice the number of rows returned.
---------------------------------------------------------------------

SELECT custid, contactname, city, region
FROM Sales.Customers 
WHERE (LEN(region) > 2 OR LEN(region) < 0) OR region IS NULL

