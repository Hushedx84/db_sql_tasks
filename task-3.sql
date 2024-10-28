-- Загальна кількість фільмів у кожній категорії
SELECT c.name AS category, COUNT(f.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- Середня тривалість фільмів у кожній категорії
SELECT c.name AS category, AVG(f.length) AS average_length
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- Мінімальна та максимальна тривалість фільмів
SELECT MIN(length) AS min_length, MAX(length) AS max_length
FROM film;

-- Загальна кількість клієнтів
SELECT COUNT(*) AS total_customers
FROM customer;

-- Сума платежів по кожному клієнту
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

-- П'ять клієнтів з найбільшою сумою платежів
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_payments DESC
LIMIT 5;

-- Загальна кількість орендованих фільмів кожним клієнтом
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name;

-- Середній вік фільмів у базі даних
SELECT AVG(EXTRACT(YEAR FROM AGE(NOW(), TO_DATE(release_year || '-01-01', 'YYYY-MM-DD')))) AS average_age
FROM film;

-- Кількість фільмів, орендованих за певний період
SELECT COUNT(*) AS total_rentals
FROM rental
WHERE lower(rental_period) BETWEEN '2004-01-01' AND '2005-12-31';

-- Сума платежів по кожному місяцю
SELECT DATE_TRUNC('month', payment_date) AS month, SUM(amount) AS total_amount
FROM payment
GROUP BY month
ORDER BY month;

-- Максимальна сума платежу, здійснена клієнтом
SELECT c.first_name, c.last_name, MAX(p.amount) AS max_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

-- Середня сума платежів для кожного клієнта
SELECT c.first_name, c.last_name, AVG(p.amount) AS average_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

-- Кількість фільмів у кожному рейтингу
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

-- Середня сума платежів по кожному магазину
SELECT s.store_id, AVG(p.amount) AS average_payment
FROM store s
JOIN customer c ON s.store_id = c.store_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY s.store_id;
