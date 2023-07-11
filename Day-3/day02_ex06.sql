SELECT DISTINCT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person ON person.name = 'Denis' OR person.name = 'Anna'
WHERE person_order.person_id = person.id
ORDER BY pizza_name ASC, pizzeria_name ASC