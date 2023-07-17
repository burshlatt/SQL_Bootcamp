--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION rate(id_car BIGINT, pdate TIMESTAMP)
    RETURNS NUMERIC
    LANGUAGE SQL
AS $$
SELECT rate_to_usd
FROM
(
    (
		SELECT rate_to_usd
		FROM currency
		WHERE id = id_car AND updated <= pdate
		ORDER BY updated DESC
		LIMIT 1
	)
    UNION ALL
    (
		SELECT rate_to_usd
		FROM currency
		WHERE id = id_car AND updated > pdate
		ORDER BY updated ASC
		LIMIT 1
	)
) AS rate_search
LIMIT 1
$$;

SELECT DISTINCT COALESCE(usr.name, 'not defined') AS name,
       COALESCE(usr.lastname, 'not defined') AS lastname,
       currency.name AS currency_name,
       balance.money * rate(balance.currency_id, balance.updated) AS currency_in_usd
FROM balance
JOIN currency ON currency.id = balance.currency_id
LEFT JOIN "user" usr ON usr.id = balance.user_id
ORDER BY name DESC, lastname ASC, currency_name ASC;