Data Gyan 30 SQL interview questions and answers
Table 1: – EmployeeDetails
Table 2: – EmployeeSalary
EmpId Project Salary
121 P1 9000
321 P2 7000
421 P1 15000
--1.Write a SQL query to fetch the count of employees working in project ‘P1’.
Ans: SELECT COUNT(*) FROM EmployeeSalary WHERE Project = 'P1';
--2.Write a SQL query to fetch employee names having a salary greater than or equal to
--5000 and less than or equal 10000.
Ans: SELECT FullName FROM EmployeeDetails WHERE EmpId IN
(SELECT EmpId FROM EmpolyeeSalary WHERE Salary BETWEEN 5000 AND 10000);
--3. Write a SQL query to fetch project-wise count of employees sorted by project’s count
--in descending order.
Ans: SELECT Project, count(EmpId) EmpProjectCount FROM EmployeeSalary 
GROUP BY Project ORDER BY EmpProjectCount DESC;
--4. Write a query to fetch only the first name(string before space) from the FullName
column of EmployeeDetails table.
Ans: SELECT SUBSTRING(FullName, 0, CHARINDEX(' ',FullName)) FROM EmployeeDetails;
--Or
SELECT LEFT(FullName, CHARINDEX(' ',FullName) - 1) FROM EmployeeDetails;
--EmpId FullName ManagerId DateOfJoining
121 Priya Batra 321 01/31/2017
321 Salman Khan 986 01/30/2016
421 Kuldeep Rana 876 27/11/2019
--5. Write a query to fetch employee names and salary records. Return employee details
--even if the salary record is not present for the employee.
Ans: SELECT E.FullName, S.Salary FROM EmployeeDetails E LEFT JOIN EmployeeSalary S
 ON E.EmpId = S.EmpId;
--6.Write a SQL query to fetch all the Employees who are also managers from
--EmployeeDetails table.
--Note: Here, we must use Self-Join as the requirement wants us to analyze the EmployeeDetails table as two
--different tables, each for Employee and manager records.
Ans:SELECT DISTINCT E.FullName FROM EmpDetails E INNER JOIN EmpDetails M ON E.EmpID = M.ManagerID;
--7. Write a SQL query to fetch all employee records from EmployeeDetails table who have
--a salary record in EmployeeSalary table.
--Note: The EXISTS condition in SQL is used to check whether the result of a correlated nested query is empty
--(contains no tuples) or not. The result of EXISTS is a Boolean value True or False. It can be used in a SELECT,
--UPDATE, INSERT or DELETE statement.
Ans: SELECT * FROM EmployeeDetails E WHERE EXISTS 
     (SELECT * FROM EmployeeSalary S WHERE E.EmpId = S.EmpId);
--8. Write a SQL query to fetch duplicate records from a table.
Ans: SELECT EmpId, Project, Salary, COUNT(*)FROM EmployeeSalary
GROUP BY EmpId, Project, Salary HAVING COUNT(*) > 1;
--9. Write a SQL query to remove duplicates from a table without using a temporary table.
DELETE FROM EmployeeSalary
WHERE rowid NOT IN(SELECT MAX(rowid) FROM EmployeeSalary GROUP BY EmpId);
Note: Using rowId
--10. Write a SQL query to fetch only odd rows from the table.
--Ans. This can be achieved by using Row_number in SQL server
SELECT E.EmpId, E.Project, E.Salary
FROM (SELECT *, Row_Number() OVER(ORDER BY EmpId) AS RowNumber
FROM EmployeeSalary) E WHERE E.RowNumber % 2 = 1
--11. Write a SQL query to fetch only even rows from the table.
--Ans. Using the same Row_Number() and checking that the remainder when divided by 2 is 0-
SELECT E.EmpId, E.Project, E.Salary FROM (SELECT *, Row_Number() OVER(ORDER BY EmpId) AS RowNumber 
FROM EmployeeSalary ) E WHERE E.RowNumber % 2 = 0
--12. Write a SQL query to create a new table with data and structure copied from another table.
--Ans. Using SELECT INTO commandSELECT * INTO newTable FROM EmployeeDetails;
--13. Write a SQL query to create an empty table with the same structure as some other table.
select * into table 1 from empinfo where 1=0
Ans: SELECT * INTO newTable FROM EmployeeDetails WHERE 1 = 0;
--14. Write a SQL query to fetch common records between two tables.
SELECT * FROM EmployeeSalary
INTERSECT
SELECT * FROM ManagerSalary
--15. Write a SQL query to fetch records that present in one table but not in another table.
SELECT * FROM EmployeeSalary
MINUS
SELECT * FROM ManagerSalary

