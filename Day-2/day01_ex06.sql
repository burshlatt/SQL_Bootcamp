SELECT person_order.order_date AS action_date, person.name AS person_name
FROM person, person_order
WHERE person.id = person_id
INTERSECT
SELECT person_visits.visit_date AS action_date, person.name AS person_name
FROM person, person_visits
WHERE person.id = person_id
ORDER BY action_date ASC, person_name DESC;