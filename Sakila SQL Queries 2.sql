-- Lab | SQL Intro
USE sakila;

-- Show tables in the database.
SHOW TABLES FROM sakila;

-- Explore tables. (select everything from each table)
SHOW FULL TABLES;

SELECT * FROM sakila.actor;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;

-- Select one column from a table. Get film titles.
SELECT title AS Film_Titles FROM sakila.film;

-- Select one column from a table and alias it. Get languages.
SELECT name AS Film_Language FROM sakila.language;

-- How many stores does the company have? How many employees? which are their names?
SELECT Count(*) store FROM sakila.store;
SELECT Count(*) staff FROM sakila.staff;
SELECT first_name AS First_Name, last_name AS Last_Name FROM sakila.staff;

-- Lab | SQL Queries 2

-- Select all the actors with the first name ‘Scarlett’.
SELECT *, first_name AS First_Name FROM sakila.actor
WHERE first_name IN ('Scarlett');

-- Select all the actors with the last name ‘Johansson’.
SELECT *, last_name AS Last_Name FROM sakila.actor
WHERE last_name IN ('Johansson');

-- How many films (movies) are available for rent?
SELECT count(distinct(inventory_id)) AS Available FROM sakila.rental;

-- How many films have been rented?
SELECT count(rental_date) AS Rented_count FROM sakila.rental;

-- What is the shortest and longest rental period?
SELECT max(DATEDIFF(last_update, rental_date)) AS Rental_period, last_update AS Last_Update, rental_date AS Rental_date FROM sakila.rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length) AS max_duration, min(length) AS min_duration FROM sakila.film;

-- What's the average movie duration?
SELECT avg(length) AS Average_duration FROM sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT TIME_FORMAT(avg(length), '%T') AS Duration FROM sakila.film;

-- How many movies longer than 3 hours?
SELECT count(length) AS Long_movies FROM sakila.film
WHERE length > 180;

-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT first_name, last_name, email, concat((left(first_name,1)), substr(lower(first_name),2),' ', last_name, ' - ', LOWER(email)) AS Formated FROM sakila.customer;

-- What's the length of the longest film title?
SELECT max(CHAR_LENGTH(TRIM(title))) AS Title_Length, title AS Title FROM sakila.film
ORDER BY title DESC;