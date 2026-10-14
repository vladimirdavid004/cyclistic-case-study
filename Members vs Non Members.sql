/* ============================================================
   CYCLISTIC CASE STUDY: CLEANING STEP
   Builds a cleaned copy of the raw trip data.
   The raw table (trips) stays untouched as a backup.
   ============================================================ */

/* Create a new table called trips_clean.
   OR REPLACE means re-running this rebuilds it instead of erroring. */
CREATE OR REPLACE TABLE `case-study-1-511513.cyclistic.trips_clean` AS

SELECT
  /* Original columns we're keeping */
  ride_id,              /* unique ID for each ride */
  rideable_type,        /* classic, electric, or docked bike */
  member_casual,        /* KEY COLUMN: annual member vs casual rider */
  started_at,           /* ride start date and time */
  ended_at,             /* ride end date and time */
  start_station_name,   /* where the ride began */
  end_station_name,     /* where the ride ended */

  /* New calculated columns for the analysis */
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_min,  /* ride length in minutes */
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,                 /* Monday, Tuesday, etc. */
  EXTRACT(HOUR FROM started_at) AS start_hour,                       /* 0 to 23, shows commute patterns */
  FORMAT_TIMESTAMP('%Y-%m', started_at) AS month                     /* e.g. 2020-07, for seasonal trends */

/* Pull from the raw table loaded from the bucket */
FROM `case-study-1-511513.cyclistic.trips`

/* Filters: which rows get kept */
WHERE started_at >= '2020-04-01'
  AND started_at < '2021-04-01'                        /* keep 12 months: Apr 2020 to Mar 2021 */
  AND ended_at > started_at                            /* drop zero-length and negative rides (maintenance pulls) */
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440   /* drop rides over 24 hours (lost or stolen bikes) */
  AND member_casual IN ('member', 'casual')            /* drop rows with a missing or invalid rider type */
  AND (start_station_name IS NULL                      /* keep rides with a blank station name... */
       OR start_station_name != 'HQ QR');              /* ...but drop Divvy's internal test station */