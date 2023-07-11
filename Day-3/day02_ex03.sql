WITH cte (id, person_id, missing_date)
AS
(
	SELECT id, person_id, visit_date AS missing_date
    FROM person_visits
    WHERE DATE(visit_date) BETWEEN '2022-01-01' AND '2022-01-10' AND (person_id = 1 OR person_id = 2)
)
SELECT DISTINCT person_visits.visit_date AS missing_date
FROM cte
RIGHT JOIN person_visits ON person_visits.visit_date = cte.missing_date
WHERE cte.missing_date IS null
ORDER BY missing_date ASC;