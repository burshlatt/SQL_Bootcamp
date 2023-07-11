SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN
(
	SELECT person_visits.pizzeria_id AS piz_id, COUNT(person_visits.pizzeria_id) AS male_count
	FROM person_visits
	JOIN person AS male ON male.gender = 'male'
	WHERE person_visits.person_id = male.id
	GROUP BY person_visits.pizzeria_id
) AS male_visits ON male_visits.piz_id = pizzeria.id
JOIN
(
	SELECT person_visits.pizzeria_id AS piz_id, COUNT(person_visits.pizzeria_id) AS female_count
	FROM person_visits
	JOIN person AS female ON female.gender = 'female'
	WHERE person_visits.person_id = female.id
	GROUP BY person_visits.pizzeria_id
) AS female_visits ON female_visits.piz_id = pizzeria.id
WHERE male_visits.male_count != female_visits.female_count
ORDER BY pizzeria_name