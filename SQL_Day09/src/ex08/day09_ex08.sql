CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (fib_number integer) AS $$
WITH RECURSIVE fib(a, b) AS (
	SELECT 0 AS a, 1 AS b
	UNION
	SELECT b, a + b FROM fib WHERE b < pstop
    )
    SELECT a FROM fib;
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
