-- How to display tables data in sql 

# USE database_name; 
-- USE parks_and_recreation;
-- The above syntax is used to target the specific database, so that whenever you select a table the engine will search that table to the current selected db only. 

# Is there any another way to select the table from the specific db without using USE keyword -- yes

SELECT * FROM parks_and_recreation.employee_demographics; 

SELECT first_name FROM parks_and_recreation.employee_demographics;

SELECT 
first_name,
last_name,
CONCAT(first_name, " ", last_name) AS full_name,
birth_date,
age,
(age + 10) * 10
FROM parks_and_recreation.employee_demographics;

# PEMDAS (Parentheses, Exponent, Multiply, Division, Addition and Substraction)
-- In MySQL, the execution of mathematical calculations has order of PEMDAS (left to right)

# DISTINCT 
-- THE DISTINCT keyword used in mysql to display a unique value each time means non-repeatative values/data's 

-- 1. without DISTINCT
SELECT gender FROM parks_and_recreation.employee_demographics;

-- 2. with DISTINCT
SELECT DISTINCT gender FROM parks_and_recreation.employee_demographics;

-- Can we display unique value with combination of columns - yes but there is a catch!

SELECT DISTINCT first_name, gender FROM parks_and_recreation.employee_demographics; 
-- HERE we will get repeatative values of Female or Male from `gender` column why?
-- The reason is the MySQL first apply the DISTINCT to first column which is given as first_name, and because the first_name column does not contains repeated value, the all values are displayed,
-- doesn't matter gender column contains unique value or not, each gender row is became a separate part of each first_name row.

-- Let's take an another example by passing first column name as gender and second as first_name, now as per you we might get only 2 rows because the gender column contains male and female as unique only.

SELECT DISTINCT gender, first_name FROM parks_and_recreation.employee_demographics; -- NOPE

-- Here, still we got repeated values many times, is because when we use DISTINCT and pass combination of columns then the rule applied to all columns because the first_name only contains unique values,
-- the result is managed based on that.