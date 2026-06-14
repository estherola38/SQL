USE SQLTutorial;
-- drops the tables if they already exist to avoid errors when creating them again
DROP TABLE IF EXISTS EmployeeDemographics;
DROP TABLE IF EXISTS EmployeeSalary;


--Table 1 Query:
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 2 Query:
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

--Viewing Tables:
Select * FROM EmployeeDemographics;



--Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

--Table 2 Insert:
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

--Viewing the EmployeeSalary
Select * FROM EmployeeSalary

/*SELECT STATEMENT
*, Top, Distinct,Count, AS, Min, Max, Avg, Sum, Group By, Order By, Where, And, Or, Not, In, Between, Like, Is Null
*/
-- picking only the first 5 records 
SELECT TOP 5 * FROM EmployeeDemographics;

--  uniques Gender
SELECT DISTINCT Gender
FROM EmployeeDemographics;

--The number of non-missing lastnames aliased
SELECT COUNT(LastName) AS CountOfLastName
FROM EmployeeDemographics;

--maximum Salary
SELECT MAX(Salary)
FROM EmployeeSalary;

--minimum Salary
SELECT MIN(Salary)
FROM EmployeeSalary;

--referencing the right table using the dot notation
SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary

/*WHERE STATEMENT FOR FILTRATION
=,<>,<,>,AND, OR. LIKE ,NULL, NOT NULL, IN
*/

--filtering only employees who are above 30yrs
SELECT * FROM EmployeeDemographics
WHERE Age > 30

--employees who are 32 or below and are male, AND operator
SELECT * 
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male';

--Employees with 32yrs/below or Males 
SELECT * 
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male';

-- Like wilcard oparator -begins with S
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE 'S%';

-- Like wilcard oparator -ends with e
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE '%e';

-- Like wilcard oparator- contains letter e
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE '%e%';

-- Like wilcard oparator -begins with M and contains leter e somewhere
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE 'M%e%';

--NUll returns records with missing values in the specified column
SELECT LastName 
FROM EmployeeDemographics
WHERE Age IS NULL

--Not Null returns records with non-missing values in the specified column
SELECT LastName 
FROM EmployeeDemographics
WHERE Age IS NOT NULL

--AND operator with multiple conditions
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim' OR
FirstName = 'Toby' ;

--IN operator to filter multiple values
SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Toby') ; 

/*GROUP BY, ORDER BY
*/
--grouping by is used to group rows that have the same values in specified columns into summary rows, like "find the number of employees
SELECT Gender, COUNT(EmployeeID) AS NumberOfEmployees
FROM EmployeeDemographics
GROUP BY Gender

-- This query groups the employees by both gender and age, and counts the number of employees in each group.
-- The result will show the number of employees for each
SELECT Gender, Age, COUNT(Gender) AS NumberOfEmployees
FROM EmployeeDemographics
GROUP BY Gender,Age;

-- This query groups the employees by gender and counts the number of employees in each group, but only for those employees who are above 31 years old.
SELECT Gender, COUNT(EmployeeID) AS NumberOfEmployees
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender;

--ORDER BY is used to sort the result set of a query by one or more columns, either in ascending (ASC) or descending (DESC) order.
SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC;

-- This query retrieves the first name and age of employees, and sorts the results first by age in ascending order
SELECT FirstName,Age,Gender
FROM EmployeeDemographics
ORDER BY Age,Gender;
 
-- This query retrieves the first name, age, and gender of employees, and sorts the results first by age in ascending order, and then by gender in descending order for employees with the same age.
SELECT FirstName,Age,Gender
FROM EmployeeDemographics
ORDER BY Age,Gender DESC;

-- Having is used to filter groups based on a specified condition, often used in conjunction with GROUP BY.
SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM EmployeeSalary
GROUP BY JobTitle
HAVING AVG(Salary) > 45000;