create or replace function fnc_fibonacci(IN maxFibNum integer DEFAULT 10)
    RETURNS SETOF INTEGER
AS
$code$
WITH RECURSIVE tableFib(Num1, Num2) AS
                   (SELECT 1, 1
                    UNION ALL
                    SELECT Num2, Num1 + Num2
                    FROM tableFib
                    WHERE Num2 < maxFibNum)
SELECT Num1
FROM tableFib;
$code$
language sql;

SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();