SELECT
(
	SELECT name
	FROM person
	WHERE id = person_order.person_id
) AS person_name,
(
	SELECT pizza_name
	FROM menu
	WHERE id = person_order.menu_id
) AS pizza_name,
(
	SELECT name
	FROM pizzeria
	WHERE id = menu.pizzeria_id
) AS pizzeria_name
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;