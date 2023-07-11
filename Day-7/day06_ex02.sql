SELECT person.name, menu.pizza_name, menu.price, ROUND(price * (1 - person_discounts.discount / 100)) AS discount_price, pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person ON person.id = person_order.person_id
JOIN person_discounts ON person_discounts.person_id = person.id
ORDER BY person.name, menu.pizza_name;