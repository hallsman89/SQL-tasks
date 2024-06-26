SELECT p.address, pi.name, COUNT(pi.name) AS count_of_orders
FROM person_order AS po
JOIN person AS p ON po.person_id = p.id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
GROUP BY 2, 1
ORDER BY 1, 2;
