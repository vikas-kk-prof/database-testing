# Database testing

**Topics**

1. what is a Database application 

2. Purpose of database application

3. different types of database application

4. Database testing Vs Application testing

5. What should be tested in database testing.

6. Database testing phases.

7. Types of database testing

8. mysql database queries

9. mysql table queries

10. working with data.

11. mysql views.

12.  Stored procedures

13. triggers

14. functions

## What is a Database application

We have lots of information which need to be saved for future.

register with gmail account. 

All information store in database.

## Purpose of database application

Store data for future use and allow different user to access it with right permission. it also allow to fetch required without effecting non-required data. insure the safty of the database. and it allow to search the data.

## different type of database application

1. relational database

2. object-oriented database

3. NoSQL database

4. open-source database

5. self-driving database.

## Database testing Vs Application testing

Application 

1. UI testing (frontend) is also called as Application testing.

2. We checkout the working of different component of UI like forms, menu etc.

3. Checkout the functionality of application like able to navigate, show some content on screen able to login.

4. User able to enter the data.

database

1. check the data validation and integrity or backend-testing.

2. backend part is not visible to end user.

3. it involve checking of stored procedures, views , schemas in database, table, index.

4. it required least basic knowladge of database.

## What should be tested in database testing

1. The flow of infomation through the app to the database.

2. Data mapping and data integrity

person 

    id        11 PK

    name      vikas  

   email    vikaskpro7

  password   defxyz 

employee

       employee_id    4

        salary  10000

       person_id 11    FK

                

moving from application to database vice-versa.

3. The ACID properties validation ( Atomicity, consistency, isolation, durability )

4. The accuracy of implemented business logics.

5. information storage and queries need to be properly tested, database schema, table, triggers.

## Database testing phases

1. Test Environment setup - setup the  database.

2. Test Scenario Generation - prepare testing sample data.

3. Execution - perform the test.

4. Analysis - check the end result. 

5. Log defects - check for the error or other required logs for clerify the test success rate.

## Types of database testing

1. Structural Testing

2. Functional Testing

### Structural testing

this is technique that validates all the elements inside the data repository. it is not directly accesable to end user.

1. Schema testing - check the schema formats associated with database, it ensure the schema mapping between front-end and backend.

2. Database table, column testing - check the mapping is compatible with the mapping in the front-end. naming conversion, check any unused/unmapped table/columns. datatype. field lengths.

3. Key and indexes testing - requirement of Primary key or foreign key,  check validation of foreign key. whether application required Clustered indexes or non-Clustered indexes.

4. Store Procedures (methods) Testing - all condition/loop applied for the required input.

5. Database server validation - check configuration of database, authorization. developer, client , tester , customer , admin, application. 

### Functional Testing

1. Data intergrity and consistency - data is logically well organized, data correctness, able to perform different operations.

2. login and user security - application login security, is data secured for unauthorized access, user different roles.

# Mysql database

### database commands.

list all databases 

```sql
SHOW DATABASES;
```

create database 

```sql
CREATE DATABASE name_of_database;
```

delete database

```sql
DROP DATABASE database_name;
```

select database

```sql
use database_name;
```

### table commands.

list all the tables

```sql
show tables;
```

check the structure of table

```sql
DESC table_name;
```

create table syntex

```sql
CREATE TABLE [IF NOT EXIST] table_name (
    col_1_definition,
    col_2_definition, 
    ....,
    table_constraints
) 
```

create column syntex

```sql
col_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] column_constraints;
```

table example 

```sql
create table if not exists task (
    task_id int auto_increment primary key,
    title varchar(40) not null,  
    start_date date, 
    due_date date,
    status tinyint not null,
    description text,
    created_at timestamp default current_timestamp
)
```

AUTO_INCREMENT - it is feature of mysql which automatic increase the column value by one whenever put new entry in table.

task_id => 100 then next 101

column_constraints - to limit our column to specific data. 

1. primary key - it is the unique key to make a entry as unique entry and entry will recognised based on this key.

2. foreign key - the key which used to create relation between two or more tables. this key belongs to another table.

relations in table

one to one ( uni or bi )

one to many  ( uni or bi )

many to one ( uni or bi )

many to many ( uni or bi )

