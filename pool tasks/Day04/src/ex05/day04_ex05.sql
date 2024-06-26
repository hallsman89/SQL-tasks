CREATE VIEW v_price_with_discount
AS
WITH orders AS (SELECT p.name, m.pizza_name, m.price
			   FROM person_order AS po
			   JOIN person AS p ON po.person_id = p.id
			   JOIN menu AS m ON po.menu_id = m.id)
SELECT o.*, ROUND(o.price * 0.9) AS discount_price
FROM orders AS o
ORDER BY 1, 2;