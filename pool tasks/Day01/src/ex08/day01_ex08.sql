SELECT po.order_date AS order_date,
	   CONCAT(p.name, '(age:', p.age, ')') AS person_information
FROM (person_order AS po(primary_id, id, menu_id, order_date)
		NATURAL JOIN person AS p)
ORDER BY order_date, person_information;