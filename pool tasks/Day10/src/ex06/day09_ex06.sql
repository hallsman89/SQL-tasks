CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar DEFAULT 'Dmitriy',
    pprice numeric DEFAULT 500,
    pdate date DEFAULT '2022-01-08'
)
    RETURNS TABLE
            (
                name varchar
            )
AS
$$
BEGIN
    RETURN QUERY (SELECT PZ.NAME
                  FROM PERSON P
                           INNER JOIN PERSON_ORDER PO ON P.ID = PO.PERSON_ID
                           INNER JOIN PERSON_VISITS PV ON P.ID = PV.PERSON_ID
                      AND PV.VISIT_DATE = PO.ORDER_DATE
                           INNER JOIN MENU M ON M.ID = PO.MENU_ID
                           INNER JOIN PIZZERIA PZ ON PZ.ID = M.PIZZERIA_ID
                  WHERE P.NAME = PPERSON AND M.PRICE < PPRICE
                    AND PO.ORDER_DATE = PDATE);


END;
$$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date
    (pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');