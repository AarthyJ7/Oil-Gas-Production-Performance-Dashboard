CREATE TABLE dim_date AS
SELECT
    ROW_NUMBER() OVER (ORDER BY production_date) AS date_id,
    production_date,
    EXTRACT(YEAR FROM production_date)::INTEGER AS year,
    EXTRACT(QUARTER FROM production_date)::INTEGER AS quarter,
    EXTRACT(MONTH FROM production_date)::INTEGER AS month,
    TO_CHAR(production_date, 'Month') AS month_name,
    TO_CHAR(production_date, 'YYYY-MM') AS year_month
FROM (
    SELECT DISTINCT
        TO_DATE(dateprd, 'DD-Mon-YY') AS production_date
    FROM raw_daily_production
) dates;
