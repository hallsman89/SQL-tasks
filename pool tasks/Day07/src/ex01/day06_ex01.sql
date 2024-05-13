INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT row_number() over () AS id,
       temp.person_id,
       temp.pizzeria_id,
       CASE
           WHEN temp.visits = 1 THEN 10.5
           WHEN temp.visits = 2 THEN 22
           ELSE 30
           END              AS discount
FROM (SELECT person_id, pizzeria_id, count(person_id) AS visits
      FROM person_order
               JOIN menu m on person_order.menu_id = m.id
      GROUP BY person_id, pizzeria_id
      ORDER BY 1, 2) AS temp;