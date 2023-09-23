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

    id                  11 PK

    name      vikas  

   email    vikaskpro7

  password   abcd



employee

       employee_id    4

        salary  10000

       person_id 11    FK

                

moving from application to database vice-versa.

3. The ACID properties validation (Atomicity, consistency, isolation, durability )

4. The accuracy of implemented business logics.

5. information storage and queries need to be properly tested, database schema, table, triggers.

## Database testing phases

1. Test Environment setup

2. Test Scenario Generation

3. Execution

4. Analysis

5. Log defects 

## Types of database testing

1. Structural Testing

2. Functional Testing

### Structural testing

this is technique that validates all the elements inside the data repository. it is not directly accesable to end user.

1. Schema testing - check the schema formats associated with database, it ensure the schema mapping between front-end and backend.

2. Database table, column testing - check the mapping is compatible with the mapping in the front-end. naming conversion, check any unused/unmapped table/columns. datatype. field lengths.

3. Key and indexes testing - requirement of Primary key or foreign key,  check validation of foreign key. whether application required Clustered indexes or non-Clustered indexes.

4. Store Procedures (methods) Testing - all condition/loop applied for the required input.

5. Database server validation - check configuration of database, authorization.

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
CREATE TABLE [IF NOT EXIST] table_name(
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

one to one (uni or bi )

one to many  (uni or bi )

many to one (uni or bi )

many to many (uni or bi )



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
UPDATE tbl_name SET col1_name = value1, col2_name WHERE condition;
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



# practical

create a database based on car selling. in this database must have car table, customer, sellers, shop_locations. and make the relation between the cars and sellers (one to many).

1. create one table using foreign key.

2. create a table and after adding some entries rename table to into another table name.

3. find out the difference between the delete and truncate table.

4. what is insert ingnore and write query for using ignore.

5. write a join query with 3 tables
   
   
