use classicmodels;

Select * from customers;

select * from customers order by contactFirstName ;

select * from employees;

SELECT * FROM employees where jobTitle='Sales Rep';

select DISTINCT lastName from employees order by lastName;

select * from customers where country='USA' and state='CA';

select concat_ws(', ', firstName, lastName) AS 'Full Name' from employees order by 'Full Name';


select 
	concat(m.lastName, ', ', m.firstName) AS Manager,
    concat(e.lastName, ', ', e.firstName) AS 'Direct report'
from 
	employees e
inner join
	employees m ON
	m.employeeNumber = e.reportsTo
order by
	Manager;