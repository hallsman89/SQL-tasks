CREATE TABLE IF NOT EXISTS routes (
    point1 char NOT NULL,
    point2 char NOT NULL,
    cost   int  NOT NULL
);

INSERT INTO routes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('c', 'b', 35),
       ('b', 'c', 35),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('a', 'd', 20),
       ('d', 'c', 30),
       ('c', 'a', 15),
       ('b', 'a', 10),
       ('b', 'd', 25);

WITH RECURSIVE direction AS (
    SELECT
        point1::bpchar AS tour,
        point1,
        point2,
        cost,
        cost AS sum
    FROM routes
    WHERE point1 = 'a'
    UNION ALL
    SELECT
        prev.tour || ',' || prev.point2 AS tour,
        next.point1,
        next.point2,
        prev.cost,
        prev.sum + next.cost AS sum
    FROM routes AS next
    INNER JOIN direction AS prev ON next.point1 = prev.point2
    WHERE tour NOT LIKE '%' || prev.point2 || '%'
)
SELECT sum AS total_cost, '{' || tour || ',' || point2 || '}' AS tour
FROM direction
WHERE length(tour) = 7
    AND point2 = 'a' 
    AND sum = (
        SELECT min(sum) 
        FROM direction
        WHERE length(tour) = 7 AND point2 = 'a'
    )
ORDER BY 1, 2;
