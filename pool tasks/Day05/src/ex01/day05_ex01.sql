SET ENABLE_SEQSCAN TO OFF;
SELECT m.pizza_name, pi.name
FROM menu AS m
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id;

EXPLAIN ANALYZE
SELECT m.pizza_name, pi.name
FROM menu AS m
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id;