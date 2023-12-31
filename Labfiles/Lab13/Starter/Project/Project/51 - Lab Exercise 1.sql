---------------------------------------------------------------------
-- LAB 13
--
-- Exercise 1
---------------------------------------------------------------------

USE TSQL2012;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a SELECT statement to retrieve the orderid, orderdate, and val columns as well as a calculated column named rowno from the view Sales.OrderValues. Use the ROW_NUMBER function to return rowno. Order the row numbers by the orderdate column.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt. 
---------------------------------------------------------------------
SELECT ROW_NUMBER() OVER(ORDER BY orderdate) AS rowno, orderid, orderdate, val FROM Sales.OrderValues


---------------------------------------------------------------------
-- Task 2
-- 
-- Copy the previous T-SQL statement and modify it by including an additional column named rankno. To create rankno, use the RANK function, with the rank order based on the orderdate column.
--
-- Execute the modified statement and compare the results that you got with the desired results shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt. Notice the different values in the rowno and rankno columns for some of the rows.
--
-- What is the difference between the RANK and ROW_NUMBER functions?
---------------------------------------------------------------------

SELECT 
	ROW_NUMBER() OVER (ORDER BY orderdate) AS rowno,
	RANK() OVER (ORDER BY orderdate) AS rankno,
	orderid, 
	orderdate,
	val
FROM Sales.OrderValues;

---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement to retrieve the orderid, orderdate, custid, and val columns as well as a calculated column named orderrankno from the Sales.OrderValues view. The orderrankno column should display the rank per each customer independently, based on val ordering in descending order. 
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 54 - Lab Exercise 1 - Task 3 Result.txt. 
---------------------------------------------------------------------

SELECT 
	RANK() OVER (PARTITION BY custid ORDER BY val DESC) AS orderrankno,
	orderid, 
	orderdate,
	custid,
	val
FROM Sales.OrderValues;

---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement to retrieve the custid and val columns from the Sales.OrderValues view. Add two calculated columns: 
--  orderyear as a year of the orderdate column 
--  orderrankno as a rank number, partitioned by the customer and order year, and ordered by the order value in descending order. 
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 55 - Lab Exercise 1 - Task 4 Result.txt. 
---------------------------------------------------------------------
SELECT 
	custid, 
	val, 
	YEAR(orderdate) AS orderyear, 
	RANK() OVER(PARTITION BY custid, YEAR(orderdate) ORDER BY val DESC) AS orderrankno 
FROM Sales.OrderValues


---------------------------------------------------------------------
-- Task 5
-- 
-- Copy the previous query and modify it to filter only orders with the first two ranks based on the orderrankno column.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 56 - Lab Exercise 1 - Task 5 Result.txt. 
---------------------------------------------------------------------

SELECT 
	o.custid, 
	o.val, 
	o.orderyear, 
	o.orderrankno
FROM (
	SELECT 
		custid, 
		val, 
		YEAR(orderdate) AS orderyear, 
		RANK() OVER(PARTITION BY custid, YEAR(orderdate) ORDER BY val DESC) AS orderrankno 
	FROM Sales.OrderValues
	) AS o
WHERE o.orderrankno <= 2