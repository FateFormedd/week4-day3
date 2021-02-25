-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT district, customer_id
FROM address
JOIN customer
ON customer.address_id = address.address_id
WHERE district = 'Texas'
--Ans:5

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name

SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > '6.99'
--Ans:1406 payments above 6.99

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);
--Ans: 6 people have more then 175 in payments

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT first_name, last_name
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE city_id = (
	SELECT city_id
	FROM city
	WHERE country_id = (
		SELECT country_id
		FROM country
		WHERE country = 'Nepal'
	)
);
--Ans:Kevin Shuler

-- 5. Which staff member had the most
-- transactions?

SELECT staff_id, COUNT(staff_id)
FROM payment
GROUP BY staff_id
ORDER BY staff_id DESC
limit 1
--Ans:Jon Stephens

-- 6. What film had the most actors in it?

SELECT title, COUNT(actor_id)
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY title
ORDER BY COUNT(actor_id) DESC
--Ans:Lambs Cincinatti

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
)
--Ans:539 customers

-- Which catagory is most prevelent in the films?

SELECT category_id, COUNT(category_id)
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
GROUP BY category_id
ORDER BY COUNT(category_id) DESC
--Ans:Category 15 with 74 films