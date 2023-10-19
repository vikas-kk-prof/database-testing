use classicmodels;

select * from customers;

select customerName, contactFirstName, contactLastName, phone from customers;

call GetCustomers;

DROP PROCEDURE IF EXISTS GetCustomers;

call getTotalOrders;


# session variable

Select @buyPrice:=buyprice FROM products WHERE buyPrice > 90 ORDER BY buyPrice;

SELECT @buyprice;


# parameters 

select * from orders;

call GetOrderCountByStatus('Shipped', @total);

select @total;


# alter stored procedures

call GetAllProducts;


# list all procedures.

SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS WHERE Db = 'classicmodels';
SHOW PROCEDURE STATUS WHERE Definer = 'root@localhost';


# if else statement
SELECT customerNumber, creditLimit FROM customers WHERE creditLimit > 50000;
    
call GetCustomerLevel(200, @Level);
select @Level;

# case statement

call GetCustomerShipping(234, @Shipping);
select @Shipping;

# while loop 

call simpleLoop();

# repeat loop

call simpleRepeat();

