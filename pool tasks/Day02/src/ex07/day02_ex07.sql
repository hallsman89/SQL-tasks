WITH visits AS (SELECT *
			   FROM person_visits AS pv
			   RIGHT JOIN (SELECT *
						  FROM person AS p
						  WHERE p.name = 'Dmitriy') AS people
			   ON pv.person_id = people.id
			   WHERE pv.visit_date = '2022-01-08'),
	 pizzerias AS (SELECT pi.id AS pi_id,
				  pi.name
				  FROM pizzeria pi
				  JOIN visits ON pi.id = visits.pizzeria_id),
	 prices AS (SELECT pizzerias.name,
			   menu.price
			   FROM pizzerias
			   JOIN menu ON pizzerias.pi_id = menu.pizzeria_id)
SELECT DISTINCT pr.name
FROM prices AS pr
WHERE pr.price < 800;