CREATE OR REPLACE TABLE customers (
    id INT,
    name STRING,
    city STRING
);

INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Ravi', 'Bangalore');


-- Create a Stream on the Table
CREATE OR REPLACE STREAM customer_stream ON TABLE customers;


-- Insert new row
INSERT INTO customers VALUES (4, 'Priya', 'Pune');

-- Update existing row
UPDATE customers SET city = 'Chennai' WHERE id = 2;

-- Delete a row
DELETE FROM customers WHERE id = 3;


SELECT * FROM customer_stream;
Key Columns in Stream

-- METADATA$ACTION → INSERT, DELETE

-- METADATA$ISUPDATE → TRUE if row was updated

-- METADATA$ROW_ID → unique row identifier


-- insert operation
CREATE OR REPLACE TABLE customers (
    id INT,
    name STRING,
    city STRING
);

INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai');

CREATE OR REPLACE STREAM customer_stream ON TABLE customers;

INSERT INTO customers VALUES (3, 'Ravi', 'Bangalore');
SELECT * FROM customer_stream;

-- Row inserted in customers table is captured in the stream.

-- METADATA$ACTION = INSERT → means it was an insert.

-- METADATA$ISUPDATE = FALSE → because it’s a pure insert, not an update.


-- combine stream
-- 1. Create base tables
CREATE OR REPLACE TABLE customers (
    id INT,
    name STRING
);

CREATE OR REPLACE TABLE orders (
    order_id INT,
    cust_id INT
);

-- 2. Create streams on tables (optional but good practice)
CREATE OR REPLACE STREAM customer_stream ON TABLE customers;
CREATE OR REPLACE STREAM order_stream ON TABLE orders;

-- 3. Create a view with aligned schema
CREATE OR REPLACE VIEW combined_changes AS
SELECT id AS key,
       name AS value,
       'CUSTOMER' AS source_table
FROM customers
UNION ALL
SELECT order_id AS key,
       TO_VARCHAR(cust_id) AS value,   -- cast to string so it matches with "name"
       'ORDER' AS source_table
FROM orders;

-- 4. Create a stream on the combined view
CREATE OR REPLACE STREAM combined_stream ON VIEW combined_changes;

-- 5. Insert test data
INSERT INTO customers VALUES (1, 'Amit'), (2, 'Neha');
INSERT INTO orders VALUES (101, 1), (102, 2);

-- 6. Query the combined stream
SELECT * FROM combined_stream;


