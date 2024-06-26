WITH visits AS (SELECT pi.name, COUNT(pizzeria_id), 'visit' AS action_type
			   FROM person_visits AS pv
			   JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
			   GROUP BY 1
			   ORDER BY 2 DESC
			   LIMIT 3),
	 orders AS (SELECT pi.name, COUNT(pi.name), 'order' AS action_type
			   FROM person_order AS po
			   JOIN menu AS m ON po.menu_Id = m.id
			   JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
			   GROUP BY 1
			   ORDER BY 2 DESC
			   LIMIT 3)
SELECT * FROM visits
UNION ALL
SELECT * FROM orders
ORDER BY 3, 2 DESC;