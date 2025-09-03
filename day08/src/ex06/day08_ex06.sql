-- Session 1, 2
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session 1
SELECT SUM(rating) FROM pizzeria;

-- Session 2
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;

--Session 1
SELECT SUM(rating) FROM pizzeria; --no change
COMMIT;
SELECT SUM(rating) FROM pizzeria;