--16. Write a SQL query to find the current date-time.
SELECT getdate();
--17. Write a SQL query to fetch all the Employees details from EmployeeDetails table who joined in the Year 2016.
select * from empinfo where doj = between 1-1-2016 and 31-12-2016

SELECT * FROM EmployeeDetails WHERE DateOfJoining BETWEEN '01-01-2016'  AND date '31-12-2016';
--18. Write SQL query to find the nth highest salary from table.
select top 1 from (select distinct top N salary from emp order by desc) as S order by salary asc

SELECT TOP 1 Salary FROM ( SELECT DISTINCT TOP N Salary FROM Employee
 ORDER BY Salary DESC )ORDER BY Salary ASC
--19. Write SQL query to find the 3rd highest salary from table without using TOP/limit keyword.
select e1.salary from emp as e1  where 2 = (select distinct (e2.salary) from emp e2 where e2.salary > e1.salary)

SELECT Salary FROM EmployeeSalary Emp1
WHERE 2 = (SELECT COUNT( DISTINCT ( Emp2.Salary ) )
FROM EmployeeSalary Emp2 WHERE Emp2.Salary > Emp1.Salary)
--20. What is the differences Between Primary key and Unique key:

Primary key is uniquely identifies a single row in the table but not allowed null values.
Unique key is uniquely identifies a single row in the table but allowed null values.

-- 21.What is the difference between DELETE and TRUNCATE statements?
Ans:
Delete is DML command is used to delete a particular row in a table. can be rollback
Truncate is DDL command used to delete all the rows from a table, can not be rollback 

--22.What is the difference between CHAR and VARCHAR2 datatype in SQL?
Both Char and Varchar2 are used for characters datatype but varchar2 is used for character 
strings of variable length whereas Char is used for strings of fixed length.

--23.What is a Foreign key?
A foreign key is a key used to link two tables together. This is sometimes also called as a 
referencing key.
--24. What is Index? What is the difference between clustered and non clustered index ?
Indexes are used to retrieve data from the database more quickly. Indexes are special lookup 
tables that the database search engine can use to speed up data retrieval.
Clustered index is used for easy retrieval of data from the database and its faster whereas 
reading from non clustered index is relatively slower.
--25.Are NULL values same as that of zero or a blank space?
--null is not same as zero or blank space, null value is value which is not assign or unavailable but it is still a value.
--blanck space is character and zero is number 

A NULL value is not at all same as that of zero or a blank space. NULL value represents a value 
which is unavailable, unknown, assigned or not applicable whereas a zero is a number and blank 
space is a character
--26.What is the difference between cross join and natural join?
cross join cartesian product and natural join acts as inner join when there are two same name of columns present in two tables
natural join can give cartesian product when there are no same columns are available
The cross join produces the cross product or Cartesian product of two tables whereas the natural 
join is based on all the columns having the same name and data types in both the tables.
--27.What is a View?
A view is a virtual table which consists of a subset of data contained in a table. Since views are 
not present, it takes less space to store. View can have data of one or more tables combined and 
it depends on the relationship.

--28.What is Normalization and what are the advantages of it?
Normalization is the process of organizing data to avoid duplication and redundancy.
--29.State the differences between HAVING and WHERE clauses.
where clause filter data from existing column
having comes with aggregate function and group by where it filters data from result set of 

--30. Explain the difference between OLTP and OLAP.
--OLAP ONLINE ANALYTICAL  PROCESSING AND OLTP TRANACTION PROCESSING
--NOT NORMALIZED	              --3NF NORMALIZED DATA DEPENDENT
--OLAP IS FOR DATA ANALYSIS			--OLTP  USED TO MANAGE SHORT TRANSACTIONS
--SLOW PROCESS						--MILLISECONDS
--OLAP For CEO, MANGERS               -- OLTP FOR CLEARKS AND DATABASE
--TAKES MORE TIME FOR QUERIES COMPLEX  -- RELATIVELY SIMPLE QUERIES
--INTEGRITY OF DATA MAINTAIN NOT CHAGES OFTEN -- INTEGRITY OF DATA HAS TO MAINTAIN ACC CONSTRAINTS 
--CUSTOMER FOCUS PROCESSIGN				-- MARKET FOCUSED
--ONLY READ AND RARELY WRITE THE OPEARATION --BOTH READ AND WRITE
