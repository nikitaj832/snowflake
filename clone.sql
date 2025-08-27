USE DATABASE MANAGE_DB;
USE SCHEMA file_formats;

CREATE OR REPLACE TABLE students (
    student_id INT,
    first_name STRING,
    last_name STRING,
    age INT,
    city STRING
);
INSERT INTO students (student_id, first_name, last_name, age, city) VALUES
(1, 'Rahul', 'Sharma', 21, 'Delhi'),
(2, 'Priya', 'Mehta', 22, 'Mumbai'),
(3, 'Amit', 'Verma', 20, 'Bangalore'),
(4, 'Sneha', 'Patel', 23, 'Ahmedabad'),
(5, 'Vikram', 'Singh', 24, 'Jaipur'),
(6, 'Anjali', 'Kapoor', 22, 'Chennai'),
(7, 'Rohit', 'Gupta', 21, 'Kolkata'),
(8, 'Neha', 'Joshi', 23, 'Hyderabad'),
(9, 'Arjun', 'Reddy', 25, 'Pune'),
(10, 'Meera', 'Nair', 20, 'Kochi');

select * from students;

CREATE OR REPLACE TABLE students_clone CLONE students;

SELECT * FROM students_clone;

UPDATE students SET city = 'Goa'
WHERE student_id = 1;

SELECT * FROM students_clone WHERE student_id = 1;


CREATE OR REPLACE temporary TABLE temp_students (
    student_id INT,
    first_name STRING,
    last_name STRING,
    age INT,
    city STRING
);
INSERT INTO temp_students (student_id, first_name, last_name, age, city) VALUES
(1, 'Rahul', 'Sharma', 21, 'Delhi'),
(2, 'Priya', 'Mehta', 22, 'Mumbai'),
(3, 'Amit', 'Verma', 20, 'Bangalore'),
(4, 'Sneha', 'Patel', 23, 'Ahmedabad'),
(5, 'Vikram', 'Singh', 24, 'Jaipur'),
(6, 'Anjali', 'Kapoor', 22, 'Chennai'),
(7, 'Rohit', 'Gupta', 21, 'Kolkata'),
(8, 'Neha', 'Joshi', 23, 'Hyderabad'),
(9, 'Arjun', 'Reddy', 25, 'Pune'),
(10, 'Meera', 'Nair', 20, 'Kochi');

CREATE OR REPLACE TEMPORARY TABLE temp_students_clone CLONE temp_students;

create table xxyy CLONE temp_students;

create transient table st(
student_id INT,
    first_name STRING
);
insert into st values (1,'mahak'),(2,'niku');

CREATE OR REPLACE table xx CLONE st;


-- cloning schema
create transient schema  new_schema
clone MANAGE_DB.EXTERNAL_STAGES;

CREATE database new_DB_copied
clone MANAGE_DB;



create table new(
student_id INT,
    first_name STRING
);
insert into new values (1,'mahak'),(2,'niku');

update new
set first_name = 'frank' where student_id =1;

select * from new;


select * from new at(offset => -60*1);

create or replace table new_clone CLONE new at (offset => -60*1.5);

select * from new_clone;


CREATE OR REPLACE TABLE new_clone_1 CLONE new
before (STATEMENT => '01be728a-3201-de99-000f-2f4200013336');

select * from new_clone_1;USE DATABASE MANAGE_DB;
USE SCHEMA file_formats;

CREATE OR REPLACE TABLE students (
    student_id INT,
    first_name STRING,
    last_name STRING,
    age INT,
    city STRING
);
INSERT INTO students (student_id, first_name, last_name, age, city) VALUES
(1, 'Rahul', 'Sharma', 21, 'Delhi'),
(2, 'Priya', 'Mehta', 22, 'Mumbai'),
(3, 'Amit', 'Verma', 20, 'Bangalore'),
(4, 'Sneha', 'Patel', 23, 'Ahmedabad'),
(5, 'Vikram', 'Singh', 24, 'Jaipur'),
(6, 'Anjali', 'Kapoor', 22, 'Chennai'),
(7, 'Rohit', 'Gupta', 21, 'Kolkata'),
(8, 'Neha', 'Joshi', 23, 'Hyderabad'),
(9, 'Arjun', 'Reddy', 25, 'Pune'),
(10, 'Meera', 'Nair', 20, 'Kochi');

select * from students;

CREATE OR REPLACE TABLE students_clone CLONE students;

SELECT * FROM students_clone;

UPDATE students SET city = 'Goa'
WHERE student_id = 1;

SELECT * FROM students_clone WHERE student_id = 1;
CREATE OR REPLACE temporary TABLE temp_students (
    student_id INT,
    first_name STRING,
    last_name STRING,
    age INT,
    city STRING
);
INSERT INTO temp_students (student_id, first_name, last_name, age, city) VALUES
(1, 'Rahul', 'Sharma', 21, 'Delhi'),
(2, 'Priya', 'Mehta', 22, 'Mumbai'),
(3, 'Amit', 'Verma', 20, 'Bangalore'),
(4, 'Sneha', 'Patel', 23, 'Ahmedabad'),
(5, 'Vikram', 'Singh', 24, 'Jaipur'),
(6, 'Anjali', 'Kapoor', 22, 'Chennai'),
(7, 'Rohit', 'Gupta', 21, 'Kolkata'),
(8, 'Neha', 'Joshi', 23, 'Hyderabad'),
(9, 'Arjun', 'Reddy', 25, 'Pune'),
(10, 'Meera', 'Nair', 20, 'Kochi');

CREATE OR REPLACE TEMPORARY TABLE temp_students_clone CLONE temp_students;

create table xxyy CLONE temp_students;

create transient table st(
student_id INT,
    first_name STRING
);
insert into st values (1,'mahak'),(2,'niku');

CREATE OR REPLACE table xx CLONE st;


-- cloning schema
create transient schema  new_schema
clone MANAGE_DB.EXTERNAL_STAGES;

CREATE database new_DB_copied
clone MANAGE_DB;



create table new(
student_id INT,
    first_name STRING
);
insert into new values (1,'mahak'),(2,'niku');

update new
set first_name = 'frank' where student_id =1;

select * from new;


select * from new at(offset => -60*1);

create or replace table new_clone CLONE new at (offset => -60*1.5);

select * from new_clone;


CREATE OR REPLACE TABLE new_clone_1 CLONE new
before (STATEMENT => '01be728a-3201-de99-000f-2f4200013336');

select * from new_clone_1;