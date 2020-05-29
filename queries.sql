-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT P.PRODUCTNAME , C.CATEGORYNAME FROM CATEGORY AS C
JOIN PRODUCT AS P 
ON P.CategoryId = C.Id

 

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT O.Id AS ORDERID, S.CompanyName, O.OrderDate  FROM [ORDER] AS O 
JOIN SHIPPER AS S 
ON O.ShipVia = S.Id
WHERE O.OrderDate < '2012-08-09'
-- ORDER BY O.OrderDate DESC OPTIONAL 

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT P.PRODUCTNAME , ORD.QUANTITY ,ORD.OrderId FROM [ORDERDETAIL] AS ORD
JOIN  PRODUCT AS P 
ON ORD.ProductId =  P.Id
WHERE ORD.OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.Id AS ORDERID,C.CompanyName AS COMPANYNAME   , E.LastName AS LASTNAME  FROM [ORDER] AS O 
JOIN CUSTOMER AS C 
ON O.EmployeeId = E.Id
JOIN EMPLOYEE AS E
ON O.CustomerId = C.Id  

--Stretch Problems
--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT c.CategoryName , COUNT(p.ProductName) as Count   from Categories as c
JOIN Products as P 
ON P.CategoryID = c.CategoryID
GROUP BY CategoryName

--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT o.ORDERID as OrderID  , COUNT(od.ORDERID) as ItemCount   from Orders as o
JOIN OrderDetails as od 
ON o.OrderID = od.OrderID
GROUP BY o.OrderID
