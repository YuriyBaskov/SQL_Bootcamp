WITH orders AS (
    SELECT 
        pizzeria.id,
        pizzeria.name,
        COUNT(person_order.id) AS order_count
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
    GROUP BY pizzeria.id, pizzeria.name
),
visits AS (
    SELECT 
        pizzeria.id,
        pizzeria.name,
        COUNT(person_visits.id) AS visit_count
    FROM person_visits 
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.id, pizzeria.name
)

SELECT 
    COALESCE(orders.name, visits.name) AS name,
    COALESCE(orders.order_count, 0) + COALESCE(visits.visit_count, 0) AS total_count
FROM orders
FULL OUTER JOIN visits ON orders.id = visits.id
ORDER BY total_count DESC, name ASC;