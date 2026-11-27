USE company;

-- 1. Shows the customer locations.
CREATE OR REPLACE VIEW view_customer_locations AS
SELECT CustomerName, City, Country
FROM Customers;

SELECT * FROM view_customer_locations;


-- 2. Total quantity ordered for each product.
CREATE OR REPLACE VIEW view_product_sales AS
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM Products p
JOIN OrderDetails od ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName;

SELECT * FROM view_product_sales
ORDER BY TotalQuantity DESC;


-- 3. Countries with the most customers.
CREATE OR REPLACE VIEW view_customer_country_count AS
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

SELECT * FROM view_customer_country_count
ORDER BY TotalCustomers DESC;


-- 4. Orders with shipper information.
CREATE OR REPLACE VIEW view_order_shipper AS
SELECT o.OrderID, o.OrderDate, c.CustomerName, s.ShipperName
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN Shippers s  ON s.ShipperID = o.ShipperID;

SELECT ShipperName, COUNT(*) AS OrderCount
FROM view_order_shipper
GROUP BY ShipperName
ORDER BY OrderCount DESC;
