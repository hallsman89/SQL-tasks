CREATE INDEX idx_person_name ON person ((UPPER(name)));

SET ENABLE_SEQSCAN TO OFF;

SELECT *
FROM person AS p
WHERE UPPER(p.name) = 'ANNA';

EXPLAIN ANALYZE
SELECT *
FROM person AS p
WHERE UPPER(p.name) = 'ANNA';