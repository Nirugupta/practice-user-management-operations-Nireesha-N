-- ============================================================================
-- Database Setup and Data Insertion
-- ============================================================================

-- Switch to the practice database
USE `new db`;

-- Insert a single record into the users table
INSERT INTO users (username, firstName, lastName, age) 
VALUES ('jdoe', 'John', 'Doe', 35);

-- Insert multiple records into the users table
INSERT INTO users (username, firstName, lastName, age)
VALUES
 ('asmith', 'Alice', 'Smith', 20),
 ('bdoe', 'Bob', 'Doe', 33),
 ('cjohnson', 'Charlie', 'Johnson', 41),
 ('dlee', 'David', 'Lee', 19),
 ('ejones', 'Eve', 'Jones', 30),
 ('fkim', 'Frank', 'Kim', 15),
 ('gwhite', 'Grace', 'White', 22),
 ('hwang', 'Henry', 'Wang', 19),
 ('ijones', 'Ivy', 'Jones', 50),
 ('jdoe', 'John', 'Doe', 65),
 ('klee', 'Kevin', 'Lee', 62),
 ('lchen', 'Linda', 'Chen', 24),
 ('mlee', 'Michael', 'Lee', 29),
 ('nkim', 'Nancy', 'Kim', 18),
 ('ojohnson', 'Oscar', 'Johnson', 40),
 ('pchen', 'Peter', 'Chen', 55),
 ('qwang', 'Quincy', 'Wang', 28),
 ('rjones', 'Rachel', 'Jones', 37),
 ('slee', 'Sam', 'Lee', 21),
 ('tkim', 'Tina', 'Kim', 26);


-- ============================================================================
-- Data Updates and Deletions
-- ============================================================================

-- Disable safe update mode to allow updates without a key column in the WHERE clause
SET SQL_SAFE_UPDATES = 0;

-- Update specific user's first and last name based on username
UPDATE users SET firstName = 'Jane', lastName = 'Doe' WHERE username = 'jdoe';

-- Update all users with the last name 'Doe' to have the first name 'Jane'
UPDATE users SET firstName = 'Jane' WHERE lastName = 'Doe';

-- View all records in the users table
SELECT * FROM users;

-- Delete a user where the username matches 'Oscar'
DELETE FROM users WHERE username = 'Oscar';


-- ============================================================================
-- Filtering Data with WHERE Clauses
-- ============================================================================

-- Select first and last names of users whose last name is 'Lee'
SELECT firstName, lastName FROM users WHERE lastName = 'Lee';

-- Filter using AND and OR logical operators
SELECT * FROM users WHERE lastName = 'Doe' AND firstName = 'John';
SELECT * FROM users WHERE lastName = 'Doe' OR firstName = 'John';
SELECT * FROM users WHERE lastName = 'Doe' AND NOT firstName = 'John';

-- Filter using grouped conditions with parentheses
SELECT * FROM users WHERE lastName = 'Doe' AND (firstName = 'John' OR firstName = 'Jane');


-- ============================================================================
-- Aliasing, Functions, Ordering, and Pagination (LIMIT / OFFSET)
-- ============================================================================

-- Use column aliases to rename output headers
SELECT firstName AS First, lastName AS Last FROM users;

-- Perform mathematical operations on columns and alias the result
SELECT username, age + 10 AS ageIn10Years FROM users;

-- Concatenate columns together into a single full name field
SELECT concat(firstName, ' ', lastName) AS fullName FROM users;

-- Order results in descending order by age
SELECT * FROM users ORDER BY age DESC;

-- Order results by multiple columns (lastName ascending, then firstName ascending)
SELECT * FROM users ORDER BY lastName ASC, firstName ASC;

-- Limit the result set to the first 5 rows
SELECT * FROM users LIMIT 5;

-- Skip the first 5 rows and limit the next 5 rows
SELECT * FROM users LIMIT 5 OFFSET 5;

-- Order results, skip 15 rows, and return the next 2 rows
SELECT * FROM users ORDER BY lastName ASC LIMIT 2 OFFSET 15;