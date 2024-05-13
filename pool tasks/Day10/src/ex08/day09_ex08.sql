CREATE OR REPLACE FUNCTION FNC_FIBONACCI(
    pstop INTEGER DEFAULT 10
)
    RETURNS TABLE
            (
                NUMBER NUMERIC
            ) AS
$FIBONACCI$
DECLARE
    N1 NUMERIC = 0;
    N2 NUMERIC = 1;
    I NUMERIC = 3;
    TEMP NUMERIC;
BEGIN
    IF pstop > 0
    THEN
        NUMBER := N1;
        RETURN NEXT;

        IF pstop > 1
        THEN
            NUMBER := N2;
            RETURN NEXT;

            LOOP
                EXIT WHEN I > pstop;
                NUMBER := (N2 + N1);
                TEMP := N2;
                N2 := NUMBER;
                N1 := TEMP;
                I := (I + 1);
                RETURN NEXT;
            END LOOP;
        END IF;
    END IF;
END;
$FIBONACCI$ LANGUAGE PLPGSQL;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();