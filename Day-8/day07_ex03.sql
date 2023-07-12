WITH cte_order AS (
	SELECT *
	FROM
	(
		SELECT pizzeria.name AS name, COUNT(person_order.menu_id) AS count
		FROM person_order
		JOIN menu ON menu.id = person_order.menu_id
		JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
		GROUP BY pizzeria.name
	) AS order_table
), cte_visit AS (
	SELECT *
	FROM
	(
		SELECT pizzeria.name AS name, COUNT(person_visits.pizzeria_id) AS count
		FROM person_visits
		JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
		GROUP BY pizzeria.name
	) AS visit_table
)

SELECT cte_order.name AS name, cte_order.count + cte_visit.count AS total_count
FROM cte_order
JOIN cte_visit ON cte_visit.name = cte_order.name
UNION
SELECT pizzeria.name AS name, 0 AS total_count
FROM pizzeria
WHERE NOT EXISTS
(
	SELECT *
	FROM
	(
		SELECT cte_order.name AS name, cte_order.count + cte_visit.count AS total_count
		FROM cte_order
		JOIN cte_visit ON cte_visit.name = cte_order.name
	) AS miss_table
	WHERE miss_table.name = pizzeria.name
)
ORDER BY total_count DESC, name ASC