SELECT pizzeria.name AS name
FROM pizzeria
WHERE name NOT IN (
	SELECT DISTINCT pi.name
	FROM pizzeria AS pi
	JOIN person_visits AS pv
	ON pi.id = pv.pizzeria_id);
								
SELECT pizzeria.name AS name
FROM pizzeria
WHERE NOT EXISTS (
	SELECT 1
	FROM person_visits AS pv
	WHERE pizzeria.id = pv.pizzeria_id);