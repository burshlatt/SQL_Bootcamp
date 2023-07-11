SELECT DISTINCT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM
(
	SELECT id AS menu_id
	FROM menu
	EXCEPT
	SELECT menu_id AS menu_id
	FROM person_order
) AS miss_id
JOIN menu ON menu.id = miss_id.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, price