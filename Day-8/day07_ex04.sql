SELECT *
FROM
(
	SELECT person.name AS name, COUNT(person_visits.pizzeria_id) AS count_of_visits
	FROM person_visits
	JOIN person ON person.id = person_visits.person_id
	GROUP BY person.name
) AS visit_table
WHERE visit_table.count_of_visits > 3;