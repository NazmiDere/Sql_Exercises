---------------------------------------------------------------------
-- LAB 11
--
-- Exercise 4
---------------------------------------------------------------------

USE TSQL2012;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a SELECT statement against the Sales.OrderValues view and retrieve the custid and totalsalesamount columns as a total of the val column. Filter the results to include orders only for the order year 2007.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 82 - Lab Exercise 4 - Task 1 Result.txt. 
--
-- Define an inline table-valued function using the following function header and add your previous query after the RETURN clause.
--
-- Modify the query by replacing the constant year value 2007 in the WHERE clause with the parameter @orderyear.
--
-- Highlight the complete code and execute it. This will create an inline table-valued function named dbo.fnGetSalesByCustomer.
---------------------------------------------------------------------

-- initial SQL statement

CREATE FUNCTION dbo.fnGetSalesByCustomer
(@orderyear AS INT) RETURNS TABLE
AS
RETURN
SELECT
	custid, SUM(val) AS totalsalesamount
FROM Sales.OrderValues
WHERE YEAR(orderdate) = @orderyear
GROUP BY custid;

GO


---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement to retrieve the custid and totalsalesamount columns from the dbo.fnGetSalesByCustomer inline table-valued function. Use the value 2007 for the needed parameter.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 83 - Lab Exercise 4 - Task 2 Result.txt. 
---------------------------------------------------------------------
SELECT 
	custid, totalsalesamount
FROM dbo.fnGetSalesByCustomer(2007);

---------------------------------------------------------------------
-- Task 3
-- 
-- In this task, you will query the Production.Products and Sales.OrderDetails tables. Write a SELECT statement that retrieves the top three sold products based on the total sales value for the customer with ID 1. Return the productid and productname columns from the Production.Products table. Use the qty and unitprice columns from the Sales.OrderDetails table to compute each order line’s value, and return the sum of all values per product, naming the resulting column totalsalesamount. Filter the results to include only the rows where the custid value is equal to 1.
--
-- Execute the T-SQL code and compare the results that you got with the recommended result shown in the file 84 - Lab Exercise 4 - Task 3_1 Result.txt.
--
-- Create an inline table-valued function based on the following function header, using the previous SELECT statement. Replace the constant custid value 1 in the query with the function’s input parameter @custid:
--
-- Highlight the complete code and execute it. This will create an inline table-valued function named dbo.fnGetTop3ProductsForCustomer that excepts a parameter for the customer id.
--
-- Test the created inline table-valued function by writing a SELECT statement against it and use the value 1 for the customer id parameter. Retrieve the productid, productname, and totalsalesamount columns, and use the alias p for the inline table-valued function.
--
-- Execute the T-SQL code and compare the results that you got with the recommended result shown in the file 85 - Lab Exercise 4 - Task 3_2 Result.txt.
---------------------------------------------------------------------
SELECT TOP(3) d.productid, MAX(p.productname) AS productname, SUM(d.qty * d.unitprice) AS totalsalesamount	
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
INNER JOIN Production.Products AS p ON p.productid = d.productid
WHERE custid = 1
GROUP BY d.productid
ORDER BY totalsalesamount DESC;

-- initial SQL statement

GO

CREATE FUNCTION dbo.fnGetTop3ProductsForCustomer
(@custid AS INT) RETURNS TABLE
AS
RETURN
SELECT TOP(3) d.productid, MAX(p.productname) AS productname, SUM(d.qty * d.unitprice) AS totalsalesamount	
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
INNER JOIN Production.Products AS p ON p.productid = d.productid
WHERE custid = @custid
GROUP BY d.productid
ORDER BY totalsalesamount DESC;

-- copy here the SQL statement


SELECT 
	p.productid,
	p.productname,
	p.totalsalesamount
FROM dbo.fnGetTop3ProductsForCustomer(1) AS p;


-- write here the SQL statement against the created function


---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement to retrieve the same result as in exercise 3, task 3, but use the created inline table-valued function in task 2 (dbo.fnGetSalesByCustomer).
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 86 - Lab Exercise 4 - Task 4 Result.txt.
---------------------------------------------------------------------

--??????
SELECT 
	c.custid, c.contactname,
	c2008.totalsalesamount AS salesamt2008,
	c2007.totalsalesamount AS salesamt2007,
	COALESCE((c2008.totalsalesamount - c2007.totalsalesamount) / c2007.totalsalesamount * 100., 0) AS percentgrowth
FROM Sales.Customers AS c
LEFT OUTER JOIN dbo.fnGetSalesByCustomer(2007) AS c2007 ON c.custid = c2007.custid
LEFT OUTER JOIN dbo.fnGetSalesByCustomer(2008) AS c2008 ON c.custid = c2008.custid;
--???????


---------------------------------------------------------------------
-- Task 5
-- 
-- Remove the created inline table-valued functions by executing the provided T-SQL statement. Execute this code exactly as written inside a query window.
---------------------------------------------------------------------

IF OBJECT_ID('dbo.fnGetSalesByCustomer') IS NOT NULL
	DROP FUNCTION dbo.fnGetSalesByCustomer;

IF OBJECT_ID('dbo.fnGetTop3ProductsForCustomer') IS NOT NULL
	DROP FUNCTION dbo.fnGetTop3ProductsForCustomer;
GO


