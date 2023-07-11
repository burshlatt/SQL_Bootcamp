SELECT andrey_visit.pizzeria_name
FROM
(
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
 	JOIN person ON person.name = 'Andrey'
 	JOIN person_visits ON person_visits.person_id = person.id
	WHERE pizzeria.id = person_visits.pizzeria_id
) AS andrey_visit
EXCEPT
SELECT andrey_order.pizzeria_name
FROM
(
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
 	JOIN person ON person.name = 'Andrey'
 	JOIN person_order ON person_order.person_id = person.id
	JOIN menu ON menu.id = person_order.menu_id
	WHERE pizzeria.id = menu.pizzeria_id
) AS andrey_order