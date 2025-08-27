-- 1. Base table
CREATE OR REPLACE TABLE customers (
    id INT,
    name STRING,
    city STRING
);

-- 2. Insert sample data
INSERT INTO customers VALUES 
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Ravi', 'Delhi');

-- 3. Create a standard view (Delhi customers only)
CREATE OR REPLACE VIEW delhi_customers AS
SELECT id, name
FROM customers
WHERE city = 'Delhi';

-- 4. Query the view
SELECT * FROM delhi_customers;


-- Normal View (not materialized)
CREATE OR REPLACE VIEW customer_orders AS
SELECT c.id, c.name, o.order_id
FROM customers c
JOIN orders o ON c.id = o.cust_id;

-- Query
SELECT * FROM customer_orders;

-- 1. Create a base table
CREATE OR REPLACE TABLE customers (
    id INT,
    name STRING,
    city STRING
);

-- 2. Insert sample data
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Ravi', 'Bangalore');

-- 3. Create a Materialized View (stores results physically)
-- Example: only Delhi customers
CREATE OR REPLACE MATERIALIZED VIEW delhi_customers AS
SELECT id, name
FROM customers
WHERE city = 'Delhi';

-- 4. Query the materialized view
SELECT * FROM delhi_customers;
