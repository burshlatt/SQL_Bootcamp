-- #1
BEGIN;

-- #2
BEGIN;

-- #1
UPDATE pizzeria SET rating = 2.5 WHERE id = 1;

-- #2
UPDATE pizzeria SET rating = 2.5 WHERE id = 2;

-- #1
UPDATE pizzeria SET rating = 3.5 WHERE id = 2;

-- #2
UPDATE pizzeria SET rating = 3.5 WHERE id = 1;

-- #1
COMMIT;

-- #2
COMMIT;

-- #1
SELECT * FROM pizzeria;

-- #2
SELECT * FROM pizzeria;