DELETE FROM person_order
WHERE order_date = '2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'greek pizza';






SELECT 
    COUNT(*) AS remaining_orders
FROM person_order 
WHERE order_date = '2022-02-25';


SELECT 
	COUNT(*) AS greek_pizza_count
FROM menu 
WHERE pizza_name = 'greek pizza';


