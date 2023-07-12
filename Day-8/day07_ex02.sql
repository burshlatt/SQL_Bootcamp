SELECT *
FROM
(
	SELECT pizzeria.name AS name, COUNT(person_order.menu_id) AS count, 'order' AS action_type
	FROM person_order
	JOIN menu ON menu.id = person_order.menu_id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
	GROUP BY pizzeria.name
	LIMIT 3
) AS order_table
UNION
SELECT *
FROM
(
	SELECT pizzeria.name AS name, COUNT(person_visits.pizzeria_id) AS count, 'visit' AS action_type
	FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	GROUP BY pizzeria.name
	LIMIT 3
) AS visit_table
ORDER BY action_type ASC, count DESC