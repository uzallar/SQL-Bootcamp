--Session #1
BEGIN;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'

--Session #2
BEGIN;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

--Session #1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

--Session #2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
