-- Session 1, 2
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Session 1
COMMIT;

-- Session 2
COMMIT; --ROLLBACK

-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';