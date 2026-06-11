-- Create raw staging table for Volve daily production dataset
-- All fields imported as TEXT to avoid datatype and formatting issues during ingestion

CREATE TABLE raw_daily_production (
    dateprd TEXT,
    well_bore_code TEXT,
    npd_well_bore_code TEXT,
    npd_well_bore_name TEXT,
    npd_field_code TEXT,
    npd_field_name TEXT,
    npd_facility_code TEXT,
    npd_facility_name TEXT,
    on_stream_hrs TEXT,
    avg_downhole_pressure TEXT,
    avg_downhole_temperature TEXT,
    avg_dp_tubing TEXT,
    avg_annulus_press TEXT,
    avg_choke_size_p TEXT,
    avg_choke_uom TEXT,
    avg_whp_p TEXT,
    avg_wht_p TEXT,
    dp_choke_size TEXT,
    bore_oil_vol TEXT,
    bore_gas_vol TEXT,
    bore_wat_vol TEXT,
    bore_wi_vol TEXT,
    flow_kind TEXT,
    well_type TEXT
);
