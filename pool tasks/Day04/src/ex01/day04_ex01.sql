SELECT vpf.name
FROM v_persons_female AS vpf
UNION ALL
SELECT vpm.name
FROM v_persons_male AS vpm
ORDER BY 1;