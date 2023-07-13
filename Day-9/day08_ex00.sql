-- #1
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- #1
COMMIT;

-- #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';