Alter table for adding new column syntex

```sql
ALTER TABLE table_name ADD new_column_name col_definition [First | AFTER col_name]
```

Example 

```sql
ALTER TABLE task ADD modified_at timestamp default current_timestamp;
```

Alter table for modify column syntex

```sql
ALTER TABLE table_name MODIFY new_column_name col_definition [First | AFTER col_name]
```

Example 

```sql
ALTER TABLE task modify title varchar(50) not null;
```

Alter table for drop / rename column syntex

```sql
ALTER TABLE table_name  DROP COLUMN column_name;
ALTER TABLE table_name  RENAME TO new_column_name;
```

Delete table 

```sql
DROP TABLE table_name;
```

### Working with data.

Insert data into table syntex

```sql
INSERT INTO tbl_name ( col1_name, col2_name, ... ) VALUES (V1, V2, ... );
```

Example 

```sql
INSERT INTO task(title, status) values ("learn mysql", 1);
```

Fetch data from table syntex

```sql
SELECT select_list(col_names list) FROM tbl_name;
```

Example

```sql
select * from task;
Select title, status from task;
```

update syntex

```sql
UPDATE tbl_name SET col1_name = value1, col2_name = value2 WHERE condition;
```

Example

```sql
UPDATE task SET description = 'learn mysql basic and joins' where task_id = 1;
```

Delete data syntex

```sql
DELETE FROM tbl_name WHERE condition;
```

Example

```sql
delete from task where task_id = 1;
delete from task where title = 'learn mysql';
```

### Sorting data

Sort the list and get data based on condition syntex

```sql
SELECT select_list FROM tbl_name ORDER BY col1 [ASC|DESC], col2 , ...;
```

Example

```sql
select * from customers order by contactFirstName ;
```

### Filtering data

Where clause 

```sql
SELECT select_list FROM tbl_name WHERE search_condition;
```

Example

```sql
SELECT * FROM employees where jobTitle='Sales Rep';
```

Select Distinct

```sql
SELECT select_list FROM tbl_name WHERE search_condition ORDER BY sort_expression;
```

Example

```sql
select DISTINCT lastName from employees order by lastName;
```

AND  Example  

```sql
select * from customers where country='USA' and state='CA';
```

OR Example

```sql

```

IN Example

```sql

```

NOT IN Example

```sql

```

BETWEEN Example

```sql

```

Like Example

```sql

```

Limit Example

```sql

```

IS null Example

```sql

```

### Table Joins

alias is used to improve the readility of the queries.

syntex

```sql
SELECT [col1 | expression] AS descriptive_name FROM tbl_name;
```

Example 

```sql
select concat_ws(' ', lastName, firstname) AS 'Full Name' from employees;
select concat_ws(', ', firstName, lastName) AS 'Full Name' from employees order by 'Full Name';
```

#### JOIN clauses

inner join syntex

```sql
SELECT col_list FROM tbl_1 INNER JOIN tbl_2 USING (col_name);
```

Example

```sql
select 
    m.member_id, m.name AS members, 
    c.committee_id , c.name AS committees
from
    members m 
inner join
    committees c 
on  
    c.name = m.name;
```

left join syntex

```sql
SELECT col_list FROM tbl_1 LEFT JOIN tbl_2 ON join_condition;
```

Example

```sql
select 
    m.member_id, m.name AS members, 
    c.committee_id , c.name AS committees
from
    members m 
left join
    committees c 
using(name);
```

```sql
select 
    m.member_id, m.name AS members, 
    c.committee_id , c.name AS committees
from
    members m 
left join
    committees c 
using(name)
where c.committee_id is null;
```

Right join syntex

```sql
SELECT col_list FROM tbl_1 RIGHT JOIN tbl_2 ON join_condition;
```

Example 

```sql

```

Cross join syntex

```sql
SELECT select_list FROM tbl1 CROSS JOIN tbl2;
```

Example

```sql
select 
    m.member_id, m.name AS members, 
    c.committee_id , c.name AS committees
from
    members m 
cross join 
    committees c;
```

self join - allow us to join two or more columns in the same table and self performed by using inner, left, right joins.

Example

```sql
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
```

### views

views don't have any values. view is virtual table created by query by joining one or many tables.

