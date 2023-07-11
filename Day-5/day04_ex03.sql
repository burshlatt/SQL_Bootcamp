SELECT generated_date AS missing_date
FROM v_generated_dates
EXCEPT
SELECT person_visits.visit_date AS missing_date
FROM person_visits
ORDER BY missing_date