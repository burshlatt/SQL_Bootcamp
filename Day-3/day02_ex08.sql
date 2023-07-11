SELECT person.name
FROM person_order
JOIN person ON person.gender = 'male' AND (person.address = 'Moscow' OR person.address = 'Samara')
JOIN menu ON menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza'
WHERE person_order.person_id = person.id AND person_order.menu_id = menu.id
ORDER BY person.name DESC;