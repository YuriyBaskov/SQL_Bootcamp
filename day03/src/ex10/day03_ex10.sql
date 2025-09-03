INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES 
    ((SELECT MAX(id) + 1 FROM person_order),
     (SELECT id FROM person WHERE name = 'Denis'),
     (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza' AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')),
     '2022-02-24'),
    ((SELECT MAX(id) + 2 FROM person_order),
     (SELECT id FROM person WHERE name = 'Irina'),
     (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza' AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')),
     '2022-02-24');



SELECT 
    person.name AS person_name,
    person_order.order_date,
    pizzeria.name AS pizzeria_name,
    menu.pizza_name,
    menu.price
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE 
    person.name IN ('Denis', 'Irina')
    AND person_order.order_date = '2022-02-24'
    AND menu.pizza_name = 'sicilian pizza'
ORDER BY person.name;