CREATE VIEW v_price_with_discount AS
SELECT 
    person.name,
    menu.pizza_name,
    menu.price,
    (menu.price - menu.price * 0.1)::integer AS discount_price
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
ORDER BY person.name, menu.pizza_name;





SELECT * FROM v_price_with_discount;