-- Step 1: Create the database
CREATE OR REPLACE DATABASE MANAGE_DB;

-- Step 2: Create schemas for organizing objects
CREATE OR REPLACE SCHEMA MANAGE_DB.file_formats;
CREATE OR REPLACE SCHEMA MANAGE_DB.external_stages;
CREATE OR REPLACE SCHEMA MANAGE_DB.pipes;

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
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  SKIP_HEADER = 1
  FIELD_DELIMITER = ','
  TRIM_SPACE = TRUE
  NULL_IF = ('NULL', 'null')
  EMPTY_FIELD_AS_NULL = TRUE;

-- Step 5: Create an external stage in external_stages schema
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.jsonstage
  URL = 's3://niki-19/csv/snowpipe'
  CREDENTIALS = (
    AWS_KEY_ID = 'myawskey',
    AWS_SECRET_KEY = 'my secret key'
  )
  FILE_FORMAT = MANAGE_DB.file_formats.csv_fileformat;

-- Step 6: List files from the stage (to confirm it's accessible)
LIST @MANAGE_DB.external_stages.jsonstage;

-- Step 7: Create a Snowpipe to automatically load files into the ratings table
CREATE OR REPLACE PIPE employee_pipe
AUTO_INGEST = TRUE
AS
COPY INTO MANAGE_DB.public.ratings
FROM @MANAGE_DB.external_stages.jsonstage
FILE_FORMAT = MANAGE_DB.file_formats.csv_fileformat
ON_ERROR = 'CONTINUE';

-- COPY INTO MANAGE_DB.public.ratings
-- FROM @MANAGE_DB.external_stages.jsonstage
-- FILE_FORMAT = MANsAGE_DB.file_formats.csv_fileformat;

DESC PIPE employee_pipe;


SELECT * FROM ratings;
SELECT count(*) FROM MANAGE_DB.PUBLIC.ratings;

DELETE FROM MANAGE_DB.PUBLIC.ratings;


-- error handle


CREATE OR REPLACE FILE FORMAT MANAGE_DB.file_formats.csv_fileformat
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_DELIMITER = ';'
  TRIM_SPACE = TRUE
  NULL_IF = ('NULL', 'null')
  EMPTY_FIELD_AS_NULL = TRUE;

  


alter pipe employee_pipe refresh;

select system$PIPE_STATUS('employee_pipe');

select * from table(validate_pipe_load(
    pipe_name=>'employee_pipe',
    start_time => DATEADD(hour,-2,current_timestamp())
));


select * From Table (INFORMATION_SCHEMA.COPY_HISTORY(
TABLE_NAME => 'MANAGE_DB.public.ratings',
START_TIME =>  DATEADD(hour,-2,current_timestamp())
));


select * from ratings;

show tables like '%ratings%';

create or replace table manage_db.public.ret_example (
id int,
first_name string,
last_name string,
email string,
gender string,
job string,
phone string
)
data_retention_time_in_days =1;

show tables;

CREATE OR REPLACE TEMPORARY TABLE ratings(
    userId INT,
    movieId INT,
    rating FLOAT,
    rating_timestamp BIGINT
);

INSERT INTO ratings VALUES
(1, 101, 3.5, 10788888),
(2, 102, 5, 10897988);

select * from rating_new;

select * from ratings;


select * from snowflake.account_usage.table_storage_metrics
where table_catalog ='TDB'
ORDER BY table_created desc;






