/* ============================================================
   CYCLISTIC CASE STUDY: LOAD STEP
   Loads every monthly Divvy CSV from the Cloud Storage bucket
   into one BigQuery table.
   ============================================================ */

/* 1. Create the dataset (the folder that holds the tables). */
CREATE SCHEMA IF NOT EXISTS `case-study-1-511513.cyclistic`
OPTIONS (location = 'US');

/* 2. Load all monthly CSVs into one table.
   The * wildcard grabs every file, since BigQuery's upload button
   only takes one file at a time.
   Station IDs are set to STRING because Divvy switched them from
   numbers to text partway through the data, which breaks auto-detect.
   OVERWRITE replaces the table on re-run, so no duplicate rows. */
LOAD DATA OVERWRITE `case-study-1-511513.cyclistic.trips` (
  ride_id STRING,
  rideable_type STRING,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name STRING,
  start_station_id STRING,
  end_station_name STRING,
  end_station_id STRING,
  start_lat FLOAT64,
  start_lng FLOAT64,
  end_lat FLOAT64,
  end_lng FLOAT64,
  member_casual STRING
)
FROM FILES (
  format = 'CSV',
  uris = ['gs://case_studybucket_1/*-divvy-tripdata.csv'],
  skip_leading_rows = 1
);

/* 3. Check that every month loaded: one row per month. */
SELECT FORMAT_TIMESTAMP('%Y-%m', started_at) AS month, COUNT(*) AS rides
FROM `case-study-1-511513.cyclistic.trips`
GROUP BY month
ORDER BY month;
