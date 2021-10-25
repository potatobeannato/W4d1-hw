-- This is a comment!
-- Selec all records from the actor table
SELECT *
FROM actor
LIMIT 10 OFFSET 5;
-- LIMIT says how many records to get
-- Query for first and last name of all actor
SELECT first_name,
    last_name
FROM actor -- Query for a first_name that equals Nick
SELECT first_name,
    last_name
FROM actor
WHERE first_name = 'Nick' -- Query for last_name that is Walhberg
SELECT first_name,
    last_name
FROM actor
WHERE last_name = 'Wahlberg' -- Query the word LIKE is the same as the equal sign
SELECT first_name,
    last_name
FROM actor
WHERE first_name LIKE 'Jon' -- Query with a % where name starts with a letter, % is like a wild card that called upon the thigns that is beeing look
SELECT first_name,
    last_name
FROM actor
WHERE first_name LIKE '%y%' -- % is any number from 0-infinity spaces
    -- _ is just one space
    -- all the names that start with a k and has 2 letters after the K
SELECT first_name,
    last_name
FROM actor
WHERE first_name LIKE 'K__%' -- for all first_name that starts with a K and end with a th
SELECT first_name,
    last_name
FROM actor
WHERE first_name LIKE 'K__%th' -- Comparison operators:
    - - >,
    <,
    >=,
    <=,
    <> (not equal),
    -- Query the Payment tables customers who paid an amount greater than $2
    -- ORDER BY amount will sort it from smallest to biggest
    -- ORDER BY if descending from biggest to smallest by using ASC or DESC
SELECT customer_id,
    amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount DESC;
-- Query for between an amount
SELECT customer_id,
    amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;
-- Query not equaly to $0.00 order Descending order
SELECT customer_id,
    amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;
-- SQL aggergations SUM, AVG, COUNT, MIN, MAX
-- Query to display sum of amounts paid that are greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99 -- Query to display average amounts paid that are greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;
--Query COUNT
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;
-- Query to display how many DISTINCT amounts paid that are greater than 5.99
-- DISTINCT will remove the same of amount
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;
-- Query to display the min/max amount greater than 7.99
SELECT MIN(amount) AS Min_num_payments
FROM payment
WHERE amount > 7.99;
SELECT MAX(amount) AS Min_num_payments
FROM payment
WHERE amount > 7.99;
SELECT MIN(amount) AS Min_num_payments,
    MAX(customer_id)
FROM payment
WHERE amount > 7.99;
--GROUP_BY
-- Query to display different amounts grouped together and count the amounts
SELECT amount,
    COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;
-- Query to display different customer_ids with the summed amounts for each customer_id
SELECT customer_id,
    SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;
--Query to display cistomer_id with the amounts for each customer
SELECT customer_id,
    amount
FROM payment
GROUP BY amount,
    customer_id
ORDER BY customer_id DESC;
-- Query to display customer_id that show up more than 5 times
-- Grouping by the customer's email
-- When use GROUP BY can't use WHERE but need to use HAVING
SELECT COUNT(customer_id),
    email
FROM customer
GROUP BY email
HAVING COUNT(customer_id) > 0;
-- Need to be in this order
SELECT COUNT(customer_id),
    email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;
ORDER BY email
LIMIT 10 OFFSET 2;
-- HW Questions
-- 1.How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';
-- 2. How many payments were made between $3.99 and $5.99
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
--3. What film does the store have the most of? (search in inventory)
SELECT film_id,
    COUNT(film_id) AS most_occurence
FROM inventory
GROUP BY film_id
ORDER BY most_occurence DESC
LIMIT 1;
--4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William' --5.What store employee (get the id) sold the most rentals?
SELECT staff_id,
    SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY staff_id DESC;
--6. How many different district names are there?
SELECT COUNT(DISTINCT(district))
FROM address 
--7. What film has the most actors in it? (use film_actor table and get film_id
SELECT film_id,
    COUNT(film_id) AS most_occurence
FROM film_actor
GROUP BY film_id
ORDER BY most_occurence DESC
LIMIT 1;
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%___es%' --9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
    - - with ids between 380 and 430 ? (
        use
        group by
            and
        having > 250
    )
SELECT COUNT(amount) > 4.99
FROM payment
WHERE rental_id BETWEEN 380 AND 430
GROUP BY rental_id
HAVING COUNT(rental_id) > 250;
--10 Within the film table, how many rating categories are there? And what rating has the most 
--movies total
SELECT COUNT(rating) AS most_movie
FROM film
GROUP BY rating
ORDER BY most_movie DESC
LIMIT 1;