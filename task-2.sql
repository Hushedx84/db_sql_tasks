-- Отримання списку фільмів та їх категорій
SELECT f.title, f.length, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- Фільми, орендовані певним клієнтом
SELECT f.title, r.rental_period
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE c.first_name = 'SARAH' AND c.last_name = 'LEWIS';

-- Популярність фільмів
SELECT f.title, COUNT(*) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- ДОДАВАННЯ НОВОГО КЛІЄНТА
-- Перевірка існування міста
SELECT city_id FROM city WHERE city = 'San Francisco';
-- Додавання нового адреса
INSERT INTO address (address, district, city_id, postal_code, phone)
VALUES ('123 Main St', 'District', (SELECT city_id FROM city WHERE city = 'San Francisco'), '94101', '777-888-7890');
-- Додавання нового клієнта
INSERT INTO customer (first_name, last_name, address_id, store_id, email, activebool, create_date)
VALUES ('Alice', 'Cooper', 1, 1, 'alice.cooper@example.com', TRUE, CURRENT_DATE);
-- ОНОВЛЕННЯ АДРЕСИ КЛІЄНТА
UPDATE customer
SET address_id = (SELECT address_id FROM address WHERE address = '456 Elm St')
WHERE first_name = 'Alice' AND last_name = 'Cooper';
-- ВИДАЛЕННЯ КЛІЄНТА
DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';
