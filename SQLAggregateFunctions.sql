--Task 1: Basic Aggregate Functions
SELECT SUM(Salary) AS Total_Salary,
		SUM(Salary) / COUNT(Salary) AS Verage_Salary,
		MAX(Salary) AS highest_salary,
		MIN(Salary) AS lowest_salary,
		COUNT(SSN)
		FROM Employee;


--Task 2: GROUP BY with Departments
SELECT SUM(Salary) AS Total_Salary,
		SUM(Salary) / COUNT(Salary) AS Verage_Salary,
		COUNT(SSN)
		FROM Employee
		GROUP BY Dnum
		ORDER BY Dnum;

--Task 3: HAVING Clause Filtering
SELECT Dnum ,SUM(Salary)AS Total_Salary FROM Employee
GROUP BY Dnum
HAVING SUM(Salary) > 10000;

SELECT Dnum ,COUNT(SSN) AS Employees FROM Employee
GROUP BY Dnum
HAVING COUNT(SSN) > 5;

SELECT Dnum ,SUM(Salary)/COUNT(SSN)AS Avrage_Salary FROM Employee
GROUP BY Dnum
HAVING SUM(Salary)/COUNT(SSN) > 5000;


--Task 4: Orders Analysis

SELECT 
		SUM(Amount) as total_revenue , 
		SUM(Amount)/Count(OrderID)  as AVerage,
		COUNT(OrderID) as Total_Id
		MAX(Amount) AS Max_amount,
		MIN(Amount) AS Min_amount,
		FROM Orders;

SELECT 
    CustomerID,
    SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

--Task 5: Customers Order Summary

---1. Show number of orders per customer
SELECT Customers.CustomerName ,COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
LEFT JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID;


---2. Show total amount spent per customer
SELECT Customers.CustomerName ,SUM(Orders.Amount) AS Totalspent 
FROM Customers
LEFT JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID;


---3. Show customers who spent more than 1000 total
SELECT Customers.CustomerName ,SUM(Orders.Amount) AS Totalspent 
FROM Customers
LEFT JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID
HAVING SUM(Orders.Amount) >1000;

---4. Show customers with no orders

SELECT 
    Customers.CustomerID,
    Customers.CustomerName
FROM Customers
LEFT JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

--Task 6: Sales Performance
--- 1. Find total sales revenue (Quantity × Price)
SELECT SUM(Quantity*Price) AS TotalSales,
FROM Sales;
--- 2. Find total quantity sold per product
SELECT SUM(Quantity) AS TotalQuantity,
FROM Sales
GROUP BY ProductID;
--- 3. Find average price per product
SELECT SUM(Price)/COUNT(ProductID) AS averagePrice,
FROM Sales
GROUP BY ProductID;

--4. Find best-selling product (highest quantity sold)
SELECT 
    ProductID,
    SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY ProductID
ORDER BY TotalQuantity DESC;

--Task 7: Mixed Aggregation Challenge
SELECT SUM(OrderDetails.Quantity) AS TotalQuantiy, Products.ProductName
FROM OrderDetails
LEFT JOIN OrderDetails
ON OrderDetails.ProductID  = Products.ProductID
GROUP BY ProductName;

SELECT SUM(OrderDetails.Quantity) AS TotalQuantiy, Products.ProductName
FROM OrderDetails
LEFT JOIN OrderDetails
ON OrderDetails.ProductID  = Products.ProductID
GROUP BY ProductName
HAVING SUM(OrderDetails.Quantity)>50;

SELECT Products.ProductName,COUNT(OrderDetails.OrderID) AS TotalOrders
FROM OrderDetails
INNER JOIN Products
    ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY Products.ProductName DESC;


--Task 8: Department Salary Statistics
SELECT 
    DepartmentID,
    MAX(Salary) AS MaxSalary
    MIN(Salary) AS MinSalary
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID;

SELECT 
    DepartmentID,
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary,
    (MAX(Salary) - MIN(Salary)) AS SalaryDifference
FROM Employees
GROUP BY DepartmentID;


