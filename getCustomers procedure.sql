DELIMITER $$

CREATE PROCEDURE getCustomers()
BEGIN 
    select customerName, contactFirstName, contactLastName, phone, creditLimit from customers;
END$$

DELIMITER ;