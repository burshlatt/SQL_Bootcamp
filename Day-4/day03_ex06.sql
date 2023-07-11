SELECT m1.pizza_name, pizzeria.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, m1.price
FROM pizzeria
CROSS JOIN pizzeria AS p2
JOIN menu AS m1 ON m1.pizzeria_id = pizzeria.id
JOIN menu AS m2 ON m2.pizzeria_id = p2.id
WHERE m1.pizza_name = m2.pizza_name AND pizzeria.name != p2.name AND pizzeria.id > p2.id AND m1.price = m2.price
ORDER BY m1.pizza_name;