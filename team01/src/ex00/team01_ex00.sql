WITH LastCurrencyRates AS (
    SELECT
        currency.id,
        name AS currency_name,
        rate_to_usd,
        updated,
        ROW_NUMBER() OVER (PARTITION BY currency.id ORDER BY updated DESC)
    AS rn
    FROM
        currency
),
LatestCurrency AS (
    SELECT
        id,
        currency_name,
        rate_to_usd
    FROM
        LastCurrencyRates
    WHERE rn = 1
),
AggregatedBalance AS (
    SELECT
        u.id AS user_id,
        name,
        lastname,
        type,
        SUM(money) AS volume,
        currency_name,
        rate_to_usd
    FROM
        balance
    LEFT JOIN "user" u ON user_id = u.id
    LEFT JOIN LatestCurrency LC ON currency_id = LC.id
    GROUP BY
        u.id, name, lastname, type, currency_name, rate_to_usd
)

SELECT
    COALESCE(NULLIF(name, ''), 'not defined') AS name,
    COALESCE(NULLIF(lastname, ''), 'not defined') AS lastname,
    COALESCE(NULLIF(type::text, ''), 'unknown') AS type,
    volume,
    COALESCE(NULLIF(currency_name, ''), 'not defined') AS currency_name,
    COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
    volume * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
FROM AggregatedBalance

ORDER BY name DESC, lastname ASC, type ASC;
