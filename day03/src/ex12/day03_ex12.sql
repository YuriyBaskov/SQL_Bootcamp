INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT MAX(id) FROM person_order) + generate_series.n,
    person.id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM generate_series(1, (SELECT COUNT(*) FROM person)) AS generate_series(n)
JOIN person ON generate_series.n = person.id;




SELECT 
    person.name AS person_name,
    person_order.order_date,
    menu.pizza_name,
    pizzeria.name AS pizzeria_name,
    menu.price
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person_order.order_date = '2022-02-25' AND menu.pizza_name = 'greek pizza'
ORDER BY person.name;