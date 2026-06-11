{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl368\sa213\partightenfactor0

\f0\fs32 \cf2 \expnd0\expndtw0\kerning0
CREATE TABLE dim_well AS\
SELECT\
\'a0\'a0\'a0 ROW_NUMBER() OVER (ORDER BY npd_well_bore_code::INTEGER) AS well_id,\
\'a0\'a0\'a0 npd_well_bore_code::INTEGER AS npd_well_bore_code,\
\'a0\'a0\'a0 well_bore_code,\
\'a0\'a0\'a0 npd_well_bore_name AS well_name,\
\'a0\'a0\'a0 npd_field_code::INTEGER AS npd_field_code,\
\'a0\'a0\'a0 npd_field_name AS field_name,\
\'a0\'a0\'a0 npd_facility_code::INTEGER AS npd_facility_code,\
\'a0\'a0\'a0 npd_facility_name AS facility_name\
FROM (\
\'a0\'a0\'a0 SELECT DISTINCT\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 npd_well_bore_code,\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 well_bore_code,\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 npd_well_bore_name,\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 npd_field_code,\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 npd_field_name,\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 npd_facility_code,\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 npd_facility_name\
\'a0\'a0\'a0 FROM raw_daily_production\
) wells;}