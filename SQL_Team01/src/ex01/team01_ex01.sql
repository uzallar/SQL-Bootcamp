insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');


SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    cur.name AS currency_name,
    CAST(ba.money * COALESCE(
        (SELECT rate_to_usd
         FROM currency cu
         WHERE ba.updated > cu.updated AND cu.id = ba.currency_id
         ORDER BY cu.updated DESC
         LIMIT 1), 
        (SELECT rate_to_usd
         FROM currency cu
         WHERE ba.updated < cu.updated AND cu.id = ba.currency_id
         ORDER BY cu.updated ASC
         LIMIT 1),
        1
    ) AS REAL) AS currency_in_usd
FROM balance ba
JOIN (SELECT name, id FROM currency GROUP BY name, id) cur ON cur.id = ba.currency_id
LEFT JOIN "user" u ON ba.user_id = u.id
ORDER BY 1 DESC, 2, 3

