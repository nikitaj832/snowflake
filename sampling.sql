CREATE OR REPLACE TABLE customers (
    id INT,
    name STRING,
    city STRING,
    age INT
);

INSERT INTO customers (id, name, city, age) VALUES
(1, 'Amit',   'Delhi',   25),
(2, 'Neha',   'Mumbai',  30),
(3, 'Ravi',   'Bangalore', 28),
(4, 'Priya',  'Pune',    35),
(5, 'Arjun',  'Delhi',   40),
(6, 'Kiran',  'Mumbai',  32),
(7, 'Anita',  'Chennai', 29),
(8, 'Raj',    'Delhi',   33),
(9, 'Meera',  'Hyderabad', 26),
(10,'Suresh', 'Kolkata', 38);

-- Bernoulli Sampling (Row by Row)

SELECT *
FROM customers
SAMPLE BERNOULLI (40);

--System Sampling (Block Level)
SELECT *
FROM customers
SAMPLE SYSTEM (30);

-- Fixed Number of Rows
SELECT *
FROM customers
SAMPLE (4 ROWS);


-- Repeatable Sample with SEED
SELECT * FROM customers SAMPLE SYSTEM (30) SEED (10);


