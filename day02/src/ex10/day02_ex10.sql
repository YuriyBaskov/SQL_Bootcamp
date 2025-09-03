SELECT 
    person.name AS person_name1, 
    person2.name AS person_name2, 
    person.address AS common_address
FROM person
JOIN person AS person2 ON person.address = person2.address AND person.id > person2.id
ORDER BY person.name, person2.name, person.address;