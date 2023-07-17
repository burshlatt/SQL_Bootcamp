WITH wallet AS (SELECT user_id, type, SUM(money) AS volume, currency_id
                  FROM balance
                  GROUP BY user_id, type, currency_id),
     last_rate AS (SELECT currency.id, name, rate_to_usd
             FROM currency
             JOIN (SELECT id, MAX(updated) AS updated FROM currency GROUP BY id) AS lr ON currency.updated = lr.updated AND currency.id = lr.id),
     result AS (SELECT COALESCE(u.name, 'not defined') AS name,
                             COALESCE(u.lastname, 'not defined') AS lastname,
                             wallet.type,
                             wallet.volume,
                             COALESCE(last_rate.name, 'not defined') AS currency_name,
                             COALESCE(last_rate.rate_to_usd, 1) AS last_rate_to_usd,
                             (wallet.volume * COALESCE(last_rate.rate_to_usd, 1)) AS total_volume_in_usd
                      FROM wallet
                      LEFT JOIN "user" u ON u.id = wallet.user_id
                      LEFT JOIN last_rate ON wallet.currency_id = last_rate.id)
SELECT *
FROM result
ORDER BY name DESC, lastname, type;