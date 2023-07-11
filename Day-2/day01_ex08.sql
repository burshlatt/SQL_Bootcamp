SELECT order_date AS action_date,
(
	SELECT CONCAT(per.name, ' (age:', per.age, ')')
) AS person_information
FROM person_order
NATURAL JOIN
(
	SELECT id AS person_id, name, age
	FROM person
) AS per
ORDER BY action_date ASC, person_information ASC;