-- #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- #1
SELECT SUM(rating) FROM pizzeria;

-- #2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

-- #2
COMMIT;

-- #1
SELECT SUM(rating) FROM pizzeria;

-- #1
COMMIT;

-- #1
SELECT SUM(rating) FROM pizzeria;

-- #2
SELECT SUM(rating) FROM pizzeria;