(
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN
	(
		SELECT person_visits.pizzeria_id AS piz_id, COUNT(person_visits.pizzeria_id) AS female_count
		FROM person_order
		JOIN person AS female ON female.gender = 'female'
		JOIN menu ON menu.id = person_order.menu_id
		JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
		WHERE person_order.person_id = female.id
		GROUP BY person_visits.pizzeria_id
	) AS female_visits ON female_visits.piz_id = pizzeria.id
	EXCEPT
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN
	(
		SELECT person_visits.pizzeria_id AS piz_id, COUNT(person_visits.pizzeria_id) AS male_count
		FROM person_order
		JOIN person AS male ON male.gender = 'male'
		JOIN menu ON menu.id = person_order.menu_id
		JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
		WHERE person_order.person_id = male.id
		GROUP BY person_visits.pizzeria_id
	) AS male_visits ON male_visits.piz_id = pizzeria.id
)
UNION
(
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN
	(
		SELECT person_visits.pizzeria_id AS piz_id, COUNT(person_visits.pizzeria_id) AS male_count
		FROM person_order
		JOIN person AS male ON male.gender = 'male'
		JOIN menu ON menu.id = person_order.menu_id
		JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
		WHERE person_order.person_id = male.id
		GROUP BY person_visits.pizzeria_id
	) AS male_visits ON male_visits.piz_id = pizzeria.id
	EXCEPT
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN
	(
		SELECT person_visits.pizzeria_id AS piz_id, COUNT(person_visits.pizzeria_id) AS female_count
		FROM person_order
		JOIN person AS female ON female.gender = 'female'
		JOIN menu ON menu.id = person_order.menu_id
		JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
		WHERE person_order.person_id = female.id
		GROUP BY person_visits.pizzeria_id
	) AS female_visits ON female_visits.piz_id = pizzeria.id
)
ORDER BY pizzeria_name