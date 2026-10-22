CREATE OR REPLACE TABLE `capstone-511823.cyclistic_raw_data.cleaned_cyclistic_data` AS 
WITH cleaned_trips AS (
  SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    
    -- 1. Calculate ride length in minutes
    --timestamp_diff does the subtraction between two different times while taking an argument that specifies the outputted type of time
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
    
    -- 2. Extract day of week (1 = Sunday, 7 = Saturday) and month
    -- extract takes a specific part of a time stamp(day, month, year) and return that number
    EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week,
    EXTRACT(MONTH FROM started_at) AS month,
    
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,

     -- 3. Rank duplicate ride_ids (keeps the earliest start time if duplicates exist)
    ROW_NUMBER() OVER (
      partition by ride_id
      order by started_at asc
    )as row_num
  
  FROM 
    `capstone-511823.cyclistic_raw_data.combined_cyclistic_data`
  WHERE
    -- 4. Remove rows with completely missing critical location data
    start_station_name IS NOT NULL 
    AND end_station_name IS NOT NULL
)

SELECT * 
FROM cleaned_trips
WHERE 
  -- 5. Exclude trips with negative durations or accidental docks (< 1 minute)
  -- 6. Exclude outlier trips lasting longer than a day (1440 minutes)
  -- 7. Exclude duplicate records and only leaves one
  ride_length_minutes >= 1 
  AND ride_length_minutes <= 1440
  AND row_num = 1;
