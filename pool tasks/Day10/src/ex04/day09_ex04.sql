CREATE OR REPLACE FUNCTION fnc_persons_female()
    RETURNS TABLE
            (
                name varchar
            )
AS
$$
SELECT name
FROM person
WHERE gender = 'female'
$$
    LANGUAGE SQL;


CREATE OR REPLACE FUNCTION fnc_persons_male()
    RETURNS TABLE
            (
                name varchar
            )
AS
$$
SELECT name
FROM person
WHERE gender = 'male'
$$
    LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();

SELECT name
FROM fnc_persons_female();