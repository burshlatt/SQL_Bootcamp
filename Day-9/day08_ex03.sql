-- #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- #2
COMMIT;

-- #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- #1
COMMIT;

-- #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';