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
    AND (sum = (SELECT min(sum) FROM direction WHERE length(tour) = 7 AND point2 = 'a')
        OR sum = (SELECT max(sum) FROM direction WHERE length(tour) = 7 AND point2 = 'a'))
ORDER BY 1, 2;