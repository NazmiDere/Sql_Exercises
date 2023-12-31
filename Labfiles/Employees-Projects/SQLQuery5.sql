CREATE DATABASE [Sales]
GO

USE [Sales]
GO

CREATE TABLE [dbo].[Sales](
	[empid] [varchar](10) NOT NULL,
	[mgrid] [varchar](10) NULL,
	[qty] [int] NULL)
GO

INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'A', N'Z', 300)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'B', N'X', 100)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'C', N'X', 200)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'D', N'Y', 200)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'E', N'Z', 250)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'F', N'Z', 300)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'G', N'X', 100)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'H', N'Y', 150)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'I', N'X', 250)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'J', N'Z', 100)
INSERT [dbo].[Sales] ([empid], [mgrid], [qty]) VALUES (N'K', N'Y', 200)

SELECT * FROM [Sales]


SELECT mgrid, empid, qty, SUM(qty) OVER() AS grand_total FROM dbo.Sales

SELECT mgrid, empid, qty, SUM(qty) OVER(PARTITION BY mgrid) AS mgr_total FROM dbo.Sales


USE TSQL2012

SELECT custid, orderid, val,
	SUM(val) OVER (PARTITION BY custid) AS cust_total,
	Sum(val) OVER() AS grandtotal,
	SUM(val) OVER (PARTITION BY custid ORDER BY orderdate, orderid ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM Sales.OrderValues
