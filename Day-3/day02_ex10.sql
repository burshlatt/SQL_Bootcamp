SELECT person.name AS person_name1, per_2.name AS person_name2, person.address AS common_address
FROM person
CROSS JOIN person AS per_2
WHERE person.address = per_2.address AND person.id > per_2.id AND NOT person.name = per_2.name
ORDER BY person_name1, person_name2, common_address