two ways to create view 

1. by commandline 

2. by workbench

**Syntex**

```sql
create [or replace] view view_name as select col, .. from tables [where conditions];
```

Example

first we try to fetch customer payment from two tables. as this query can used many times. 

```sql
select customerName, checkNumber, paymentDate, amount from customers inner join payments using (customerNumber);
```

so it is better to create a view 

```sql
create view customerPayments as select customerName, checkNumber, paymentDate, amount from customers inner join payments using (customerNumber);
```

To run the view just run the query below

```mysql
 select * from customerPayments;
```

**update view**

Allow to manipulate the data tables only if table not contain elements.

1. Aggregate function like MIN MAX AVG and COUNT.

2. DISTINCT

3. GROUP BY

4. HAVING

5. UNION

6. LEFT JOIN OR OUTER JOIN

7. subquery

8. etc.

Example

create table and put some values in it.

```sql
CREATE TABLE item (
    id int auto_increment primary key,
    name varchar(50) not null,
    price decimal(11, 2) not null
);

insert into item (name, price) values ('laptop', 80000.00), ('Desktop', 100000.00);
insert into item (name, price) values ('android', 80000.00), ('iphone', 100000.00);
select * from item;
```

create the view with some [conditions].

```sql
create view luxuryItems as select * from item where price > 81000;
```

now run view and get list of all luxury items.

```sql
select * from luxuryItems;
```

let delete the one entry by using view.

```sql
 Delete from luxuryItems where id=4;
```

### Index

ways of creating indexing

while creating table

**Syntex**

```mysql
create table t( 
    col1 ...,
    col2 ...,
    col3 ...,
    Index (col2, col3)
)
```

create index on table.

```mysql
create index index_name on table_name (col_list)
```

Internally index use by default btree algorithm. and indexing cast few write in database.

**Example.**

To check how much rows processed while looking for the entries.

```sql
explain select employeeNumber, lastName, firstName from employees where jobtitle="Sales Rep";
```

explain element explain about the how select query run and how many row processed while performing operation. now lets create index for jobtitle.

```mysql
create index jobtitle on employees(jobtitle);
```

re-run the explain query again and compare the result.

**Show index**

To check index 

```sql
show indexes from table_name;
show indexes from database_name.table_name;
show indexes from table_name in database_name;
show index in table_name from database_name;
```

get the index details by using where clouse.

```sql
 Show indexes from employees where visible = 'NO'
```

type of indexing 

1. Unique indexing - uses unique indexes to ensure distinct values.

2. prefix indexing - use the prefix index to create an index for a character strings column.

## Stored procedures

these are pre-compiled sql statements stored in a database. they are subroutines containing a name, a parameter list, and SQL statements.

```sql
DELIMITER $$

CREATE PROCEDURE [IF NOT EXISTS] name(parameters)
BEGIN 
    SQL statements (queries).
END$$

DELIMITER ;
```

Example

```sql
DELIMITER $$

CREATE PROCEDURE GetCustomers()
BEGIN 
    select customerName, contactFirstName, contactLastName, phone from customers;
END$$

DELIMITER ;
```

**Advantage**

1. **Reduce network Traffic.**

2. **centralize bussiness logic in database.**

3. **make the database more secure.**

**Disadvantages**

1. **Resource usage** - cache memory.

2. **Troubleshooting** 

3. **Maintenances** 

### DELIMITER

### Remove Procedures

```sql
DROP PROCEDURE [IF EXISTS] name;
```

```sql
DROP PROCEDURE IF EXISTS GetCustomers;
```

### Declaring variables

These are internal storage of procedure to store data from queries and use it to perform other operation.

```sql
DECLARE var_name datatype(size) [DEFAULT value];
```

```sql
DELIMITER $$

CREATE PROCEDURE `getTotalOrders`()
BEGIN
    DECLARE TotalOrder INT DEFAULT 0;

    SELECT COUNT(*) INTO totalOrder FROM orders;

    SELECT TotalOrder;
END$$

DELIMITER ;
```

#### Variable scope

1. **local to procedures**

2. **session** @variableName

#### Assigning variable

```sql
DECLARE total INT DEFAULT 0;
SET total = 100;
```

### Parameters

