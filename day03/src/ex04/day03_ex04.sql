(SELECT pizzeria.name AS pizzeria_name
 FROM person_order
 JOIN menu ON person_order.menu_id = menu.id
 JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 JOIN person ON person_order.person_id = person.id
 WHERE person.gender = 'female'
 EXCEPT
 SELECT pizzeria.name
 FROM person_order
 JOIN menu ON person_order.menu_id = menu.id
 JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 JOIN person ON person_order.person_id = person.id
 WHERE person.gender = 'male')
UNION
(SELECT pizzeria.name AS pizzeria_name
 FROM person_order
 JOIN menu ON person_order.menu_id = menu.id
 JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 JOIN person ON person_order.person_id = person.id
 WHERE person.gender = 'male'
 EXCEPT
 SELECT pizzeria.name
 FROM person_order
 JOIN menu ON person_order.menu_id = menu.id
 JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 JOIN person ON person_order.person_id = person.id
 WHERE person.gender = 'female')
ORDER BY pizzeria_name;