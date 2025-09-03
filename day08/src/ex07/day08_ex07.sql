-- Session 1, 2
SHOW TRANSACTION ISOLATION LEVEL;

-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 4 WHERE name = 'Dominos';

-- Session 2
BEGIN;
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';

-- Session 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos'; --error deadlock
COMMIT;

-- Session 1
COMMIT;
SELECT * FROM pizzeria WHERE name IN ('Dominos', 'Pizza Hut');
