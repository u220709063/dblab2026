USE company;

-- 1. Procedure that lists the customers of a given country.
DROP PROCEDURE IF EXISTS SelectCustomersByCountry;
DELIMITER $$
CREATE PROCEDURE SelectCustomersByCountry(IN p_country VARCHAR(50))
BEGIN
    SELECT *
    FROM Customers
    WHERE Country = p_country;
END $$
DELIMITER ;

SET @country = 'Spain';
CALL SelectCustomersByCountry(@country);


-- 2. Procedure that returns the number of orders of a given shipper (OUT parameter).
DROP PROCEDURE IF EXISTS GetOrderCountByShipper;
DELIMITER $$
CREATE PROCEDURE GetOrderCountByShipper(IN p_shipper VARCHAR(50), OUT p_count INT)
BEGIN
    SELECT COUNT(o.OrderID) INTO p_count
    FROM Orders o
    JOIN Shippers s ON s.ShipperID = o.ShipperID
    WHERE s.ShipperName = p_shipper;
END $$
DELIMITER ;

SELECT ShipperName FROM Shippers;
CALL GetOrderCountByShipper('United Package', @order_count);
SELECT @order_count;


-- 3. Procedure that returns the name and the total sales of a customer (two OUT parameters).
DROP PROCEDURE IF EXISTS GetCustomerSales;
DELIMITER $$
CREATE PROCEDURE GetCustomerSales(
    IN  p_customer_id INT,
    OUT p_name  VARCHAR(255),
    OUT p_sales DECIMAL(12,2))
BEGIN
    SELECT CustomerName INTO p_name
    FROM Customers
    WHERE CustomerID = p_customer_id;

    SELECT IFNULL(SUM(p.Price * od.Quantity), 0) INTO p_sales
    FROM Orders o
    JOIN OrderDetails od ON od.OrderID = o.OrderID
    JOIN Products p      ON p.ProductID = od.ProductID
    WHERE o.CustomerID = p_customer_id;
END $$
DELIMITER ;

CALL GetCustomerSales(5, @name, @sales);
SELECT @name, @sales;

CALL GetCustomerSales(2, @name, @sales);
SELECT @name, @sales;
