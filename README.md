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

- Yes, a few things make a big difference. The Google capstone follows six phases (Ask, Prepare, Process, Analyze, Share, Act), and reviewers look for each one.
Write-up pieces (these go in the README):
* Business task statement. One or two sentences: “Find out how members and casual riders use bikes differently, to help marketing convert casual riders into members.”
* Data credibility check. Note where the data comes from (Divvy/Motivate, public license), the time range, and its limits. For example, there’s no rider info, so you can’t tell whether one casual rider took 50 rides or 50 people took one each.
* Cleaning log. List what you removed and how many rows each step dropped. Before and after row counts make this concrete.
* Limitations. Mention things like 2020 being a COVID year, missing station names, and the absence of pricing data.
The part people skip, which matters most:
* Three recommendations tied to your findings. For example: “Casual riders peak on summer weekends near the lakefront, so run a weekend-to-annual membership promo there in May.” Each recommendation should point back to a specific query result.
* Next steps. Say what data you’d want next, such as pricing, survey data, or rider IDs.
Getting it seen:
* Pin the repo on your GitHub profile.
* Add it to LinkedIn under Featured, and write a short post about it with one chart.
* Put the link on your resume under a “Projects” section.
