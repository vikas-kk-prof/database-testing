# Database testing

**Topics**

1. what is a Database application 

2. Purpose of database application

3. different types of database application

4. Database testing Vs Application testing

5. What should be tested in database testing.

6. Database testing phases.

7. Types of database testing





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

    id                  1

    name      vikas  

   email    vikaskpro7

  password   abcd

  

employee

       id    1

        person_id 1    



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
   
   


