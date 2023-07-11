SELECT DISTINCT COALESCE(person.name, '-') AS person_name, person_visits.visit_date AS visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM
(
	SELECT DISTINCT person.name AS person_name, person_visits.visit_date AS visit_date, pizzeria.name AS pizzeria_name
	FROM person_visits
	LEFT JOIN person ON person.id = person_visits.person_id
	LEFT JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	WHERE DATE(person_visits.visit_date) BETWEEN '2022-01-01' AND '2022-01-03'
) AS not_missed
FULL JOIN person ON person.name = not_missed.person_name
FULL JOIN person_visits ON person_visits.visit_date = not_missed.visit_date
FULL JOIN pizzeria ON pizzeria.name = not_missed.pizzeria_name
WHERE (DATE(person_visits.visit_date) BETWEEN '2022-01-01' AND '2022-01-03') OR DATE(person_visits.visit_date) IS null
ORDER BY person_name ASC, visit_date ASC, pizzeria_name ASC