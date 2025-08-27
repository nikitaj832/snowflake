-- Step 1: Create the database
CREATE OR REPLACE DATABASE MANAGE_DB;

-- Step 2: Create schemas for organizing objects
CREATE OR REPLACE SCHEMA MANAGE_DB.file_formats;
CREATE OR REPLACE SCHEMA MANAGE_DB.external_stages;

-- Step 3: Create the ratings table in PUBLIC schema
USE SCHEMA MANAGE_DB.PUBLIC;

CREATE OR REPLACE TABLE ratings (
    userId INT,
    movieId INT,
    rating FLOAT,
    rating_timestamp TIMESTAMP
);

-- Step 4: Create a CSV file format in file_formats schema
CREATE OR REPLACE FILE FORMAT MANAGE_DB.file_formats.csv_fileformat
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_DELIMITER = ',';

-- Step 5: Create an external stage in external_stages schema
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.csvstage
  URL = 's3://niki-19/csv/snowpipe'
  CREDENTIALS = (
    AWS_KEY_ID = may aaccses key',
    AWS_SECRET_KEY = my secret key'
  )
  FILE_FORMAT = MANAGE_DB.file_formats.csv_fileformat;

-- Step 6: List files from the stage (to confirm it's accessible)
LIST @MANAGE_DB.external_stages.csvstage;

COPY INTO MANAGE_DB.public.ratings
FROM @MANAGE_DB.external_stages.csvstage
FILES = ('/ratings.csv');



SELECT * FROM ratings ;

update MANAGE_DB.public.ratings
    set userid =199999;


alter session set TIMEZONE ='UTC';
show parameters like 'TIMEZONE';

SELECT DATEADD(DAY,1,CURRENT_TIMESTAMP);

SELECT DATEADD(DAY,0,CURRENT_TIMESTAMP);

//col :: datatype
//accesing data before timestamp

SELECT * from MANAGE_DB.public.ratings before(timestamp => '2025-08-11 07:26:40.145'::timestamp);

SELECT * FROM MANAGE_DB.public.ratings before(STATEMENT => '01be4b2f-3201-dc66-0000-000f2f26f2fd');

DROP TABLE ratings;
// restore data
undrop table MANAGE_DB.public.ratings;

update MANAGE_DB.public.ratings
    set userid =299999;
    
update MANAGE_DB.public.ratings
    set userid = 8888888;

SELECT * FROM ratings ;

create or replace table MANAGE_DB.public.ratings as 
select * from ratings  BEFORE(statement => '01be4b42-3201-dc66-0000-000f2f26f429');

SELECT * FROM ratings ;

create or replace table MANAGE_DB.public.ratings_nk as 
select * from ratings  BEFORE(statement => '01be4b42-3201-dc66-0000-000f2f26f429');



