-- Session 1, 2
SHOW TRANSACTION ISOLATION LEVEL;

-- Session 1
BEGIN;
SELECT SUM(rating) FROM pizzeria;

-- Session 2
BEGIN;
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;
SELECT SUM(rating) FROM pizzeria;

--Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;