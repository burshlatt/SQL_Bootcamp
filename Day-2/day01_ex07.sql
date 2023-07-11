SELECT person_order.order_date AS action_date, CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person, person_order
WHERE person.id = person_id
ORDER BY action_date ASC, person_information ASC;