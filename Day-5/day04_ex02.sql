CREATE VIEW v_generated_dates AS
(
	SELECT date::DATE AS generated_date
	FROM generate_series(DATE('2022-01-01'), DATE('2022-01-31'), interval '1 day') AS date
	ORDER BY generated_date
);