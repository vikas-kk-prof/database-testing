CREATE DATABASE new_db;

USE new_db;

create table if not exists task (
	task_id int auto_increment primary key,
    title varchar(40) not null,
    start_date date,
    due_date date,
    status tinyint not null,
    description text,
    created_at timestamp default current_timestamp
);

ALTER TABLE task ADD modified_at timestamp default current_timestamp;

ALTER TABLE task modify title varchar(50) not null;

INSERT INTO task(title, status) values ("learn mysql", 1);

select * from task;
Select title, status from task;

UPDATE task SET description = 'learn mysql basic and joins' where task_id = 1;

delete from task where task_id = 1;
delete from task where title = 'learn mysql';

CREATE TABLE members (
	member_id INT auto_increment,
    name varchar(50),
    primary key (member_id)
);

create table committees (
	committee_id int auto_increment,
    name varchar(50),
    primary key (committee_id)
);

insert into members(name) values ('vikas'), ('vijay'), ('vikram'), ('aman');
insert into committees(name) values ('vijay'), ('vikram'), ('aman');

select 
	m.member_id, m.name AS members, 
    c.committee_id , c.name AS committees
from
	members m 
inner join
	committees c 
on  
	c.name = m.name;


select 
	m.member_id, m.name AS members, 
    c.committee_id , c.name AS committees
from
	members m 
left join
	committees c 
using(name)
where c.committee_id is null;


select 
	m.member_id, m.name AS members, 
    c.committee_id , c.name AS committees
from
	members m 
cross join 
	committees c;
