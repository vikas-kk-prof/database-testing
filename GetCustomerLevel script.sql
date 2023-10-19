CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerLevel`(
	IN pCustNum INT,
    OUT pCustLvl VARCHAR(20)
)
BEGIN
	DECLARE credit DECIMAL(10, 2) DEFAULT 0;
    
    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustNum;
    
    IF credit > 50000 THEN
		SET pCustLvl = 'PLATINUM';
	ELSE 
		SET pCustLvl = 'GOLD';
	END IF;
    
END