-- TASK 1: Database Design

 -- Task 1 : Question 1 
Create database TechShop;
Use TechShop;

-- Task 1: Question 2
Create Table Customers(
CustomerID int auto_increment primary key,
FirstName varchar(50) not null,
LastName varchar(50),
Email varchar(50),
Phone varchar(15) not null,
Address varchar(250) not null
);

Create Table Products(
ProductID int auto_increment primary key,
ProductName varchar(100),
Description varchar(200),
Price decimal(10,2));

Create Table Orders(
OrderID int auto_increment primary key,
CustomerID int,
OrderDate date not null,
TotalAmount decimal(10,2),
Foreign key (CustomerID) references Customers(CustomerID)
);

Create Table OrderDetails(
OrderDetailID int auto_increment primary key,
OrderID int,
ProductID int,
Quantity int,
Foreign key (OrderID) references Orders(OrderID),
Foreign key (ProductID) references Products(ProductID)
);

Create Table Inventory(
InventoryID int auto_increment primary key,
ProductID int,
QuantityInStock int,
LastStockUpdate date not null,
Foreign Key (ProductID) references Products(ProductID)
);

-- Task 1: QUestion 5
Insert into Customers
(FirstName,LastName,Email,Phone,Address)
Values
('Amit','Bhatt','ab987@gmail.com','8595440621','Noida'),
('Vibhor','Sharma','vibhor@gmail.com','1234567890','Lucknow'),
('Mudit','Saxena','mudit@gmail.com','2345678901','Kanpur'),
('Deepak','Garg','deepak@gmail.com','3456789012','Ghaziabad'),
('Punit','Rajkumar','punit@gmail.com','4567890123','Varanasi'),
('Johhny','Cage','johhny@gmail.com','5678901234','Gurugram'),
('Sonya','Blade','sonya@gmail.com','6789012345','Chennai'),
('Cassie','Cage','cassie@gmail.com','7890123456','Siruseri'),
('Jason','Voorhees','jason@gmail.com','8901234567','Elm Street'),
('Viktor','Blane','viktor@gmail.com','9012345678','Gorakhpur');

Insert into Products
(ProductName,Description,Price)
Values
('Iphone','128GB storage',59000),
('TV','Android TV',15000),
('Laptop','RGB gaming laptop',72000),
('Air Conditioner','Inverter Air Conditioner',40000),
('Toaster','Automatic Timer',1500),
('Washing machine','Top Load',16000),
('Induction Cooker','SAS metal',2500),
('Travel Adaptor','Two port Connectivity',2000),
('TWS','32db ANC',4000),
('Speakers','Bluetooth 5.3',3000);

Insert into Orders
(CustomerID,OrderDate,TotalAmount)
Values
(1,'2024-05-01',59000),
(2,'2024-05-02',15000),
(3,'2024-05-03',72000),
(4,'2024-05-04',40000),
(5,'2024-05-05',1500),
(6,'2024-05-06',16000),
(7,'2024-05-07',2500),
(8,'2024-05-08',2000),
(9,'2024-05-09',4000),
(10,'2024-05-10',3000);

Insert into OrderDetails
(OrderID,ProductID,Quantity)
Values
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1);

Insert into Inventory
(ProductID,QuantityInStock,LastStockUpdate)
Values
(1,100,'2024-05-02'),
(2,150,'2024-05-02'),
(3,200,'2024-05-02'),
(4,250,'2024-05-02'),
(5,300,'2024-05-02'),
(6,350,'2024-05-02'),
(7,400,'2024-05-02'),
(8,450,'2024-05-02'),
(9,500,'2024-05-02'),
(10,550,'2024-05-02');

-- Task 2: Select, Where, Between and Like

-- Task 2: Question 1
Select CONCAT(Firstname,' ',LastName) as names,
Email as emails from Customers;

-- Task 2: Question 2
Select OrderID, OrderDate, 
CONCAT(FirstName,' ',LastName) as Customer_Name 
From Orders,Customers
Where Orders.OrderID = Customers.CustomerID;

-- Task 2: Question 3
Insert into Customers
(FirstName,LastName,Email,Phone,Address)
Values
('Bhanu','Pratap','bhanu@gmail.com','0123456789','Indraprasth');

-- Task 2: Question 4
SET SQL_SAFE_UPDATES = 0;
Update Products 
Set Price = Price*1.1;

-- Task 2: Question 5
SET @orderID = 5;
Delete from OrderDetails where OrderID = @orderID;
Delete from Orders where OrderID = @orderID;

-- Task 2: Question 6
Insert Into Orders
(CustomerID, OrderDate,TotalAmount)
Values
(3,'2024-05-12',1800);

-- Task 2: Question 7
SET @customerID = 3;
SET @email = 'updatedmail@gmail.com';
SET @address = 'new address';
Update Customers
Set Email = @email,
Address = @address
where CustomerID = @customerID;

-- Task 2: Question 8
Update Orders
Set TotalAmount = (
Select SUM(OrderDetails.Quantity*Products.Price)
From OrderDetails
Inner Join Products ON OrderDetails.ProductID = Products.ProductID
Where OrderDetails.OrderID = Orders.OrderID);

-- Task 2: Question 9 
SET @customerID = 6;
Delete from OrderDetails Where OrderID in
(Select OrderID from Orders where CustomerID = @customerID);
Delete from Orders 
Where CustomerID = @customerID;

