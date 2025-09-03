CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,  
    IN pdate date DEFAULT '2022-01-08'
)
RETURNS TABLE (pizzeria_name varchar) AS $$
BEGIN
    RETURN QUERY
    SELECT pizzeria.name
    FROM menu
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
    WHERE menu.price < pprice
    	AND person.name = pperson
        AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');