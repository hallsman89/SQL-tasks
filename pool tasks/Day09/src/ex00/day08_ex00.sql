-- session 1
BEGIN TRANSACTION;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT WORK;

-- session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';