WITH orders AS (SELECT m.id AS menu_id
				FROM menu AS m
				EXCEPT
				SELECT po.menu_id
				FROM person_order AS po
				ORDER BY 1),
	 pizzas AS (SELECT *
			   FROM menu
			   RIGHT JOIN orders
			   ON menu.id = orders.menu_id)
SELECT pizzas.pizza_name, pizzas.price, pi.name AS pizzeria_name
FROM pizzas
JOIN pizzeria AS pi ON pizzas.pizzeria_id = pi.id
ORDER BY 1, 2;