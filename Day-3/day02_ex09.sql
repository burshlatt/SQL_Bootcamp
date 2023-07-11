SELECT DISTINCT cheese.per_name AS name
FROM person_order
JOIN
(
	SELECT person.name AS per_name
	FROM person_order
	JOIN menu ON menu.pizza_name = 'cheese pizza'
	JOIN person ON person.gender = 'female'
	WHERE person_order.person_id = person.id AND person_order.menu_id = menu.id
) AS cheese ON cheese.per_name IS NOT null
JOIN
(
	SELECT person.name AS per_name
	FROM person_order
	JOIN menu ON menu.pizza_name = 'pepperoni pizza'
	JOIN person ON person.gender = 'female'
	WHERE person_order.person_id = person.id AND person_order.menu_id = menu.id
) AS pepperoni ON pepperoni.per_name IS NOT null
WHERE cheese.per_name = pepperoni.per_name
ORDER BY cheese.per_name ASC;