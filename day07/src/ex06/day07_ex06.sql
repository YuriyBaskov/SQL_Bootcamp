SELECT 
    pizzeria.name,
    COUNT(person_order.id) AS count_of_orders,
    ROUND(AVG(menu.price)::numeric, 2) AS average_price,
    MAX(menu.price) AS max_price,
    MIN(menu.price) AS min_price
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.id, pizzeria.name
ORDER BY pizzeria.name;