-- Task 2: Question 10
Insert into Products 
(ProductName,Description,Price)
Values
('New Release','Detailed highlights',2550);

-- TAsk 2: Question 11
Alter Table Orders
ADD Status Varchar(50);
SET @orderID = 4;
SET @status = 'Shipped';
Update Orders
SET Status = @status
Where OrderID = @orderID;

-- Task 2: Question 12
SELECT Customers.CustomerID , CONCAT(FirstNAme,' ',LastName) AS
CustomerName,
COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName,
Customers.LastName;

-- Task 3: Aggregate functions, Having, Order By, GroupBy and Joins

-- Task 3: Question 1
Select Orders.OrderID,Orders.OrderDate, 
Concat(Customers.FirstName,' ',Customers.LastName) As Customer_name,
Customers.Email,Customers.Phone
From Orders
Inner Join Customers
ON
Orders.CustomerID = Customers.CustomerID;

-- Task 3: Question 2
Select Products.ProductName,
SUM(Products.Price*OrderDetails.Quantity) as Tot_Rev
From Products
Left Join 
OrderDetails 
ON 
Products.ProductID = OrderDetails.ProductID
Group by Products.ProductName;

-- Task 3: Question 3
Select DISTINCT Concat(FIrstName,' ',LastName) as Customer_name,
Phone,Email From Customers
Inner Join Orders
ON
Customers.CustomerID = Orders.CustomerID;

-- Task 3: Question 4
Select Products.ProductName,
SUM(OrderDetails.Quantity) as Total_Ordered_Quantity
From Products
Left Join OrderDetails
ON
Products.ProductID = OrderDetails.ProductID
Group by Products.ProductName
Order by Total_Ordered_Quantity Desc
Limit 1;

-- Task 3: Question 5
Select Products.ProductName, Categories.CategoryName
From Products 
Inner Join Categories
ON
Products.CategoryID = Categories.CategoryID;

-- Task 3: Question 6
Select Concat(Customers.FirstName,' ',Customers.LastName) as Customer_name,
AVG(Orders.TotalAmount) as Average_value
From Customers
Left Join Orders
ON
Customers.CustomerID = Orders.CustomerID
Group By Customers.CustomerID,
Customers.FirstName,
Customers.LastName;

-- Task 3: Question 7
Select Orders.OrderID,
Concat(Customers.FirstName,' ',Customers.LastName) As Customer_name,
Customers.Email,Customers.Phone,
Orders.TotalAmount as Total_Revenue
From Orders
Left Join Customers
ON
Orders.CustomerID = Customers.CustomerID
Order By Total_Revenue Desc
limit 1;

-- Task 3: Question 8
Select Products.ProductName, 
SUM(OrderDetails.Quantity) as Total_Ordered_Quantity
From Products
Left Join OrderDetails
ON
Products.ProductID = OrderDetails.ProductID
Group By Products.ProductName;

-- Task 3: Question 9
SET @gadget = 'Washing machine';
SELECT Customers.CustomerID,
CONCAT(Customers.Firstname,' ',Customers.LastName) AS CustomerName,
Customers.Email,Customers.Phone,Customers.Address
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.OrderID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = @gadget;

-- Task 3: Question 10
Set @START1 = '2024-05-03';
Set @END1 = '2024-05-07';
Select SUM(TotalAmount) as Total_Revenue
From Orders
Where OrderDate Between @START1 and @END1;

-- TASK 4:  Subquery and its type

-- Task 4: Question 1
Select * from Customers
Where CustomerID not in (
Select CustomerID from Orders);

-- Task 4: Question 2
Select SUM(QuantityInStock) as
Total_quantity From Inventory;

-- Task 4: Question 3
Select SUM(TotalAmount) as 
Total_Revenue From Orders;

-- Task 4: Question 4


-- Task 4: Question 5
SET @specific = 4;
Select SUM(TotalAmount) as Total_revenue
From Orders Where CustomerID = @specific;

-- Task 4: Question 6
Select CONCAT(Customers.FirstName,' ',LastName) as Customer_name,
Count(Orders.OrderID) as Number_of_Orders
From Customers
Inner Join orders
ON
Customers.CustomerID = Orders.CustomerID
Group by Customer_Name
Order by Number_of_orders Desc
Limit 1;

-- Task 4: Question 7


-- Task 4: Question 8
Select CONCAT(Customers.FirstName,' ',Customers.LastName) as
Customer_name ,SUM(Orders.TotalAmount) AS Total_Spending
From Customers
Inner Join Orders 
ON Customers.CustomerID = Orders.CustomerID
Group by Customers.CustomerID , Customer_Name
Order by Total_Spending Desc
Limit 1;

-- Task 4: Question 9
Select AVG(Orders.TotalAMount) as Average_Order_Value
From Orders;

-- Task 4: Question 10
Select CONCAT(Customers.FirstName,' ',Customers.LastName) as
Customer_Name ,
(Select COUNT(*) From Orders Where Customers.CustomerID =
Orders.CustomerID) as Order_Count
From Customers;

-- SOME COMMONLY USED QUERIES FOR CHECKING THE OUTPUT TABLES --

Select * from Inventory;
Select * from OrderDetails;
Select* from Orders;
Select * from Customers;
Select * from Products;
Drop database TechShop;