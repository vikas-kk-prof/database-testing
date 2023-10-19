# trigger 

CREATE TABLE emp_audit (
	id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    changedate DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

# create tigger

CREATE TRIGGER before_employee_update
	BEFORE UPDATE ON employees
    FOR EACH ROW
INSERT INTO emp_audit
SET action = 'update',
	employeeNumber = OLD.employeeNumber,
    lastName = OLD.lastName,
    Changedate = NOW();
    
    
# show triggers
SHOW TRIGGERS;

# run update query on employee

select * from employees;

update employees set lastName = 'Patterson' where employeeNumber = 1002;

select * from emp_audit;


