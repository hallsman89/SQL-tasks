SELECT p.name                                AS name,
       m.pizza_name,
       m.price,
       m.price * ((100 - pd.discount) / 100) AS discount_price,
       p2.name                               AS pizzeria_name
FROM person_order
         JOIN menu m on m.id = person_order.menu_id
         JOIN person p on p.id = person_order.person_id
         JOIN pizzeria p2 on p2.id = m.pizzeria_id
         JOIN person_discounts pd on p.id = pd.person_id
ORDER BY 1, 2;