It is way to send input to the stored procedures. there are some rules to define parameters.

1. IN     - input for the stored procedure.

2. OUT - send back the parameter to the calling program.

3. INOUT - these parameter able to perform both in/out action.

```sql
[IN | OUT | INOUT] parameterName datatype[(length)]
```

Example

```sql
CREATE PROCEDURE `GetOrderCountByStatus`(
    IN orderStatus VARCHAR(25),
    OUT total INT
)
BEGIN
    SELECT COUNT(orderNumber) INTO total FROM orders WHERE status = orderStatus;
END
```

### Alter procedures.

procedures are not directly Alter, we need to drop and recreate it again with new changes.

To make changes into stored procedure  first need to drop it and need to recreate it with new changes.

### List out all procedures.

it will list all the procedures already created in database.

```sql
SHOW PROCEDURE STATUS [LIKE 'pattern' | WHERE search_condition ]


SHOW PROCEDURE STATUS;
```

### Define Conditions.

In procedures sometime need to filter out the data based on condition  so todo that we have two ways.

1. If statement

2. Case statement.

**If else if else Statment**

```sql
IF condition THEN
    statements;
ELSEIF  condition THEN
    statements;
...
ELSE 
    statements;
END IF;
```

Example

```sql
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
```

run queries for output.

```sql
SELECT customerNumber, creditLimit FROM customers WHERE creditLimit > 50000;

call GetCustomerLevel(200, @Level);
select @Level;
```

**Case statement**

It is similar to the switch statement in the other programming languages.

**Syntex**

```sql
CASE case_value
    WHEN when_value2 THEN statements1
    WHEN when_value2 THEN statements2
    ...
    [ELSE else statement]
END CASE;
```

if we skip the else statement then program will throw error.

**Case not found for CASE statement** 

To stop this error message from executing if dont have any else statement;

```sql
CASE case_value
    WHEN when_value2 THEN statements1
    WHEN when_value2 THEN statements2
    ...
    ELSE 
        BEGIN
        END;
END CASE;
```

by this program not generate any ELSE case error.



Example 

```sql
CREATE PROCEDURE `GetCustomerShipping`(
	IN pCustomerNumber INT,
    OUT pShipping VARCHAR(50)
)
BEGIN
	DECLARE customerCountry VARCHAR(100);
    
    SELECT country
	INTO customerCountry 
    FROM customers
	WHERE customerNumber = pCustomerNumber;
        
	CASE customerCountry
		WHEN 'USA' THEN
			SET pShipping = '2-day Shipping';
        WHEN 'Canada' THEN    
			SET pShipping = '3-day Shipping';
		ELSE
			SET pShipping = '5-day Shipping';
	END CASE;
END
```

To running above run below query

```sql
call GetCustomerShipping(234, @Shipping);
select @Shipping;
```



### Loops

Loops are similar to performing same many times, like writing on paper even the content of writing will change but process will be same.

1. While loop

2. Repeat loop

3. leave statement.



**While loop**

**syntex**

```sql
[begin_label:] 
    WHILE search_condition 
    DO 
        ...
        ...
 END WHILE
[end_label]
```

Example

```sql
CREATE PROCEDURE `simpleLoop`()
BEGIN
	DECLARE x INT DEFAULT 1;
    DECLARE str VARCHAR(255) DEFAULT '';
    
    loop_label: LOOP
		IF x > 10 THEN
			LEAVE loop_label;
		END IF;
		
        SET x = x + 1;
        
        IF (x mod 2) THEN
			ITERATE loop_label;
		ELSE 
			SET str = CONCAT(str, x, ',');
		END IF;
        
	END lOOP;
    
    SELECT str;
END
```



**Repeat loop**

IT is similar to the while loop but it throw least one output or response on first execution.

**Syntex**

```sql
[begin_label:] REPEAT
        statements
        ...
        ...
 UNTIL search_condition
 END REPEAT
[end_label]

```

Example

```sql
CREATE PROCEDURE `simpleRepeat`()
BEGIN
	DECLARE counter INT DEFAULT 1;
    DECLARE outputText VARCHAR(255) DEFAULT '';
    
    REPEAT
		SET outputText = CONCAT(outputText, counter, ',');
		SET counter = counter + 1;
		
	UNTIL counter >= 10
	END REPEAT;
    
    SELECT outputText;
END
```



