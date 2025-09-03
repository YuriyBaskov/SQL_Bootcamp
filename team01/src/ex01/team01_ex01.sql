insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH processing AS (
    SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined')  AS lastname,
    (SELECT rate_to_usd  FROM currency cr
    WHERE cr.name = c.name AND b.updated >= cr.updated
    ORDER BY cr.updated DESC LIMIT 1)  AS t1,
    (SELECT rate_to_usd FROM currency cr
    WHERE cr.name = c.name AND b.updated < cr.updated
    ORDER BY cr.updated LIMIT 1) AS t2,
    c.name AS currency_name, money
    FROM balance b
    LEFT JOIN "user" u ON u.id = b.user_id
    FULL JOIN (SELECT DISTINCT id, name FROM currency ) as c ON c.id = b.currency_id
    WHERE c.name IS NOT NULL)
SELECT name, lastname, currency_name,
    CASE
    WHEN t1 IS NOT NULL THEN t1 * money
    ELSE t2 * money END AS currency_in_usd
FROM processing
ORDER BY 
    name desc, 
    lastname asc,
    currency_name asc;
