-- Session 1, 2
SHOW TRANSACTION ISOLATION LEVEL;

-- Session 1
BEGIN;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'

-- Session 2
BEGIN;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --block and wait

-- Session 1
COMMIT;

-- Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';