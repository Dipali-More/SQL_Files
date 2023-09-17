--aggregate functions min,max,count,sum 


--sum of values 
select * from Customer
select sum (sales) as totalsales from Customer; 

--minimum values 
select min (sales) as minsales from Customer; 
--max values 
select max (sales) as maxsales from Customer; 
--count values 
select count (sales) as totalsales from Customer; 
--we use orderby to see first and last values of the coulumn
-- group by 

select sales as totalsales  from Customer order by sales; 

select count (id), gender from Customer where gender = 'female' or gender = 'male' group by gender  ;

select count (id), gender, sum (sales) as totalsales from Customer group by gender;

--total sales city wise 
select city , sum(sales) as totalsales from Customer group by City;


--having caluse when we want to use where condition, having clause used on the group by and where clause used on column name 
select city , sum(sales) as totalsales from Customer group by City  having sum(sales)>100; 
select city , sum(sales) as totalsales from Customer where city = 'awb' group by City  having sum(sales)>100; 

--example of having,join,groupby

CREATE TABLE emp11 (
  EmployeeID INT,
  LastName VARCHAR(50),
  FirstName VARCHAR(50),
  BirthDate DATE
);


INSERT INTO emp11(EmployeeID, LastName, FirstName, BirthDate) 
VALUES 
(1, 'Davolio', 'Nancy', '1968-12-08'),
(2, 'Fuller', 'Andrew', '1952-02-19'),
(3, 'Leverling', 'Janet', '1963-08-30'),
(4, 'Peacock', 'Margaret', '1958-09-19'),
(5, 'Buchanan', 'Steven', '1955-03-04'),
(6, 'Suyama', 'Michael', '1963-07-02'),
(7, 'King', 'Robert', '1960-05-29'),
(8, 'Callahan', 'Laura', '1958-01-09'),
(9, 'Dodsworth', 'Anne', '1969-07-02'),
(10, 'West', 'Adam', '1928-09-19');

CREATE TABLE order11 (
    OrderID int,
    CustomerID int,
    EmployeeID int,
    OrderDate date,
    ShipperID int
);

INSERT INTO order11(OrderID, CustomerID, EmployeeID, OrderDate, ShipperID)
VALUES 
    (10248, 90, 5, '1996-07-04', 3),
    (10249, 81, 6, '1996-07-05', 1),
    (10250, 34, 4, '1996-07-08', 2),
    (10251, 84, 3, '1996-07-08', 1),
    (10252, 76, 4, '1996-07-09', 2),
    (10253, 34, 3, '1996-07-10', 2),
    (10254, 14, 5, '1996-07-11', 2),
    (10255, 68, 9, '1996-07-12', 3),
    (10256, 88, 3, '1996-07-15', 2),
    (10257, 35, 4, '1996-07-16', 3),
    (10258, 20, 1, '1996-07-17', 1),
    (10259, 13, 4, '1996-07-18', 3),
    (10260, 55, 4, '1996-07-19', 1),
    (10261, 61, 4, '1996-07-19', 2),
    (10262, 65, 8, '1996-07-22', 3),
    (10263, 20, 9, '1996-07-23', 3),
    (10264, 24, 6, '1996-07-24', 3),
    (10265, 7, 2, '1996-07-25', 1),
    (10266, 87, 3, '1996-07-26', 3),
    (10267, 25, 4, '1996-07-29', 1),
    (10268, 33, 8, '1996-07-30', 3),
    (10269, 89, 5, '1996-07-31', 1),
    (10270, 87, 1, '1996-08-01', 1),
    (10271, 75, 6, '1996-08-01', 2),
    (10272, 65, 6, '1996-08-02', 2),
    (10273, 63, 3, '1996-08-05', 3),
    (10274, 85, 6, '1996-08-06', 1),
    (10275, 49, 1, '1996-08-07', 1),
    (10276, 80, 8, '1996-08-08', 3),
    (10277, 52, 2, '1996-08-09', 3),
    (10278, 5, 8, '1996-08-12', 2)
select * from order11
select * from emp11

SELECT Emp11.LastName, COUNT(order11.CustomerID) AS custOrders
FROM order11
INNER JOIN Emp11 ON Order11.EmployeeID = Emp11.EmployeeID
GROUP BY LastName
HAVING COUNT(Order11.CustomerID) > 2;

SELECT Emp11.LastName, COUNT(Order11.EmployeeID) AS NumberOfOrders
FROM Order11
INNER JOIN Emp11 ON Order11.EmployeeID = Emp11.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Order11.EmployeeID)>=2;



