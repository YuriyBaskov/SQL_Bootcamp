SELECT pizzeria.name AS pizzeria_name
FROM (
    SELECT 
        person_visits.pizzeria_id,
        COUNT(*) FILTER (WHERE person.gender = 'female') AS female_visits,
        COUNT(*) FILTER (WHERE person.gender = 'male') AS male_visits
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    GROUP BY person_visits.pizzeria_id
    HAVING 
        COUNT(*) FILTER (WHERE person.gender = 'female') != COUNT(*) FILTER (WHERE person.gender = 'male')
) AS diff_visits
JOIN pizzeria ON diff_visits.pizzeria_id = pizzeria.id
ORDER BY pizzeria.name;