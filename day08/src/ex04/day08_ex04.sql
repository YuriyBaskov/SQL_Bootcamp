-- Session 1, 2
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --no change
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';