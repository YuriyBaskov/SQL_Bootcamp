SELECT 
    person.name,
    menu.pizza_name,
    menu.price,
    ROUND(menu.price - (menu.price * person_discounts.discount / 100), 2) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN person ON person.id = person_order.person_id
JOIN person_discounts ON person.id = person_discounts.person_id AND person_discounts.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person.name, menu.pizza_name;