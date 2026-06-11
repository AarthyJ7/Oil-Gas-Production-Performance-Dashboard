CREATE TABLE fact_production AS
SELECT
    d.date_id,
    w.well_id,
    r.flow_kind,
    r.well_type,
    NULLIF(REPLACE(r.on_stream_hrs, ',', ''), '')::NUMERIC AS on_stream_hrs,
    NULLIF(REPLACE(r.bore_oil_vol, ',', ''), '')::NUMERIC AS oil_volume,
    NULLIF(REPLACE(r.bore_gas_vol, ',', ''), '')::NUMERIC AS gas_volume,
    NULLIF(REPLACE(r.bore_wat_vol, ',', ''), '')::NUMERIC AS water_volume,
    NULLIF(REPLACE(r.bore_wi_vol, ',', ''), '')::NUMERIC AS water_injection_volume,
    NULLIF(REPLACE(r.avg_downhole_pressure, ',', ''), '')::NUMERIC AS avg_downhole_pressure,
    NULLIF(REPLACE(r.avg_downhole_temperature, ',', ''), '')::NUMERIC AS avg_downhole_temperature,
    NULLIF(REPLACE(r.avg_dp_tubing, ',', ''), '')::NUMERIC AS avg_dp_tubing,
    NULLIF(REPLACE(r.avg_annulus_press, ',', ''), '')::NUMERIC AS avg_annulus_press,
    NULLIF(REPLACE(r.avg_choke_size_p, ',', ''), '')::NUMERIC AS avg_choke_size_p,
    r.avg_choke_uom,
    NULLIF(REPLACE(r.avg_whp_p, ',', ''), '')::NUMERIC AS avg_whp_p,
    NULLIF(REPLACE(r.avg_wht_p, ',', ''), '')::NUMERIC AS avg_wht_p,
    NULLIF(REPLACE(r.dp_choke_size, ',', ''), '')::NUMERIC AS dp_choke_size
FROM raw_daily_production r
JOIN dim_date d
    ON TO_DATE(r.dateprd, 'DD-Mon-YY') = d.production_date
JOIN dim_well w
    ON r.npd_well_bore_code::INTEGER = w.npd_well_bore_code;
