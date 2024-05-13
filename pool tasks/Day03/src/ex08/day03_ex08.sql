INSERT INTO menu
VALUES ((SELECT MAX(id) FROM menu) +1,
	   (SELECT pi.id 
		FROM pizzeria AS pi 
		WHERE pi.name = 'Dominos'),
	   'sicilian pizza', 900);