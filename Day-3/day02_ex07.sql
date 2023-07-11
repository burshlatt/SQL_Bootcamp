SELECT pizzeria.name
FROM pizzeria
JOIN person ON person.name = 'Dmitriy'
JOIN person_visits ON person_visits.person_id = person.id AND person_visits.visit_date = '2022-01-08'
WHERE pizzeria.id = person_visits.pizzeria_id