select empid, firstname, lastname from HR.Employees;

select * from HR.Employees order by firstname desc;

--all ladies in the UK
select * from HR.Employees where country = 'UK' and titleofcourtesy in ('Ms.', 'Mrs.');

select * from HR.Employees where YEAR(birthdate)  = 1973

select firstname, lastname, YEAR(birthdate) from HR.Employees;

select * from HR.Employees where region is not NULL;

select * from HR.Employees where lastname like '_u__';
select * from HR.Employees where lastname like 'f%';

select firstname, lastname, YEAR(birthdate)  as 'birth year' from HR.Employees;

select COUNT(*) from sales.Customers;

select country, city, COUNT(*) as 'numberofrecords' from sales.Customers group by country, city order by numberofrecords desc;

--inner join
select o.orderid, o.orderdate, o.custid, c.companyname 
from sales.Customers as c
inner join sales.Orders as o on c.custid = o.custid;
--where c.custid = o.custid; -- inner join

select *
from sales.Orders as o 
inner join sales.OrderDetails as od on od.orderid = o.orderid
inner join Sales.Shippers as s on o.shipperid = s.shipperid;

select o.orderid, o.orderdate, o.custid, c.companyname 
from sales.Customers as c
left outer join sales.Orders as o on c.custid = o.custid; -- where o.custid is NULL;

-- inner  outer(left, right, full)
-- cross join

select sum(unitprice*qty) as totalsale from Sales.OrderDetails group by orderid;

select categoryname, count(productid) as numberofproducts
from Production.Categories as c inner join Production.Products as p on c.categoryid = p.categoryid
--where unitprice > 20
group by  categoryname having count(productid) > 10; --order by count(productid) desc;


