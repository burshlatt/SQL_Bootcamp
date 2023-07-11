SELECT DISTINCT person_visits.visit_date AS missing_date
FROM
(
	SELECT id, person_id, visit_date
	FROM person_visits
	WHERE DATE(visit_date) BETWEEN '2022-01-01' AND '2022-01-10' AND (person_id = 1 OR person_id = 2)
) AS missing_table
RIGHT JOIN person_visits ON person_visits.visit_date = missing_table.visit_date
WHERE missing_table.visit_date IS null
ORDER BY missing_date ASC;