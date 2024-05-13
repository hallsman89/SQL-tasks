drop function fnc_persons_female();
drop function fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female')
    RETURNS TABLE
            (
                name varchar
            )
AS
$$
SELECT name
FROM person
WHERE gender = pgender
$$
    LANGUAGE SQL;


select *
from fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();