{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl368\sa213\partightenfactor0

\f0\fs32 \cf2 \expnd0\expndtw0\kerning0
CREATE TABLE fact_production AS\
SELECT\
\'a0\'a0\'a0 d.date_id,\
\'a0\'a0\'a0 w.well_id,\
\'a0\'a0\'a0 r.flow_kind,\
\'a0\'a0\'a0 r.well_type,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.on_stream_hrs, ',', ''), '')::NUMERIC AS on_stream_hrs,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.bore_oil_vol, ',', ''), '')::NUMERIC AS oil_volume,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.bore_gas_vol, ',', ''), '')::NUMERIC AS gas_volume,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.bore_wat_vol, ',', ''), '')::NUMERIC AS water_volume,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.bore_wi_vol, ',', ''), '')::NUMERIC AS water_injection_volume,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.avg_downhole_pressure, ',', ''), '')::NUMERIC AS avg_downhole_pressure,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.avg_downhole_temperature, ',', ''), '')::NUMERIC AS avg_downhole_temperature,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.avg_dp_tubing, ',', ''), '')::NUMERIC AS avg_dp_tubing,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.avg_annulus_press, ',', ''), '')::NUMERIC AS avg_annulus_press,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.avg_choke_size_p, ',', ''), '')::NUMERIC AS avg_choke_size_p,\
\'a0\'a0\'a0 r.avg_choke_uom,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.avg_whp_p, ',', ''), '')::NUMERIC AS avg_whp_p,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.avg_wht_p, ',', ''), '')::NUMERIC AS avg_wht_p,\
\'a0\'a0\'a0 NULLIF(REPLACE(r.dp_choke_size, ',', ''), '')::NUMERIC AS dp_choke_size\
FROM raw_daily_production r\
JOIN dim_date d\
\'a0\'a0\'a0 ON TO_DATE(r.dateprd, 'DD-Mon-YY') = d.production_date\
JOIN dim_well w\
\'a0\'a0\'a0 ON r.npd_well_bore_code::INTEGER = w.npd_well_bore_code;}