## Stored Functions

It is similar to stored procedures but can executed inside the query.

**Syntex**

```sql
CREATE FUNCTION fun_name(
    param1,
    param2, 
    ...
)
RETURN datatype
[NOT] DETERMINSTIC
BEGIN
    statements
END $$


```

Example

```sql
CREATE FUNCTION `CustomerLevel`(
	credit DECIMAL(10, 2)
) RETURNS varchar(20) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE CustLvl VARCHAR(20);
    
	IF credit > 50000 THEN
		SET CustLvl = 'PLATINUM';
	ELSEIF (credit >= 50000 AND  credit <= 50000) THEN
		SET CustLvl = 'GOLD';
	ELSE
		SET CustLvl = 'SILVER';
	END IF;
    
	RETURN (CustLvl);
END
```

To execute running query

```sql
select customerName, CustomerLevel(creditLimit) from customers;
```

### Drop function

To drop the function need to follow the same step as do in stored procedures.

### Listing Stored function

```sql
SHOW FUNCTION STATUS [LIKE 'pattern' | WHERE search_condition ]


SHOW FUNCTION STATUS;
```





## MySQL triggers

A trigger is a stored program invoked automatically in reponse to an each event such as insert, update and delete that occurs in the associated table.

there are two type's of triggers 

1. row-level - it will invoked when row of table have any changes, it invoked 100 times for the 100 rows effected. 

2. statement-level - it will invoked when each transaction executed regardless of how many rows are effected.

**NOTE** - mysql only support row-level



Advantages.

Disadvantages.



### Create trigger

**Syntex**

```sql
CREATE TRIGGER trigger_name
{ BEFORE | AFTER } {INSERT | UPDATE | DELETE }
ON table_name FOR EACH ROW 
trigger_body;
```

----

**Before Insert syntex**

```sql
CREATE TRIGGER trigger_name
BEFORE INSERT 
ON table_name FOR EACH ROW 
trigger_body;
```

**after Insert syntex**

```sql
CREATE TRIGGER trigger_name
AFTER INSERT 
ON table_name FOR EACH ROW 
trigger_body;
```

----

**Before update syntex**

```sql
CREATE TRIGGER trigger_name
BEFORE UPDATE 
ON table_name FOR EACH ROW 
trigger_body;
```

**Example**

```sql
CREATE TRIGGER before_employee_update
	BEFORE UPDATE ON employees
    FOR EACH ROW
INSERT INTO emp_audit
SET action = 'update',
	employeeNumber = OLD.employeeNumber,
    lastName = OLD.lastName,
    Changedate = NOW();
```

To check any changes just execute the below queries.

```sql
select * from employees;

update employees set lastName = 'Patterson' where employeeNumber = 1002;

select * from emp_audit;
```



**after update syntex**

```sql
CREATE TRIGGER trigger_name
AFTER UPDATE ON table_name FOR EACH ROW 
trigger_body;
```

-----

**Before delete syntex**

```sql
CREATE TRIGGER trigger_name
BEFORE DELETE 
ON table_name FOR EACH ROW 
trigger_body;
```

**after delete syntex**

```sql
CREATE TRIGGER trigger_name
AFTER DELETE 
ON table_name FOR EACH ROW 
trigger_body;
```

### DROP trigger

```sql
DROP TRIGGER [IF EXISTS] [schema_name.] trigger_name;
```



### Show trigger

```sql
SHOW TRIGGERS;
```



# practical

## Practical 1

create a database based on car selling. in this database must have car table, customer, sellers, shop_locations. and make the relation between the cars and sellers (one to many).

1. create one table using foreign key.

2. create a table and after adding some entries rename table to into another table name.

3. find out the difference between the delete and truncate table.

4. what is insert ingnore and write query for using ignore.

5. write a join query with 3 tables

## Practical 2

1. practice the indexing on the table check all different types of indexing.

2. check how to use rename, drop, with check option, local & cascaded view.

## Practical 3

1. Read and practice from Stored procedures upto triggers and update all the code block with you own practical example.

2. Check about the what are Event in mysql, how to create and use it.
