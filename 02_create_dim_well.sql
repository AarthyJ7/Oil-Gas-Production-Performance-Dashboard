CREATE TABLE dim_well AS
SELECT
    ROW_NUMBER() OVER (ORDER BY npd_well_bore_code::INTEGER) AS well_id,
    npd_well_bore_code::INTEGER AS npd_well_bore_code,
    well_bore_code,
    npd_well_bore_name AS well_name,
    npd_field_code::INTEGER AS npd_field_code,
    npd_field_name AS field_name,
    npd_facility_code::INTEGER AS npd_facility_code,
    npd_facility_name AS facility_name
FROM (
    SELECT DISTINCT
        npd_well_bore_code,
        well_bore_code,
        npd_well_bore_name,
        npd_field_code,
        npd_field_name,
        npd_facility_code,
        npd_facility_name
    FROM raw_daily_production
) wells;
