SELECT * FROM balance
ORDER BY type, updated DESC;
SELECT * FROM "user";
SELECT * FROM currency;


SELECT 
    COALESCE (u.name, 'not defined') AS name,
    COALESCE (u.lastname, 'not defined') AS lastname,
    type,
    SUM(balance.money) AS volume,
    COALESCE (currency.name, 'not defined') AS currency_name,
    COALESCE (currency.rate_to_usd, 1) AS last_rate_to_usd,
    CAST(SUM(balance.money) * COALESCE (currency.rate_to_usd, 1) AS REAL) AS total_volume_in_usd
FROM "user" AS u
FULL JOIN balance ON balance.user_id = u.id
FULL JOIN (
    SELECT 
    currency.id,
    currency.name,
    currency.rate_to_usd
FROM currency
JOIN (
    SELECT DISTINCT
        id,
        name,
        MAX(updated) AS updated
    FROM currency
    GROUP BY id, name
) AS popa ON currency.updated = popa.updated
GROUP BY currency.id,
    currency.name,
    currency.rate_to_usd) AS currency ON currency.id = balance.currency_id
GROUP BY user_id, u.name, u.lastname, balance.type,currency.rate_to_usd , currency.name
ORDER BY 1 DESC, 2, 3