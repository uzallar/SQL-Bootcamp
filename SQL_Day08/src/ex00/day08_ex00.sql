-- Session #1
BEGIN; -- начинаем транзакцию
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- обновляем рейтинг пиццерии
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- смотрим, обновилось ли

--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- смотрим, изменился ли рейтинг
-- в параллельной сессии до коммита, нет он не изменился

--Session #1
COMMIT; -- в первой сессии завершаем транзакцию и делаем
-- все внесенные изменения постоянными в базе данных

--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- снова смотрим, изменился ли рейтинг
-- в параллельнной сессии. да, он изменился