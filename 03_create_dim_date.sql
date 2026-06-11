{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl368\sa213\partightenfactor0

\f0\fs32 \cf2 \expnd0\expndtw0\kerning0
CREATE TABLE dim_date AS\
SELECT\
\'a0\'a0\'a0 ROW_NUMBER() OVER (ORDER BY production_date) AS date_id,\
\'a0\'a0\'a0 production_date,\
\'a0\'a0\'a0 EXTRACT(YEAR FROM production_date)::INTEGER AS year,\
\'a0\'a0\'a0 EXTRACT(QUARTER FROM production_date)::INTEGER AS quarter,\
\'a0\'a0\'a0 EXTRACT(MONTH FROM production_date)::INTEGER AS month,\
\'a0\'a0\'a0 TO_CHAR(production_date, 'Month') AS month_name,\
\'a0\'a0\'a0 TO_CHAR(production_date, 'YYYY-MM') AS year_month\
FROM (\
\'a0\'a0\'a0 SELECT DISTINCT\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 TO_DATE(dateprd, 'DD-Mon-YY') AS production_date\
\'a0\'a0\'a0 FROM raw_daily_production\
) dates;}