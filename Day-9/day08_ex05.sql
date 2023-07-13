-- #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- #1
SELECT SUM(rating) FROM pizzeria;

-- #2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';

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