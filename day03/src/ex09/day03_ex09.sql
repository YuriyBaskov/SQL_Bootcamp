INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES 
    ((SELECT MAX(id) + 1 FROM person_visits),
     (SELECT id FROM person WHERE name = 'Denis'),
     (SELECT id FROM pizzeria WHERE name = 'Dominos'),
     '2022-02-24'),
    ((SELECT MAX(id) + 2 FROM person_visits),
     (SELECT id FROM person WHERE name = 'Irina'),
     (SELECT id FROM pizzeria WHERE name = 'Dominos'),
     '2022-02-24');




SELECT 
    person.name AS person_name,
    person_visits.visit_date,
    pizzeria.name AS pizzeria_name
FROM person_visits
JOIN person ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE 
    person.name IN ('Denis', 'Irina')
    AND person_visits.visit_date = '2022-02-24'
    AND pizzeria.name = 'Dominos'
ORDER BY person.name;


	 