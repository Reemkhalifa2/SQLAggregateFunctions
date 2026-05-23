use CompanyAnalytics
--Task 1: Basic Aggregate Functions

SELECT SUM(Salary) AS TotalSalary,
	 AVG(Salary) AS AverageSalary ,
	 MAX(Salary) AS HighestSalary,
	 MIN(Salary) AS LowestSalary ,
	 COUNT(*) AS TotalEmployees FROM Employees;


--Task 2: GROUP BY with Departments

SELECT DepartmentID, SUM(Salary) AS TotalSalary,
AVG(Salary) AS AverageSalary,
COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID;

--Task 3: HAVING Clause Filtering

SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
HAVING SUM(Salary) > 10000;

SELECT DepartmentID, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 5;

SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 5000;

--Task 4

SELECT SUM(Amount) AS TotalRevenue ,
 AVG(Amount) AS AvgOrder ,
 COUNT(*) AS TotalOrders ,
 MAX(Amount) AS MaxOrder, MIN(Amount) AS MinOrder FROM Orders;

SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

--Task 5

SELECT CustomerID, COUNT(OrderID) AS NumOrders,
CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(Amount) > 1000;

SELECT Customers.CustomerID, Customers.CustomerName
FROM Customers 
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

--Task6

SELECT SUM(Quantity * Price) AS TotalRevenue FROM Sales;

SELECT ProductID, SUM(Quantity) AS TotalQty, AVG(Price) AS AvgPrice
FROM Sales
GROUP BY ProductID;

SELECT ProductID, SUM(Quantity) AS TotalQty
FROM Sales
GROUP BY ProductID
ORDER BY TotalQty DESC;


--Task7

SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQty
FROM OrderDetails 
JOIN Products  ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName;

SELECT ProductID, SUM(Quantity) AS TotalQty
FROM OrderDetails
GROUP BY ProductID
HAVING SUM(Quantity) > 50;

SELECT ProductID, COUNT(DISTINCT OrderID) AS NumOrders
FROM OrderDetails
GROUP BY ProductID;

SELECT ProductID, SUM(Quantity) AS TotalQty
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQty DESC;

--Task8

SELECT DepartmentID,
       MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary,
       AVG(Salary) AS AvgSalary,
       (MAX(Salary) - MIN(Salary)) AS SalaryDifference
FROM Employees
GROUP BY DepartmentID;

--Task 9

SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 6000
ORDER BY AvgSalary DESC;

SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
HAVING SUM(Salary) > 20000;

SELECT DepartmentID, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 3;

--Task 10
SELECT CustomerID, SUM(Amount) AS TotalSpent, AVG(Amount) AS AvgOrder,
COUNT(*) AS NumOrders
FROM Orders
GROUP BY CustomerID;

SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(Amount) > 500;

--Task11

SELECT ProductID, SUM(Quantity * Price) AS Revenue,
 SUM(Quantity) AS TotalQty
,AVG(Price) AS AvgPrice
FROM Sales
GROUP BY ProductID;

SELECT ProductID, SUM(Quantity * Price) AS Revenue
FROM Sales
GROUP BY ProductID
HAVING SUM(Quantity * Price) > 1000;


--Task12
SELECT COUNT(*) AS TotalOrders,
	SUM(Amount) AS TotalRevenue ,
	AVG(Amount) AS AvgAmount,
	MAX(Amount) AS MaxAmount, MIN(Amount) AS MinAmount FROM Orders;

SELECT CustomerID, COUNT(*) AS NumOrders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 2;


--Task 13
SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS TotalOrders,
SUM(Orders.Amount) AS TotalSpent
FROM Customers 
JOIN Orders  ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;


SELECT Customers.CustomerName, SUM(Orders.Amount) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName
HAVING SUM(Orders.Amount) > 1000;

SELECT Customers.CustomerName, SUM(Orders.Amount) AS TotalSpent
FROM Customers 
JOIN Orders  ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName
ORDER BY TotalSpent DESC;


--Task 14
SELECT DepartmentID , MAX(Salary)FROM Employees 
GROUP BY DepartmentID
HAVING MAX(Salary) > 8000;

SELECT DepartmentID , MIN(Salary)FROM Employees 
GROUP BY DepartmentID
HAVING MAX(Salary) < 3000;

SELECT DepartmentID , SUM(Salary) / COUNT(*) FROM Employees 
GROUP BY DepartmentID
HAVING SUM(Salary) / COUNT(*) > 4000 AND SUM(Salary) / COUNT(*)<7000;

SELECT DepartmentID  FROM Employees 
GROUP BY DepartmentID
HAVING COUNT(EmployeeID)>2;


--Task 15
SELECT ProductID, SUM(Quantity * Price) AS Revenue
FROM Sales
GROUP BY ProductID;

SELECT ProductID, SUM(Quantity) AS TotalQty,SUM(Quantity * Price) AS Revenue
FROM Sales
GROUP BY ProductID
ORDER BY Revenue DESC;

SELECT p.ProductID
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;

--Task 16
SELECT Products.ProductName , SUM(Sales.Price) 
FROM Sales
LEFT JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.ProductName;

SELECT Products.ProductName , SUM(Sales.Quantity) 
FROM Sales
LEFT JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY SUM(Sales.Quantity) DESC;

SELECT Products.ProductName , SUM(Sales.Quantity)*SUM(Sales.Price)  AS PROFIT 
FROM Sales
LEFT JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY SUM(Sales.Quantity) DESC;

--TASK 17: Sales Time Analysis

SELECT SaleDate, SUM(Quantity * Price) AS Revenue
FROM Sales
GROUP BY SaleDate;

SELECT MONTH(SaleDate) AS Month, SUM(Quantity * Price) AS Revenue
FROM Sales
GROUP BY MONTH(SaleDate);

SELECT TOP 1 SaleDate, SUM(Quantity * Price) AS Revenue
FROM Sales
GROUP BY SaleDate
ORDER BY Revenue DESC;

SELECT MONTH(SaleDate) AS Month, COUNT(*) 
FROM Sales
GROUP BY MONTH(SaleDate);
