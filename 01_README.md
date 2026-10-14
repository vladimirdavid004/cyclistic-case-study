# Cyclistic Bike-Share Case Study
Google Data Analytics Capstone

## Business question
How do annual members and casual riders use Cyclistic bikes differently?

## Data
Divvy public trip data, April 2020 to March 2021 (link here)

## Tools
Google Cloud Storage, BigQuery (SQL), Python

## Process
1. Loaded monthly CSVs from a GCS bucket into BigQuery with a Python script
2. Cleaned the data in SQL (see `sql/01_cleaning.sql`): removed negative and 24h+ rides, test stations, and invalid rider types; added ride length, day of week, hour, and month
3. Analyzed patterns by rider type

## Key findings
- (fill in once you have them)

## Recommendations
- (fill in)
