insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    nearest_rate.name AS currency_name,
    nearest_rate.money * COALESCE(nearest_rate.rate_min, nearest_rate.rate_max) AS currency_in_usd
FROM (
    SELECT
        balance.user_id,
        currency.id,
        currency.name,
        balance.money,
        (SELECT currency.rate_to_usd 
         FROM currency
         WHERE currency.id = balance.currency_id AND currency.updated < balance.updated
         ORDER BY rate_to_usd
         LIMIT 1) AS rate_min,
        (SELECT currency.rate_to_usd 
         FROM currency
         WHERE currency.id = balance.currency_id AND currency.updated > balance.updated
         ORDER BY rate_to_usd
         LIMIT 1) AS rate_max
    FROM currency
    JOIN balance ON currency.id = balance.currency_id
    GROUP BY
        balance.money,
        currency.name,
        currency.id,
        balance.updated,
        balance.currency_id,
        balance.user_id
    ORDER BY rate_min DESC, rate_max
) AS nearest_rate
LEFT JOIN "user" ON nearest_rate.user_id = "user".id
ORDER BY name DESC, lastname ASC, currency_name ASC;

