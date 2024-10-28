-- Отримания Приписала к категориулу Филмиевого
ВЫБРАТЬ ф.title, ф.length, к.name КАК категория
ИЗ филлим ф
PRIСОEDYNЯDYTHESI film_category fc NА f.film_id = fc.film_id
PRIСОEDYNЯETEСIL categiya c NA fc.category_id = c.category_id;

--Фильми, орендовані певним клієнтом
ВЫБРАТЬ ф.title, р.rental_period
ИЗ заказчик в
PRIСОEDYNЯTESI arénda рНА c.customer_id = р.customer_id
PRIСОEDINIATEСI invetary i NA r.inventory_id = i.inventory_id
ПРИСОЭДИЦИАЯ филиал ф А i.film_id = ф.film_id
GDE c.first_name = 'САРА' И c.last_name = 'LIJIZYС';

-- Популярный Филмитов
ВЫБРАТЬ ф.название, ГРАФ(*) КАК Аренда_счет
ИЗ Аренда р
PRIСОEDINIATEСI invetary i NA r.inventory_id = i.inventory_id
ПРИСОЭДИЦИАЯ филиал ф А i.film_id = ф.film_id
ГРУППА ПО ф.название
ОРДЕН ПО аренда_счет ДЕСК
ПРЁДЕЛЬЕ 5;

-- ДАДАВАННЯ НОВОГО КЛІЄНТА
-- Перевірка існуваня міста
ВЫБРАТЬ год_ыд ИЗ год ГДЕ год = "Сан-Франциско";
-- Додавання нового адреса
ВСТАВИТЬ В адрес (адрес, район, city_id, postal_code, teléfohn)
ЦЕННОКТИ ('123 Главная Улица', 'Район', (ВЫБРАТЬ год_ыд ИЗ год ГДЕ год = "Сан-Франциско"), '94101', '777-888-7890');
-- Додавання нового клієнта
СТАВИТЬ В заказчик (first_name, last_name, address_id, store_id, email, activebool, create_date)
ЦЕННОКТИ ('Алиса', 'Купер', 1, 1, "alissа.cuper@example.com", ПРАВДА, ТЕКЮ В ЕЩЕ ОДНОЙ СТРАННОЙ ВЕЩЬЮ С ЮРЬЕ_ДАТА);
-- ОНОВЛЕННЯ АДРЕСИ КЛІЄНТА
ОБНОВЛЕНЕЦ заказик
НАБОР адрес_id = (ВЫБРАТЬ adrés_yd ЯВЛЯЕТСЯ adrés GDE adrés = '456 Вячеслав Улица')
GDE first_name = 'Алиса' И фамилия = 'Купер';
-- ВИДАЛЕННЯ КЛІЄНТА
УДАЛИТ ИЗ заказчик
GDE first_name = 'Алиса' И фамилия = 'Купер';
