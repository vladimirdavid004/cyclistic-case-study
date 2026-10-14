/* ============================================================
   CYCLISTIC CASE STUDY: ANALYSIS STEP
   How do annual members and casual riders use bikes differently?
   Every query reads trips_clean and splits by member_casual.
   ============================================================ */

/* Q1. Overall: who rides more, and who rides longer? */
SELECT
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_min), 1) AS avg_ride_minutes
FROM `case-study-1-511513.cyclistic.trips_clean`
GROUP BY member_casual;

/* Q2. Day of week: weekday commuters or weekend riders?
   DAYOFWEEK sorts Sunday=1 to Saturday=7 so days appear in order. */
SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS rides,
  ROUND(AVG(ride_length_min), 1) AS avg_ride_minutes
FROM `case-study-1-511513.cyclistic.trips_clean`
GROUP BY member_casual, day_of_week, EXTRACT(DAYOFWEEK FROM started_at)
ORDER BY member_casual, EXTRACT(DAYOFWEEK FROM started_at);

/* Q3. Time of day: do members spike at commute hours? */
SELECT
  member_casual,
  start_hour,
  COUNT(*) AS rides
FROM `case-study-1-511513.cyclistic.trips_clean`
GROUP BY member_casual, start_hour
ORDER BY member_casual, start_hour;

/* Q4. Month: how seasonal is each group? */
SELECT
  member_casual,
  month,
  COUNT(*) AS rides
FROM `case-study-1-511513.cyclistic.trips_clean`
GROUP BY member_casual, month
ORDER BY member_casual, month;

/* Q5. Bike type: does either group prefer certain bikes? */
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS rides
FROM `case-study-1-511513.cyclistic.trips_clean`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, rides DESC;

/* Q6. Top 10 start stations for casual riders:
   where marketing should target to convert them to members. */
SELECT
  start_station_name,
  COUNT(*) AS casual_rides
FROM `case-study-1-511513.cyclistic.trips_clean`
WHERE member_casual = 'casual'
  AND start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY casual_rides DESC
LIMIT 10;
