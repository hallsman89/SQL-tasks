SELECT vgd.generated_date AS missing_date
FROM v_generated_dates AS vgd
EXCEPT
SELECT pv.visit_date
FROM person_visits pv
ORDER BY 1;