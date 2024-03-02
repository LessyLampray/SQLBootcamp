create or replace function fnc_persons_male()
returns table (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) as
$code$
    select *
    from
        person
    where
        gender = 'male';
$code$
language sql;

create or replace function fnc_persons_female()
returns table (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) as
$code$
    select *
    from
        person
    where
        gender = 'female';
$code$
language sql;


SELECT *
FROM fnc_persons_male();
SELECT *
FROM fnc_persons_female();