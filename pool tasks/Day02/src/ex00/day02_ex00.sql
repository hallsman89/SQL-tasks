SELECT DISTINCT pi.name, pi.rating
FROM pizzeria AS pi
	LEFT JOIN person_visits AS pv ON
	pi.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;